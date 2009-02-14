line1=Server settings,11
mail_system=Mail server om te configureren,4,1-Sendmail,0-Postfix,2-Qmail,4-Qmail+LDAP,5-Qmail+VPOPMail,6-Exim (experimenteel),3-Detecteer automatisch
generics=Ook uitgaande adressen voor mailboxen updaten?,1,1-Ja,0-Nee
bccs=Automatisch BCCing van uitgaande email toestaan?,1,1-Ja,0-Nee
quotas=Quota opzetten voor domein en mail gebruikers?,1,1-Ja (indien aangezet),0-Nee
iface=Network interface voor virtuele adressen,3,Detecteer automatisch
defip=Standaard virtueel server IP adres,3,Van netwerk interface
dns_ip=Standaard IP adres voor DNS records,10,*-Automatisch extern adres detecteren,-Zelfde als virtuele server IP,Ander adres
disable=Extra opties om uit te zetten wanneer iets word uitgeschakeld,13,unix-Administratie gebruiker (op slot zetten account),mail-Mail (stop email acceptatie voor domein),web-Website (vervang site met fouten pagina),dns-DNS (stop ondersteuning domein),mysql-MySQL (MySQL login weigeren),postgres-PostgreSQL (inloggen bij PostgreSQL gebruiker weigeren),ftp-ProFTPD (weiger toegang)
ldap=Gebruikers en groepen opslaan,1,1-In LDAP database,0-In locale files
compression=Backup compressie formaat,1,0-gzip,1-bzip2,2-Geen (alleen tar),3-ZIP
mysql_replicas=Extra MySQL servers  om gebruikers op te maken,3,Alleen op dit systeem
preload_mode=Bij opstarten vooraf Virtualmin bibliotheken laden?,1,2-Alle bibliotheken,1-Alleen core,0-Nee
scriptwarn_url=Virtualmin URL voor gebruik in email berichten,3,Automatisch uitwerken
line1.4=Gebruikers interface settings,11
display_max=Maximum aantal domeinen laten zien,3,Ongelimiteerd
name_max=Maximale domein naam lengte om te laten zien,0,5
show_features=Laat server extra's zien op hoofd pagina?,1,1-Ja,0-Nee
show_quotas=Laat disk gebruik zien op hoofd pagina?,1,1-Ja,0-Nee
show_mailsize=Laat mailbox grote zien in gebruikers lijst?,1,1-Ja,0-Nee
show_sysinfo=Laat systeem informatie zien op hoofd pagina?,1,1-Ja,0-Nee,2-Alleen voor hofd admin,3-Alleen voor hoofd admin en resellers
template_auto=Zodra een server gemaakt word template bewerken van opties toestaan?,1,0-Ja,1-Nee
domains_sort=Sorteer virtuele servers op,1,user-Gebruiker met subserver tree,dom-Domein naam,pwner-Omschrijving,sub-Domein naam met subserver tree
show_ugroup=Selectie van verschillende groepen voor server admins toestaan?,1,1-Ja,0-Nee
theme_image=URL voor bedrijfs logo plaatje,3,Geen of standaard,50
theme_link=Bestemming's link voor bedrijfs logo,3,Geen,50
show_nf=Laat nieuwe opties zien aan,2,master-Hoofd administrator,reseller-Resellers,domain-Domein eigenaren
line1.5=Server administratie permissies,11
edit_afiles=Mag alias inclusief antwoord files bewerken?,1,1-Ja,0-Nee
edit_homes=Mag home directory's selecteren voor gebruiker?,1,1-Ja,0-Nee
edit_ftp=Mag FTP gebruiker maken?,1,1-Ja,0-Nee
edit_quota=Mag mailbox quota's instellen?,1,1-Ja,0-Nee
show_pass=Mag mailbox en virtuele server wachtwoorden zien?,1,1-Ja,0-Nee
batch_create=Mag diverse servers maken van een batch file?,1,1-Ja,0-Nee
alias_types=Toegestane alias types,13,1-Adres,2-Adres in file,3-File,4-Programma,5-Autoantwoord,6-Filter,7-Andere gebruiker mailbox,8-Zelfde mailbox in domein,9-Bounce,10-Gebruikers mailbox,11-Verwijder,Autoantwoord file,13-Iedereen
post_check=Update alle Webmin gebruikers zodra de configuratie verandert?,1,1-Ja,0-Nee
webmin_modules=Extra Webmin modules voor server administrators,15,modules,webmin_modules
webmin_theme=Webmin theme voor server administrators,15,theme,webmin_theme
show_tabs=Categorieen van Webmin modules op hoofd pagina?,1,1-Ja,0-Nee
domains_group=Voeg alle server administraties toe aan Unix groep,3,Geen
line2=Standaard voor nieuwe domeinen,11
home_base=Home directory basis,3,Van gebruikers en groepen module
home_format=Home subdirectory,10,-Automatisch,Van template (maak gebruik van $USER en $DOM)
append=Inclusief domein naam in gebruikersnamen?,1,1-Altijd,0-Alleen om clash te voorkomen
longname=Domein naam stijl in gebruikersnaam,1,1-Volledige domein naam,0-Gebruikersnaam of eerste gedeelte van domein,2-Eerste gedeelte van domein
groupsame=Forceer dat de groep naam altijd hetzelfde is als de gebruikersnaam?,1,1-Ja,0-Nee
localgroup=Primaire groep voor locale gebruikers,3,Laat locale gebruikers niet zien
mail_skel=Aanvankelijke file directory voor mail gebruikers,3,Geen
proxy_pass=Maken van Alleen-doorstuur website toestaan?,1,1-Ja gebruik proxy,2-Ja gebruik frame doorsturen,0-Nee
homes_dir=Subdirectory voor mailbox gebruikers home directory,0,20
passwd_mode=Wachtwoord veld type,1,1-Willekeurig gegenereerd wachtwoord,0-Wachtwoord 1x invullen,2-Wachtwoord 2x invullen
passwd_length=Lengte van willekeurig gegenereerd wachtwoord,3,Standaard (15 karakters),5
limitnoalias=Inclusief gelimiteerde alias servers?,1,0-Ja,1-Nee
denied_domains=Reguliere expressie voor niet toegestane domein namen,0
line2.1=SSL settings,11
key_size=Standaard SSL sleutel grote,3,Webmin standaard (512 bits),6,,bits
key_tmpl=Template voor prive sleutel pad,3,Standaard (<tt>~/ssl.key</tt>)
cert_tmpl=Template voor certificate pad,3,Standaard (<tt>~/ssl.cert</tt>)
ca_tmpl=Template voor CA certificate pad,3,Standaard (<tt>~/ssl.ca</tt>)
openssl_cnf=Locatie van de OpenSSL configuratie file,3,Automatisch uitwerken
line6.5=Reseller settings,11
reseller_theme=Theme voor nieuwe resellers,15,theme,reseller_theme
reseller_modules=Extra modules voor resellers,15,modules,reseller_modules
line4=Acties tijdens maken van server en gebruiker,11
from_addr=Van: adres voor email verstuurd door Virtualmin,3,Webmin standaard
from_reseller=Van: adres om email te versturen aan domein eigenaren,1,1-Reseller's adres (indien aanwezig),0-adres zoals hierboven ingesteld
pre_command=Uit te voeren opdracht voordat een server word verandert,0
post_command=Uit te voeren opdracht nadat een server is verandert,0
alias_pre_command=Uit te voeren opdracht voor veranderingen gemaakt zijn aan een alias,0
alias_post_command=Uit te voeren opdracht nadat veranderingen gemaakt zijn aan een alias,0
other_users=Wanneer server administrator Unix gebruiker word geupdate dit doorgeven aan andere modules?,1,1-Ja,0-Nee
other_doms=Wanneer de mailbox Unix gebruikers word geupdate dit doorgeven aan andere modules?,1,1-Ja,0-Nee
check_apache=Controleer Apache configuratie voordat iets word toegevoegd?,1,1-Ja,0-Nee
nodeniedssh=Gebruikers zonder SSH toegang toevoegen aan de <tt>deniedssh</tt> groep?,1,0-Ja,1-Nee
line4.5=Qmail+LDAP opties,11
ldap_host=LDAP server,0
ldap_port=LDAP poort,3,Standaard
ldap_login=Inlog voor LDAP server,0
ldap_pass=Wachtwoord voor LDAP server,0
ldap_base=Basis voor mail gebruikers,0
ldap_unix=Qmail LDAP gebruikers zijn ook Unix gebruikers?,1,1-Ja,0-Nee
ldap_mailstore=Mail opslag voor gebruikers,0
ldap_classes=Extra object classes voor LDAP gebruikers,0
ldap_aclasses=Extra object classes voor LDAP aliassen,0
ldap_props=Extra attributen voor LDAP gebruikers,9,40,3,\t
line4.6=VPOPMail opties,11
vpopmail_dir=Basis directory voor VPOPMail,0
vpopmail_user=VPOPMail gebruiker,5
vpopmail_group=VPOPMail groep,6
vpopmail_auto=Pad naar autorespond programma,3,Niet geinstalleerd
line4.7=Spam filter opties,11
spam_delivery=Standaard aflevering voor spam,10,-Normaal afleveren,/dev/null-Verwijder,$HOME/mail/spam-Spam mbox folder,$HOME/Maildir/.spam/-Spam Maildir folder,Andere file of email adres
clam_delivery=Standaard aflering voor virussen,10,/dev/null-Verwijder,$HOME/mail/virus-Virus mbox folder,$HOME/Maildir/.virus/-Virus Maildir folder,Andere file of email adres
spam_white=Standaard spam whitelist optie,1,1-Aangezet,0-Uitgeschakeld
spam_level=Standaard score om spam te verwijderen,3,Niet verwijderen,4
spam_lock=Spamassasin proces alleen uitvoeren op een bepaalde tijd?,1,1-Ja,0-Nee
spam_trap_black=Toegevoegde afzenders van spam versturen naar <tt>spamtrap</tt> aan zwarte lijst?,1,2-Globaal,1-Domein niveau,0-Nee
ham_trap_white=Afzenders toevoegen van Niet-spam versturen naar <tt>hamtrap</tt> naar whitelist?,1,2-Globaal,1-Domein niveau,0-Nee
line4.8=Quota opdrachten,11
quota_commands=Gebruik externe opdrachten om quota's te krijgen en zetten?,1,1-Ja,0-Nee
quota_set_user_command=Opdracht om gebruiker quota te zetten,3,Gebruik standaard programma's
quota_set_group_command=Opdracht om groep quota te zetten,3,Gebruik standaard programma's
quota_list_users_command=Opdracht om lijst te maken van gebruiker quota's,3,Gebruik standaard programma's
quota_list_groups_command=Opdracht om lijst te maken van groep quota's,3,Gebruik standaard programma's
quota_get_user_command=Opdracht om een gebruikers quota te krijgen,3,Gebruik standaard programma's
quota_get_group_command=Opdracht om een groeps quota te krijgen,3,Gebruik standaard programma's
line5=Webmin modules beschikbaar voor server administrators,11
avail_dns=BIND DNS Server (voor DNS domein),1,1-Ja,0-Nee
avail_mail=Virtuele Email (voor mailboxen en aliassen),1,1-Ja,0-Nee
avail_web=Apache Webserver (voor virtuele host),1,1-Ja,0-Nee
avail_webalizer=Webalizer Logfile Analyse (voor website's logs),1,1-Ja,0-Nee
avail_mysql=MySQL Database Server (voor database),1,1-Ja,0-Nee
avail_postgres=PostgreSQL Database Server (voor database),1,1-Ja,0-Nee
avail_spam=SpamAssassin Mail Filter (voor domein config file),1,1-Ja,0-Nee
line3=Extra modules beschikbaar voor server administrators,11
avail_file=File Manager (alleen home directory),1,1-Ja,0-Nee
avail_passwd=Verander Wachtwoord,1,2-Gebruiker en mailboxen wachtwoord,1-Gebruikers wachtwoord,0-Nee
avail_proc=Lopende Processen (alleen gebruikers processen),1,2-Zie eigen processen,1-Zie alle processen,0-Nee
avail_cron=Geplande Cron Jobs (gebruikers Cron Jobs),1,1-Ja,0-Nee
avail_at=Geplande Opdrachten (gebruikers opdrachten),1,1-Ja,0-Nee
avail_telnet=SSH/Telnet Login,1,1-Ja,0-Nee
avail_updown=Upload en Download (als gebruiker),1,1-Ja,0-Nee,2-Alleen upload
avail_change-user=Verander Taal en Theme,1,1-Ja,0-Nee
avail_htaccess-htpasswd=Beschermde Web Directory's (onder de home directory),1,1-Ja,0-Nee
avail_mailboxes=Lees Gebruiker Mail (gebruikers mailboxen),1,1-Ja,0-Nee
avail_custom=Custom Opdrachten,1,1-Ja,0-Nee
avail_shell=Opdracht Shell (opdrachten uitvoeren als admin),1,1-Ja,0-Nee
avail_webminlog=Webmin Actie Log (bekijk eigen acties),1,1-Ja,0-Nee
avail_syslog=Systeem Logs (bekijk Apache en FTP logs),1,1-Ja,0-Nee
avail_phpini=PHP Configuratie (voor domein php.ini files),1,1-Ja,0-Nee
line7=Status verzamelen,11
collect_interval=Interval tussen job status verzamelen,10,none-Nooit uitvoeren,Minuten
collect_restart=Herstart een service die als uitgeschakeld word gedetecteerd?,1,1-Ja,0-Nee
line6=Geavanceerde opties,11
iface_base=Basis aantal voor virtuele interfaces,3,Automatisch
iface_manual=Naar boven halen van virtuele interfaces?,1,0-Ja,1-Nee
dns_check=Controleer resolv.conf voor dit systeem?,1,1-Ja,0-Nee
delete_indom=Verwijder alle Apache virtuele hosts in het domein wanneer word verwijdert?,1,1-Ja,0-Nee
ldap_mail=Toevoegen van attributen aan LDAP gebruikers?,1,1-Ja gebruik alleen <tt>mail</tt> attributen,2-Ja gebruik <tt>mail</tt> en <tt>mailAlternateAddress</tt>,0-Nee
maillog_period=Aantal dagen om verwerkte mail logs te bewaren,3,Voor altijd
allow_upper=Forceer mailbox gebruikersnamen in kleine letter?,1,0-Ja,1-Nee
delete_virts=Verwijder alle email aliassen wanneer mail word uitgeschakeld?,1,1-Ja,0-Nee
leave_acl=Altijd Webmin module ACLs opnieuw updaten?,1,0-Ja,1-Nee
webalizer_nocron=Webalizer Cron job opzetten voor iedere virtuele server?,1,0-Ja,1-Nee
allow_subdoms=Sub-domeinen maken toestaan?,1,1-Ja,0-Nee,-Beslis automatisch
mem_cmd=Opdracht om geheugen gebruik te verkrijgen,3,Vraag aan het systeem
api_helper=Pad naar opdracht om API helper te maken,3,Beslis automatisch
fcgid_max=Maximale fcgid executie tijd,10,-Van PHP configuratie,*-Niet instellen,Tijd in seconden
