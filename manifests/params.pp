class itmagent::params {

  # itm agent params
  $itm_server           = 'fsxopsx9999.wrk.fs.usda.gov'

  # module params
  $itm_version          = '6.3.0'
  $itm_home             = '/opt/IBM/ITM'
  $itm_file             = 'ITM_V6.3.0_AGENTS_MP_ENGLISH.tar'
  $itm_dir              = regsubst($itm_file, '\.tar$', '')
  $mnt_dir              = '/mnt/srv'
  $src_dir              = '$mnt_dir/itm630agent_inst'
  $mnt_fs_host          = '10.20.1.8'
  $mnt_fs_dir           = '/var/centos70s0'
  $mnt_fs_options       = '-t nfs'
  $script_file          = 'itm630lnxagt.tgz'
  $script_dir           = regsubst($script_file, '\.tgz$', '')
  $dir_tmp              = '/tmp'
  
}
