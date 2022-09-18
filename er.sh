echo "################Emergency Response By HSCSEC################" > result.log
echo "----------------uptime----------------" >> result.log
uptime >> result.log
echo "----------------netstat -antlp----------------" >> result.log
netstat -antlp | more >> result.log
echo "----------------/etc/rc.local----------------" >> result.log
ls -l /etc/rc.local >> result.log
echo "----------------ps aux | grep crond----------------" >> result.log 
ps aux | grep crond >> result.log
echo "----------------ps aux----------------" >> result.log 
ps aux >> result.log
echo "----------------pstree----------------" >> result.log 
pstree >> result.log
echo "----------------chkconfig----------------" >> result.log
chkconfig  --list >> result.log
echo "----------------chkconfig --list | grep----------------" >> result.log
chkconfig --list | grep "3:on\|5:on" >> result.log
echo "----------------/etc/rsyslog.conf----------------" >> result.log
cat /etc/rsyslog.conf >> result.log
echo "">> result.log
echo "">> result.log
echo "">> result.log
echo "################CRONTAB################" >> result.log
echo "----------------/etc/anacrontab----------------" >> result.log
cat /etc/anacrontab >> result.log
echo "----------------/etc/crontab----------------" >> result.log 
cat /etc/crontab >> result.log
echo "----------------crontab/root----------------" >> result.log 
cat /var/spool/cron/crontabs/root >> result.log
echo "----------------/etc/cron.d/*----------------" >> result.log
cat /etc/cron.d/* >> result.log
cat /etc/cron.d/.* >> result.log
echo "----------------cron daily----------------" >> result.log
cat /etc/cron.daily/*  >> result.log
cat /etc/cron.daily/.*  >> result.log
echo "----------------cron hourly----------------" >> result.log
chkconfig --list | grep "3:on\|5:on" >> result.log
cat /etc/cron.hourly/.* >> result.log
echo "----------------cron monthly----------------" >> result.log 
cat /etc/cron.monthly/* >> result.log
cat /etc/cron.monthly/.* >> result.log
echo "----------------cron weekly----------------" >> result.log
cat /etc/cron.weekly/* >> result.log
cat /etc/cron.weekly/.* >> result.log
echo "----------------cron/*/*----------------" >> result.log
cat /var/spool/cron/*/* >> result.log
echo "----------------spool anacron----------------" >> result.log
cat /var/spool/anacron/* >> result.log
echo "----------------/etc/anacrontab----------------" >> result.log
cat /etc/anacrontab >> result.log
echo "################CRONTAB################" >> result.log
echo "">> result.log
echo "">> result.log
echo "">> result.log
echo "################SECURE################" >> result.log
echo "----------------/etc/passwd----------------" >> result.log
cat /etc/passwd >> result.log
echo "----------------/etc/shadow----------------" >> result.log
cat /etc/shadow >> result.log
echo "----------------Other user for sudo----------------" >> result.log
cat /etc/sudoers | grep -v "^#\|^$" | grep "ALL=(ALL)" >> result.log
echo "----------------Remote login account----------------" >> result.log
awk '/\$1|\$6/{print $1}' /etc/shadow >> result.log
echo "----------------Failed password for root----------------" >> result.log
grep "Failed password for root" /var/log/secure | awk '{print $11}' | sort | uniq -c | sort -nr >> result.log
grep "Failed password for root" /var/log/auth.log | awk '{print $11}' | sort | uniq -c | sort -nr >> result.log
echo "----------------Failed password IP----------------" >> result.log
grep "Failed password" /var/log/secure | grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"|uniq -c >> result.log
grep "Failed password" /var/log/auth.log | grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"|uniq -c >> result.log
echo "----------------Failed password USER----------------" >> result.log
grep "Failed password" /var/log/secure|perl -e 'while($_=<>){ /for(.*?) from/; print "$1\n";}'|uniq -c|sort -nr >> result.log
grep "Failed password" /var/log/auth.log|perl -e 'while($_=<>){ /for(.*?) from/; print "$1\n";}'|uniq -c|sort -nr >> result.log
echo "----------------Login Accepted DATA USER IP----------------" >> result.log
grep "Accepted " /var/log/secure | awk '{print $1,$2,$3,$9,$11}' >> result.log
grep "Accepted " /var/log/auth.log | awk '{print $1,$2,$3,$9,$11}' >> result.log
echo "----------------Login Accepted----------------" >> result.log
grep "Accepted " /var/log/secure | awk '{print $11}' | sort | uniq -c | sort -nr >> result.log
grep "Accepted " /var/log/auth.log | awk '{print $11}' | sort | uniq -c | sort -nr >> result.log
echo "----------------Login Accepted----------------" >> result.log
grep "Accepted " /var/log/secure | awk '{print $1,$2,$3,$9,$11}' >> result.log
grep "Accepted " /var/log/auth.log | awk '{print $1,$2,$3,$9,$11}' >> result.log
echo "----------------useradd----------------" >> result.log
grep "useradd" /var/log/secure  >> result.log
grep "useradd" /var/log/auth.log  >> result.log
echo "----------------userdel----------------" >> result.log
grep "userdel" /var/log/secure >> result.log
grep "userdel" /var/log/auth.log >> result.log
echo "----------------last----------------" >> result.log
last >> result.log
echo "----------------lastlog----------------" >> result.log
lastlog >> result.log
echo "----------------lastb----------------" >> result.log
lastb >> result.log
echo "----------------Kernel and public information logs----------------" >> result.log
cat /var/log/messages/* >> result.log
echo "----------------history----------------" >> result.log
history >> result.log
echo "----------------top----------------" >> result.log
top -n 1 -b >> result.log
echo "################SECURE################" >> result.log
