#
# Copyright (c) 2017 The Authors, All Rights Reserved.
group 'web_admin'

user 'web_admin' do
user 'web_admin' do
group node['customers-list']['group']

user node['customers-list']['user'] do
  group node['customers-list']['group']
  system true
  shell '/bin/bash'
end
