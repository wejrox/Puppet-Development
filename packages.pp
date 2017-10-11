# Ensures that all packages specified are installed and installed
class packages{
	package { 'wget' :
		ensure 		=> 'installed',
		provider 	=> 'yum',
	}

	# This is needed for yum or things will be missing
	exec { 'getDeps' :
		onlyif		=> '/usr/bin/yum-config-manager',
		command 	=> '/usr/bin/yum-config-manager --enable rhui-REGION-rhel-server-optional',
	}

	# Install cgdb
	package { 'cgdb' :
		ensure 	 	=> 'installed',
		source 	 	=> 'ftp://mirror.switch.ch/pool/4/mirror/epel/7/x86_64/c/cgdb-0.6.8-1.el7.x86_64.rpm',
		provider 	=> 'rpm',
	}

	# Install fuse-sshfs	
	package { 'glib*' : 
		ensure 		=> 'installed', 
		provider 	=> 'yum',
	} ->
	package { 'fuse*' : 
		ensure 		=> 'installed', 
		provider 	=> 'yum',
	} ->
	package { 'fuse-sshfs' :
		ensure 	 	=> 'installed',
		source 	 	=> 'ftp://195.220.108.108/linux/dag/redhat/el7/en/x86_64/dag/RPMS/fuse-sshfs-2.5-1.el7.rf.x86_64.rpm',
		provider 	=> 'rpm',
	}

	# Install dia2code
	package { 'libxml2.so.2' : 
		ensure => installed, 
	} ->
	package { 'dia2code' :
		ensure 		=> 'installed',
		source 		=> 'https://downloads.sourceforge.net/project/dia2code/dia2code/0.8.3/dia2code-0.8.3-3.1.i586.rpm?r=http%3A%2F%2Fdia2code.sourceforge.net%2Fdownload.html&ts=1507292790&use_mirror=ncu',
		provider 	=> 'rpm',
	}

	# Install mysql-server
	package { 'mysql-server' :
		ensure 		=> 'installed',
		source 		=> 'https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm',
		provider 	=> 'rpm',
	}

	# Install additional packages that exist on Yum
	$packages = [
		'openssh', 'httpd', 'mysql', 
		'tigervnc-server', 'tmux', 'lynx', 'gcc',
		'gdb', 'vim', 'emacs', 'csh',
	]

	package { $packages :
		ensure 		=> 'installed',
		provider 	=> 'yum',
	}
}