# Handles management of services, and initial setup
class services {
  file {'/var/www/s3540510':
    ensure => 'directory',
    owner  => 'root',
    mode   => '0600',
  }
  -> service { 'httpd' :
    ensure => running,
    enable => true,
  }

  # Overwrite httpd.conf with custom configuration
  ~> file { '/etc/httpd/conf/httpd.conf' :
    ensure  => present,
    notify  => Service['httpd'],
    mode    => '0777',
    owner   => 'root',
    group   => 'root',
    source  => '/etc/puppetlabs/code/environments/production/manifests/configfiles/httpd.conf',
    require => Package['httpd'],
  }
}