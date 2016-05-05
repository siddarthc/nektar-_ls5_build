########################################################################
#
# ThirdParty configuration for Nektar++
#
# ARPACK
#
########################################################################

OPTION(NEKTAR_LINK_IFPORT
    "Include libifport" ON)

IF (NEKTAR_LINK_IFPORT)
    FIND_LIBRARY(IFPORT_LIBRARY NAMES "ifport" PATHS /opt/apps/intel/16.0.1.150/compilers_and_libraries_2016.1.150/linux/compiler/lib/intel64_lin)

    IF (IFPORT_LIBRARY)
        MESSAGE(STATUS "Found libifport: ${IFPORT_LIBRARY}")
        MARK_AS_ADVANCED(IFPORT_LIBRARY)
        LINK_DIRECTORIES(/opt/apps/intel/16.0.1.150/compilers_and_libraries_2016.1.150/linux/compiler/lib/intel64_lin) 
    ELSE()
        MESSAGE(FATAL_ERROR "Could not find libifcore")
    ENDIF()
ENDIF()

