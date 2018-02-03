#
# Cookbook:: app_service
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# install java

include_recipe "java"

# install tomcat

package 'tomcat'
