# A puppet script that increases the amount of traffic an Nginx server can handle.

# Adjusting the ULIMIT setting of the default file
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path     => '/usr/bin',
  provider => 'shell'
}
# Restart Nginx in order to apply changes
exec { 'nginx-restart':
  command  => 'nginx restart',
  path     => '/usr/bin',
  provider => 'shell'
}
