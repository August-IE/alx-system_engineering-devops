#!/usr/bin/env bash
# A script that creates a custom HTTP header response, but with Puppet.

exec { 'update_package_lists':
  command  => 'sudo apt-get update',
  logoutput => true,
  refreshonly => true,
}

package { 'nginx':
  ensure => present,
  require => Exec['update_package_lists'],
}

file_line { 'custom_http_header':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "  add_header X-Served-By $hostname;",
  match  => '^\s*location / {',
  require => Package['nginx'],
  notify => Exec['restart_nginx'],
}

exec { 'restart_nginx':
  command  => 'sudo service nginx restart',
  refreshonly => true,
  subscribe => File_line['custom_http_header'],
}

