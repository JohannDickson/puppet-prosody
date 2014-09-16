class prosody::config {

  File {
    owner   => 'root',
    group   => 'prosody',
    mode    => '0644',
    recurse => true,
    require => Class['prosody::package'],
    notify  => Service['prosody'],
  }

  file {
    'prosody.cfg.lua':
      ensure  => 'present',
      path    => '/etc/prosody/prosody.cfg.lua',
      mode    => '0640',
      content => template('prosody/prosody.cfg.lua.erb'),
      ;

    'certs':
      ensure  => 'directory',
      path    => '/etc/prosody/certs',
      mode    => '0640',
      ;

    'conf.avail':
      ensure  => 'directory',
      path    => '/etc/prosody/conf.avail',
      ;
    'conf.d':
      ensure  => 'directory',
      path    => '/etc/prosody/conf.d',
      ;
  }

}
