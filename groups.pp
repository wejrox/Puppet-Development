# Creates all groups requested
class groups {
  group{'sysadmin':
    ensure => present,
    gid    => '500',
  }

  group{'cars':
    ensure => present,
    gid    => '501',
  }

  group{'trucks':
    ensure => present,
    gid    => '502',
  }

  group{'ambulances':
    ensure => present,
    gid    => '503', 
  }
}