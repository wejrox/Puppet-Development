class iniConfig {
	augeas { 'agent_runinterval_exists':
		context => "/etc/puppetlabs/puppet/puppet.conf/agent",
		changes => "set runinterval 20m",
	}

	exec { 'runlevel': 
		command => '/usr/bin/systemctl set-default multi-user.target',
	}

	# Set the timestamp to client
	class iniConfig::motd {
		$timeStamp = generate('/bin/date', '+%d-%m-%Y_%H.%M.%S')
		notice("Agent started running at $timeStamp")
	}

	# Include /usr/local/bin to user
	file {'/etc/profile.d/set-user-bin.sh':
		owner	=> 'root',
		mode 	=> '0644',
		content => 'PATH=$PATH:/usr/local/bin',
	}

	# Give Becca Sudoers privilege
	exec { 'give_sudo_becca':
		command => '/usr/bin/usermod -aG sudo becca',
	}
}