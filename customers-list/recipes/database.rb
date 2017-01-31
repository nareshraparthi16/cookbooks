#
# Cookbook Name:: customers-list
# Recipe:: database
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
   # Configure the MySQL client.
   mysql_client 'default' do
   action :create
   end

   # Configure the MySQL service.
   mysql_service 'default' do
   initial_root_password node['customers-list']['database']['root_password']
   action [:create, :start]
   end
   #Install the mysql2 Ruby gem.
   mysql2_chef_gem 'default' do
   action :install
   end
# Create the database instance.
   mysql_database node['customers-list']['database']['dbname'] do
   connection(
    :host => node['customers-list']['database']['host'],
    :username => node['customers-list']['database']['root_username'],
    :password => node['customers-list']['database']['root_password']
     )
    action :create
     end
# Add a database user.
      mysql_database_user node['customers-list']['database']['admin_username'] do
      connection(
        :host => node['customers-list']['database']['host'],
        :username => node['customers-list']['database']['root_username'],
        :password => node['customers-list']['database']['root_password']
                )
        password node['customers-list']['database']['admin_password']
        database_name node['customers-list']['database']['dbname']
        host node['customers-list']['database']['host']
         action [:create, :grant]
         end
# Create a path to the SQL file in the Chef cache.
  create_tables_script_path = File.join(Chef::Config[:file_cache_path], 'create-tables.sql')

# Write the SQL script to the filesystem.
        cookbook_file create_tables_script_path do
        source 'create-tables.sql'
        owner 'root'
        group 'root'
         mode '0600'
         end
# Seed the database with a table and test data.
   execute 'initialize my_company database' do
   command "mysql -h 127.0.0.1 -u db_admin -pdatabase_password -D my_company < /tmp/create-tables.sql"
   not_if  "mysql -h 127.0.0.1 -u db_admin -pdatabase_password -D my_company -e 'describe customers;'"
     end

# Seed the database with a table and test data.
 execute "initialize #{node['customers-list']['database']['dbname']} database" do
   command "mysql -h #{node['customers-list']['database']['host']} -u #{node['customers-list']['database']['admin_username']} -p#{node['customers-list']['database']['admin_password']} -D #{node['customers-list']['database']['dbname']} < #{create_tables_script_path}"
     not_if  "mysql -h #{node['customers-list']['database']['host']} -u #{node['customers-list']['database']['admin_username']} -p#{node['customers-list']['database']['admin_password']} -D #{node['customers-list']['database']['dbname']} -e 'describe customers;'"
     end
