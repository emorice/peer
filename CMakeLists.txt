cmake_minimum_required(VERSION 3.14)
project(PEER)

#build options
#bindings
#PYTHON on by default
option(BUILD_PYTHON_PACKAGE "Enable Python bindings" ON)
#R optional
option(BUILD_R_PACKAGE "Enable R bindings" OFF)

#build stuff
option(BUILD_UNIVERSAL "Build both 32 and 64 bit versions" OFF)

#compile i386+x86_64 universal binaries on OS X
if (BUILD_UNIVERSAL)
IF(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
SET(CMAKE_OSX_ARCHITECTURES "i386;x86_64")
ENDIF(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
endif (BUILD_UNIVERSAL)

## Documentation for final package
# manual installation paths

##R build options###
#set(R_EXECUTABLE "")
#R executable 
#set(R_HOME "")
#R home directory
#set(R_H "")
#R include directory for headers
#set(R_INCLUDEDIR "")
#R include dir
#set(LIBR_SO)
#R dylib or dynamic link SO 
##/R END##


# OLI's build options
#set(LIBR_SO "/opt/local/lib/R/lib/x86_64/libR.dylib")
##/R END



# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#There are lots of scripts with cmake
#for finding external libraries. 
#see /usr/local/share/cmake-2.6/Modules/Find*.cmake for more examples

set(CMAKE_MODULE_PATH "${PEER_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
include_directories(./include)

add_definitions(-g -Wextra -D_BSD_SOURCE)

#fPic while compiling on
#this seems to be needed on some linux systems
#set(CMAKE_CXX_FLAGS "-fPIC -O3 -march=core2")
set(CMAKE_CXX_FLAGS "-fPIC")

include_directories(./External/alglib/src)

#add Cmake modules
add_subdirectory(./External/alglib/src)
add_subdirectory(./External/csv_parser)
add_subdirectory(./src)

IF (BUILD_PEERTOOL)
add_subdirectory(./External/yaml-cpp)
endif (BUILD_PEERTOOL)
#### build external interface (optional) #####
if (BUILD_PYTHON_PACKAGE)
add_subdirectory(./python)
endif (BUILD_PYTHON_PACKAGE)
if (BUILD_R_PACKAGE)
add_subdirectory(./R)
endif (BUILD_R_PACKAGE)

