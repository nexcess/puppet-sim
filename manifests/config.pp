class sim::config {
  if ! empty($sim::config) {
    $defaults = {'ensure' => 'present', 'target' => $sim::config_file}
    create_resources(shellvar, $sim::config, $defaults)
  }
}
