# A puppet manifest that installs Nginx web server
# Nginx should be listening on port 80
# It must return a page that contains the string Hello World!
# The redirection must be a “301 Moved Permanently”

# Define a class for Nginx installation and configuration
class nginx_config {

  # Install Nginx package
  package { 'nginx':
    ensure => installed,
  }

  # Ensure Nginx service is running and enabled
  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
  }

  # Configure Nginx main configuration file
  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    content => template('nginx/nginx.conf.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  # Create a virtual host file for the default site
  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => template('nginx/default-site.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  # Create a symbolic link to enable the default site
  file { '/etc/nginx/sites-enabled/default':
    ensure  => link,
    target  => '/etc/nginx/sites-available/default',
    require => File['/etc/nginx/sites-available/default'],
    notify  => Service['nginx'],
  }
}

# Define a class for the 301 redirect
class redirect_config {

  # Create a location block for the redirect
  file { '/etc/nginx/sites-available/redirect':
    ensure  => file,
    content => template('nginx/redirect-site.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  # Create a symbolic link to enable the redirect site
  file { '/etc/nginx/sites-enabled/redirect':
    ensure  => link,
    target  => '/etc/nginx/sites-available/redirect',
    require => File['/etc/nginx/sites-available/redirect'],
    notify  => Service['nginx'],
  }
}
