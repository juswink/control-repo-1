class profile::app::webserver::iis {
  $iis_features = ['Web-WebServer','Web-Scripting-Tools']

  iis_feature { $iis_features:
    ensure => 'present',
  }
  
  iis_site { 'Default Web Site':
    ensure  => absent,
    #require => iis_feature['Web-WebServer'],
  }
  
  iis_site { 'minimal':
    ensure          => 'started',
    physicalpath    => 'c:\\inetpub\\minimal',
    applicationpool => 'DefaultAppPool',
    #require         => [
    #  File['minimal'],
    #  iis_site['Default Web Site']
    #],
  }

  file { 'minimal':
    ensure => 'directory',
    path   => 'c:\\inetpub\\minimal',
  }
}
