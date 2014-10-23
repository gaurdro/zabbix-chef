# Author:: Nacer Laradji (<nacer.laradji@gmail.com>)
# Cookbook Name:: zabbix
# Recipe:: common
#
# Copyright 2011, Efactures
#
# Apache 2.0
#

# install mysql gem for chef
chef_gem 'mysql' do
  action :install
end 
# Define root owned folders
root_dirs = [
  node['zabbix']['etc_dir'],
]

# Create root folders
case node['platform_family']
when 'windows'
  root_dirs.each do |dir|
    directory dir do
      owner 'Administrator'
      rights :read, 'Everyone', :applies_to_children => true
      recursive true
    end
  end
else
  root_dirs.each do |dir|
    directory dir do
      owner 'root'
      group 'root'
      mode '755'
      recursive true
    end
  end
end

# Define zabbix owned folders
zabbix_dirs = [
  node['zabbix']['log_dir'],
  node['zabbix']['run_dir']
]

# Create zabbix folders
zabbix_dirs.each do |dir|
  directory dir do
    owner node['zabbix']['login']
    group node['zabbix']['group']
    mode '755'
    recursive true
    # Only execute this if zabbix can't write to it. This handles cases of
    # dir being world writable (like /tmp)
    not_if { ::File.world_writable?(dir) }
  end
end

remote_file "/tmp/zabbix-repo.rpm" do
  source "http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm"
  mode 0644
end

rpm_package "zabbix-repo" do
  source "/tmp/zabbix-repo.rpm"
  action :install
end

unless node['zabbix']['agent']['source_url']
  node.default['zabbix']['agent']['source_url'] = Chef::Zabbix.default_download_url(node['zabbix']['agent']['branch'], node['zabbix']['agent']['version'])
end

unless node['zabbix']['server']['source_url']
  node.default['zabbix']['server']['source_url'] = Chef::Zabbix.default_download_url(node['zabbix']['server']['branch'], node['zabbix']['server']['version'])
end
