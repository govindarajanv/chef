#
# Cookbook Name:: db_server
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
mysqlpass = data_bag_item("mysql", "rtpass.json")

mysql_service "mysqldefault" do
  port '3306'
  version '5.7'
  initial_root_password mysqlpass["password"]
  action [:create, :start]
end

mysql2_chef_gem 'default' do
  action :install
end
