# A puppet manifest that installs Nginx web server
# Nginx should be listening on port 80
# It must return a page that contains the string Hello World!
# The redirection must be a “301 Moved Permanently”

class { 'nginx':
  manage_repo => true,
}

nginx::resource::vhost { 'default':
  ensure   => 'present',
  listen   => ['80'],
  location => {
    '/' => {
      ensure  => 'present',
      content => 'Hello World!',
    },
    '/redirect_me' => redirect('/redirect_me', 'https://google.com'),
  },
}
