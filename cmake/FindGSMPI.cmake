
SET(GSMPI_SEARCH_PATHS 
#	${CMAKE_SOURCE_DIR}/ThirdParty/gsmpi-1.2/
#	${CMAKE_SOURCE_DIR}/ThirdParty/gsmpi-1.2/build/
#	${CMAKE_SOURCE_DIR}/../ThirdParty/gsmpi-1.2/
#	${CMAKE_SOURCE_DIR}/../ThirdParty/gsmpi-1.2/build 
#    ${CMAKE_SOURCE_DIR}/ThirdParty/dist/lib 
#    ${CMAKE_SOURCE_DIR}/../ThirdParty/dist/lib
    /work/02138/siddarth/lonestar/libraries/gsmpi-1.2/lib)

FIND_LIBRARY(GSMPI_LIBRARY NAMES gsmpi PATHS ${GSMPI_SEARCH_PATHS})

SET(GSMPI_FOUND FALSE)
IF (GSMPI_LIBRARY)
  SET(GSMPI_FOUND TRUE)
  MARK_AS_ADVANCED(GSMPI_LIBRARY)
ENDIF (GSMPI_LIBRARY)

IF (GSMPI_FOUND)
  IF (NOT GSMPI_FIND_QUIETLY)
     MESSAGE(STATUS "Found GSMPI in: ${GSMPI_SEARCH_PATHS}")
     LINK_DIRECTORIES(/work/02138/siddarth/lonestar/libraries/gsmpi-1.2/lib)  
     INCLUDE_DIRECTORIES(/work/02138/siddarth/lonestar/libraries/gsmpi-1.2) 
  ENDIF (NOT GSMPI_FIND_QUIETLY)
ELSE(GSMPI_FOUND)
  IF (GSMPI_FIND_REQUIRED)
     MESSAGE(FATAL_ERROR "Could not find GSLib")
  ENDIF (GSMPI_FIND_REQUIRED)
ENDIF (GSMPI_FOUND)
