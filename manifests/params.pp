class itmagent::params {

  # itm agent params
  $itm_server           = 'fsxopsx9999.wrk.fs.usda.gov'

  # module params
  # src_dir             : path to install files
  $src_dir              = "/tmp/itm630agent"
  $dir_tmp              = '/tmp'
  $itm_home             = '/opt/IBM/ITM'
  $itm_file             = 'ITM_V6.3.0_AGENTS_MP_ENGLISH.tar'
  $itm_dir              = regsubst($itm_file, '\.tar$', '')
  $script_file          = 'itm630lnxagt.tgz'
  $script_dir           = regsubst($script_file, '\.tgz$', '')

  # prereqs
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
