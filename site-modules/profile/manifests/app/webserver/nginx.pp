class profile::app::webserver::nginx {

  include nginx

  file { "/var/www/$facts['fqdn']/index.html":
    ensure  => file,
    content => '<html>I love Puppet!</html>',
  }
  #nginx::resource::server { 'vhost1.com':
  #  listen_port => 8080,
  #  www_root => '/var/www/vhost1.com/html',
  #}
}
