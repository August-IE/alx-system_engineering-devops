# A script to create a file in /tmp using puppet

file { 'school':
  ensure  => 'file',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  path    => '/tmp/school',
  content => 'I love Puppet',
}
