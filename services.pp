# Handles management of services, and initial setup
class services {
	service { 'httpd' :
		enable => true,
	}

	# Overwrite httpd.conf with custom configuration
	file { '/etc/httpd/conf/httpd.conf' :
		ensure 	=> present,
		notify 	=> Service['httpd'],
		mode 	=> '0777',
		owner 	=> 'root',
		group	=> 'root',
		source 	=> '/etc/puppetlabs/code/environments/production/manifests/configfiles/httpd.conf',
		require => Package['httpd'],
	}
}