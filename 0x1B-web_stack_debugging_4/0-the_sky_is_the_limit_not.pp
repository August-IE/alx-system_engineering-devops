# A puppet script that increases the amount of traffic an Nginx server can handle.
# Adjusting the ULIMIT setting of the default file
exec { "Set's a limit and restarts Nginx":
  command  => 'sudo sed -i \'s/15/4096/\' /etc/default/nginx && sudo service nginx restart',
  provider => shell,
}
