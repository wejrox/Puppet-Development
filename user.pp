# Creates all groups
class groups {
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
}

# Creates all users
class users {
	# Create users 
	user { 'becca' :
		ensure 		=> present,
		uid 		=> '10010510',
		home 		=> '/home/becca', 
		managehome 	=> true,
		groups	 	=> ['sysadmin', 'cars'],
		shell 		=> '/bin/bash',
	}

	user { 'fred' :
		ensure 		=> present,
		uid 		=> '10020510',
		home 		=> '/home/fred', 
		managehome 	=> true,
		groups 		=> ['trucks', 'cars'],
		shell 		=> '/bin/bsd-csh',
	}

	user { 'wilma' :
		ensure 			=> present,
		uid 			=> '10030510',
		home 			=> '/home/wilma',
		managehome 		=> true, 
		groups 			=> ['trucks', 'cars', 'ambulances'],
		shell 			=> '/bin/bash',
		purge_ssh_keys 	=> true,
	}

	# SSH Key for wilma's account
	ssh_authorized_key { 'wilmaKey' :
		ensure 	=> present,
		user 	=> 'wilma',
		type 	=> 'ssh-rsa', 
		key 	=> 'ThisIsWilmasKeyAbCdE',
	}
}