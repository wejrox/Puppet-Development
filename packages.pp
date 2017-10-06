# Ensures that all packages specified are installed and installed
class packages{
	$services = [
		'openssh', 'httpd', 'mysql-server', 'mysql', 
		'vncserver', 'tmux', 'dia2code', 'lynx', 'gcc',
		'gdb', 'cgdb', 'vim', 'emacs', 'sshfs', 
		'puppet-lint', 'csh',
	]

	package { $services :
		ensure => 'installed',
	}

	service { $services :
		enable => true,
	}
}