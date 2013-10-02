class agent (
  $puppet_server = 'puppet',
  $puppet_ca = 'puppet',
  $puppet_certname = $::fqdn,
  $puppet_environment = 'production',
  $puppet_start = true,
  $puppet_symlink = true,
) {
  
  file { '/etc/puppetlabs/puppet/puppet.conf':
    ensure  => file,
    owner   => pe-puppet,
    group   => pe-puppet,
    mode    => 0600,
    content => template('agent/puppet.conf.erb'),
  }

  if $puppet_start == true {
    service { 'pe-puppet':
      ensure    => running,
      enable    => true,
      subscribe => File['/etc/puppetlabs/puppet/puppet.conf'],
    }
  }

  if $puppet_symlink == true {
    file { '/usr/local/bin/puppet':
      ensure => link,
      target => '/opt/puppet/bin/puppet',
    }
    file { '/usr/local/bin/facter':
      ensure => link,
      target => 'opt/puppet/bin/facter',
    }
  }

}
