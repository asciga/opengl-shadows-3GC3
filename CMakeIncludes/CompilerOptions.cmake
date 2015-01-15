set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )

if(CMAKE_COMPILER_IS_GNUCC)
	# Enable additional warnings.
	# add_definitions(-Weffc++)
	# add_definitions(-Winline.)
	add_definitions(-Wall -Wextra -Wshadow -Winvalid-pch)
	add_definitions(-Wctor-dtor-privacy -Wold-style-cast -Woverloaded-virtual)

	# Turn off all pragma warnings.
	add_definitions(-Wno-pragmas -Wno-unknown-pragmas)
	add_definitions(-march=native -ffast-math)	
	
	#
	# Setting compiler to c++11
	#
	include(CheckCXXCompilerFlag)
	CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
	CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
	if(COMPILER_SUPPORTS_CXX11)
		add_definitions(-std=c++11)
	elseif(COMPILER_SUPPORTS_CXX0X)
		add_definitions(-std=c++0x)
	else()
		message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ 			compiler.")
	endif()

	if(CMAKE_BUILD_TYPE STREQUAL "Debug")
		# Debugging symbols
		add_definitions(-g3)
		add_definitions(-O0)
		add_definitions(-D _DEBUG)
	
	elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
		#add_definitions(-pg)
		add_definitions(-O3)
		add_definitions(-flto=2 -fwhole-program)
		set(CMAKE_EXE_LINKER_FLAGS "-flto=2 -fwhole-program -fuse-linker-plugin")
	elseif(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
		add_definitions(-g3)
		add_definitions(-O3)
	endif()
	if(PLATFORM_TARGET STREQUAL "x86")
		add_definitions(-m32)
		set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -m32")
		set (CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -m32")
		set (CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} -m32")
	endif()
endif()
