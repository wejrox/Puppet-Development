# Handles management of services, and initial setup
class services {
	service { 'httpd' :
		enable => true,
	}

	augeas { 'httpd_conf' :
		context => '/etc/httpd/conf/httpd.conf'
		changes => 'set DocumentRoot "/var/www/s3540510"',
	}
}