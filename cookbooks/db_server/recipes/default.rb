#
# Cookbook Name:: db_server
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
include_recipe 'yum-mysql-community::mysql57'

mysql_client 'default' do
  action :create
end

mysql_service 'my_sql_installation' do
  port '3306'
  version '5.7'
  initial_root_password 'abc123'
  action [:create, :start]
end

mysql2_chef_gem 'default' do
  action :install
end
