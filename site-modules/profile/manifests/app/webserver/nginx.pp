class profile::app::webserver::nginx {

  include nginx

  $webservers_hash = lookup('nginx::nginx_servers')#, Hash, {'strategy' => 'unique'}, {})
  $webservers_hash.each | String $domain, Hash $options | {
    file { "/var/www/${domain}":
      ensure  => directory,
    }

    file { "/var/www/${domain}/index.html":
      ensure  => present,
      content => '<html>I love Puppet!</html>',
    }
    #notify { "${domain}\n":}
    #notify { "${options}[www_root]\n":}
    #notify { "${options}[listen_port]\n":}

    nginx::resource::server { $domain:
      listen_port => $options[listen_port],
      www_root    => $options[www_root],
    }
  }
}
