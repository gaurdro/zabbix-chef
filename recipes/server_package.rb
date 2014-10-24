# Author:: Ross Smith (<rjsm@umich.edu>)
# Cookbook Name:: zabbix
# Recipe:: agent_package
#
# Apache 2.0
#
include_recipe 'zabbix::server_common'

yum_package "zabbix-server-mysql" do
  action :upgrade
  flush_cache [:before] 
end

# start zabbix server!
service "zabbix-server" do
  action :enable
end

service "zabbix-server" do
  action :start
end
