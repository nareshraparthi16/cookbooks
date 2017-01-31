#
# Cookbook Name:: sgadgil-user-test
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# groupadd -g 1234 user01
#
group 'user01' do
 gid     1234
end

# useradd -u 1234 -g 1234 -d /home/user01 -s /bin/bash user01
# passwd user01
#
user 'user01' do
 uid            1234
 gid            1234
 home           '/home/user01'
 shell          '/bin/bash'
 comment        'This user is created with chef'
 password       '$1$aes$9T1p7ePn9qq7bgYegQORL1'
end

# usermod -G wheel user01
#
group 'wheel' do
 action :modify
 members 'user01'
 append true
end

