class prosody(
  $admins                 = [],
  $daemonize              = true,
  $pidfile                = '/var/run/prosody/prosody.pid',
  $modules_enabled        = ['defaults'],
  $modules_disabled       = [],
  $authentication         = 'internal_plain',
  $allow_registration     = false,
  $c2s_require_encryption = false,
  $s2s_require_encryption = false,
){

  class {
    'prosody::package':;

    'prosody::service':;

    'prosody::config':;
  }

}
