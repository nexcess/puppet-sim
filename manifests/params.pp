class sim::params {
  $crontab     = '/etc/crontab'
  $cron_job    = 'present'
  $cron_line   = '*/5 * * * * root /usr/local/sim/sim -q > /dev/null 2>&1'
  $cron_match  = '/usr/local/sim/sim'
  $config_file = '/usr/local/sim/conf.sim'
  $config      = {}
}
