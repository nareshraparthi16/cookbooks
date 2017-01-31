#
# Cookbook Name:: rnareshnewcb
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#package 'tomcat' do 
#action :install
#end
 
directory '/tmp/sample-dir' do
 owner 'root'
 group 'root'
 mode 0755
 action :create
end
