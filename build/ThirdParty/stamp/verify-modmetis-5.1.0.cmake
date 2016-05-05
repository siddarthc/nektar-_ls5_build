set(file "/work/02138/siddarth/lonestar/nektar_ls5_build/ThirdParty/modmetis-5.1.0_2.tar.bz2")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "8a1f1afd39b46a4477c1ea15464cdf89")
set(attempt 0)
set(succeeded 0)
while(${attempt} LESS 3 OR ${attempt} EQUAL 3 AND NOT ${succeeded})
  file(MD5 "${file}" actual_value)
  if("${actual_value}" STREQUAL "${expect_value}")
    set(succeeded 1)
  elseif(${attempt} LESS 3)
    message(STATUS "MD5 hash of ${file}
does not match expected value
  expected: ${expect_value}
    actual: ${actual_value}
Retrying download.
")
    file(REMOVE "${file}")
    execute_process(COMMAND ${CMAKE_COMMAND} -P "/work/02138/siddarth/lonestar/nektar_ls5_build/build/ThirdParty/stamp/download-modmetis-5.1.0.cmake")
  endif()
  math(EXPR attempt "${attempt} + 1")
endwhile()

if(${succeeded})
  message(STATUS "verifying file... done")
else()
  message(FATAL_ERROR "error: MD5 hash of
  ${file}
does not match expected value
  expected: ${expect_value}
    actual: ${actual_value}
")
endif()
