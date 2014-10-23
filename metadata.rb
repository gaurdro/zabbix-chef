name 'zabbix'
maintainer 'Ross Smith'
maintainer_email 'rjsm@umich.edu'
license 'Apache 2.0'
description 'Installs/Configures Zabbix Agent/Server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.8.0'
supports 'redhat', '>= 6.0'
supports 'centos', '>= 6.0'
supports 'oracle', '>= 6.0'
supports 'amazon', '>=2014.09'
depends 'yum'
depends 'php'
depends 'yum-epel'
