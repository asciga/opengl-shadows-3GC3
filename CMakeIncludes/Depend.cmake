#
# To Search for additional libraries
#
SET (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules/;${CMAKE_MODULE_PATH}")
#
# Get Dependencies
#
find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)
find_package(GLEW REQUIRED)
find_package(GLM REQUIRED)

if(NOT OPENGL_FOUND)
	message("ERROR: OpenGL not found")
endif(NOT OPENGL_FOUND)
#
# add include directories
#
include_directories(${OPENGL_INCLUDE_DIR}
      		    ${GLEW_INCLUDE_DIR}
		    ${GLUT_INCLUDE_DIR}
		    ${GLM_INCLUDE_DIRS}
	)

SET ( DEPEND_LIBRARIES
	${OPENGL_LIBRARIES}
	${GLUT_LIBRARIES}
	${GLEW_LIBRARY}
	)
