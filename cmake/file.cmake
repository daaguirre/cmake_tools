
#! generate_cpp_sources
#
# cmake function for generating cpp sources
# a file is only generated if it does not exist
#
#
# \arg FILES: file list of relative paths
function(generate_cpp_sources)
    set(options "")
    set(oneValueArgs "")
    set(multiValueArgs FILES)
    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    set(HEADER_FILES ".h" ".hpp" ".cuh")
    foreach(FILE ${ARGS_FILES})
        set(FILE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/${FILE})
        if(NOT EXISTS ${FILE_PATH})
            get_filename_component(EXTENSION ${FILE_PATH} EXT)
            # used in template
            get_filename_component(FILE_NAME ${FILE_PATH} NAME_WE)
            if(${EXTENSION} IN_LIST HEADER_FILES)
                string(REPLACE "." "_" CPP_GUARD ${FILE})
                string(REPLACE "/" "_" CPP_GUARD ${CPP_GUARD})
                string(TOUPPER ${CPP_GUARD} CPP_GUARD)
                set(CPP_GUARD "__${CPP_GUARD}_")
                configure_file(${CMAKE_TOOLS_PATH}/templates/cpp_header.in ${FILE_PATH})
            else()
                configure_file(${CMAKE_TOOLS_PATH}/templates/any.in ${FILE_PATH})
            endif()
        endif()
    endforeach()
endfunction()
