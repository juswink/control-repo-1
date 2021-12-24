class profile::app::webserver::nginx {

  nginx::resource::server { 'sample_website':
    listen_port => 8080,
    www_root => '/var/www/sample_website',
  }
}
