# - Nektar++ Config File
#
# Use this module by invoking find_package with the form:
#  FIND_PACKAGE(Nektar++
#    [version] [EXACT]      # Minimum or EXACT version e.g. 1.36.0
#    [REQUIRED]             # Fail with error if Nektar++ is not found
#    )                      #
#
# This sets the following variables:
#  Nektar++_FOUND             - True if headers and requested libraries were found
#  Nektar++_VERSION           - Nektar++_VERSION
#  Nektar++_INCLUDE_DIRS      - Nektar++ include directories
#  Nektar++_LIBRARY_DIRS      - Link directories for Nektar++ libraries
#  Nektar++_DEFINITIONS       - Nektar++ build flags
#  Nektar++_LIBRARIES         - Nektar++ component libraries to be linked
#
#  Nektar++_TP_INCLUDE_DIRS   - Nektar++ ThirdParty include directories
#  Nektar++_TP_LIBRARY_DIRS   - Link directories for Nektar++ ThirdParty libraries
#  Nektar++_TP_LIBRARIES      - Nektar++ ThirdParty libraries to be linked
#
# Example Use:
#  FIND_PACKAGE(Nektar++ REQUIRED)
#  ADD_DEFINITIONS(${NEKTAR++_DEFINITIONS})
#  INCLUDE_DIRECTORIES(${NEKTAR++_INCLUDE_DIRS} ${NEKTAR++_TP_INCLUDE_DIRS})
#  LINK_DIRECTORIES(${NEKTAR++_LIBRARY_DIRS} ${NEKTAR++_TP_LIBRARY_DIRS})
#  TARGET_LINK_LIBRARIES(${ProjectName} ${NEKTAR++_LIBRARIES} ${NEKTAR++_TP_LIBRARIES})
#

# set basic variables
SET(NEKTAR++_FOUND "ON")
SET(NEKTAR++_VERSION "NOTFOUND.NOTFOUND.NOTFOUND")
SET(NEKTAR++_ROOT_DIR "/work/02138/siddarth/lonestar/nektar_ls5_build/build/dist")
SET(NEKTAR++_INCLUDE_DIRS "${NEKTAR++_ROOT_DIR}/include/nektar++-NOTFOUND.NOTFOUND.NOTFOUND")
SET(NEKTAR++_LIBRARY_DIRS "${NEKTAR++_ROOT_DIR}/lib64/nektar++-NOTFOUND.NOTFOUND.NOTFOUND")
SET(NEKTAR++_DEFINITIONS  -DNEKTAR_USING_LAPACK -DNEKTAR_USING_BLAS -DTIXML_USE_STL -DNEKTAR_MEMORY_POOL_ENABLED)
SET(NEKTAR++_LIBRARIES SolverUtils;LibUtilities;StdRegions;SpatialDomains;LocalRegions;MultiRegions;Collections)

SET(NEKTAR++_TP_INCLUDE_DIRS
    "${NEKTAR++_ROOT_DIR}/include/nektar++-NOTFOUND.NOTFOUND.NOTFOUND/ThirdParty")
SET(NEKTAR++_TP_LIBRARIES "")
SET(NEKTAR++_TP_LIBRARY_DIRS "")

# Set up Boost and other ThirdParty include directories.
SET(Boost_INCLUDE_DIRS "/opt/apps/intel16/boost/1.59/include")
SET(NEKTAR++_TP_INCLUDE_DIRS
    ${NEKTAR++_TP_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS})

SET(Boost_LIBRARIES /opt/apps/intel16/boost/1.59/lib/libboost_thread.so;/opt/apps/intel16/boost/1.59/lib/libboost_iostreams.so;/opt/apps/intel16/boost/1.59/lib/libboost_date_time.so;/opt/apps/intel16/boost/1.59/lib/libboost_filesystem.so;/opt/apps/intel16/boost/1.59/lib/libboost_system.so;/opt/apps/intel16/boost/1.59/lib/libboost_program_options.so;/opt/apps/intel16/boost/1.59/lib/libboost_regex.so;/opt/apps/intel16/boost/1.59/lib/libboost_timer.so)
SET(Boost_LIBRARY_DIRS "/opt/apps/intel16/boost/1.59/lib")
SET(NEKTAR++_TP_LIBRARIES
    ${NEKTAR++_TP_LIBRARIES} ${Boost_LIBRARIES})

