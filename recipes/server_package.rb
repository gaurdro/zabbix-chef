# Author:: Ross Smith (<rjsm@umich.edu>)
# Cookbook Name:: zabbix
# Recipe:: agent_package
#
# Apache 2.0
#

#include_recipe 'zabbix::agent_common'

case node['platform']
remote_file "/tmp/zabbix-repo.rpm" do
  source "http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm"
  mode 0644
  checksum ""
end

rpm_package "zabbix-repo" do
  source "/tmp/zabbix-repo.rpm"
  action :install
end 

package "zabbix" do
  action :upgrade
end

include_recipe 'zabbix::servewr_common'

