include epel

package { 'java-1.7.0-openjdk-devel':
  ensure => installed,
}

class { 'elasticsearch':
  manage_repo  => true,
  repo_version => '1.1',

  config      => {
    'node'    => {
      'name' => "elasticsearch-$ipaddress_eth0"
    },
  },
}

elasticsearch::plugin{'mobz/elasticsearch-head':
  module_dir => 'head'
}

elasticsearch::plugin{'royrusso/elasticsearch-HQ':
  module_dir => 'HQ'
}

include redis

class { 'logstash':
  manage_repo => true,
  repo_version => '1.4'
}

logstash::configfile { 'input_redis':
  content => template('input_redis.erb'),
  order   => 10,
}

logstash::configfile { 'output_es':
  content => template('output_es_cluster.erb'),
  order   => 30,
}

class { 'kibana3': }

service { 'iptables':
  ensure => stopped,
  enable => false,
}
