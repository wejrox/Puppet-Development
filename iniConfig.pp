class iniConfig {
	inifile::setting { 'agent_runinterval':
		ensure 	=> present,
		path    => "/etc/puppetlabs/puppet/puppet.conf",
		section => "main",
		setting => "runinterval",
		value 	=> "21600",
	}
}