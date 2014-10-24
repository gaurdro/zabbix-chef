# Author:: Ross Smith (<rjsm@umich.edu>)
# Cookbook Name:: zabbix
# Recipe:: agent_package
#
# Apache 2.0
#

#include_recipe 'zabbix::agent_common'

yum_package "zabbix-agent" do
  action :upgrade
  flush_cache [:before]
end

include_recipe 'zabbix::agent_common'

