class profile::app::webserver::iis {
  $iis_features = ['Web-WebServer','Web-Scripting-Tools', 'Web-Management-Console']

  iis_feature { $iis_features:
    ensure => 'present',
  }
}
