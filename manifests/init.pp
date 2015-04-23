# == Class: itmagent
class itmagent (

  $itm_server          = $itmagent::params::itm_server,
  $src_dir             = $itmagent::params::src_dir,
  $dir_tmp             = $itmagent::params::dir_tmp,

) inherits itmagent::params {

   validate_string($itm_server)
   validate_string($src_dir)
   validate_string($dir_tmp)

   anchor { 'itmagent::begin': }     ->
   class  { '::itmagent::install': } ->
   #class  { '::itmagent::config': }  ~>
   #class  { '::itmagent::service': } ->
   anchor { 'itmagent::end': }

}
