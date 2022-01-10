class profile::app::webserver::nginx {

  include nginx

  $webservers_hash.each | String $domain, Hash $options | {
            user { $usr:
              ensure     => present,
              shell      => $options[shell],
              managehome => true,
            }
  file { "/var/www/${domain}/index.html":
    ensure  => file,
    content => '<html>I love Puppet!</html>',
  }
  nginx::resource::server { "${domain}":
    listen_port => $options[listen_port],
    www_root    => $options[www_root],
  }
}
