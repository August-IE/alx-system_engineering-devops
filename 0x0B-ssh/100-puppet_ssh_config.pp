# A script that implements my SSH client configuration using puppet
# SSH client is configured to use the private key ~/.ssh/school
# SSH client is configured to refuse to authenticate using a password

# Ensure the .ssh directory exists within the user's home directory
file { '/etc/ssh/ssh_config':
  ensure => present,
}

# Ensure the PasswordAuthentication line is set to 'no'
file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => 'PasswordAuthentication no',
  match => '^#PasswordAuthentication',
}

# Ensure the IdentityFile line is set to '~/.ssh/school'
file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^#IdentityFile',
}
