# A script that implements my SSH client configuration using puppet
# SSH client is configured to use the private key ~/.ssh/school
# SSH client is configured to refuse to authenticate using a password

# Ensure the .ssh directory exists
file { '/home/ubuntu/.ssh':
  ensure => directory,
  owner  => 'ubuntu',
  group  => 'ubuntu',
  mode   => '0700',
}

# Manage the SSH configuration file
file { '/home/ubuntu/.ssh/config':
  ensure => present,
  owner  => 'ubuntu',
  group  => 'ubuntu',
  mode   => '0600',
  content => "
    Host 271026-web-01
        HostName 54.236.203.202
        User ubuntu
        IdentityFile /home/ubuntu/.ssh/school
        PasswordAuthentication no
  ",
}
