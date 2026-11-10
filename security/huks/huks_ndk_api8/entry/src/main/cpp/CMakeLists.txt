# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(musl)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include
                    ${NATIVERENDER_ROOT_PATH}/huksnapi
                    ${NATIVERENDER_ROOT_PATH}/nativehuks)

add_library(huksndk SHARED huksndk.cpp huks_api_test.cpp
            huksnapi/HuksAgreeDhTest.cpp
            huksnapi/HuksAgreeEcdhTest.cpp
            huksnapi/HuksAgreeX25519Test.cpp
            huksnapi/HuksAttestTest.cpp
            huksnapi/HuksCipherAesTest.cpp
            huksnapi/HuksCipherRsaTest.cpp
            huksnapi/HuksCipherSm4Test.cpp
            huksnapi/HuksDeriveHkdfTest.cpp
            huksnapi/HuksDerivePbkdfTest.cpp
            huksnapi/HuksHmacTest.cpp
            huksnapi/HuksMiscTest.cpp
            huksnapi/HuksNullptrTest.cpp
            huksnapi/HuksSignVerifyDsaTest.cpp
            huksnapi/HuksSignVerifyEccTest.cpp
            huksnapi/HuksSignVerifyEd25519Test.cpp
            huksnapi/HuksSignVerifyRsaTest.cpp
            huksnapi/HuksSignVerifySm2Test.cpp
            huksnapi/HuksWrappedTest.cpp
            huksnapi/NapiInitTest.cpp
            nativehuks/NativeHuksRegister.cpp
            nativehuks/HuksApiTest.cpp
            nativehuks/HuksApi1Test.cpp
            nativehuks/HuksApi2Test.cpp
            nativehuks/HuksAuthApiTest.cpp
            nativehuks/OHHuksStructTest.cpp
            nativehuks/common/CommonTest.cpp)
target_link_libraries(huksndk PUBLIC libace_napi.z.so libc++.a libhilog_ndk.z.so libhuks_ndk.z.so)