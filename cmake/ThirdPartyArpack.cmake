########################################################################
#
# ThirdParty configuration for Nektar++
#
# ARPACK
#
########################################################################

OPTION(NEKTAR_USE_ARPACK
    "Use Arpack routines for evaluating eigenvalues and eigenvectors" OFF)

IF (NEKTAR_USE_ARPACK)
    FIND_LIBRARY(ARPACK_LIBRARY NAMES "arpack.1" "arpack" "libarpack" PATHS /opt/local/lib /work/02138/siddarth/lonestar/libraries/ARPACK)
#    FIND_LIBRARY(ARPACK_LIBRARY NAMES "arpack.1" "arpack" "libarpack" PATHS /work/02138/siddarth/lonestar/libraries/CFDLAB_compiled/ls5_export/ARPACK) 

    IF (ARPACK_LIBRARY)
        MESSAGE(STATUS "Found Arpack: ${ARPACK_LIBRARY}")
        MARK_AS_ADVANCED(ARPACK_LIBRARY)
    ELSE()
        MESSAGE(FATAL_ERROR "Could not find Arpack")
    ENDIF()
ENDIF()

