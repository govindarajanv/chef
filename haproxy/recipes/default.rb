#
# Cookbook Name:: haproxy
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'haproxy'

service 'haproxy' do
	action [:enable, :start]
end
