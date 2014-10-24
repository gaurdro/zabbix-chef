# Author:: Ross Smith (<rjsm@umich.edu>)
# Cookbook Name:: zabbix
# Recipe:: agent_package
#
# Apache 2.0
#

package "zabbix-server-mysql" do
  action :upgrade
  flush_cache [:before] 
end

include_recipe 'zabbix::server_common'

