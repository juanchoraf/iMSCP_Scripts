printf "\n
******************************************************************************************************\r
************************************** AnonPro i-MSCP Uninstall **************************************\r
******************************************************************************************************\n
 [AnonB0T] I'm going to clean your system, this could take some minutes... \r
 [AnonB0T] Go for a cup of coffee :D \n
   [info] Linux Header: %s\r
   [info] Linux Version: %s\r
   [info] Processor Type: %s\r
   [info] Operative System: \n%s\n
   [info] Stopping Services...\n\n" "$(uname -a)" "$(uname -r)" "$(uname -m)" "$(lsb_release -a)"
sleep 4s

service imscp* stop
service php* stop
service mysql* stop
service dovecot* stop
service postfix* stop
service apache* stop
service nginx* stop
service proftpd* stop
service fail2ban* stop
service bind9* stop

T1='   [info] %s services are running, PIDs are %s\n';
T2='   [info] %s services goes down!\n';
if P=$(pgrep imscp*); then printf "$T1" 'iMSCP' "$(pgrep imscp* | tr '\n\r' ' ')"; else printf "$T2" 'iMSCP'; fi
if P=$(pgrep php*); then printf "$T1" 'Php' "$(pgrep php* | tr '\n\r' ' ')"; else printf "$T2" 'Php'; fi
if P=$(pgrep mysql*); then printf "$T1" 'Mysql' "$(pgrep mysql* | tr '\n\r' ' ')"; else printf "$T2" 'Mysql'; fi
if P=$(pgrep dovecot*); then printf "$T1" 'Dovecot' "$(pgrep dovecot* | tr '\n\r' ' ')"; else printf "$T2" 'Dovecot'; fi
if P=$(pgrep postfix*); then printf "$T1" 'Postfix' "$(pgrep postfix* | tr '\n\r' ' ')"; else printf "$T2" 'Postfix'; fi
if P=$(pgrep apache*); then printf "$T1" 'Apache' "$(pgrep apache* | tr '\n\r' ' ')"; else printf "$T2" 'Apache'; fi
if P=$(pgrep nginx*); then printf "$T1" 'Nginx' "$(pgrep nginx* | tr '\n\r' ' ')"; else printf "$T2" 'Nginx'; fi
if P=$(pgrep proftpd*); then printf "$T1" 'Proftpd' "$(pgrep proftpd* | tr '\n\r' ' ')"; else printf "$T2" 'Proftpd'; fi
if P=$(pgrep fail2ban*); then printf "$T1" 'Fail2Ban' "$(pgrep fail2ban* | tr '\n\r' ' ')"; else printf "$T2" 'Fail2Ban'; fi
if P=$(pgrep bind9*); then printf "$T1" 'Bind9' "$(pgrep bind9* | tr '\n\r' ' ')"; else printf "$T2" 'Bind9'; fi

apt-get -y remove --purge dovecot* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge postfix* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge proftpd* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge vsftpd* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge nagios* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge awstats* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge phpmyadmin* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge libapache2-mod-security* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge libapache2-mod-evasive* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge fail2ban* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge php* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge apache* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge nginx* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge mysql* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge bind* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge bind9* && apt-get -y autoremove && apt-get -y autoclean
apt-get -y remove --purge zip unzip && apt-get -y autoremove && apt-get -y autoclean
apt-get -y autoremove && apt-get -y autoclean

rm -fR /var/www/imscp/{daemon,engine,gui}
rm -fR /var/cache/imscp/
rm -fR /var/local/imscp/
rm -fR /var/log/imscp
rm -fR /tmp/imscp/
rm -fR /etc/imscp/
rm -fR /etc/logrotate.d/imscp
rm -fR /etc/apt/preferences.d/imscp
rm -fR /etc/cron.d/imscp
rm -fR /var/log/mod_evasive/
rm -fR /usr/local/src/*
rm -fR /etc/vsftpd/
rm -fR /etc/dovecot/
rm -f */imap/*/*/Maildir/dovecot*
rm -f */imap/*/*/Maildir/.*/dovecot*
rm -f */Maildir/dovecot*
rm -f */Maildir/.*/dovecot*
rm -fR /etc/postfix/
rm -fR /etc/apache2/
rm -fR /etc/modsecurity2/
rm -fR /etc/nginx/
rm -fR /etc/mysql/
rm -fR /var/lib/mysql*
rm -fR /etc/php*

apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
apt-get -y autoremove && apt-get -y autoclean

printf "\n [AnonB0T] I already cleaned out your system! \n [AnonB0T] Now I'm going to search for some gargabe files, this could take some minutes... \n\n"
find / -type f \( -name 'ajaxplorer' -o -name 'pydio' -o -name 'phpmyadmin' -o -name 'roundcube' -o -name 'imscp' \)
printf "\n [AnonB0T] Attention: If you see over here any file route, please delete it to complete the cleaning of your system! \n [AnonB0T] If you don't see anything, cool! your system is already clean! \n [AnonB0T] Advice: Reboot your system now to apply all the changes! \n\n"
