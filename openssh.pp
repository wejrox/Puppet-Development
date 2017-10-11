class openssh {
	service { 'sshd' :
		ensure	=> running,
		enable 	=> true,
		require => Package['openssh'],
	}

	augeas { 'sshd_config' :
		notify 	=> Service['sshd'],
		context => '/etc/ssh/sshd_config',
		changes => ['set PermitRootLogin no',],
		require => Package['openssh'],
	}
}