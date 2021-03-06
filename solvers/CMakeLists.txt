MACRO(ADD_SOLVER_EXECUTABLE name component source)

    ADD_EXECUTABLE(${name} ${source} ${ARGN})
    
    SET_TARGET_PROPERTIES(${name} PROPERTIES DEBUG_POSTFIX -g)
    SET_TARGET_PROPERTIES(${name} PROPERTIES MINSIZEREL_POSTFIX -ms)
    SET_TARGET_PROPERTIES(${name} PROPERTIES RELWITHDEBINFO_POSTFIX -rg)

    SET_COMMON_PROPERTIES(${name})

    IF (NEKTAR_LINK_IFCORE)
       IF (NEKTAR_LINK_IFPORT)
         TARGET_LINK_LIBRARIES(${name} SolverUtils ifcore ifport)
        ELSE ()
          TARGET_LINK_LIBRARIES(${name} SolverUtils ifcore)
        ENDIF ()
    ELSEIF (NEKTAR_LINK_GFORTRAN)
       TARGET_LINK_LIBRARIES(${name} SolverUtils gfortran)
    ELSE ()
       TARGET_LINK_LIBRARIES(${name} SolverUtils)
    ENDIF ()

    SET_PROPERTY(TARGET ${name} PROPERTY FOLDER ${component})
    INSTALL(TARGETS ${name} 
            RUNTIME DESTINATION ${NEKTAR_BIN_DIR} COMPONENT ${component} OPTIONAL)
ENDMACRO(ADD_SOLVER_EXECUTABLE name component source)


# Generate list of available subdirectories
FILE(GLOB dir_list "*")
FOREACH(dir ${dir_list})
    IF(IS_DIRECTORY ${dir} AND EXISTS ${dir}/CMakeLists.txt)    
        ADD_SUBDIRECTORY(${dir})
    ENDIF(IS_DIRECTORY ${dir} AND EXISTS ${dir}/CMakeLists.txt)
ENDFOREACH(dir ${dir_list})


SET(CPACK_COMPONENTS_ALL solvers)

SET(CPACK_COMPONENT_SOLVERS_NAME "nektar++-solvers")
SET(CPACK_COMPONENT_SOLVERS_DESCRIPTION "Solvers for Nektar++")
#SET(CPACK_COMPONENT_SOLVERS_DEPENDS lib)

INCLUDE(CPack)
