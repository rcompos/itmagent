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

   $itm_server = $itmagent::params::itm_server,
   $itm_file   = $itmagent::params::itm_file,
   $dir_dest   = $itmagent::params::dir_dest,
   $url_src    = $itmagent::params::url_src,

) inherits itmagent::params {

   validate_string($itm_server)
   validate_string($itm_file)
   validate_string($dir_dest)
   validate_string($url_src)

   anchor { 'itmagent::begin': }     ->
   class  { '::itmagent::install': } ->
   #class  { '::itmagent::config': }  ~>
   #class  { '::itmagent::service': } ->
   anchor { 'itmagent::end': }

}
