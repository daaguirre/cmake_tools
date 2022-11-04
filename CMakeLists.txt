
set(cmake_tools_path ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(cmake_tools_path ${CMAKE_CURRENT_LIST_DIR}/cmake PARENT_SCOPE)
include(${CMAKE_CURRENT_LIST_DIR}/cmake/file.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/cmake/python.cmake)

if(NOT EXISTS "${cmake_tools_path}/conan.cmake")
  message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/0.18.1/conan.cmake"
                "${cmake_tools_path}/conan.cmake"
                TLS_VERIFY ON)
endif()

include(${cmake_tools_path}/conan.cmake)
