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
file_line { 'Turn off passwd auth':
  path  => '/home/ubuntu/.ssh/config',
  line  => 'PasswordAuthentication no',
}

file_line { 'Declare identity file':
  path  => '/home/ubuntu/.ssh/config',
  line  => 'IdentityFile ~/.ssh/school',
}
