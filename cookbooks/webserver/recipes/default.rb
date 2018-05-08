#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
package 'httpd'

include_recipe 'webserver::configure'
service 'httpd' do
  action %i[enable start]
end
