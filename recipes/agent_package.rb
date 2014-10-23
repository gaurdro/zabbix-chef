# Author:: Ross Smith (<rjsm@umich.edu>)
# Cookbook Name:: zabbix
# Recipe:: agent_package
#
# Apache 2.0
#

#include_recipe 'zabbix::agent_common'

package "zabbix" do
  action :upgrade
end

include_recipe 'zabbix::agent_common'

