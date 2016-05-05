########################################################################
#
# ThirdParty configuration for Nektar++
#
# ARPACK
#
########################################################################

OPTION(NEKTAR_LINK_LIBSTDC++
    "Include libstdc++" OFF)

IF (NEKTAR_LINK_LIBSTDC++)
    FIND_LIBRARY(STDC++_LIBRARY NAMES "libstdc++" "stdc++" PATHS /opt/local/lib /usr/lib /usr/lib64)

    IF (STDC++_LIBRARY)
        MESSAGE(STATUS "Found stdc++: ${STDC++_LIBRARY}")
        MARK_AS_ADVANCED(STDC++_LIBRARY)
        LINK_DIRECTORIES(/usr/lib64) 
    ELSE()
        MESSAGE(FATAL_ERROR "Could not find stdc++")
    ENDIF()
ENDIF()

