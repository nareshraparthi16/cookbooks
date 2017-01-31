#
# Cookbook Name:: sgadgil-httpd-test
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#package 'httpd' do
#action: install
#end

# package 'httpd'

#How to install multiple packages

#package [ 'httpd', 'postfix' ] do
#action: install
#end

#How to install condition
#

package 'Install Apache' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'httpd' 
  when 'ubuntu', 'debain'
    package_name 'apache2'
  end
end

service 'httpd' do
 action [ :enable, :start]
end


