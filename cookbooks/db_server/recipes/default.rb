#
# Cookbook Name:: db_server
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

# This is one way of accessing accessing a data bag named mysql with data bag item named 'rtpass.json' and value is returned to mysqlpass
#mysqlpass = data_bag_item("mysql", "rtpass.json",IO.read("/etc/chef/encrypted_data_bag_secret"))

# Load the secret key
#my_secret_key = Chef::EncryptedDataBagItem.load_secret("/etc/chef/encrypted_data_bag_secret")
# Read the set password
#password_set = Chef::EncryptedDataBagItem.load("mysql", "root_passwd", my_secret_key)

#include recipe for installing and configuring mysql server
include_recipe 'db_server::install_configure_mysql'

#mysql_service 'mysql-server' do
#  port '3306'
#  version '5.5'
#  initial_root_password password_set['password']
#  action [:create, :start]
#end
##You can put extra configuration into the conf.d directory by using the mysql_config resource
#mysql_config 'mysql-server' do
#  source 'mysql_extra_settings.erb'
#    notifies :restart, 'mysql_service[mysql-server]'
#      action :create
#end
