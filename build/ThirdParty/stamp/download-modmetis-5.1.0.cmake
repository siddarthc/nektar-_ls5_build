if(EXISTS "/work/02138/siddarth/lonestar/nektar_ls5_build/ThirdParty/modmetis-5.1.0_2.tar.bz2")
  file("MD5" "/work/02138/siddarth/lonestar/nektar_ls5_build/ThirdParty/modmetis-5.1.0_2.tar.bz2" hash_value)
  if("x${hash_value}" STREQUAL "x8a1f1afd39b46a4477c1ea15464cdf89")
    return()
  endif()
endif()
message(STATUS "downloading...
     src='http://www.nektar.info/thirdparty/modmetis-5.1.0_2.tar.bz2'
     dst='/work/02138/siddarth/lonestar/nektar_ls5_build/ThirdParty/modmetis-5.1.0_2.tar.bz2'
     timeout='none'")




file(DOWNLOAD
  "http://www.nektar.info/thirdparty/modmetis-5.1.0_2.tar.bz2"
  "/work/02138/siddarth/lonestar/nektar_ls5_build/ThirdParty/modmetis-5.1.0_2.tar.bz2"
  SHOW_PROGRESS
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'http://www.nektar.info/thirdparty/modmetis-5.1.0_2.tar.bz2' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
