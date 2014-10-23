include_recipe "zabbix::common"
include_recipe "zabbix::web_#{node['zabbix']['web']['install_method']}"
