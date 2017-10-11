class openssh {
	service { 'sshd' :
		ensure	=> running,
		enable 	=> true,
		require => Package['openssh-server'],
	}

	augeas { 'sshd_config' :
		notify 	=> Service['sshd'],
		mode 	=> '0600',
		owner 	=> 'root',
		context => '/etc/ssh/sshd_config',
		changes => ['set PermitRootLogin no',],
		require => Package['openssh-server'],
	}
}