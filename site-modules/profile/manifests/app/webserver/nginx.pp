class profile::app::webserver::nginx {

  #include nginx

  #file { "/var/www/${facts}['fqdn']/html/index.html":
  #  ensure  => file,
  #  content => '<html>I love Puppet!</html>',
  #}
  #nginx::resource::server { "${facts}['fqdn']":
  #  listen_port => 8080,
  #  www_root    => "/var/www/${facts}['fqdn']/html",
  #}
}
