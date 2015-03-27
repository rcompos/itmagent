class itmagent::params {

  # itm agent params
  $itm_server           = 'fsxopsx9999.wrk.fs.usda.gov'
  #$itm_server_force     = undef

  # module params
  $dir_tmp              = '/tmp'
  $itm_version          = '6.3.0'
  $itm_home             = '/opt/IBM/ITM'
  $itm_file             = 'ITM_V6.3.0_AGENTS_MP_ENGLISH.tar'
  $itm_dir              = regsubst($itm_file, '\.tar$', '')
  # mnt_dir 		: path to directory src_dir
  $mnt_dir              = '/mnt/srv'
  # src_dir 		: directory where itm_file resides
  $src_dir              = "itm630agent_inst"
  $nfs_host             = '10.20.1.8'
  $nfs_dir              = '/var/centos70s0'
  $nfs_options          = '-t nfs'
  $script_file          = 'itm630lnxagt.tgz'
  $script_dir           = regsubst($script_file, '\.tgz$', '')
  $nfs_package          = 'nfs-utils'
  $nfs_ensure           = 'present'
  $ksh_package          = 'ksh'
  $ksh_ensure           = 'present'
  $stdcpp_64_package    = 'libstdc++.x86_64'
  $stdcpp_64_ensure     = 'latest'
  $stdcpp_32_package    = 'libstdc++.i686'
  $stdcpp_32_ensure     = 'latest'
  $gcc_32_package       = 'libgcc.i686'
  $gcc_32_ensure        = 'present'
  
}
