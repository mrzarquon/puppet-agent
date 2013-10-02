class agent (
  puppet_server = 'puppet',
  puppet_ca = 'puppet',
  puppet_certname = $::fqdn,
  puppet_environment = $::environment,
  puppet_start = true,
) {
  
  file { '/etc/puppetlabs/puppet/puppet.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template('agent/puppet.conf.erb'),
  }

  if $puppet_start == true {
    service { 'pe-puppet':
      ensure    => running,
      enable    => true,
      subscribe => File['/etc/puppetlabs/puppet/puppet.conf'],
    }
  }

}
