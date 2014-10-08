define prosody::virtualhost(
  $admins                 = [],
  $allow_registration     = false,
  $registration_watchers  = [],
  $modules_enabled        = [],
  $storage                = $::prosody::storage,
  $authentication         = $::prosody::authentication,
  $c2s_require_encryption = $::prosody::c2s_require_encryption,
  $s2s_require_encryption = $::prosody::s2s_require_encryption,
  $ssl_key                = '',
  $ssl_cert               = '',
){

  file {
    "conf.d/${name}.cfg.lua":
      ensure  => 'link',
      path    => "/etc/prosody/conf.d/${name}.cfg.lua",
      target  => "/etc/prosody/conf.avail/${name}.cfg.lua",
      require => File["conf.d/${name}.cfg.lua"],
      notify  => Service['prosody'],
      ;

    "conf.avail/${name}.cfg.lua":
      ensure  => 'present',
      path    => "/etc/prosody/conf.avail/${name}.cfg.lua",
      content => template('prosody/virtualhost.cfg.lua.erb'),
      owner   => 'root',
      group   => 'prosody',
      mode    => '0644',
      require => Class['prosody::config'],
      notify  => Service['prosody'],
      ;
  }

}
