cmake_minimum_required (VERSION 2.8)
project (shadows)

include(CMakeIncludes/CompilerOptions.cmake)
include(CMakeIncludes/Directories.cmake)
include(CMakeIncludes/VSFolders.cmake)
include(CMakeIncludes/Depend.cmake)

# Project Libraries
include(CMakeIncludes/Project.cmake)	# main project

# Main Project Executable
add_executable	( ${PROJECT_NAME} ${MAIN_SOURCE} ${MAIN_HEADERS} )
target_link_libraries( ${PROJECT_NAME} ${DEPEND_LIBRARIES} )
