# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(videoCodecSample)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/capbilities/include
                    ${NATIVERENDER_ROOT_PATH}/common
                    ${NATIVERENDER_ROOT_PATH}/common/dfx/err
                    ${NATIVERENDER_ROOT_PATH}/common/dfx/log
                    ${NATIVERENDER_ROOT_PATH}/render/include
                    ${NATIVERENDER_ROOT_PATH}/sample/player
)

set(BASE_LIBRARY
    libace_napi.z.so libEGL.so libGLESv3.so libace_ndk.z.so libuv.so libhilog_ndk.z.so
    libnative_media_codecbase.so libnative_media_core.so libnative_media_vdec.so libnative_window.so
    libnative_media_venc.so libnative_media_acodec.so libnative_media_avdemuxer.so libnative_media_avsource.so libnative_media_avmuxer.so
    libohaudio.so
    liblowpower_avsink.so
)
add_library(player SHARED sample/player/PlayerNative.cpp
                          sample/player/Player.cpp
                          capbilities/demuxer.cpp
                          capbilities/video_decoder.cpp
                          capbilities/audio_decoder.cpp
                          capbilities/video_encoder.cpp
                          capbilities/lpp_audio_streamer.cpp
                          capbilities/lpp_video_streamer.cpp
                          render/egl_core.cpp
                          render/plugin_render.cpp
                          render/plugin_manager.cpp
                          common/sample_callback.cpp
                          common/lppCallback.cpp
)

add_library(lowpoweraudiosinkndk SHARED LowPowerSinkTest.cpp)
target_link_libraries(lowpoweraudiosinkndk PUBLIC
    libace_napi.z.so
    libavrecorder.so
    libnative_media_core.so
    libnative_media_core.so
    libnative_media_codecbase.so
    libnative_media_venc.so
    libnative_window.so
    libavplayer.so
    libnative_image.so
    libGLESv3.so
    libEGL.so
    libnative_buffer.so
    libhilog_ndk.z.so
    librawfile.z.so
    libavtranscoder.so
    libnative_media_avsource.so
    libnative_media_core.so
    libnative_media_aenc.so
    libnative_media_codecbase.so
    libnative_media_adec.so
    liblowpower_avsink.so
    libnative_media_avsource.so
    libnative_media_avdemuxer.so
    libnative_buffer.so
    libnative_media_venc.so
)

add_library(lowpoweraudiosinktwondk SHARED LowPowerSinkTwoTest.cpp)
target_link_libraries(lowpoweraudiosinktwondk PUBLIC
    libace_napi.z.so
    libavrecorder.so
    libnative_media_core.so
    libnative_media_core.so
    libnative_media_codecbase.so
    libnative_media_venc.so
    libnative_window.so
    libavplayer.so
    libnative_image.so
    libGLESv3.so
    libEGL.so
    libnative_buffer.so
    libhilog_ndk.z.so
    librawfile.z.so
    libavtranscoder.so
    libnative_media_avsource.so
    libnative_media_core.so
    libnative_media_aenc.so
    libnative_media_codecbase.so
    libnative_media_adec.so
    liblowpower_avsink.so
    libnative_media_avsource.so
    libnative_media_avdemuxer.so
    libnative_buffer.so
    libnative_media_venc.so
)

target_link_libraries(player PUBLIC ${BASE_LIBRARY})