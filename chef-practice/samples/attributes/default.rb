# *** Tomcat tuning
#
default['app_name']['serverxml']['tomcatThreadPool']['maxThreads'] = 300
default['app_name']['serverxml']['tomcatThreadPool']['minSpareThreads'] = 50
#
# *** Spring
# #
# default['app_name']['spring']['datasource']['url'] = nil
# default['app_name']['spring']['datasource']['db_name'] = nil
# default['app_name']['spring']['datasource']['username'] = nil
# default['app_name']['spring']['datasource']['password'] = nil
#
node.default['app_name']['to_be_deployed'] =
{
        'app_name_1' => node['app_name']['module_name']['package_name_1']['pkg_version'],
        'app_name_2' => node['app_name']['module_name']['package_name_2']['pkg_version'],
}
