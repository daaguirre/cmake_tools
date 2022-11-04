#! activates a virtual env 
#
# if virtual env does not exist is created
# later venv bin path is added to the PATH 
# and project requirements are installed if the venv is a brand new venv
# \arg VENV_PATH: path to venv to avtivate 
# Output variables:
# project_venv
function(activate_virtual_env)
    set(options "")
    set(oneValueArgs VENV_PATH)
    set(multiValueArgs "")
    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if(NOT EXISTS "${ARGS_VENV_PATH}")
        find_package (Python3 3.8 COMPONENTS Interpreter)
        message("Creating python venv in ${ARGS_VENV_PATH}")
        execute_process (COMMAND "${Python3_EXECUTABLE}" -m venv "${ARGS_VENV_PATH}")
        set(install_requirements true)
    endif()

    # activate python venv
    set(ENV{VIRTUAL_ENV} ${ARGS_VENV_PATH})
    set (Python3_FIND_VIRTUALENV FIRST)
    # unset Python3_EXECUTABLE because it is also an input variable (see documentation, Artifacts Specification section)
    unset (Python3_EXECUTABLE)
    find_package (Python3)
    if(install_requirements)
        execute_process (COMMAND "${Python3_EXECUTABLE}" -m pip install -r "${PROJECT_SOURCE_DIR}/python/requirements.txt")
    endif()
    set(ENV{PATH} "$ENV{PATH}:${ARGS_VENV_PATH}/bin")
endfunction()