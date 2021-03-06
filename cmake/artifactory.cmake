function(prepare_rt_props)

set(arch ${CMAKE_SYSTEM_PROCESSOR})
if (${arch} STREQUAL "aarch64")
    set(arch "sbsa")
endif()

set(RT_PROPS "")
list(APPEND RT_PROPS "arch=${arch}")
list(APPEND RT_PROPS "branch=${BUILD_BRANCH}")
list(APPEND RT_PROPS "changelist=${COMMIT_ID}")
list(APPEND RT_PROPS "os=linux")
list(APPEND RT_PROPS "platform=linux-${arch}")
set(VER_VAL "${CMAKE_PROJECT_VERSION}")
if(DEFINED ENV{BUILD_NUMBER} AND NOT "$ENV{BUILD_NUMBER}" STREQUAL "")
set (VER_VAL "${VER_VAL}.$ENV{BUILD_NUMBER}")
endif()
list(APPEND RT_PROPS "version=${VER_VAL}")
list(APPEND RT_PROPS "component_name=dcgm")
#list(APPEND RT_PROPS "source=")

message("RT_PROPS: ${RT_PROPS}")
file(WRITE "${CMAKE_BINARY_DIR}/rt.props" "${RT_PROPS}")

endfunction()
