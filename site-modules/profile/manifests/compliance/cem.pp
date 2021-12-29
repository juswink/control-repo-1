class profile::compliance:cem {

  case $facts['kernel'] {
    'Linux':  {
      include profile::compliance::cem:linux
    }
    'windows':  {
      include profile::compliance::cem:windows
    }  
  }
}
