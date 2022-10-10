yum -y update
yum -y install httpd 

myip = `curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat  << EOF > /var/www/html/index.html
<html>
<h2> 1 </h2>
Owner ${f_name} ${l_name}

%{for x in names ~}
Hello to ${x}  from ${f_name}<br>

%{endfor ~}


</html>


EOF

sudo service httpd start
chkconfig httpd on