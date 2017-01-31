#
# Cookbook Name:: customers-list
# Recipe:: web
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
# Install Apache and start the service.
 httpd_service 'customers' do
 mpm 'prefork'
 action [:create, :start]
    end

# Add the site configuration.
   httpd_config 'customers' do
   instance 'customers'
   source 'customers.conf.erb'
   notifies :restart, 'httpd_service[customers]'
    end
# Create the document root directory.
   directory node['customers-list']['document_root'] do
   recursive true
    end

# Write the home page.
  template "#{node['customers-list']['document_root']}/index.php" do
  source 'index.php.erb'
   mode '0644'
   owner node['customers-list']['user']
   group node['customers-list']['group']
    end
# Install the mod_php Apache module.
   httpd_module 'php' do
   instance 'customers'
   end

   # Install php-mysql.
   package 'php-mysql' do
   action :install
   notifies :restart, 'httpd_service[customers]'
       end
