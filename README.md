Simple agent configuration task

meant to be run via a puppet apply, but could be used for other things:

`/opt/puppet/bin/puppet apply --modulepath=/home/vagrant/modules/ -e "class{'agent': puppet_server => 'puppet', puppet_ca => 'puppet'}"`
