#
# Cookbook Name:: customers-list
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

 include_recipe 'selinux::permissive'
 include_recipe 'customers-list::firewall'
 include_recipe 'customers-list::web_user'
 include_recipe 'customers-list::web'
 include_recipe 'customers-list::database'
