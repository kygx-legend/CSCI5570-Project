cmake_minimum_required(VERSION 3.3.0)
project(csci5570-project)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/release/)

set(CMAKE_C_COMPILER   "/data/opt/brew/bin/mpicc")  # need to put the path of your own mpicc 
set(CMAKE_CXX_COMPILER "/data/opt/brew/bin/mpic++")  # need to put the path of your own mpic++
set(CMAKE_BUILD_TYPE Release CACHE STRING "set build type to release")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m64")
set(COMMON_LINK_LIBS "-lpthread") 

add_subdirectory(app)
