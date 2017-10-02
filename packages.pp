# Ensures that all packages specified are installed and installed
class packages{
	package { 'openssh' :
		ensure => 'installed',
		enable => true,
	}

	package { 'httpd' :
		ensure => 'installed',
		enable => true,
	}

	package { 'mysql-server' :
		ensure => 'installed',
		enable => true,
	}

	package { 'mysql' :
		ensure => 'installed', 
		enable = true,
	}

	package { 'vncserver':
		ensure => 'installed', 
		enable = true,
	}

	package { 'tmux' : 
		ensure => 'installed', 
		enable = true,
	}

	package { 'dia2code' : 
		ensure => 'installed', 
		enable = true,
	}

	package { 'lynx' : 
		ensure => 'installed', 
		enable = true,
	}

	package { 'gcc' : 
		ensure => 'installed', 
		enable = true,
	}

	package { 'gdb' : 
		ensure => 'installed', 
		enable = true,
	}

	package { 'cgdb' : 
		ensure => 'installed', 
		enable = true,
	}

	package { 'vim' : 
		ensure => 'installed', 
		enable = true,
	}

	package { 'emacs' : 		
		ensure => 'installed', 
		enable = true,
	}
	package { 'sshfs' :
		ensure => 'installed', 
		enable = true,
	}
}