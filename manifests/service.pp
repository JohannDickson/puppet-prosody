class prosody::service {

  service { 'prosody':
    ensure     => 'running',
    enable     => true,
    hasstatus  => false,
    status     => 'prosodyctl status',
    hasrestart => true,
    require    => Class['prosody::package'],
  }

}
