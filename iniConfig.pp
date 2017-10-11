# Sets run interval, agent timestamp display, inclusion of /usr/local/bin,
# Becca sudoing, mounting Titan onto becca's drive.
class iniconfig {
  augeas { 'agent_runinterval_exists' :
    context => '/etc/puppetlabs/puppet/puppet.conf/agent',
    changes => 'set runinterval 20m',
  }

  exec { 'runlevel' :
    command => '/usr/bin/systemctl set-default multi-user.target',
  }

  # Set the timestamp to client
  file { '/etc/profile.d/agent_login.sh' :
    ensure  => present,
    mode    => '0777',
    owner   => 'root',
    group   => 'root',
    content => 'timeStamp=`/bin/date +"%d-%m-%Y_%H.%M.%S"`; echo "Agent started running at $timeStamp"',
  }

  # Include /usr/local/bin to user
  file {'/etc/profile.d/set-user-bin.sh' :
    owner   => 'root',
    mode    => '0644',
    content => 'PATH=$PATH:/usr/local/bin',
  }

  # Give Becca Sudoers privilege
  exec { 'give_sudo_becca' :
    command => '/usr/sbin/usermod -aG root becca',
  }

  # Mount titan over becca (/home/becca/titan)
  # Make dir to use, connect using sshfs; only if it's not mounted already
  exec { 'mount_titan_becca' :
    command => '/usr/bin/mkdir /home/becca/titan; echo \
    "$(cat /etc/puppetlabs/code/environments/production/manifests/configfiles/ssh_pass)" | \
    /usr/bin/sshfs -o StrictHostKeyChecking=no -o password_stdin s3540510@titan.csit.rmit.edu.au:/home/sl0/S3540510/ /home/becca/titan/',
    unless  => '/usr/bin/find /home/becca/titan -mindepth 1 | /usr/bin/read',
  }
}