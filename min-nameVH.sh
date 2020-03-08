#!/bin/bash

cat << "EOF" >> /etc/apache2/httpd.conf
NameVirtualHost 192.168.0.2:80

<VirtualHost 192.168.0.2:80>
    ServerName vhost1.kishiro.com
    ServerAdmin root@kishiro.com
    DocumentRoot "/home/www/content/vhost1/root_http"
</VirtualHost>

<VirtualHost 192.168.0.2:80>
    ServerName vhost2.kishiro.com
    ServerAdmin root@kishiro.com
    DocumentRoot "/home/www/content/vhost2/root_http"
</VirtualHost>

EOF
