#!/usr/bin/env bash
# A script that creates a custom HTTP header response, but with Puppet.

package { 'nginx':
  ensure => installed,
}

# Define Nginx configuration file
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/nginx.conf.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Define the Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
}

# Restart Nginx whenever the configuration changes
exec { 'restart_nginx':
  command     => '/usr/sbin/service nginx restart',
  refreshonly => true,
  subscribe   => File['/etc/nginx/sites-available/default'],
}

# Create a custom fact for the server hostname
file { '/etc/facter/facts.d/server_hostname.txt':
  ensure  => file,
  content => "server_hostname=${::hostname}\n",
}

Service['nginx'] {
  subscribe => File['/etc/facter/facts.d/server_hostname.txt'],
}
