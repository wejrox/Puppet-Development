class openssh {
	service { 'sshd' :
		ensure	=> running,
		enable 	=> true,
		require => Package['openssh-server'],
	}

	# Overwrite sshd_config with custom one. 
	# Augeas cannot handle commenting.
	file { '/etc/ssh/sshd_config':
		ensure 	=> present,
		notify 	=> Service['sshd'],
		mode 	=> '0777',
		owner 	=> 'root',
		group	=> 'root',
		source 	=> '/etc/puppetlabs/code/environments/production/manifests/configfiles/sshd_config',
		require => Package['openssh-server'],
	}
}