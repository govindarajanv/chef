#
# Cookbook Name:: elk_stack
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
include_recipe 'elk_stack::elastic_search'
include_recipe 'elk_stack::kibana'
include_recipe 'elk_stack::log_stash'
