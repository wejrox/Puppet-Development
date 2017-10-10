class iniConfig {
	augeas { 'agent_runinterval':
		context => "/etc/puppetlabs/puppet/puppet.conf/agent",
		changes => [
			"set runinterval 20m",
		],
	}

	augeas { 'runlevel': 
		context => "/files/etc/inittab",
		changes => [
			"set id/runlevels 3",
		],
	}

	# Set the timestamp to client
	class iniConfig::motd {
		$timeStamp = generate('/bin/date', '+%d-%m-%Y_%H.%M.%S')
		file { '/etc/timestampLog'}
		notice("Agent started running at $timeStamp")
	}
	
	# Include /usr/local/bin to user
	file {'/etc/profile.d/set-user-bin.sh':
		owner	=> 'root',
		mode 	=> '0644',
		content => 'PATH=$PATH:/usr/local/bin',
	}
}