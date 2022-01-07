class profile::app::webserver {

  case $facts['kernel'] {
    'Linux':  {
      include profile::app::webserver::nginx
    }

    'windows':  {
      #include profile::app::webserver::iis
    }

    default: { notify {'Platform not supported': } }
  }
}
