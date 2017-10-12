# Handles management of services, and initial setup
class services {
  file {'/var/www/s3540510':
    ensure => 'directory',
    owner  => 'root',
    mode   => '0644',
  }
  # Overwrite httpd.conf with custom configuration
  -> file { '/etc/httpd/conf/httpd.conf' :
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => '/etc/puppetlabs/code/environments/production/manifests/configfiles/httpd.conf',
    require => Package['httpd'],
  }
  # Subscribe to service (restart on file change)
  ~> service { 'httpd' :
    ensure => running,
    enable => true,
  }
}