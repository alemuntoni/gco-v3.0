project(gco)
cmake_minimum_required(VERSION 3.10)

option(BUILD_GCO_EXAMPLE "Build an example executable that runs on GCO lib." OFF)
option(BUILD_WITH_FLOATING_POINT_ENERGY_TYPES "" ON)

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
if (BUILD_GCO_EXAMPLE)
	add_executable(gco_example ${example_srcs})
	target_link_libraries(gxo_example gco)
endif()

if (BUILD_WITH_FLOATING_POINT_ENERGY_TYPES)
	target_compile_definitions(
		gco PUBLIC GCO_ENERGYTYPE=double GCO_ENERGYTERMTYPE=float)
endif()

install(
	TARGETS gco
		ARCHIVE DESTINATION "${CMAKE_INSTALL_PREFIX}/lib"
		LIBRARY DESTINATION "${CMAKE_INSTALL_PREFIX}/lib"
		COMPONENT library)
install(
	DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
		DESTINATION "${CMAKE_INSTALL_PREFIX}/include"
		FILES_MATCHING PATTERN "*.h" PATTERN "*.inl")

