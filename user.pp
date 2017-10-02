# Creates all groups and users required
class usergroup {
	# Create the groups specified in assignment
	group{ 'sysadmin' :
		ensure 	=> present,
		gid 	=> '500',
	}

	group { 'cars' :
		ensure 	=> present,
		gid		=> '501',
	}

	group { 'trucks' :
		ensure 	=> present,
		gid 	=> '502',
	}

	group { 'ambulances' :
		ensure 	=> present,
		gid 	=> '503', 
	}

	# Create users 
	user { 'becca' :
		ensure 		=> present,
		uid 		=> '10010510'
		home 		=> '/home/becca', 
		managehome 	=> true,
		groups	 	=> ['sysadmin', 'cars'],
		shell 		=> '/bin/bash',
	}

	user { 'fred':
		ensure 		=> present,
		uid 		=> '10020510',
		home 		=> '/home/fred', 
		managehome 	=> true,
		groups 		=> ['trucks', 'cars'],
		shell 		=> '/bin/csh',
	}

	user { 'wilma':
	ensure => present,
		uid => '10030510',
		home => '/home/wilma',
		managehome => true, 
		groups => ['trucks', 'cars', 'ambulances'],
	}
}