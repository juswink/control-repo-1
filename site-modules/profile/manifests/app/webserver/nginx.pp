class profile::app::webserver::nginx {

  include nginx

  nginx::resource::server { 'sample_website':
    listen_port => 8080,
    www_root => '/var/www/sample_website',
  }
}
