#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
package 'httpd'do 
action :install
end
 packahe 'httpd' do 
action :enable
end
package 'httpd' do 
action :start
end

$firewall-cmd --add-service=http
$firewall-cmd --permanent --add-service=http
$systemctl restart firewalld
