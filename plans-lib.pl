# Functions for managing plans, which are sets of limits separate from templates

# list_plans()
# Returns a list of all plans, each of which is a hash ref
sub list_plans
{
if (!-d $plans_dir) {
	# Somehow hasn't been run yet
	&convert_plans();
	}
if (!@list_plans_cache) {
	local @rv;
	opendir(DIR, $plans_dir);
	foreach my $id (readdir(DIR)) {
		if ($id ne "." && $id ne "..") {
			local $plan = &get_plan($id);
			push(@rv, $plan) if ($plan && !$plan->{'deleted'});
			}
		}
	closedir(DIR);
	@list_plans_cache = sort { lc($a->{'name'}) cmp lc($b->{'name'}) } @rv;
	}
return @list_plans_cache;
}

# list_editable_plans()
# Returns a list of plans the current user can edit
sub list_editable_plans
{
local $canmode = &can_edit_plans();
if ($canmode == 0) {
	return ( );
	}
elsif ($canmode == 1) {
	return grep { $_->{'owner'} eq $base_remote_user } &list_plans();
	}
else {
	return &list_plans();
	}
}

# list_available_plans()
# Returns a list of plans the current user can use
sub list_available_plans
{
local $canmode = &can_edit_plans();
local @plans = &list_plans();
if (&master_admin()) {
	# Master admin can use all
	return @plans;
	}
elsif (&reseller_admin()) {
	# Resellers can use their plans, and those granted to them by the 
	# master admin.
	return grep { $_->{'owner'} eq $base_remote_user ||
		      !$_->{'resellers'} ||
		      &indexof($base_remote_user,
			       split(/\s+/, $_->{'resellers'})) >= 0 } @plans;
	}
else {
	# Domain owners? Can't happen ..
	return ( );
	}
}

# get_plan(id)
# Returns the hash ref for the plan with some ID
sub get_plan
{
local ($id) = @_;
local %plan;
&read_file_cached("$plans_dir/$id", \%plan) || return undef;
$plan{'id'} = $id;
$plan{'file'} = "$plans_dir/$id";
return \%plan;
}

# save_plan(&plan)
# Updates or creates a plan on disk
sub save_plan
{
local ($plan) = @_;
local $newplan;
if ($plan->{'id'} eq '') {
	$plan->{'id'} = &domain_id();
	$newplan = 1;
	}
$plan->{'file'} = "$plans_dir/$plan->{'id'}";
if (!-d $plans_dir) {
	&make_dir($plans_dir, 0700);
	}
&lock_file($plan->{'file'});
&write_file($plan->{'file'}, $plan);
&unlock_file($plan->{'file'});
if (@list_plans_cache && $newplan) {
	push(@list_plans_cache, $plan);
	}
}

# delete_plan(&plan)
# Deletes an existing plan.
sub delete_plan
{
local ($plan) = @_;
&lock_file($plan->{'file'});
local @users = &get_domain_by("plan", $plan->{'id'});
if (@users) {
	# Just flag as deleted
	$plan->{'deleted'} = 1;
	&save_plan($plan);
	}
else {
	&unlink_file($plan->{'file'});
	}
if (@list_plans_cache) {
	@list_plans_cache = grep { $_->{'id'} ne $plan->{'id'} }
				 @list_plans_cache;
	}
&unlock_file($plan->{'file'});
}

# convert_plans()
# Converts all templates that have owner limits into plans, and updates virtual
# servers to refer to the converted plan. Only designed to be called once at
# installation time, to handle upgrades.
sub convert_plans
{
# For each template, create a plan
local %planmap;
foreach my $ltmpl (&list_templates()) {
	local $tmpl = &get_template($ltmpl->{'id'});
	local $got = &get_plan($tmpl->{'id'});
	next if ($got);				# Already converted
	next if ($tmpl->{'id'} eq '1');		# Sub-servers don't have plans!

	# Extract plan-related settings
	$plan = { 'id' => $tmpl->{'id'},
		  'name' => $tmpl->{'id'} eq '0' ? 'Default Plan'
						 : $tmpl->{'name'} };
	$plan->{'featurelimits'} = $tmpl->{'featurelimits'};
	foreach my $l ("mailbox", "alias", "dbs", "doms", "aliasdoms",
		       "realdoms", "bw", "mongrels") {
		$plan->{$l.'limit'} = $tmpl->{$l.'limit'} eq 'none' ? '' :
					$tmpl->{$l.'limit'};
		}
	$plan->{'quota'} = $tmpl->{'quota'} eq 'none' ? '' : $tmpl->{'quota'};
	$plan->{'uquota'} = $tmpl->{'uquota'} eq 'none' ? '' :$tmpl->{'uquota'};
	$plan->{'capabilities'} = $tmpl->{'capabilities'};
	foreach my $n ('nodbname', 'norename', 'forceunder') {
		$plan->{$n} = $tmpl->{$n};
		}
	&save_plan($plan);
	$planmap{$tmpl->{'id'}} = $plan;
	}

# For each top-level domain, map it's template to the created plan
foreach my $d (grep { !$_->{'parent'} } &list_domains()) {
	if ($d->{'plan'} eq '' || !&get_plan($d->{'plan'})) {
		local $plan = $planmap{$d->{'template'}};
		$d->{'plan'} = $plan ? $plan->{'id'} : '0';
		&save_domain($d);
		}
	# Filter down to sub-servers, even though they don't really use plans
	foreach my $sd (&get_domain_by("parent", $d->{'id'})) {
		$sd->{'plan'} = $d->{'plan'};
		&save_domain($sd);
		}
	}
}

1;

