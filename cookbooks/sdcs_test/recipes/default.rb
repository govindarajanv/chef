# Cookbook Name:: ofe-sdcs-install 
# Recipe:: default # Copyright 2016, Optum 
# All rights reserved - Do Not Redistribute 
case node['platform'] 
when 'redhat'   
  include_recipe 'test_sdcs_install::rhel-install' 
when 'windows'   
  include_recipe 'test_sdcs_install::win-install' 
end

