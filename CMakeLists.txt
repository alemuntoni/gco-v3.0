project(gco)
cmake_minimum_required(VERSION 2.8)

if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release")
endif()

set(gco_headers
	GCoptimization.h
	LinkedBlockList.h
	block.h
	energy.h
	graph.h
	graph.inl
	maxflow.inl)

set(gco_sources
	GCoptimization.cpp
	LinkedBlockList.cpp)

set(example_srcs
    example.cpp)

add_library(gco ${gco_headers} ${gco_sources})
add_executable(example ${example_srcs})
target_link_libraries(example gco)

install(TARGETS gco
        ARCHIVE DESTINATION "${CMAKE_INSTALL_PREFIX}/lib"
        LIBRARY DESTINATION "${CMAKE_INSTALL_PREFIX}/lib"
        COMPONENT library)
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        DESTINATION "${CMAKE_INSTALL_PREFIX}/include"
        FILES_MATCHING PATTERN "*.h" PATTERN "*.inl")

