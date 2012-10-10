IF(EXISTS "${CMAKE_SOURCE_DIR}/../csync/src/csync.h")
  SET(CSYNC_INCLUDE_PATH ${CMAKE_SOURCE_DIR}/../csync/src/)
ELSE()
  FIND_PATH(CSYNC_INCLUDE_PATH NAMES csync.h HINTS $ENV{CSYNC_DIR} )
ENDIF()

IF( DEFINED CSYNC_LIBRARY_PATH AND DEFINED CSYNC_INCLUDE_PATH )
  IF( WIN32 )
    SET(CSYNC_LIBRARY ${CMAKE_SOURCE_DIR}/src/libocsync.dll)
  ELSE( WIN32 )
    SET(CSYNC_LIBRARY ${CSYNC_LIBRARY}/src/libocsync.so)
  ENDIF( WIN32 )
ELSE()
  FIND_LIBRARY(CSYNC_LIBRARY NAMES ocsync HINTS $ENV{CSYNC_DIR})
ENDIF()

SET(CSYNC_INCLUDE_DIR ${CSYNC_INCLUDE_PATH})

# handle the QUIETLY and REQUIRED arguments and set CSYNC_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Csync DEFAULT_MSG
  CSYNC_LIBRARY CSYNC_INCLUDE_PATH)

MARK_AS_ADVANCED( CSYNC_INCLUDE_PATH CSYNC_LIBRARY )
