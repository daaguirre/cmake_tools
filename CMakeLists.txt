
set(CMAKE_TOOLS_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(CMAKE_TOOLS_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake PARENT_SCOPE)

include(${CMAKE_CURRENT_LIST_DIR}/cmake/utils.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/cmake/file.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/cmake/python.cmake)

if(NOT EXISTS "${CMAKE_TOOLS_PATH}/conan.cmake")
  message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/0.18.1/conan.cmake"
                "${CMAKE_TOOLS_PATH}/conan.cmake"
                TLS_VERIFY ON)
endif()

include(${CMAKE_TOOLS_PATH}/conan.cmake)
