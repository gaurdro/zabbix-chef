include_recipe 'zabbix::common'

package "redhat-lsb" do
  action :install
end
