class profile::app::webserver::nginx {

  include nginx

  $webservers_hash = lookup('nginx::nginx_servers')#, Hash, {'strategy' => 'unique'}, {})
  $webservers_hash.each | String $domain, Hash $options | {
    file { "/var/www/${domain}/html":
      ensure  => directory,
    }

    file { "/var/www/${domain}/html/index.html":
      ensure  => present,
      content => '<html>I love Puppet!</html>',
    }

    #nginx::resource::server { $domain:
    #  listen_port => $options[listen_port],
    #  www_root    => $options[www_root],
    #}
  }
}
