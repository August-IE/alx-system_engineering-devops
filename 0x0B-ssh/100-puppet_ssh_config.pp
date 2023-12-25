# A script that implements my SSH client configuration using puppet
# SSH client is configured to use the private key ~/.ssh/school
# SSH client is configured to refuse to authenticate using a password

file { '~/.ssh/config':
  ensure => present,
  owner  => 'ubuntu',
  group  => 'ubuntu',
  mode   => '0600',
  content => "
    Host 271026-web-01
        HostName 54.236.203.202
        User ubuntu
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
  ",
}
