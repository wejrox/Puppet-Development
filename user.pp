# Creates all users requested
class user {
	require groups
	require packages

	user { 'becca' :
		ensure 		=> present,
		uid 		=> '10010510',
		home 		=> '/home/becca', 
		managehome 	=> true,
		password	=> 'b4613f8681b1e26686a2e88299525a4dc89c46d5',
		groups	 	=> ['sysadmin', 'cars'],
		shell 		=> '/bin/bash',
	}

	user { 'fred' :
		ensure 		=> present,
		uid 		=> '10020510',
		home 		=> '/home/fred', 
		managehome 	=> true,
		password	=> 'b4613f8681b1e26686a2e88299525a4dc89c46d5',
		groups 		=> ['trucks', 'cars', 'wheel'],
		shell 		=> '/bin/csh',
	}

	user { 'wilma' :
		ensure 			=> present,
		uid 			=> '10030510',
		home 			=> '/home/wilma',
		managehome 		=> true, 
		password		=> 'b4613f8681b1e26686a2e88299525a4dc89c46d5',
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