/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <fstream>
#include <unistd.h>

#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/video_processing_engine/video_processing.h>
#include <multimedia/video_processing_engine/video_processing_types.h>
#include <native_buffer/buffer_common.h>
#include <native_buffer/native_buffer.h>
#include <native_drawing/drawing_region.h>
#include <native_window/external_window.h>
#include "include/OhosCommonTest.h"
#include "include/VideoSampleTest.h"

constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;
constexpr uint32_t DEFAULT_WIDTH = 1920;
constexpr uint32_t DEFAULT_HEIGHT = 1080;
constexpr uint64_t NV12_FMT_INDEX = 24;
constexpr int CREATE_TYPE = 0x4;

using namespace std;

namespace OHOS {
namespace Media {
namespace VideoProcessingEngine {

const VideoProcessing_ColorSpaceInfo SRC_INFO{
    .metadataType = OH_VIDEO_HDR_HDR10,
    .colorSpace = OH_COLORSPACE_BT2020_PQ_LIMIT,
    .pixelFormat = NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP,
};

const VideoProcessing_ColorSpaceInfo DST_INFO{
    .metadataType = OH_VIDEO_HDR_HLG,
    .colorSpace = OH_COLORSPACE_BT2020_PQ_LIMIT,
    .pixelFormat = NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP,
};

void OnErrorEmptyCallback(OH_VideoProcessing* handle, VideoProcessing_ErrorCode errorCode, void* userData) {}

void OnError(OH_VideoProcessing* handle, VideoProcessing_ErrorCode errorCode, void* userData) {}

void OnState(OH_VideoProcessing* instance, VideoProcessing_State state, void* userData) {}

void OnNewOutputBuffer(OH_VideoProcessing* instance, uint32_t index, void* userData) {}

int64_t GetSystemTime()
{
    struct timespec now;
    (void)clock_gettime(CLOCK_BOOTTIME, &now);
    int64_t nanoTime = reinterpret_cast<int64_t>(now.tv_sec) * NANOS_IN_SECOND + now.tv_nsec;
    return nanoTime / NANOS_IN_MICRO;
}

uint32_t FlushSurf(OHNativeWindowBuffer* ohNativeWindowBuffer, OHNativeWindow* window)
{
    struct Region region;
    struct Region::Rect* rect = new Region::Rect();
    rect->x = 0;
    rect->y = 0;
    rect->w = DEFAULT_WIDTH;
    rect->h = DEFAULT_HEIGHT;
    region.rects = rect;
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_UI_TIMESTAMP, GetSystemTime());
    int32_t err = OH_NativeWindow_NativeWindowFlushBuffer(window, ohNativeWindowBuffer, -1, region);
    delete rect;
    if (err != 0) {
        cout << "FlushBuffer failed" << endl;
        return 1;
    }
    return 0;
}

// initialize context with nullptr
/**
 * @tc.name   vpeVideoNdk_01
 * @tc.number vpeVideoNdk_01
 * @tc.desc   vpeVideoNdk_01
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_01()
{
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    ret = OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_Destroy(instance);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    return VIDEO_PROCESSING_SUCCESS;
}

// create context without initialization
/**
 * @tc.name   vpeVideoNdk_02
 * @tc.number vpeVideoNdk_02
 * @tc.desc   vpeVideoNdk_02
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_02()
{
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_Destroy(instance);
    return VIDEO_PROCESSING_SUCCESS;
}

// initialize context with wrong type
/**
 * @tc.name   vpeVideoNdk_03
 * @tc.number vpeVideoNdk_03
 * @tc.desc   vpeVideoNdk_03
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_03()
{
    int badCreateType = 0x3; // 3 is not support
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    ret = OH_VideoProcessing_Create(&instance, badCreateType);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_Destroy(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    return VIDEO_PROCESSING_SUCCESS;
}

// destroy context without create
/**
 * @tc.name   vpeVideoNdk_05
 * @tc.number vpeVideoNdk_05
 * @tc.desc   vpeVideoNdk_05
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_05()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Destroy(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}


// destroy context without create or initialize
/**
 * @tc.name   vpeVideoNdk_06
 * @tc.number vpeVideoNdk_06
 * @tc.desc   vpeVideoNdk_06
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_06()
{
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Destroy(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    return VIDEO_PROCESSING_SUCCESS;
}

// support check with null
/**
 * @tc.name   vpeVideoNdk_07
 * @tc.number vpeVideoNdk_07
 * @tc.desc   vpeVideoNdk_07
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_07()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(nullptr, nullptr);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// support check
/**
 * @tc.name   vpeVideoNdk_08
 * @tc.number vpeVideoNdk_08
 * @tc.desc   vpeVideoNdk_08
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_08()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, &DST_INFO);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// support check 2
/**
 * @tc.name   vpeVideoNdk_09
 * @tc.number vpeVideoNdk_09
 * @tc.desc   vpeVideoNdk_09
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_09()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, nullptr);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// support check 3
/**
 * @tc.name   vpeVideoNdk_10
 * @tc.number vpeVideoNdk_10
 * @tc.desc   vpeVideoNdk_10
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_10()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(nullptr, &DST_INFO);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// metagen check
/**
 * @tc.name   vpeVideoNdk_11
 * @tc.number vpeVideoNdk_11
 * @tc.desc   vpeVideoNdk_11
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_11()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(nullptr);
    ASSERT_FALSE(ret);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// metagen check 2
/**
 * @tc.name   vpeVideoNdk_12
 * @tc.number vpeVideoNdk_12
 * @tc.desc   vpeVideoNdk_12
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_12()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO);
    ASSERT_FALSE(ret);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// metagen check 3
/**
 * @tc.name   vpeVideoNdk_13
 * @tc.number vpeVideoNdk_13
 * @tc.desc   vpeVideoNdk_13
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_13()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(&DST_INFO);
    ASSERT_FALSE(ret);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set parameter to nullptr
/**
 * @tc.name   vpeVideoNdk_14
 * @tc.number vpeVideoNdk_14
 * @tc.desc   vpeVideoNdk_14
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_14()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set parameter quality level to high
/**
 * @tc.name   vpeVideoNdk_15
 * @tc.number vpeVideoNdk_15
 * @tc.desc   vpeVideoNdk_15
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_15()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set parameter quality level to medium
/**
 * @tc.name   vpeVideoNdk_16
 * @tc.number vpeVideoNdk_16
 * @tc.desc   vpeVideoNdk_16
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_16()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_MEDIUM);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set parameter quality level to low
/**
 * @tc.name   vpeVideoNdk_17
 * @tc.number vpeVideoNdk_17
 * @tc.desc   vpeVideoNdk_17
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_17()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_LOW);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set parameter quality level to none
/**
 * @tc.name   vpeVideoNdk_18
 * @tc.number vpeVideoNdk_18
 * @tc.desc   vpeVideoNdk_18
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_18()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_NONE);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}


// get parameter to non-nullptr
/**
 * @tc.name   vpeVideoNdk_19
 * @tc.number vpeVideoNdk_19
 * @tc.desc   vpeVideoNdk_19
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_19()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetParameter(instance, parameter);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// get parameter to nullptr
/**
 * @tc.name   vpeVideoNdk_20
 * @tc.number vpeVideoNdk_20
 * @tc.desc   vpeVideoNdk_20
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_20()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetParameter(instance, parameter);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// get parameter after setting to high
/**
 * @tc.name   vpeVideoNdk_21
 * @tc.number vpeVideoNdk_21
 * @tc.desc   vpeVideoNdk_21
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_21()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OH_AVFormat* parameterGot = OH_AVFormat_Create();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetParameter(instance, parameterGot);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set surface with surface from another instance
/**
 * @tc.name   vpeVideoNdk_22
 * @tc.number vpeVideoNdk_22
 * @tc.desc   vpeVideoNdk_22
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_22()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetSurface(instance, window2);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set surface with nullptr
/**
 * @tc.name   vpeVideoNdk_23
 * @tc.number vpeVideoNdk_23
 * @tc.desc   vpeVideoNdk_23
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_23()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OHNativeWindow* window = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetSurface(instance, window);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// get surface to nullptr
/**
 * @tc.name   vpeVideoNdk_24
 * @tc.number vpeVideoNdk_24
 * @tc.desc   vpeVideoNdk_24
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_24()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OHNativeWindow* window = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetSurface(instance, &window);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// create callback function
/**
 * @tc.name   vpeVideoNdk_25
 * @tc.number vpeVideoNdk_25
 * @tc.desc   vpeVideoNdk_25
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_25()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// create and destroy callback function
/**
 * @tc.name   vpeVideoNdk_26
 * @tc.number vpeVideoNdk_26
 * @tc.desc   vpeVideoNdk_26
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_26()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Destroy(callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// destroy callback without create
/**
 * @tc.name   vpeVideoNdk_27
 * @tc.number vpeVideoNdk_27
 * @tc.desc   vpeVideoNdk_27
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_27()
{
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Destroy(callback);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    return VIDEO_PROCESSING_SUCCESS;
}

// create callback function then register
/**
 * @tc.name   vpeVideoNdk_28
 * @tc.number vpeVideoNdk_28
 * @tc.desc   vpeVideoNdk_28
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_28()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnError(callback, OnError);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnState(callback, OnState);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    ret = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// create callback but register null function
/**
 * @tc.name   vpeVideoNdk_29
 * @tc.number vpeVideoNdk_29
 * @tc.desc   vpeVideoNdk_29
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_29()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnError(callback, nullptr);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnState(callback, nullptr);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, nullptr);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    ret = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessingCallback_Destroy(callback);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// createa and destroy callback function with register
/**
 * @tc.name   vpeVideoNdk_30
 * @tc.number vpeVideoNdk_30
 * @tc.desc   vpeVideoNdk_30
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_30()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, OnError);
    OH_VideoProcessingCallback_BindOnState(callback, OnState);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    auto userData = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_Destroy(callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// create callback and register but instance is nullptr
/**
 * @tc.name   vpeVideoNdk_31
 * @tc.number vpeVideoNdk_31
 * @tc.desc   vpeVideoNdk_31
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_31()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnError(callback, OnError);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnState(callback, OnState);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// create callback and register but callback is nullptr
/**
 * @tc.name   vpeVideoNdk_32
 * @tc.number vpeVideoNdk_32
 * @tc.desc   vpeVideoNdk_32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_32()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnError(callback, OnError);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnState(callback, OnState);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    ret = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// start processing with flush surface then stop
/**
 * @tc.name   vpeVideoNdk_33
 * @tc.number vpeVideoNdk_33
 * @tc.desc   vpeVideoNdk_33
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_33()
{
    OHNativeWindowBuffer* ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, OnError);
    OH_VideoProcessingCallback_BindOnState(callback, OnState);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    OH_VideoProcessing_SetSurface(instance, window2);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Start(instance);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, NV12_FMT_INDEX);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(window, &ohNativeWindowBuffer, &fenceFd);
    FlushSurf(ohNativeWindowBuffer, window);
    ret = OH_VideoProcessing_Stop(instance);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// bind on null callback
/**
 * @tc.name   vpeVideoNdk_34
 * @tc.number vpeVideoNdk_34
 * @tc.desc   vpeVideoNdk_34
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_34()
{
    OHNativeWindowBuffer* ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, nullptr);
    OH_VideoProcessingCallback_BindOnState(callback, nullptr);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, nullptr);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    OH_VideoProcessing_SetSurface(instance, window2);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Start(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, NV12_FMT_INDEX);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(window, &ohNativeWindowBuffer, &fenceFd);
    FlushSurf(ohNativeWindowBuffer, window);
    ret = OH_VideoProcessing_Stop(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_Destroy(instance2);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// register null callback
/**
 * @tc.name   vpeVideoNdk_34_2
 * @tc.number vpeVideoNdk_34_2
 * @tc.desc   vpeVideoNdk_34_2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_34_2()
{
    OHNativeWindowBuffer* ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    OH_VideoProcessing_RegisterCallback(instance, nullptr, &userData);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    OH_VideoProcessing_SetSurface(instance, window2);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Start(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, NV12_FMT_INDEX);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(window, &ohNativeWindowBuffer, &fenceFd);
    FlushSurf(ohNativeWindowBuffer, window);
    ret = OH_VideoProcessing_Stop(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_Destroy(instance2);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// call output buffer
/**
 * @tc.name   vpeVideoNdk_35
 * @tc.number vpeVideoNdk_35
 * @tc.desc   vpeVideoNdk_35
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_35()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_RenderOutputBuffer(instance, 0);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// bind callback after start
/**
 * @tc.name   vpeVideoNdk_37
 * @tc.number vpeVideoNdk_37
 * @tc.desc   vpeVideoNdk_37
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_37()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Start(instance);
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnError(nullptr, OnErrorEmptyCallback);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// sample multi thread start
/**
 * @tc.name   vpeVideoNdk_38
 * @tc.number vpeVideoNdk_38
 * @tc.desc   vpeVideoNdk_38
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeVideoNdk_38()
{
    std::unique_ptr<VideoSample> sample = std::make_unique<VideoSample>();
    sample->SetQualityLevel(VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    VideoProcessParam Param = { NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P, 480,  360,
                                NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P, 1280, 720 };
    int32_t ret = sample->InitVideoSample(Param);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    sample->StartProcess();
    EXPECT_EQ(sample->WaitAndStopSample(), VIDEO_PROCESSING_SUCCESS);
    return VIDEO_PROCESSING_SUCCESS;
}


} // namespace VideoProcessingEngine
} // namespace Media
} // namespace OHOS
