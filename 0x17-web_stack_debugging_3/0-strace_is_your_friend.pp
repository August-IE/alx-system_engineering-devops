# Define a file resource to manage the wp-settings.php file
file { '/var/www/html/wp-settings.php':
  ensure  => file,            # Ensure it's a file
  owner   => 'www-data',      # Set appropriate owner
  group   => 'www-data',      # Set appropriate group
  mode    => '0644',          # Set appropriate permissions
  source  => 'puppet:///modules/wordpress_config/files/wp-settings.php', # Path to the corrected file on Puppet server
  require => Package['fix-wordpress'], # Ensure WordPress is installed before this file is managed
}

# Define a service resource to restart Apache after changes
service { 'apache2':
  ensure  => running,
  enable  => true,
  require => File['/var/www/html/wp-settings.php'], # Ensure Apache restarts after wp-settings.php is fixed
}

# Fixes bad `phpp` extensions to `php` in the WordPress file `wp-settings.php`.

exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
}
