class profile::app::webserver::iis {
  $iis_features = ['Web-WebServer','Web-Scripting-Tools']

  iis_feature { $iis_features:
    ensure => 'present',
    include_management_tools => 'present',
  }
}
