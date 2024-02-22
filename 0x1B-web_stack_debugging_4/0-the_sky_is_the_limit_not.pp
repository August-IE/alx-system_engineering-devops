# A puppet script that increases the amount of traffic an Nginx server can handle.
# Adjusting the ULIMIT setting of the default file
exec { 'fix-for-nginx':
  command => 'echo ULIMIT="-n 2000" > /etc/default/nginx', 
  path     => '/usr/local/bin/:/bin/',
} ->
# Restart Nginx in order to apply changes
exec { 'nginx-restart':
  command => 'service restart nginx',
  path    => '/etc/init.d/'
}
