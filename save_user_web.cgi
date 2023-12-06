#!/usr/local/bin/perl
# save_user_db.cgi
# Create, update or delete webserver
# user without creating a Unix user

require './virtual-server-lib.pl';
&ReadParse();
&error_setup($text{'user_err'});
my ($d, $user);
if ($in{'dom'}) {
	$d = &get_domain($in{'dom'});
	&can_edit_domain($d) || &error($text{'users_ecannot'});
	}
else {
	&can_edit_local() || &error($text{'users_ecannot2'});
	}
&can_edit_users() || &error($text{'users_ecannot'});

# User to edit or delete
if (!$in{'new'}) {
        my @webusers = &list_domain_users($d, 1, 0, 1, 1);
        my $olduser_name = $in{'olduser'};
        my $user_full = lc("$in{'webuser'}"."@".$d->{'dom'});
        ($user) = grep { $_->{'user'} eq $olduser_name } @webusers;
        $user || &error(&text('user_edoesntexist', &html_escape($olduser_name)));
        my %olduser = %{$user};
        # If renaming user, check if new name is not already used
        if ($olduser_name ne $user_full) {
                my ($user_check) = grep { $_->{'user'} eq $user_full } @webusers;
                !$user_check || &error(&text('user_ealreadyexist', &html_escape($user_full)));
                }

        if ($in{'delete'}) {
                # Delete webserver user using plugin
                $olduser{'user'} = $olduser_name;
		&delete_webserver_user(\%olduser, $d);
	        }
        else {
                # Update user
                $user->{'user'} = $user_full;
                # Pass password
                if (!$in{'webpass_def'}) {
                        $user->{'pass'} = $in{'webpass'};
                        $user->{'pass'} || &error($text{'user_epasswebnotset'});
                        }
                $user->{'plainpass'} = $user->{'pass'};

                &modify_webserver_user($user, \%olduser, $d);
                }
        }
else {
	# Create initial user
        $user = &create_initial_user($d);
        $user->{'user'} = lc("$in{'webuser'}"."@".$d->{'dom'});
        my @webusers = &list_domain_users($d, 1, 0, 1, 1);
        my ($user_already) = grep { $_->{'user'} eq $user->{'user'} } @webusers;
        !$user_already || &error(&text('user_ealreadyexist', &html_escape($user->{'user'})));
        
        # Set initial password
        $user->{'pass'} = $in{'webpass'};
        $user->{'pass'} || &error($text{'user_epasswebnotset'});

        &modify_webserver_user($user, undef, $d);
	}

# Log
&webmin_log($in{'new'} ? "create" : "modify", "user",
                &remove_userdom($user->{'user'}, $d), $user);
# Redirect
&redirect($d ? "list_users.cgi?dom=$in{'dom'}" : "index.cgi");
