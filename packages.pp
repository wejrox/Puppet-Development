# Ensures that all packages specified are installed and installed
class packages{
	exec { 'getDeps' :
		command => "yum-config-manager --enable rhui-REGION-rhel-server-optional",
		onlyif 	=> "service --status-all | grep -Fq 'lynx'",
	}

	exec {'getDia2Code' :
		source => 'http://sourceforge.net/projects/dia2code/files/dia2code/0.8.3-1.x86_64.rpm',
	}

	$services = [
		'openssh', 'httpd', 'mysql-server', 'mysql', 
		'tigervnc-server', 'tmux', 'lynx', 'gcc',
		'gdb', 'cgdb', 'vim', 'emacs', 'fuse-sshfs', 
		'puppet-lint', 'csh',
	]

	package { $services :
		ensure 		=> 'installed',
		provider 	=> 'yum',
	}

	service { $services :
		enable => true,
	}
}