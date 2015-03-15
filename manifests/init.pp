# == Class: itmagent
class itmagent (

  $itm_server          = $itmagent::params::itm_server,
  $dir_tmp             = $itmagent::params::dir_tmp,
  $src_dir             = $itmagent::params::src_dir,
  $mnt_dir             = $itmagent::params::mnt_dir,
  $nfs_host            = $itmagent::params::nfs_host,
  $nfs_dir             = $itmagent::params::nfs_dir,

) inherits itmagent::params {

   validate_string($itm_server)
   validate_string($dir_tmp)
   validate_string($src_dir)
   validate_string($mnt_dir)
   validate_string($nfs_host)
   validate_string($nfs_dir)

   anchor { 'itmagent::begin': }     ->
   class  { '::itmagent::install': } ->
   #class  { '::itmagent::config': }  ~>
   #class  { '::itmagent::service': } ->
   anchor { 'itmagent::end': }

}
