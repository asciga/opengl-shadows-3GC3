# Set up directories for convenience and for a cleaner(?) build system

set(MAIN_DIR ${PROJECT_SOURCE_DIR})
set(SOURCE_DIR ${PROJECT_SOURCE_DIR}/src)

include_directories(${SOURCE_DIR})
include_directories(${TEST_DIR})

if(UNIX)
set(SYSTEM_FOLDER "linux")
else()
set(SYSTEM_FOLDER "windows")
endif()

set(BIN_DIR ${MAIN_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BIN_DIR}/${PLATFORM_TARGET}/${CMAKE_BUILD_TYPE})

# Paths for project's library files
set(LIB_DIR ${MAIN_DIR}/lib/${SYSTEM_FOLDER})


