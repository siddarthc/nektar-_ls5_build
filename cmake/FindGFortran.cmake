########################################################################
#
# ThirdParty configuration for Nektar++
#
# ARPACK
#
########################################################################

OPTION(NEKTAR_LINK_GFORTRAN
    "Include libgfortran" OFF)

IF (NEKTAR_LINK_GFORTRAN)
    FIND_LIBRARY(GFORTRAN_LIBRARY NAMES "gfortran" "libgfortran" PATHS /opt/local/lib /opt/apps/gcc/4.9.3/lib64)

    IF (GFORTRAN_LIBRARY)
        MESSAGE(STATUS "Found gfortran: ${GFORTRAN_LIBRARY}")
        MARK_AS_ADVANCED(GFORTRAN_LIBRARY)
        LINK_DIRECTORIES(/opt/apps/gcc/4.9.3/lib64) 
    ELSE()
        MESSAGE(FATAL_ERROR "Could not find gfortran")
    ENDIF()
ENDIF()

