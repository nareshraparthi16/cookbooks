#
# Cookbook Name:: docker_image
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Pull latest image
docker_image 'nginx' do
  tag 'latest'
  action :pull
end

# Run container exposing ports
docker_container 'my_nginx' do
  repo 'nginx'
  tag 'latest'
  port '80:80'
  binds [ '/some/local/files/:/etc/nginx/conf.d' ]
  host_name 'www'
  domain_name 'computers.biz'
  env 'FOO=bar'
  subscribes :redeploy, 'docker_image[nginx]'
end
