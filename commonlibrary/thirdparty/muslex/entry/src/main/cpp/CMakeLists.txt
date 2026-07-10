# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(MyApplication0525)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(OPENHARMONY_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../../../../..)
set(src_sec
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/memset_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureprintoutput_a.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/sprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strcpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/fscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/fwscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/gets_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/memcpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/memmove_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/scanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/securecutil.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureinput_a.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureinput_w.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureprintoutput_w.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/snprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/sscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strcat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strncat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strncpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strtok_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/swprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/swscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vfscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vfwscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vsnprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vsprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vsscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vswprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vswscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vwscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcscat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcscpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcsncat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcsncpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcstok_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wmemcpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wmemmove_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wscanf_s.c
)

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/include
                    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src
                    ${OPENHARMONY_ROOT_PATH}/third_party/node/src
                    ${NATIVERENDER_ROOT_PATH}/common
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(acosfFinitendktest SHARED acosfFiniteNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(asprintfChkndktest SHARED asprintfChkNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(atan2Finitendktest SHARED atan2FiniteNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(cmsgNxthdrndktest SHARED cmsgNxthdrNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(dfxsetcrashlogconfigndktest SHARED dfxSetCrashLogConfigNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(exp2ffinitedktest SHARED exp2fFiniteNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(exp2Finitendktest SHARED exp2FiniteNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(expfinitedktest SHARED expFiniteNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(explicitbzerochkndktest SHARED explicitBzeroChkNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(fcntl64nativetest SHARED fcntl64Native.cpp libcFunctionLoader.h ${src_sec})
add_library(fdeltchkndktest SHARED fdeltChkNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(fedisableexceptndktest SHARED fedisableExceptNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(feenableexceptndktest SHARED feenableExceptNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(fegetexceptndktest SHARED fegetExceptNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(finitedktest SHARED finiteNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(finitefdktest SHARED finitefNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(fprintfchkdktest SHARED fprintfChkNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(getaddrcustomndktest SHARED getaddrinfoCustomNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(getauxvaldktest SHARED getauxvalNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(getrestraceidndktest SHARED getResTraceIdNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(gwpasancollectndktest SHARED gwpAsanCollectNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(gwpasanregffrtndktest SHARED gwpAsanRegisterFfrtNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(hilogbaseislogglendktest SHARED hilogBaseIsLoggableNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(hilogbaseprintndktest SHARED hilogBasePrintNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(isinffndktest SHARED isinffNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(isinftest SHARED isinfNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(isnanfndktest SHARED isnanfNdk.cpp libcFunctionLoader.h ${src_sec})
add_library(isnanndktest SHARED isnanNdk.cpp libcFunctionLoader.h ${src_sec})

target_link_libraries(acosfFinitendktest PUBLIC libace_napi.z.so)
target_link_libraries(asprintfChkndktest PUBLIC libace_napi.z.so)
target_link_libraries(atan2Finitendktest PUBLIC libace_napi.z.so)
target_link_libraries(cmsgNxthdrndktest PUBLIC libace_napi.z.so)
target_link_libraries(dfxsetcrashlogconfigndktest PUBLIC libace_napi.z.so)
target_link_libraries(exp2ffinitedktest PUBLIC libace_napi.z.so)
target_link_libraries(exp2Finitendktest PUBLIC libace_napi.z.so)
target_link_libraries(expfinitedktest PUBLIC libace_napi.z.so)
target_link_libraries(explicitbzerochkndktest PUBLIC libace_napi.z.so)
target_link_libraries(fcntl64nativetest PUBLIC libace_napi.z.so)
target_link_libraries(fdeltchkndktest PUBLIC libace_napi.z.so)
target_link_libraries(fedisableexceptndktest PUBLIC libace_napi.z.so)
target_link_libraries(feenableexceptndktest PUBLIC libace_napi.z.so)
target_link_libraries(fegetexceptndktest PUBLIC libace_napi.z.so)
target_link_libraries(finitedktest PUBLIC libace_napi.z.so)
target_link_libraries(finitefdktest PUBLIC libace_napi.z.so)
target_link_libraries(fprintfchkdktest PUBLIC libace_napi.z.so)
target_link_libraries(getaddrcustomndktest PUBLIC libace_napi.z.so)
target_link_libraries(getauxvaldktest PUBLIC libace_napi.z.so)
target_link_libraries(getrestraceidndktest PUBLIC libace_napi.z.so)
target_link_libraries(gwpasancollectndktest PUBLIC libace_napi.z.so)
target_link_libraries(gwpasanregffrtndktest PUBLIC libace_napi.z.so)
target_link_libraries(hilogbaseislogglendktest PUBLIC libace_napi.z.so)
target_link_libraries(hilogbaseprintndktest PUBLIC libace_napi.z.so)
target_link_libraries(isinffndktest PUBLIC libace_napi.z.so)
target_link_libraries(isinftest PUBLIC libace_napi.z.so)
target_link_libraries(isnanfndktest PUBLIC libace_napi.z.so)
target_link_libraries(isnanndktest PUBLIC libace_napi.z.so)
