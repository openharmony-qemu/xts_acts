/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "include/ApiTest.h"
#include <atomic>
#include <fstream>
#include <iostream>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/video_processing_engine/video_processing.h>
#include <native_buffer/buffer_common.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <queue>
#include <string>
#include <thread>
#include <unistd.h>
#include <napi/native_api.h>
#include "include/CommonTool.h"

using namespace std;
namespace {

class TestConsumerListener {
public:
    TestConsumerListener(OH_NativeImage* img, std::string_view name) : image_(img)
    {
        listener_.onFrameAvailable = &TestConsumerListener::OnFrameAvailableStatic;
        listener_.context = this;

        OH_NativeImage_SetOnFrameAvailableListener(image_, listener_);
    }
    ~TestConsumerListener()
    {
        if (image_ != nullptr) {
            OH_NativeImage_UnsetOnFrameAvailableListener(image_);
        }
    }

private:
    static void OnFrameAvailableStatic(void* ctx)
    {
        auto* self = static_cast<TestConsumerListener*>(ctx);
        self->OnFrameAvailable();
    }

    void OnFrameAvailable() {}

private:
    OH_NativeImage* image_;
    OH_OnFrameAvailableListener listener_;
    int64_t timestamp = 0;
    Region::Rect damage = {};
};

const VideoProcessing_ColorSpaceInfo SRC_INFO = { OH_VIDEO_HDR_VIVID,
                                                  OH_COLORSPACE_BT2020_HLG_LIMIT,
                                                  NATIVEBUFFER_PIXEL_FMT_YCBCR_P010 };
const VideoProcessing_ColorSpaceInfo DST_INFO = { OH_VIDEO_HDR_VIVID,
                                                  OH_COLORSPACE_BT2020_PQ_LIMIT,
                                                  NATIVEBUFFER_PIXEL_FMT_YCBCR_P010 };

} // namespace

namespace {
static int32_t g_userValue = 1;
static int32_t g_index = 1;

static void onErrorEmptyCallback(OH_VideoProcessing* videoProcessor, VideoProcessing_ErrorCode error, void* userData)
{
    // do nothing
}

static void onErrorCallback(OH_VideoProcessing* videoProcessor, VideoProcessing_ErrorCode error, void* userData)
{
    OHPrintf("onErrorCallback");
}

static void onStateEmptyCallback(OH_VideoProcessing* videoProcessor, VideoProcessing_State state, void* userData)
{
    // do nothing
}

static void onStateCallback(OH_VideoProcessing* videoProcessor, VideoProcessing_State state, void* userData)
{
    OHPrintf("onStateCallback");
}

static void OnNewOutputBufferEmptyCallback(OH_VideoProcessing* videoProcessor, uint32_t index, void* userData)
{
    // do nothing
}

static void OnNewOutputBufferCallback(OH_VideoProcessing* videoProcessor, uint32_t index, void* userData)
{
    OHPrintf("OnNewOutputBufferCallback");
}

} // namespace

static napi_value CreateIntInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

