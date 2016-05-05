########################################################################
#
# ThirdParty configuration for Nektar++
#
# ARPACK
#
########################################################################

OPTION(NEKTAR_LINK_IFCORE
    "Include libifcore" ON)

IF (NEKTAR_LINK_IFCORE)
    FIND_LIBRARY(IFCORE_LIBRARY NAMES "ifcore" PATHS /opt/apps/intel/16.0.1.150/compilers_and_libraries_2016.1.150/linux/compiler/lib/intel64_lin)

    IF (IFCORE_LIBRARY)
        MESSAGE(STATUS "Found libifcore: ${IFCORE_LIBRARY}")
        MARK_AS_ADVANCED(IFCORE_LIBRARY)
        LINK_DIRECTORIES(/opt/apps/intel/16.0.1.150/compilers_and_libraries_2016.1.150/linux/compiler/lib/intel64_lin) 
    ELSE()
        MESSAGE(FATAL_ERROR "Could not find libifcore")
    ENDIF()
ENDIF()

