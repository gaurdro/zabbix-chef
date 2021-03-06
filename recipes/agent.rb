include_recipe "zabbix::common"
include_recipe "zabbix::agent_#{node['zabbix']['agent']['install_method']}"

#define out service
service "zabbix-agent" do
  action :enable
end 

# Install configuration
template 'zabbix_agentd.conf' do
  path node['zabbix']['agent']['config_file']
  source 'zabbix_agentd.conf.erb'
    owner 'root'
    group 'root'
    mode '644'
  notifies :restart, 'service[zabbix-agent]'
end

# Install optional additional agent config file containing UserParameter(s)
template 'user_params.conf' do
  path node['zabbix']['agent']['userparams_config_file']
  source 'user_params.conf.erb'
    owner 'root'
    group 'root'
    mode '644'
  notifies :restart, 'service[zabbix-agent]'
  only_if { node['zabbix']['agent']['user_parameter'].length > 0 }
end

ruby_block 'start service' do
  block do
    true
  end
  Array(node['zabbix']['agent']['service_state']).each do |action|
    notifies action, 'service[zabbix-agent]'
  end
end
