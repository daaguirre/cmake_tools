
#! get environment variable
#
# Obtains environment variable, gives default value if not found
# If no default value is given and the variable is not found then a fatal error is raised   
#
# \arg VAR_NAME: environment variable name.
# \arg DEFAULT: default value if env var is not defined.
function(get_env_var)
    set(options "")
    set(oneValueArgs VAR_NAME DEFAULT)
    set(multiValueArgs "")
    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if(DEFINED ENV{${ARGS_VAR_NAME}})
        set(${ARGS_VAR_NAME} $ENV{${ARGS_VAR_NAME}} PARENT_SCOPE)
    elseif(ARGS_DEFAULT)
        set(${ARGS_VAR_NAME} ${ARGS_DEFAULT} PARENT_SCOPE)
    else()
        message( FATAL_ERROR "Environment variable ${ARGS_VAR_NAME} not found." )
    endif()
endfunction()
