#
# Cookbook Name:: mysql_database
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
# Install the mysql2 Ruby gem.
mysql2_chef_gem 'default' do
  action :install
end

include_recipe 'mysql_database::install_configure_database'
#
# Create a mysql database
mysql_database 'myproject-demo' do
  connection(
    :host     => '127.0.0.1',
    :username => 'root',
    :password => node['wordpress-cust01']['mysql']['initial_root_password']
  )
  action :create
end

mysql_database_user 'disenfranchised' do
  connection mysql_connection_info
  password   'super_secret'
  action     :create
end
