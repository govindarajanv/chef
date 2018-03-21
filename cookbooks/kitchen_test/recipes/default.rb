#
# Cookbook Name:: kitchen_test
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
require "chef/mixin/powershell_out"
include Chef::Mixin::PowershellOut
file '/etc/motd' do
	content 'Welcome to Kitchen Testing'
	mode '0755'
end
