#
# Cookbook Name:: sgadgil-webserver
# Recipe:: default
#
# Copyright 2016, My Company
#
# All rights reserved - Do Not Redistribute
#

package 'httpd' do
  action :install
end

service 'httpd' do
  action [:enable, :start]
end
