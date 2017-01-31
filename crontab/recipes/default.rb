#
# Cookbook Name:: crontab
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

cron 'chef-client' do
  minute '5'
  hour '*'
  day '*'
  month '*'
  weekday '*'
  command "/usr/bin/chef-client"
end
