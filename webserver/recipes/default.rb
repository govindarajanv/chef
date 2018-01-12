#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
package 'httpd'

service 'httpd' do
	action [:enable, :start]
end
