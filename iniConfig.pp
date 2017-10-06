class iniConfig {
	augeas { 'agent_runinterval':
		context => "/etc/puppetlabs/puppet/puppet.conf/agent",
		changes => [
			"set runinterval=20m",
			],
		require => File['puppet.conf'],
	}

	augeas { 'runlevel': 
		context => "/files/etc/inittab",
		changes => [
			"set id/runlevels 3",
			],
		}
}