void TearDown()
{
    OH_VideoProcessing_DeinitializeEnvironment();
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_00100
 * @tc.number SUB_VPE_VIDEO_API_TEST_00100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest00100(napi_env env, napi_callback_info info)
{
    if (SRC_INFO.metadataType != OH_VIDEO_HDR_VIVID) { return CreateIntInt32Result(env, -1); }
    if (SRC_INFO.colorSpace != OH_COLORSPACE_BT2020_HLG_LIMIT) { return CreateIntInt32Result(env, -1); }
    if (SRC_INFO.pixelFormat != NATIVEBUFFER_PIXEL_FMT_YCBCR_P010) { return CreateIntInt32Result(env, -1); }
    if (DST_INFO.metadataType != OH_VIDEO_HDR_VIVID) { return CreateIntInt32Result(env, -1); }
    if (DST_INFO.colorSpace != OH_COLORSPACE_BT2020_PQ_LIMIT) { return CreateIntInt32Result(env, -1); }
    if (DST_INFO.pixelFormat != NATIVEBUFFER_PIXEL_FMT_YCBCR_P010) { return CreateIntInt32Result(env, -1); }
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_InitializeEnvironment();
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    OH_VideoProcessing_DeinitializeEnvironment();
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_00200
 * @tc.number SUB_VPE_VIDEO_API_TEST_00200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest00200(napi_env env, napi_callback_info info)
{
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_DeinitializeEnvironment();
    if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_00300
 * @tc.number SUB_VPE_VIDEO_API_TEST_00300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest00300(napi_env env, napi_callback_info info)
{
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_InitializeEnvironment();
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    ret = OH_VideoProcessing_DeinitializeEnvironment();
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_00400
 * @tc.number SUB_VPE_VIDEO_API_TEST_00400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest00400(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsColorSpaceConversionSupported(nullptr, nullptr);
    if ((ret)) { return CreateIntInt32Result(env, -1); }
    OH_VideoProcessing_DeinitializeEnvironment();
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_00500
 * @tc.number SUB_VPE_VIDEO_API_TEST_00500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest00500(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, nullptr);
    if ((ret)) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_00600
 * @tc.number SUB_VPE_VIDEO_API_TEST_00600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest00600(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsColorSpaceConversionSupported(nullptr, &DST_INFO);
    if ((ret)) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_00700
 * @tc.number SUB_VPE_VIDEO_API_TEST_00700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest00700(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, &DST_INFO);
    if (!access("/system/lib64/libvideoprocessingengine_ext.z.so", 0)) {
        if (!(ret)) { return CreateIntInt32Result(env, -1); }
    } else {
        if ((ret)) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_00800
 * @tc.number SUB_VPE_VIDEO_API_TEST_00800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest00800(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(nullptr);
    if ((ret)) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_00900
 * @tc.number SUB_VPE_VIDEO_API_TEST_00900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest00900(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO);
    if (!access("/system/lib64/libvideoprocessingengine_ext.z.so", 0)) {
        if (!(ret)) { return CreateIntInt32Result(env, -1); }
    } else {
        if ((ret)) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_01000
 * @tc.number SUB_VPE_VIDEO_API_TEST_01000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest01000(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing** videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(videoProcessor, INT_MAX);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_01100
 * @tc.number SUB_VPE_VIDEO_API_TEST_01100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest01100(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing** videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_01200
 * @tc.number SUB_VPE_VIDEO_API_TEST_01200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest01200(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor, INT_MAX);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
    OH_VideoProcessing_Destroy(videoProcessor);
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_01300
 * @tc.number SUB_VPE_VIDEO_API_TEST_01300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest01300(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_01400
 * @tc.number SUB_VPE_VIDEO_API_TEST_01400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest01400(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Destroy(nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_01500
 * @tc.number SUB_VPE_VIDEO_API_TEST_01500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest01500(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_Destroy(videoProcessor);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_01600
 * @tc.number SUB_VPE_VIDEO_API_TEST_01600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest01600(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_RegisterCallback(nullptr, nullptr, nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_01700
 * @tc.number SUB_VPE_VIDEO_API_TEST_01700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest01700(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    ret = OH_VideoProcessing_RegisterCallback(nullptr, callback, nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    OH_VideoProcessingCallback_Destroy(callback);
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_01800
 * @tc.number SUB_VPE_VIDEO_API_TEST_01800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest01800(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, nullptr, nullptr);
        if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_01900
 * @tc.number SUB_VPE_VIDEO_API_TEST_01900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest01900(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        VideoProcessing_Callback* callback = nullptr;
        ret = OH_VideoProcessingCallback_Create(&callback);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessingCallback_BindOnError(callback, onErrorEmptyCallback);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, nullptr);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_VideoProcessingCallback_Destroy(callback);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_02000
 * @tc.number SUB_VPE_VIDEO_API_TEST_02000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest02000(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        VideoProcessing_Callback* callback = nullptr;
        ret = OH_VideoProcessingCallback_Create(&callback);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, nullptr);
        if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_VideoProcessingCallback_Destroy(callback);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_02100
 * @tc.number SUB_VPE_VIDEO_API_TEST_02100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest02100(napi_env env, napi_callback_info info)
{
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        OH_VideoProcessing* videoProcessor = nullptr;
        VideoProcessing_ErrorCode ret =
            OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OH_NativeImage* cNativeImage = OH_ConsumerSurface_Create();
        auto listener = make_unique<TestConsumerListener>(
            TestConsumerListener(cNativeImage, "/data/test/media/out_320_240_10s.rgba"));
        auto pNativeWindow = OH_NativeImage_AcquireNativeWindow(cNativeImage);
        ret = OH_VideoProcessing_SetSurface(videoProcessor, pNativeWindow);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OHNativeWindow* inwindow = nullptr;
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &inwindow);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        VideoProcessing_Callback* callback = nullptr;
        ret = OH_VideoProcessingCallback_Create(&callback);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessingCallback_BindOnError(callback, onErrorEmptyCallback);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, nullptr);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_Start(videoProcessor);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, nullptr);
        if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessingCallback_Destroy(callback);
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(pNativeWindow);
    }
    return CreateIntInt32Result(env, 0);
}
/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_02200
 * @tc.number SUB_VPE_VIDEO_API_TEST_02200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest02200(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        VideoProcessing_Callback* callback = nullptr;
        ret = OH_VideoProcessingCallback_Create(&callback);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        void* userData = &g_userValue;
        if (!userData) {
            ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, userData);
            if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        }
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_VideoProcessingCallback_Destroy(callback);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_02300
 * @tc.number SUB_VPE_VIDEO_API_TEST_02300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest02300(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetSurface(nullptr, nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_02400
 * @tc.number SUB_VPE_VIDEO_API_TEST_02400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest02400(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_NativeImage* cNativeImage = OH_ConsumerSurface_Create();
    auto listener =
        make_unique<TestConsumerListener>(TestConsumerListener(cNativeImage, "/data/test/media/out_320_240_10s.rgba"));
    auto pNativeWindow = OH_NativeImage_AcquireNativeWindow(cNativeImage);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetSurface(nullptr, pNativeWindow);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    OH_NativeWindow_DestroyNativeWindow(pNativeWindow);
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_02500
 * @tc.number SUB_VPE_VIDEO_API_TEST_02500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest02500(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_SetSurface(videoProcessor, nullptr);
        if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_02600
 * @tc.number SUB_VPE_VIDEO_API_TEST_02600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest02600(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OH_NativeImage* cNativeImage = OH_ConsumerSurface_Create();
        auto listener = make_unique<TestConsumerListener>(
            TestConsumerListener(cNativeImage, "/data/test/media/out_320_240_10s.rgba"));
        auto pNativeWindow = OH_NativeImage_AcquireNativeWindow(cNativeImage);
        ret = OH_VideoProcessing_SetSurface(videoProcessor, pNativeWindow);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(pNativeWindow);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_02700
 * @tc.number SUB_VPE_VIDEO_API_TEST_02700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest02700(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetSurface(nullptr, nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_02800
 * @tc.number SUB_VPE_VIDEO_API_TEST_02800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest02800(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_NativeImage* cNativeImage = OH_ConsumerSurface_Create();
    auto listener =
        make_unique<TestConsumerListener>(TestConsumerListener(cNativeImage, "/data/test/media/out_320_240_10s.rgba"));
    auto pNativeWindow = OH_NativeImage_AcquireNativeWindow(cNativeImage);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetSurface(nullptr, &pNativeWindow);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    OH_NativeWindow_DestroyNativeWindow(pNativeWindow);
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_02900
 * @tc.number SUB_VPE_VIDEO_API_TEST_02900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest02900(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_GetSurface(videoProcessor, nullptr);
        if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_03000
 * @tc.number SUB_VPE_VIDEO_API_TEST_03000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest03000(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OH_NativeImage* cNativeImage = OH_ConsumerSurface_Create();
        auto listener = make_unique<TestConsumerListener>(
            TestConsumerListener(cNativeImage, "/data/test/media/out_320_240_10s.rgba"));
        auto pNativeWindow = OH_NativeImage_AcquireNativeWindow(cNativeImage);
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &pNativeWindow);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(pNativeWindow);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_03100
 * @tc.number SUB_VPE_VIDEO_API_TEST_03100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest03100(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OHNativeWindow* window = nullptr;
        OHNativeWindow* window2 = nullptr;
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &window);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &window2);
        if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(window);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_03200
 * @tc.number SUB_VPE_VIDEO_API_TEST_03200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest03200(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Start(nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_03300
 * @tc.number SUB_VPE_VIDEO_API_TEST_03300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest03300(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_Start(videoProcessor);
        if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_03400
 * @tc.number SUB_VPE_VIDEO_API_TEST_03400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest03400(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OH_NativeImage* cNativeImage = OH_ConsumerSurface_Create();
        auto listener = make_unique<TestConsumerListener>(
            TestConsumerListener(cNativeImage, "/data/test/media/out_320_240_10s.rgba"));
        auto pNativeWindow = OH_NativeImage_AcquireNativeWindow(cNativeImage);
        ret = OH_VideoProcessing_SetSurface(videoProcessor, pNativeWindow);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_Start(videoProcessor);
        if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(pNativeWindow);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_03500
 * @tc.number SUB_VPE_VIDEO_API_TEST_03500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest03500(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Stop(nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_03600
 * @tc.number SUB_VPE_VIDEO_API_TEST_03600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest03600(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_Stop(videoProcessor);
        if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_03700
 * @tc.number SUB_VPE_VIDEO_API_TEST_03700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest03700(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OH_NativeImage* cNativeImage = OH_ConsumerSurface_Create();
        auto listener = make_unique<TestConsumerListener>(
            TestConsumerListener(cNativeImage, "/data/test/media/out_320_240_10s.rgba"));
        auto pNativeWindow = OH_NativeImage_AcquireNativeWindow(cNativeImage);
        ret = OH_VideoProcessing_SetSurface(videoProcessor, pNativeWindow);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OHNativeWindow* outwindow = nullptr;
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &outwindow);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_Start(videoProcessor);
        if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_Stop(videoProcessor);
        if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(pNativeWindow);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_03800
 * @tc.number SUB_VPE_VIDEO_API_TEST_03800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest03800(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_RenderOutputBuffer(nullptr, g_index);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_03900
 * @tc.number SUB_VPE_VIDEO_API_TEST_03900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest03900(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_RenderOutputBuffer(videoProcessor, INT_MAX);
        if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_04000
 * @tc.number SUB_VPE_VIDEO_API_TEST_04000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest04000(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_04100
 * @tc.number SUB_VPE_VIDEO_API_TEST_04100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest04100(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    OH_VideoProcessingCallback_Destroy(callback);
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_04200
 * @tc.number SUB_VPE_VIDEO_API_TEST_04200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest04200(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Destroy(nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_04300
 * @tc.number SUB_VPE_VIDEO_API_TEST_04300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest04300(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    ret = OH_VideoProcessingCallback_Destroy(callback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_04400
 * @tc.number SUB_VPE_VIDEO_API_TEST_04400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest04400(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnError(nullptr, onErrorEmptyCallback);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_04500
 * @tc.number SUB_VPE_VIDEO_API_TEST_04500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest04500(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    ret = OH_VideoProcessingCallback_BindOnError(callback, onErrorEmptyCallback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    OH_VideoProcessingCallback_Destroy(callback);
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_04600
 * @tc.number SUB_VPE_VIDEO_API_TEST_04600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest04600(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnError(nullptr, onErrorCallback);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_04700
 * @tc.number SUB_VPE_VIDEO_API_TEST_04700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest04700(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    ret = OH_VideoProcessingCallback_BindOnError(callback, onErrorCallback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    OH_VideoProcessingCallback_Destroy(callback);
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_04800
 * @tc.number SUB_VPE_VIDEO_API_TEST_04800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest04800(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnState(nullptr, onStateEmptyCallback);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_04900
 * @tc.number SUB_VPE_VIDEO_API_TEST_04900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest04900(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    ret = OH_VideoProcessingCallback_BindOnState(callback, onStateEmptyCallback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    OH_VideoProcessingCallback_Destroy(callback);
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_05000
 * @tc.number SUB_VPE_VIDEO_API_TEST_05000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest05000(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnState(nullptr, onStateCallback);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_05100
 * @tc.number SUB_VPE_VIDEO_API_TEST_05100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest05100(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    ret = OH_VideoProcessingCallback_BindOnState(callback, onStateCallback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    OH_VideoProcessingCallback_Destroy(callback);
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_05200
 * @tc.number SUB_VPE_VIDEO_API_TEST_05200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest05200(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessingCallback_BindOnNewOutputBuffer(nullptr, OnNewOutputBufferEmptyCallback);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_05300
 * @tc.number SUB_VPE_VIDEO_API_TEST_05300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest05300(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBufferEmptyCallback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    OH_VideoProcessingCallback_Destroy(callback);
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_05400
 * @tc.number SUB_VPE_VIDEO_API_TEST_05400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest05400(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessingCallback_BindOnNewOutputBuffer(nullptr, OnNewOutputBufferCallback);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_05500
 * @tc.number SUB_VPE_VIDEO_API_TEST_05500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest05500(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBufferCallback);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    OH_VideoProcessingCallback_Destroy(callback);
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_05600
 * @tc.number SUB_VPE_VIDEO_API_TEST_05600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest05600(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_COLOR_SPACE_CONVERSION);
    if (OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, &DST_INFO)) {
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        if (ret == VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_05700
 * @tc.number SUB_VPE_VIDEO_API_TEST_05700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest05700(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        return CreateIntInt32Result(env, 0);
    }
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t metadataMode = VIDEO_METADATA_GENERATOR_CONTRAST_MODE;
    OH_AVFormat_SetIntValue(format, VIDEO_METADATA_GENERATOR_STYLE_CONTROL, metadataMode);
    ret = OH_VideoProcessing_SetParameter(videoProcessor, format);
    OH_VideoProcessing_Destroy(videoProcessor);
    OH_AVFormat_Destroy(format);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_05800
 * @tc.number SUB_VPE_VIDEO_API_TEST_05800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest05800(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret =
        OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        return CreateIntInt32Result(env, 0);
    }
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t metadataMode = VIDEO_METADATA_GENERATOR_BRIGHT_MODE;
    OH_AVFormat_SetIntValue(format, VIDEO_METADATA_GENERATOR_STYLE_CONTROL, metadataMode);
    ret = OH_VideoProcessing_SetParameter(videoProcessor, format);
    OH_AVFormat_Destroy(format);
    OH_VideoProcessing_Destroy(videoProcessor);
    if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_05900
 * @tc.number SUB_VPE_VIDEO_API_TEST_05900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest05900(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing* videoProcessor = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t metadataMode = VIDEO_METADATA_GENERATOR_BRIGHT_MODE;
    OH_AVFormat_SetIntValue(format, VIDEO_METADATA_GENERATOR_STYLE_CONTROL, metadataMode);
    int32_t ret = OH_VideoProcessing_SetParameter(videoProcessor, format);
    OH_AVFormat_Destroy(format);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_06000
 * @tc.number SUB_VPE_VIDEO_API_TEST_06000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest06000(napi_env env, napi_callback_info info)
{
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        OH_VideoProcessing* videoProcessor = nullptr;
        VideoProcessing_ErrorCode ret =
            OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
        ret = OH_VideoProcessing_SetParameter(videoProcessor, nullptr);
        OH_VideoProcessing_Destroy(videoProcessor);
        if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_06100
 * @tc.number SUB_VPE_VIDEO_API_TEST_06100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest06100(napi_env env, napi_callback_info info)
{
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        OH_VideoProcessing* videoProcessor = nullptr;
        VideoProcessing_ErrorCode ret =
            OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_GetParameter(videoProcessor, nullptr);
        OH_VideoProcessing_Destroy(videoProcessor);
        if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_06200
 * @tc.number SUB_VPE_VIDEO_API_TEST_06200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest06200(napi_env env, napi_callback_info info)
{
    OH_VideoProcessing* videoProcessor = nullptr;
    int32_t ret = OH_VideoProcessing_GetParameter(videoProcessor, nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VPE_VIDEO_API_TEST_06300
 * @tc.number SUB_VPE_VIDEO_API_TEST_06300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value VpeVideoApiTest06300(napi_env env, napi_callback_info info)
{
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        OH_VideoProcessing* videoProcessor = nullptr;
        VideoProcessing_ErrorCode ret =
            OH_VideoProcessing_Create(&videoProcessor, VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OH_NativeImage* cNativeImage = OH_ConsumerSurface_Create();
        auto listener = make_unique<TestConsumerListener>(
            TestConsumerListener(cNativeImage, "/data/test/media/out_320_240_10s.rgba"));
        auto pNativeWindow = OH_NativeImage_AcquireNativeWindow(cNativeImage);
        ret = OH_VideoProcessing_SetSurface(videoProcessor, pNativeWindow);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        OHNativeWindow* inWindow = nullptr;
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &inWindow);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        VideoProcessing_Callback* callback = nullptr;
        ret = OH_VideoProcessingCallback_Create(&callback);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessingCallback_BindOnError(callback, onErrorEmptyCallback);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBufferEmptyCallback);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, nullptr);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_Start(videoProcessor);
        if (ret != VIDEO_PROCESSING_SUCCESS) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoProcessing_RenderOutputBuffer(videoProcessor, INT_MAX);
        if (ret != VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) { return CreateIntInt32Result(env, -1); }
        OH_VideoProcessingCallback_Destroy(callback);
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(pNativeWindow);
    }
    return CreateIntInt32Result(env, 0);
}