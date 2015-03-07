class itmagent::params {

  # itm agent params
  $itm_server           = 'fsxopsx9999.wrk.fs.usda.gov'

  # module params
  $itm_version          = '6.3.0'
  $itm_home             = '/opt/IBM/ITM'
  $itm_file             = 'ITM_V6.3.0_AGENTS_MP_ENGLISH.tar'
  $itm_dir              = regsubst($itm_file, '\.tar$', '')
  $src_dir              = '/mnt/srv/itm630agent_inst'
  $script_file          = 'itm630lnxagt.tgz'
  $script_dir           = regsubst($script_file, '\.tgz$', '')
  $dir_tmp              = '/tmp'
  
}
