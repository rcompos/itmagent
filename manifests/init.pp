# == Class: itmagent
class itmagent (

  $itm_server          = $itmagent::params::itm_server,
  $dir_tmp             = $itmagent::params::dir_tmp,
  $src_dir             = $itmagent::params::src_dir,
  $mnt_dir             = $itmagent::params::mnt_dir,
  $nfs_host            = $itmagent::params::nfs_host,
  $nfs_dir             = $itmagent::params::nfs_dir,
  $nfs_package         = $itmagent::params::nfs_package,
  $nfs_options         = $itmagent::params::nfs_options,
  $ksh_package         = $itmagent::params::ksh_package,
  $stdcpp_64_package   = $itmagent::params::stdcpp_64_package,
  $stdcpp_32_package   = $itmagent::params::stdcpp_32_package,
  $gcc_32_package      = $itmagent::params::gcc_32_package,

) inherits itmagent::params {

   validate_string($itm_server)
   validate_string($dir_tmp)
   validate_string($src_dir)
   validate_string($mnt_dir)
   validate_string($nfs_host)
   validate_string($nfs_dir)
   validate_string($nfs_package)
   validate_string($nfs_options)
   validate_string($ksh_package)
   validate_string($stdcpp_64_package)
   validate_string($stdcpp_32_package)
   validate_string($gcc_32_package)

   #notify{"IBM Tivoli Monitoring Agent $itm_version":}
   #notify{"ITM directory: $itm_dir":}

   anchor { 'itmagent::begin': }     ->
   class  { '::itmagent::install': } ->
   #class  { '::itmagent::config': }  ~>
   #class  { '::itmagent::service': } ->
   anchor { 'itmagent::end': }

}
