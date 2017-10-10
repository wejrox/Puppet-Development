# Ensures that all packages specified are installed and installed
class packages{
	package { 'wget' :
		ensure 		=> 'installed',
		provider 	=> 'yum',
	}

	exec { 'getDeps' :
		onlyif	=> '/usr/bin/yum-config-manager',
		command => '/usr/bin/yum-config-manager --enable rhui-REGION-rhel-server-optional',
	}

	exec { 'getDia2Code' :
		onlyif	=> '/usr/bin/test -x /usr/bin/wget',
		command => '/usr/bin/wget https://downloads.sourceforge.net/project/dia2code/dia2code/0.8.3/dia2code-0.8.3-3.1.i586.rpm?r=http%3A%2F%2Fdia2code.sourceforge.net%2Fdownload.html&ts=1507292790&use_mirror=ncu',
	}

	exec { 'installDia2Code' :
		onlyif 	=> '/usr/bin/test -x /usr/bin/yum',
		command => '/usr/bin/yum install dia2code-0.8.3-3.1.i586.rpm',
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