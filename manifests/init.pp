# == Class: itmagent
#
# Full description of class itmagent here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { itmagent:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class itmagent (

  $itm_server          = $itmagent::params::itm_server,
  $dir_tmp             = $itmagent::params::dir_tmp,
  $src_dir             = $itmagent::params::src_dir,
  $mnt_dir             = $itmagent::params::mnt_dir,
  $nfs_host            = $itmagent::params::nfs_host,
  $nfs_dir             = $itmagent::params::nfs_dir,
  $nfs_options         = $itmagent::params::nfs_options,

) inherits itmagent::params {

   validate_string($itm_server)
   validate_string($dir_tmp)
   validate_string($src_dir)
   validate_string($mnt_dir)
   validate_string($nfs_host)
   validate_string($nfs_dir)
   validate_string($nfs_options)

   #notify{"IBM Tivoli Monitoring Agent $itm_version":}
   #notify{"ITM directory: $itm_dir":}

   anchor { 'itmagent::begin': }     ->
   class  { '::itmagent::install': } ->
   #class  { '::itmagent::config': }  ~>
   #class  { '::itmagent::service': } ->
   anchor { 'itmagent::end': }

}
