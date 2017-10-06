class iniConfig {
	inifile::setting { 'agent_runinterval':
		ensure 	=> present,
		path    => "/etc/puppetlabs/puppet/puppet.conf",
		section => "agent",
		setting => "runinterval",
		value 	=> "1200",
	}
}