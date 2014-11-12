class prosody::package {

  package {
    'prosody':
      ensure => 'latest',
      ;
  }

  file {
    'apt-source':
      ensure  => 'present',
      path    => '/etc/apt/sources.list.d/prosody.list',
      content => template('prosody/prosody.list.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      ;
  }

  exec {
    'apt-key':
      command  => 'wget https://prosody.im/files/prosody-debian-packages.key \
        -qO - \
        | apt-key --keyring /etc/apt/trusted.gpg.d/prosody.gpg add -',
      creates  => '/etc/apt/trusted.gpg.d/prosody.gpg',
      provider => 'shell',
      require  => File['apt-source'],
      before   => Package['prosody'],
      ;
  }

}