SET(LOKI_INCLUDE_DIRS "/work/02138/siddarth/lonestar/nektar_ls5_build/build/dist/include/ThirdParty")
SET(NEKTAR++_TP_INCLUDE_DIRS
    ${NEKTAR++_TP_INCLUDE_DIRS} ${LOKI_INCLUDE_DIRS})

SET(TINYXML_INCLUDE_DIRS "/work/02138/siddarth/lonestar/nektar_ls5_build/build/dist/include/ThirdParty")
SET(NEKTAR++_TP_INCLUDE_DIRS
    ${NEKTAR++_TP_INCLUDE_DIRS} ${TINYXML_INCLUDE_DIRS})

SET(ZLIB_INCLUDE_DIRS "/usr/include")
SET(NEKTAR++_TP_INCLUDE_DIRS
    ${NEKTAR++_TP_INCLUDE_DIRS} ${ZLIB_INCLUDE_DIRS})

SET(NEKTAR_USE_MPI "OFF")
IF( NEKTAR_USE_MPI )
    SET(MPI_LIBRARY "")
    SET(MPI_EXTRA_LIBRARY "")
    SET(MPI_INCLUDE_PATH "")
    SET(NEKTAR++_TP_INCLUDE_DIRS
        ${NEKTAR++_TP_INCLUDE_DIRS} ${MPI_INCLUDE_PATH})
    SET(NEKTAR++_TP_LIBRARIES
        ${NEKTAR++_TP_LIBRARIES} ${MPI_LIBRARY} ${MPI_EXTRA_LIBRARY})
    SET(NEKTAR++_DEFINITIONS
        "${NEKTAR++_DEFINITIONS} -DNEKTAR_USE_MPI")
ENDIF( NEKTAR_USE_MPI )

SET(NEKTAR_USE_SCOTCH "OFF")
IF( NEKTAR_USE_SCOTCH )
    SET(SCOTCH_INCLUDE_DIRS "")
    SET(NEKTAR++_TP_INCLUDE_DIRS
        ${NEKTAR++_TP_INCLUDE_DIRS} ${SCOTCH_INCLUDE_DIRS})
ENDIF( NEKTAR_USE_SCOTCH )

SET(NEKTAR_USE_FFTW "OFF")
IF( NEKTAR_USE_FFTW )
    SET(FFTW_INCLUDE_DIR "")
    SET(NEKTAR++_TP_INCLUDE_DIRS
        ${NEKTAR++_TP_INCLUDE_DIRS} ${FFTW_INCLUDE_DIR})
ENDIF( NEKTAR_USE_FFTW )

SET(NEKTAR_USE_ARPACK "OFF")
IF( NEKTAR_USE_ARPACK )
    SET(ARPACK_INCLUDE_DIR "")
    SET(NEKTAR++_TP_INCLUDE_DIRS
        ${NEKTAR++_TP_INCLUDE_DIRS} ${ARPACK_INCLUDE_DIR})
ENDIF( NEKTAR_USE_ARPACK )

SET(NEKTAR_USE_VTK "OFF")
IF( NEKTAR_USE_VTK )
    SET(VTK_INCLUDE_DIRS "")
    SET(NEKTAR++_TP_INCLUDE_DIRS
        ${NEKTAR++_TP_INCLUDE_DIRS} ${VTK_INCLUDE_DIRS})
ENDIF( NEKTAR_USE_VTK )

# find and add Nektar++ libraries
INCLUDE(${NEKTAR++_LIBRARY_DIRS}/cmake/Nektar++Libraries.cmake)

# platform dependent options
IF(${CMAKE_SYSTEM} MATCHES "Linux.*")
    set(NEKTAR++_TP_LIBRARIES ${NEKTAR++_TP_LIBRARIES} rt)
    SET(NEKTAR++_DEFINITIONS "${NEKTAR++_DEFINITIONS} -pthread")
ENDIF(${CMAKE_SYSTEM} MATCHES "Linux.*")
