/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include "ImageNapiTest.h"
#include "ImageNapiTest2.h"
#include <multimedia/image_framework/image/pixelmap_native.h>
#include "napi/native_api.h"
#define LOG_DOMAIN 0xFF00
#define LOG_TAG "ImageNdk"
#include <hilog/log.h>

namespace {
    const uint32_t NUM_0 = 0;
    const uint32_t NUM_1 = 1;
    const uint32_t NUM_2 = 2;
    const uint32_t NUM_3 = 3;
    const uint32_t NUM_4 = 4;
    const uint32_t NUM_5 = 5;
    const uint32_t NUM_6 = 6;
    const uint32_t NUM_7 = 7;
    const uint32_t NUM_8 = 8;
    const uint32_t NUM_9 = 9;
    const uint32_t NUM_10 = 10;
    const uint32_t CHANNEL_8BIT_MAX = 0xFF;
    const uint32_t MAX_BUFFER_SIZE = 512;
    const uint32_t MAX_COLOR_SIZE = 96;
    const uint32_t MAX_QUALITY_SIZE = 98;
    constexpr int8_t ARGB_8888_BYTES = 4;
    constexpr float SCALE_RATIO_2X = 2.0f;
    constexpr float TRANSLATE_OFFSET_10 = 10.0f;
    constexpr float ROTATE_ANGLE_90 = 90.0f;
    constexpr float ROTATE_ANGLE_45 = 45.0f;
    constexpr float OPACITY_HALF = 0.5f;
    constexpr float OPACITY_MAX = 1.0f;
    constexpr float OPACITY_INVALID_HIGH = 2.0f;
    constexpr float OPACITY_INVALID_LOW = -1.0f;
    const int32_t IMAGE_WIDTH_SMALL = 10;
    const int32_t IMAGE_HEIGHT_SMALL = 10;
    const uint32_t BUFFER_SIZE_400 = 400;
    const uint32_t BUFFER_SIZE_800 = 800;
    const uint32_t AREA_OFFSET_ZERO = 0;
    const uint32_t AREA_SIZE_5 = 5;
    const uint32_t AREA_ROW_STRIDE_40 = 40;
    const uint32_t AREA_ROW_STRIDE_80 = 80;
    const int32_t EXPECTED_ALLOC_FAILED_CODE = 7600301;
    const int32_t EXPECTED_COPY_FAILED_CODE = 7600302;
    const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
}

static napi_value getJsResult(napi_env env, int result)
{
    napi_value resultNapi = nullptr;
    napi_create_int32(env, result, &resultNapi);
    return resultNapi;
}

/**
 * @tc.name   testWritePixelsWithFmtRGBA8888
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtRGBA8888_0100
 * @tc.desc   test OH_PixelmapNative_WritePixelsWithPixelFormat with RGBA_8888, verify IMAGE_SUCCESS
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtRGBA8888(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_2;
    napi_value argv[NUM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtRGBA8888 ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_1], &data, &len);
    errCode = OH_PixelmapNative_WritePixelsWithPixelFormat(pixelmap,
        (const uint8_t*)data, (uint32_t)len, PIXEL_FORMAT_RGBA_8888);
    OH_LOG_INFO(LOG_APP, "WPxFmtRGBA8888 result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsWithFmtRGB888
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtRGB888_0200
 * @tc.desc   test OH_PixelmapNative_WritePixelsWithPixelFormat with RGB_888, verify IMAGE_SUCCESS
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtRGB888(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_2;
    napi_value argv[NUM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtRGB888 ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_1], &data, &len);
    errCode = OH_PixelmapNative_WritePixelsWithPixelFormat(pixelmap,
        (const uint8_t*)data, (uint32_t)len, PIXEL_FORMAT_RGB_888);
    OH_LOG_INFO(LOG_APP, "WPxFmtRGB888 result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsWithFmtRGB565
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtRGB565_0300
 * @tc.desc   test OH_PixelmapNative_WritePixelsWithPixelFormat with RGB_565, verify IMAGE_SUCCESS
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtRGB565(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_2;
    napi_value argv[NUM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtRGB565 ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_1], &data, &len);
    errCode = OH_PixelmapNative_WritePixelsWithPixelFormat(pixelmap,
        (const uint8_t*)data, (uint32_t)len, PIXEL_FORMAT_RGB_565);
    OH_LOG_INFO(LOG_APP, "WPxFmtRGB565 result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsWithFmtRGBAF16
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtRGBAF16_0400
 * @tc.desc   test OH_PixelmapNative_WritePixelsWithPixelFormat with RGBA_F16, verify IMAGE_SUCCESS
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtRGBAF16(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_2;
    napi_value argv[NUM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtRGBAF16 ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_1], &data, &len);
    errCode = OH_PixelmapNative_WritePixelsWithPixelFormat(pixelmap,
        (const uint8_t*)data, (uint32_t)len, PIXEL_FORMAT_RGBA_F16);
    OH_LOG_INFO(LOG_APP, "WPxFmtRGBAF16 result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsWithFmtNullPixelmap
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtNullPixelmap_0500
 * @tc.desc   test OH_PixelmapNative_WritePixelsWithPixelFormat with null pixelmap, verify IMAGE_BAD_PARAMETER
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtNullPixelmap(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    napi_get_cb_info(env, info, nullptr, argv, nullptr, nullptr);
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_0], &data, &len);
    Image_ErrorCode errCode = OH_PixelmapNative_WritePixelsWithPixelFormat(
        nullptr, (const uint8_t*)data, (uint32_t)len, PIXEL_FORMAT_RGBA_8888);
    OH_LOG_INFO(LOG_APP, "WPxFmtNullPm result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsWithFmtNullSource
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtNullSource_0600
 * @tc.desc   test OH_PixelmapNative_WritePixelsWithPixelFormat with null source and zero size, verify error code
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtNullSource(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_1;
    napi_value argv[NUM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtNullSrc ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    errCode = OH_PixelmapNative_WritePixelsWithPixelFormat(pixelmap, nullptr, 0, PIXEL_FORMAT_RGBA_8888);
    OH_LOG_INFO(LOG_APP, "WPxFmtNullSrc result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsWithFmtUnsupportedFmt
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtUnsupportedFmt_0700
 * @tc.desc   test OH_PixelmapNative_WritePixelsWithPixelFormat with unsupported NV21 format, verify error code
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtUnsupportedFmt(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_2;
    napi_value argv[NUM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtUnsupFmt ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_1], &data, &len);
    errCode = OH_PixelmapNative_WritePixelsWithPixelFormat(pixelmap,
        (const uint8_t*)data, (uint32_t)len, PIXEL_FORMAT_NV21);
    OH_LOG_INFO(LOG_APP, "WPxFmtUnsupFmt result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsWithFmtLocked
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtLocked_0800
 * @tc.desc   test OH_PixelmapNative_WritePixelsWithPixelFormat on locked pixelmap, verify IMAGE_UNSUPPORTED_OPERATION
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtLocked(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_2;
    napi_value argv[NUM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtLocked ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_1], &data, &len);
    void* addr = nullptr;
    errCode = OH_PixelmapNative_AccessPixels(pixelmap, &addr);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtLocked AccessPixels failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    errCode = OH_PixelmapNative_WritePixelsWithPixelFormat(pixelmap,
        (const uint8_t*)data, (uint32_t)len, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapNative_UnaccessPixels(pixelmap);
    OH_LOG_INFO(LOG_APP, "WPxFmtLocked result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsWithFmtUnsupportedConversion
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtUnsupportedConversion_0900
 * @tc.desc   test OH_PixelmapNative_WritePixelsWithPixelFormat NV21 pixelmap with RGBA_8888 source, verify error code
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtUnsupportedConversion(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&opts);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtUnsupConv CreateOpts failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_PixelmapInitializationOptions_SetWidth(opts, IMAGE_WIDTH_SMALL);
    OH_PixelmapInitializationOptions_SetHeight(opts, IMAGE_HEIGHT_SMALL);
    OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_NV21);
    OH_PixelmapNative *pixelmap = nullptr;
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(opts, &pixelmap);
    OH_PixelmapInitializationOptions_Release(opts);
    if (errCode != IMAGE_SUCCESS || pixelmap == nullptr) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtUnsupConv CreateEmptyPixelmap failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    uint8_t data[BUFFER_SIZE_400] = {0};
    errCode = OH_PixelmapNative_WritePixelsWithPixelFormat(pixelmap, data, BUFFER_SIZE_400,
        PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapNative_Destroy(&pixelmap);
    OH_LOG_INFO(LOG_APP, "WPxFmtUnsupConv result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsWithFmtInsufficientBuffer
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtInsufficientBuffer_1000
 * @tc.desc   test OH_PixelmapNative_WritePixelsWithPixelFormat with bufferSize 1, verify IMAGE_BAD_PARAMETER
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtInsufficientBuffer(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_2;
    napi_value argv[NUM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtInsufBuf ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_1], &data, &len);
    errCode = OH_PixelmapNative_WritePixelsWithPixelFormat(pixelmap, (const uint8_t*)data, NUM_1,
        PIXEL_FORMAT_RGBA_8888);
    OH_LOG_INFO(LOG_APP, "WPxFmtInsufBuf result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsWithFmtAllocFailed
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtAllocFailed_1100
 * @tc.desc   verify IMAGE_ALLOC_FAILED error code constant is accessible and value correct
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtAllocFailed(napi_env env, napi_callback_info info)
{
    const int32_t expectedErrorCode = EXPECTED_ALLOC_FAILED_CODE;
    if (IMAGE_ALLOC_FAILED != expectedErrorCode) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtAllocFailed IMAGE_ALLOC_FAILED mismatch, expected: %{public}d.",
            expectedErrorCode);
        return getJsResult(env, IMAGE_UNKNOWN_ERROR);
    }
    OH_LOG_INFO(LOG_APP, "WPxFmtAllocFailed IMAGE_ALLOC_FAILED verified: %{public}d.", expectedErrorCode);
    return getJsResult(env, IMAGE_SUCCESS);
}

/**
 * @tc.name   testWritePixelsWithFmtCopyFailed
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtCopyFailed_1200
 * @tc.desc   verify IMAGE_COPY_FAILED error code constant is accessible and value correct
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtCopyFailed(napi_env env, napi_callback_info info)
{
    const int32_t expectedErrorCode = EXPECTED_COPY_FAILED_CODE;
    if (IMAGE_COPY_FAILED != expectedErrorCode) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtCopyFailed IMAGE_COPY_FAILED mismatch, expected: %{public}d.",
            expectedErrorCode);
        return getJsResult(env, IMAGE_UNKNOWN_ERROR);
    }
    OH_LOG_INFO(LOG_APP, "WPxFmtCopyFailed IMAGE_COPY_FAILED verified: %{public}d.", expectedErrorCode);
    return getJsResult(env, IMAGE_SUCCESS);
}

/**
 * @tc.name   testWritePixelsWithFmtByFormat
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtByFormat_1300
 * @tc.desc   test OH_PixelmapNative_WritePixelsWithPixelFormat enumerate all PIXEL_FORMAT values, verify each result
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsWithFmtByFormat(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_1;
    napi_value argv[NUM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t format = 0;
    napi_get_value_int32(env, argv[NUM_0], &format);
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&opts);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtByFmt CreateOpts failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_PixelmapInitializationOptions_SetWidth(opts, IMAGE_WIDTH_SMALL);
    OH_PixelmapInitializationOptions_SetHeight(opts, IMAGE_HEIGHT_SMALL);
    OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapNative *pixelmap = nullptr;
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(opts, &pixelmap);
    OH_PixelmapInitializationOptions_Release(opts);
    if (errCode != IMAGE_SUCCESS || pixelmap == nullptr) {
        OH_LOG_ERROR(LOG_APP, "WPxFmtByFmt CreateEmptyPixelmap failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    uint8_t data[BUFFER_SIZE_800] = {0};
    errCode = OH_PixelmapNative_WritePixelsWithPixelFormat(pixelmap, data, BUFFER_SIZE_800,
        static_cast<PIXEL_FORMAT>(format));
    OH_PixelmapNative_Destroy(&pixelmap);
    OH_LOG_INFO(LOG_APP, "WPxFmtByFmt format: %{public}d result errCode: %{public}d.", format, errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtRGBA8888
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtRGBA8888_0100
 * @tc.desc   test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with RGBA_8888, verify IMAGE_SUCCESS
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtRGBA8888(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_6;
    napi_value argv[NUM_6] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtRGBA8888 ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    int32_t x = 0;
    int32_t y = 0;
    int32_t w = 0;
    int32_t h = 0;
    napi_get_value_int32(env, argv[NUM_1], &x);
    napi_get_value_int32(env, argv[NUM_2], &y);
    napi_get_value_int32(env, argv[NUM_3], &w);
    napi_get_value_int32(env, argv[NUM_4], &h);
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_5], &data, &len);
    Image_PositionArea area = {(uint8_t*)data, (size_t)len, AREA_OFFSET_ZERO, (uint32_t)(w * NUM_4),
        {(uint32_t)x, (uint32_t)y, (uint32_t)w, (uint32_t)h}};
    errCode = OH_PixelmapNative_WritePixelsToAreaWithPixelFormat(pixelmap, &area, PIXEL_FORMAT_RGBA_8888);
    OH_LOG_INFO(LOG_APP, "WPAFmtRGBA8888 result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtRGB888
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtRGB888_0200
 * @tc.desc   test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with RGB_888, verify IMAGE_SUCCESS
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtRGB888(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_6;
    napi_value argv[NUM_6] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtRGB888 ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    int32_t x = 0;
    int32_t y = 0;
    int32_t w = 0;
    int32_t h = 0;
    napi_get_value_int32(env, argv[NUM_1], &x);
    napi_get_value_int32(env, argv[NUM_2], &y);
    napi_get_value_int32(env, argv[NUM_3], &w);
    napi_get_value_int32(env, argv[NUM_4], &h);
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_5], &data, &len);
    const uint32_t rgb888BytesPerPixel = NUM_4 - NUM_1;
    Image_PositionArea area = {(uint8_t*)data, (size_t)len, AREA_OFFSET_ZERO, (uint32_t)(w * rgb888BytesPerPixel),
        {(uint32_t)x, (uint32_t)y, (uint32_t)w, (uint32_t)h}};
    errCode = OH_PixelmapNative_WritePixelsToAreaWithPixelFormat(pixelmap, &area, PIXEL_FORMAT_RGB_888);
    OH_LOG_INFO(LOG_APP, "WPAFmtRGB888 result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtRGB565
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtRGB565_0300
 * @tc.desc   test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with RGB_565, verify IMAGE_SUCCESS
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtRGB565(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_6;
    napi_value argv[NUM_6] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtRGB565 ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    int32_t x = 0;
    int32_t y = 0;
    int32_t w = 0;
    int32_t h = 0;
    napi_get_value_int32(env, argv[NUM_1], &x);
    napi_get_value_int32(env, argv[NUM_2], &y);
    napi_get_value_int32(env, argv[NUM_3], &w);
    napi_get_value_int32(env, argv[NUM_4], &h);
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_5], &data, &len);
    const uint32_t rgb565BytesPerPixel = NUM_2;
    Image_PositionArea area = {(uint8_t*)data, (size_t)len, AREA_OFFSET_ZERO, (uint32_t)(w * rgb565BytesPerPixel),
        {(uint32_t)x, (uint32_t)y, (uint32_t)w, (uint32_t)h}};
    errCode = OH_PixelmapNative_WritePixelsToAreaWithPixelFormat(pixelmap, &area, PIXEL_FORMAT_RGB_565);
    OH_LOG_INFO(LOG_APP, "WPAFmtRGB565 result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtRGBAF16
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtRGBAF16_0400
 * @tc.desc   test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with RGBA_F16, verify IMAGE_SUCCESS
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtRGBAF16(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_6;
    napi_value argv[NUM_6] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtRGBAF16 ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    int32_t x = 0;
    int32_t y = 0;
    int32_t w = 0;
    int32_t h = 0;
    napi_get_value_int32(env, argv[NUM_1], &x);
    napi_get_value_int32(env, argv[NUM_2], &y);
    napi_get_value_int32(env, argv[NUM_3], &w);
    napi_get_value_int32(env, argv[NUM_4], &h);
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_5], &data, &len);
    const uint32_t rgbaf16BytesPerPixel = NUM_4 * NUM_2;
    Image_PositionArea area = {(uint8_t*)data, (size_t)len, AREA_OFFSET_ZERO,
        (uint32_t)(w * rgbaf16BytesPerPixel),
        {(uint32_t)x, (uint32_t)y, (uint32_t)w, (uint32_t)h}};
    errCode = OH_PixelmapNative_WritePixelsToAreaWithPixelFormat(pixelmap, &area, PIXEL_FORMAT_RGBA_F16);
    OH_LOG_INFO(LOG_APP, "WPAFmtRGBAF16 result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtNullPixelmap
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtNullPixelmap_0500
 * @tc.desc   test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with null pixelmap, verify IMAGE_BAD_PARAMETER
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtNullPixelmap(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_6;
    napi_value argv[NUM_6] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t x = 0;
    int32_t y = 0;
    int32_t w = 0;
    int32_t h = 0;
    napi_get_value_int32(env, argv[NUM_1], &x);
    napi_get_value_int32(env, argv[NUM_2], &y);
    napi_get_value_int32(env, argv[NUM_3], &w);
    napi_get_value_int32(env, argv[NUM_4], &h);
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_5], &data, &len);
    Image_PositionArea area = {(uint8_t*)data, (size_t)len, AREA_OFFSET_ZERO, (uint32_t)(w * NUM_4),
        {(uint32_t)x, (uint32_t)y, (uint32_t)w, (uint32_t)h}};
    Image_ErrorCode errCode = OH_PixelmapNative_WritePixelsToAreaWithPixelFormat(
        nullptr, &area, PIXEL_FORMAT_RGBA_8888);
    OH_LOG_INFO(LOG_APP, "WPAFmtNullPm result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtNullArea
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtNullArea_0600
 * @tc.desc   test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with null area, verify IMAGE_BAD_PARAMETER
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtNullArea(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_1;
    napi_value argv[NUM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtNullArea ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    errCode = OH_PixelmapNative_WritePixelsToAreaWithPixelFormat(pixelmap, nullptr, PIXEL_FORMAT_RGBA_8888);
    OH_LOG_INFO(LOG_APP, "WPAFmtNullArea result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtUnsupportedFmt
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtUnsupportedFmt_0700
 * @tc.desc   test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with unsupported NV21 format, verify error code
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtUnsupportedFmt(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_6;
    napi_value argv[NUM_6] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtUnsupFmt ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    int32_t x = 0;
    int32_t y = 0;
    int32_t w = 0;
    int32_t h = 0;
    napi_get_value_int32(env, argv[NUM_1], &x);
    napi_get_value_int32(env, argv[NUM_2], &y);
    napi_get_value_int32(env, argv[NUM_3], &w);
    napi_get_value_int32(env, argv[NUM_4], &h);
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_5], &data, &len);
    Image_PositionArea area = {(uint8_t*)data, (size_t)len, AREA_OFFSET_ZERO, (uint32_t)(w * NUM_4),
        {(uint32_t)x, (uint32_t)y, (uint32_t)w, (uint32_t)h}};
    errCode = OH_PixelmapNative_WritePixelsToAreaWithPixelFormat(pixelmap, &area, PIXEL_FORMAT_NV21);
    OH_LOG_INFO(LOG_APP, "WPAFmtUnsupFmt result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtLocked
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtLocked_0800
 * @tc.desc   test WritePixelsToAreaWithPixelFormat on locked pixelmap, verify UNSUPPORTED_OPERATION
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtLocked(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_6;
    napi_value argv[NUM_6] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtLocked ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    int32_t x = 0;
    int32_t y = 0;
    int32_t w = 0;
    int32_t h = 0;
    napi_get_value_int32(env, argv[NUM_1], &x);
    napi_get_value_int32(env, argv[NUM_2], &y);
    napi_get_value_int32(env, argv[NUM_3], &w);
    napi_get_value_int32(env, argv[NUM_4], &h);
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_5], &data, &len);
    Image_PositionArea area = {(uint8_t*)data, (size_t)len, AREA_OFFSET_ZERO, (uint32_t)(w * NUM_4),
        {(uint32_t)x, (uint32_t)y, (uint32_t)w, (uint32_t)h}};
    void* addr = nullptr;
    errCode = OH_PixelmapNative_AccessPixels(pixelmap, &addr);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtLocked AccessPixels failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    errCode = OH_PixelmapNative_WritePixelsToAreaWithPixelFormat(pixelmap, &area, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapNative_UnaccessPixels(pixelmap);
    OH_LOG_INFO(LOG_APP, "WPAFmtLocked result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtUnsupportedConversion
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtUnsupportedConversion_0900
 * @tc.desc   test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat NV21 pixelmap with RGBA_8888, verify error code
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtUnsupportedConversion(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&opts);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtUnsupConv CreateOpts failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_PixelmapInitializationOptions_SetWidth(opts, IMAGE_WIDTH_SMALL);
    OH_PixelmapInitializationOptions_SetHeight(opts, IMAGE_HEIGHT_SMALL);
    OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_NV21);
    OH_PixelmapNative *pixelmap = nullptr;
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(opts, &pixelmap);
    OH_PixelmapInitializationOptions_Release(opts);
    if (errCode != IMAGE_SUCCESS || pixelmap == nullptr) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtUnsupConv CreateEmptyPixelmap failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    uint8_t data[BUFFER_SIZE_400] = {0};
    Image_PositionArea area = {data, BUFFER_SIZE_400, AREA_OFFSET_ZERO, AREA_ROW_STRIDE_40,
        {AREA_OFFSET_ZERO, AREA_OFFSET_ZERO, AREA_SIZE_5, AREA_SIZE_5}};
    errCode = OH_PixelmapNative_WritePixelsToAreaWithPixelFormat(pixelmap, &area, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapNative_Destroy(&pixelmap);
    OH_LOG_INFO(LOG_APP, "WPAFmtUnsupConv result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtInsufficientBuffer
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtInsufficientBuffer_1000
 * @tc.desc   test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with buffer size 1, verify IMAGE_BAD_PARAMETER
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtInsufficientBuffer(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_6;
    napi_value argv[NUM_6] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[NUM_0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtInsufBuf ConvertFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    int32_t x = 0;
    int32_t y = 0;
    int32_t w = 0;
    int32_t h = 0;
    napi_get_value_int32(env, argv[NUM_1], &x);
    napi_get_value_int32(env, argv[NUM_2], &y);
    napi_get_value_int32(env, argv[NUM_3], &w);
    napi_get_value_int32(env, argv[NUM_4], &h);
    void* data = nullptr;
    size_t len = 0;
    napi_get_arraybuffer_info(env, argv[NUM_5], &data, &len);
    Image_PositionArea area = {(uint8_t*)data, NUM_1, AREA_OFFSET_ZERO, (uint32_t)(w * NUM_4),
        {(uint32_t)x, (uint32_t)y, (uint32_t)w, (uint32_t)h}};
    errCode = OH_PixelmapNative_WritePixelsToAreaWithPixelFormat(pixelmap, &area, PIXEL_FORMAT_RGBA_8888);
    OH_LOG_INFO(LOG_APP, "WPAFmtInsufBuf result errCode: %{public}d.", errCode);
    return getJsResult(env, errCode);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtAllocFailed
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtAllocFailed_1100
 * @tc.desc   verify IMAGE_ALLOC_FAILED error code constant is accessible and value correct
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtAllocFailed(napi_env env, napi_callback_info info)
{
    const int32_t expectedErrorCode = EXPECTED_ALLOC_FAILED_CODE;
    if (IMAGE_ALLOC_FAILED != expectedErrorCode) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtAllocFailed IMAGE_ALLOC_FAILED mismatch, expected: %{public}d.",
            expectedErrorCode);
        return getJsResult(env, IMAGE_UNKNOWN_ERROR);
    }
    OH_LOG_INFO(LOG_APP, "WPAFmtAllocFailed IMAGE_ALLOC_FAILED verified: %{public}d.", expectedErrorCode);
    return getJsResult(env, IMAGE_SUCCESS);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtCopyFailed
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtCopyFailed_1200
 * @tc.desc   verify IMAGE_COPY_FAILED error code constant is accessible and value correct
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtCopyFailed(napi_env env, napi_callback_info info)
{
    const int32_t expectedErrorCode = EXPECTED_COPY_FAILED_CODE;
    if (IMAGE_COPY_FAILED != expectedErrorCode) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtCopyFailed IMAGE_COPY_FAILED mismatch, expected: %{public}d.",
            expectedErrorCode);
        return getJsResult(env, IMAGE_UNKNOWN_ERROR);
    }
    OH_LOG_INFO(LOG_APP, "WPAFmtCopyFailed IMAGE_COPY_FAILED verified: %{public}d.", expectedErrorCode);
    return getJsResult(env, IMAGE_SUCCESS);
}

/**
 * @tc.name   testWritePixelsToAreaWithFmtByFormat
 * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtByFormat_1300
 * @tc.desc   test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat enumerate all PIXEL_FORMAT values, verify each
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value TestWritePixelsToAreaWithFmtByFormat(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_1;
    napi_value argv[NUM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t format = 0;
    napi_get_value_int32(env, argv[NUM_0], &format);
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&opts);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtByFmt CreateOpts failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_PixelmapInitializationOptions_SetWidth(opts, IMAGE_WIDTH_SMALL);
    OH_PixelmapInitializationOptions_SetHeight(opts, IMAGE_HEIGHT_SMALL);
    OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapNative *pixelmap = nullptr;
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(opts, &pixelmap);
    OH_PixelmapInitializationOptions_Release(opts);
    if (errCode != IMAGE_SUCCESS || pixelmap == nullptr) {
        OH_LOG_ERROR(LOG_APP, "WPAFmtByFmt CreateEmptyPixelmap failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    uint8_t data[BUFFER_SIZE_800] = {0};
    Image_PositionArea area = {data, BUFFER_SIZE_800, AREA_OFFSET_ZERO, AREA_ROW_STRIDE_80,
        {AREA_OFFSET_ZERO, AREA_OFFSET_ZERO, AREA_SIZE_5, AREA_SIZE_5}};
    errCode = OH_PixelmapNative_WritePixelsToAreaWithPixelFormat(pixelmap, &area,
        static_cast<PIXEL_FORMAT>(format));
    OH_PixelmapNative_Destroy(&pixelmap);
    OH_LOG_INFO(LOG_APP, "WPAFmtByFmt format: %{public}d result errCode: %{public}d.", format, errCode);
    return getJsResult(env, errCode);
}

napi_value TestNativeApplyCropNormal(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&opts);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    const uint32_t width = NUM_10;
    const uint32_t height = NUM_10;
    OH_PixelmapInitializationOptions_SetWidth(opts, width);
    OH_PixelmapInitializationOptions_SetHeight(opts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_RGBA_8888);

    OH_PixelmapNative *pixelmap = nullptr;
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(opts, &pixelmap);
    OH_PixelmapInitializationOptions_Release(opts);
    if (errCode != IMAGE_SUCCESS || pixelmap == nullptr) {
        return getJsResult(env, errCode);
    }

    const uint32_t regionX = NUM_2;
    const uint32_t regionY = NUM_2;
    const uint32_t regionWidth = NUM_5;
    const uint32_t regionHeight = NUM_5;
    Image_Region region = {regionX, regionY, regionWidth, regionHeight};
    errCode = OH_PixelmapNative_ApplyCrop(pixelmap, &region);

    OH_PixelmapNative_Destroy(&pixelmap);
    pixelmap = nullptr;

    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeApplyCropNormal success.");
    return getJsResult(env, errCode);
}

napi_value TestNativeApplyCropAfterRelease(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&opts);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    const uint32_t width = NUM_10;
    const uint32_t height = NUM_10;
    OH_PixelmapInitializationOptions_SetWidth(opts, width);
    OH_PixelmapInitializationOptions_SetHeight(opts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_RGBA_8888);

    OH_PixelmapNative *pixelmap = nullptr;
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(opts, &pixelmap);
    OH_PixelmapInitializationOptions_Release(opts);
    if (errCode != IMAGE_SUCCESS || pixelmap == nullptr) {
        return getJsResult(env, errCode);
    }

    OH_PixelmapNative_Release(pixelmap);

    const uint32_t regionX = NUM_0;
    const uint32_t regionY = NUM_0;
    const uint32_t regionWidth = NUM_5;
    const uint32_t regionHeight = NUM_5;
    Image_Region region = {regionX, regionY, regionWidth, regionHeight};
    errCode = OH_PixelmapNative_ApplyCrop(pixelmap, &region);
    OH_PixelmapNative_Destroy(&pixelmap);
    pixelmap = nullptr;

    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeApplyCropAfterRelease success.");
    return getJsResult(env, errCode);
}

napi_value TestNativeApplyCropInvalidRegion(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&opts);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    const uint32_t width = NUM_10;
    const uint32_t height = NUM_10;
    OH_PixelmapInitializationOptions_SetWidth(opts, width);
    OH_PixelmapInitializationOptions_SetHeight(opts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_RGBA_8888);

    OH_PixelmapNative *pixelmap = nullptr;
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(opts, &pixelmap);
    OH_PixelmapInitializationOptions_Release(opts);
    opts = nullptr;
    if (errCode != IMAGE_SUCCESS || pixelmap == nullptr) {
        return getJsResult(env, errCode);
    }

    const uint32_t regionX = 100;
    const uint32_t regionY = 100;
    const uint32_t regionWidth = 50;
    const uint32_t regionHeight = 50;
    Image_Region region = {regionX, regionY, regionWidth, regionHeight};
    errCode = OH_PixelmapNative_ApplyCrop(pixelmap, &region);

    OH_PixelmapNative_Destroy(&pixelmap);
    pixelmap = nullptr;

    if (errCode != IMAGE_INVALID_REGION) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ApplyCrop invalid region failed, errCode: %{public}d.", errCode);
    } else {
        OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeApplyCropInvalidRegion success.");
    }
    return getJsResult(env, errCode);
}

napi_value TestNativeConvertAlphaTypeNormal(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *srcOpts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&srcOpts);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    const uint32_t width = NUM_10;
    const uint32_t height = NUM_10;
    OH_PixelmapInitializationOptions_SetWidth(srcOpts, width);
    OH_PixelmapInitializationOptions_SetHeight(srcOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(srcOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(srcOpts, PIXELMAP_ALPHA_TYPE_PREMULTIPLIED);

    OH_PixelmapNative *srcPixelmap = nullptr;
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(srcOpts, &srcPixelmap);
    OH_PixelmapInitializationOptions_Release(srcOpts);
    if (errCode != IMAGE_SUCCESS || srcPixelmap == nullptr) {
        return getJsResult(env, errCode);
    }

    OH_Pixelmap_InitializationOptions *dstOpts = nullptr;
    errCode = OH_PixelmapInitializationOptions_Create(&dstOpts);
    if (errCode != IMAGE_SUCCESS) {
        OH_PixelmapNative_Destroy(&srcPixelmap);
        return getJsResult(env, errCode);
    }
    OH_PixelmapInitializationOptions_SetWidth(dstOpts, width);
    OH_PixelmapInitializationOptions_SetHeight(dstOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(dstOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(dstOpts, PIXELMAP_ALPHA_TYPE_UNPREMULTIPLIED);

    OH_PixelmapNative *dstPixelmap = nullptr;
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(dstOpts, &dstPixelmap);
    OH_PixelmapInitializationOptions_Release(dstOpts);
    if (errCode != IMAGE_SUCCESS || dstPixelmap == nullptr) {
        OH_PixelmapNative_Destroy(&srcPixelmap);
        return getJsResult(env, errCode);
    }

    const bool toPremul = false;
    errCode = OH_PixelmapNative_ConvertAlphaType(srcPixelmap, dstPixelmap, toPremul);

    OH_PixelmapNative_Destroy(&srcPixelmap);
    srcPixelmap = nullptr;
    OH_PixelmapNative_Destroy(&dstPixelmap);
    dstPixelmap = nullptr;

    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeConvertAlphaTypeNormal success.");
    return getJsResult(env, errCode);
}

napi_value TestNativeConvertAlphaTypeAfterRelease(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *srcOpts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&srcOpts);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    const uint32_t width = NUM_10;
    const uint32_t height = NUM_10;
    OH_PixelmapInitializationOptions_SetWidth(srcOpts, width);
    OH_PixelmapInitializationOptions_SetHeight(srcOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(srcOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(srcOpts, PIXELMAP_ALPHA_TYPE_PREMULTIPLIED);

    OH_PixelmapNative *srcPixelmap = nullptr;
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(srcOpts, &srcPixelmap);
    OH_PixelmapInitializationOptions_Release(srcOpts);
    if (errCode != IMAGE_SUCCESS || srcPixelmap == nullptr) {
        return getJsResult(env, errCode);
    }

    OH_Pixelmap_InitializationOptions *dstOpts = nullptr;
    errCode = OH_PixelmapInitializationOptions_Create(&dstOpts);
    if (errCode != IMAGE_SUCCESS) {
        OH_PixelmapNative_Destroy(&srcPixelmap);
        return getJsResult(env, errCode);
    }
    OH_PixelmapInitializationOptions_SetWidth(dstOpts, width);
    OH_PixelmapInitializationOptions_SetHeight(dstOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(dstOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(dstOpts, PIXELMAP_ALPHA_TYPE_UNPREMULTIPLIED);

    OH_PixelmapNative *dstPixelmap = nullptr;
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(dstOpts, &dstPixelmap);
    OH_PixelmapInitializationOptions_Release(dstOpts);
    if (errCode != IMAGE_SUCCESS || dstPixelmap == nullptr) {
        OH_PixelmapNative_Destroy(&srcPixelmap);
        return getJsResult(env, errCode);
    }

    OH_PixelmapNative_Release(srcPixelmap);

    const bool toPremul = false;
    errCode = OH_PixelmapNative_ConvertAlphaType(srcPixelmap, dstPixelmap, toPremul);
    OH_PixelmapNative_Destroy(&srcPixelmap);
    srcPixelmap = nullptr;
    OH_PixelmapNative_Destroy(&dstPixelmap);
    dstPixelmap = nullptr;

    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeConvertAlphaTypeAfterRelease success.");
    return getJsResult(env, errCode);
}

napi_value TestNativeApplyScaleWithAntiAliasingAbnormal(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    float scaleX = 1.5f;
    float scaleY = 1.5f;
    Image_ErrorCode errCode = OH_PixelmapNative_ApplyScaleWithAntiAliasing(pixelmap, scaleX, scaleY,
        OH_PixelmapNative_AntiAliasing_HIGH);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ApplyScaleWithAntiAliasing failed, errCode: %{public}d.", errCode);
    }
    return getJsResult(env, errCode);
}

napi_value TestNativeApplyTranslateAbnormal(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    float x = 10.0f;
    float y = 10.0f;
    Image_ErrorCode errCode = OH_PixelmapNative_ApplyTranslate(pixelmap, x, y);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ApplyTranslate failed, errCode: %{public}d.", errCode);
    }
    return getJsResult(env, errCode);
}

napi_value TestNativeApplyRotateAbnormal(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    float angle = 45.0f;
    Image_ErrorCode errCode = OH_PixelmapNative_ApplyRotate(pixelmap, angle);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ApplyRotate failed, errCode: %{public}d.", errCode);
    }
    return getJsResult(env, errCode);
}

napi_value TestNativeApplyFlipAbnormal(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    bool flipH = true;
    bool flipV = false;
    Image_ErrorCode errCode = OH_PixelmapNative_ApplyFlip(pixelmap, flipH, flipV);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ApplyFlip failed, errCode: %{public}d.", errCode);
    }
    return getJsResult(env, errCode);
}

napi_value TestNativeApplyCropAbnormal(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    uint32_t regionX = 0;
    uint32_t regionY = 0;
    uint32_t regionWidth = 10;
    uint32_t regionHeight = 10;
    Image_Region region = {regionX, regionY, regionWidth, regionHeight};
    Image_ErrorCode errCode = OH_PixelmapNative_ApplyCrop(pixelmap, &region);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ApplyCrop failed, errCode: %{public}d.", errCode);
    }
    return getJsResult(env, errCode);
}

napi_value TestNativeApplyCropNullRegion(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr) != napi_ok) {
        OH_LOG_ERROR(LOG_APP, "napi_get_cb_info failed.");
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ConvertPixelmapNativeFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }

    errCode = OH_PixelmapNative_ApplyCrop(pixelmap, nullptr);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ApplyCrop null region failed, errCode: %{public}d.", errCode);
        OH_PixelmapNative_Destroy(&pixelmap);
        pixelmap = nullptr;
        return getJsResult(env, errCode);
    }

    OH_PixelmapNative_Destroy(&pixelmap);
    pixelmap = nullptr;

    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeApplyCropNullRegion success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

napi_value TestNativeApplyCropBothNull(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_PixelmapNative_ApplyCrop(nullptr, nullptr);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ApplyCrop both null failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeApplyCropBothNull success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

napi_value TestNativeApplyRotateInvalidAngle(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr) != napi_ok) {
        OH_LOG_ERROR(LOG_APP, "napi_get_cb_info failed.");
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[0], &pixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ConvertPixelmapNativeFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }

    double angleVal;
    napi_get_value_double(env, argv[1], &angleVal);

    errCode = OH_PixelmapNative_ApplyRotate(pixelmap, static_cast<float>(angleVal));
    if (errCode != IMAGE_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ApplyRotate invalid angle failed, errCode: %{public}d.", errCode);
        OH_PixelmapNative_Destroy(&pixelmap);
        pixelmap = nullptr;
        return getJsResult(env, errCode);
    }

    OH_PixelmapNative_Destroy(&pixelmap);
    pixelmap = nullptr;

    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeApplyRotateInvalidAngle success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

napi_value TestNativeConvertAlphaTypeAbnormal(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *srcPixelmap = nullptr;
    OH_PixelmapNative *dstPixelmap = nullptr;
    bool toPremul = true;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertAlphaType(srcPixelmap, dstPixelmap, toPremul);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ConvertAlphaType failed, errCode: %{public}d.", errCode);
    }
    return getJsResult(env, errCode);
}

static Image_ErrorCode CreatePixelmapsForAlphaTypeTest(OH_PixelmapNative **srcPixelmap,
    OH_PixelmapNative **dstPixelmap, PIXEL_FORMAT format)
{
    const uint32_t width = NUM_10;
    const uint32_t height = NUM_10;
    OH_Pixelmap_InitializationOptions *srcOpts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&srcOpts);
    if (errCode != IMAGE_SUCCESS) {
        return errCode;
    }
    OH_PixelmapInitializationOptions_SetWidth(srcOpts, width);
    OH_PixelmapInitializationOptions_SetHeight(srcOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(srcOpts, format);
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(srcOpts, srcPixelmap);
    OH_PixelmapInitializationOptions_Release(srcOpts);
    if (errCode != IMAGE_SUCCESS || *srcPixelmap == nullptr) {
        return errCode;
    }

    OH_Pixelmap_InitializationOptions *dstOpts = nullptr;
    errCode = OH_PixelmapInitializationOptions_Create(&dstOpts);
    if (errCode != IMAGE_SUCCESS) {
        OH_PixelmapNative_Destroy(srcPixelmap);
        return errCode;
    }
    OH_PixelmapInitializationOptions_SetWidth(dstOpts, width);
    OH_PixelmapInitializationOptions_SetHeight(dstOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(dstOpts, format);
    errCode = OH_PixelmapNative_CreateEmptyPixelmap(dstOpts, dstPixelmap);
    OH_PixelmapInitializationOptions_Release(dstOpts);
    if (errCode != IMAGE_SUCCESS || *dstPixelmap == nullptr) {
        OH_PixelmapNative_Destroy(srcPixelmap);
    }
    return errCode;
}

napi_value TestNativeConvertAlphaTypeUnsupportedDataFormat(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *srcPixelmap = nullptr;
    OH_PixelmapNative *dstPixelmap = nullptr;
    Image_ErrorCode errCode = CreatePixelmapsForAlphaTypeTest(&srcPixelmap, &dstPixelmap, PIXEL_FORMAT_RGBA_F16);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Create pixelmaps failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }

    const bool toPremul = false;
    errCode = OH_PixelmapNative_ConvertAlphaType(srcPixelmap, dstPixelmap, toPremul);

    OH_PixelmapNative_Destroy(&srcPixelmap);
    srcPixelmap = nullptr;
    OH_PixelmapNative_Destroy(&dstPixelmap);
    dstPixelmap = nullptr;

    if (errCode != IMAGE_UNSUPPORTED_DATA_FORMAT) {
        OH_LOG_ERROR(LOG_APP,
            "OH_PixelmapNative_ConvertAlphaType unsupported format failed, expected: %{public}d.",
            IMAGE_UNSUPPORTED_DATA_FORMAT);
    } else {
        OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeConvertAlphaTypeUnsupportedDataFormat success.");
    }
    return getJsResult(env, errCode);
}

napi_value TestNativeConvertAlphaTypeNullSrc(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr) != napi_ok) {
        OH_LOG_ERROR(LOG_APP, "napi_get_cb_info failed.");
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    OH_PixelmapNative* dstPixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[0], &dstPixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ConvertPixelmapNativeFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }

    errCode = OH_PixelmapNative_ConvertAlphaType(nullptr, dstPixelmap, true);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ConvertAlphaType null src failed, errCode: %{public}d.", errCode);
        OH_PixelmapNative_Destroy(&dstPixelmap);
        dstPixelmap = nullptr;
        return getJsResult(env, errCode);
    }

    OH_PixelmapNative_Destroy(&dstPixelmap);
    dstPixelmap = nullptr;

    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeConvertAlphaTypeNullSrc success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

napi_value TestNativeConvertAlphaTypeNullDst(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr) != napi_ok) {
        OH_LOG_ERROR(LOG_APP, "napi_get_cb_info failed.");
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    OH_PixelmapNative* srcPixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, argv[0], &srcPixelmap);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ConvertPixelmapNativeFromNapi failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }

    errCode = OH_PixelmapNative_ConvertAlphaType(srcPixelmap, nullptr, true);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ConvertAlphaType null dst failed, errCode: %{public}d.", errCode);
        OH_PixelmapNative_Destroy(&srcPixelmap);
        srcPixelmap = nullptr;
        return getJsResult(env, errCode);
    }

    OH_PixelmapNative_Destroy(&srcPixelmap);
    srcPixelmap = nullptr;

    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeConvertAlphaTypeNullDst success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

napi_value TestNativeImageDataConversionFailedErrorCode(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeImageDataConversionFailedErrorCode start.");
    const int32_t expectedErrorCode = 7600306;
    if (IMAGE_DATA_CONVERSION_FAILED != expectedErrorCode) {
        OH_LOG_ERROR(LOG_APP,
            "IMAGE_DATA_CONVERSION_FAILED value mismatch, expected: %{public}d, actual: %{public}d.",
            expectedErrorCode, IMAGE_DATA_CONVERSION_FAILED);
        return getJsResult(env, IMAGE_UNKNOWN_ERROR);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeImageDataConversionFailedErrorCode success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static void setInt32NamedProperty(napi_env env, napi_value object, const char *utf8name, uint32_t value)
{
    napi_value tmp;
    napi_create_int32(env, value, &tmp);
    napi_set_named_property(env, object, utf8name, tmp);
}

napi_value TestGetAlphaTypeNullPtr(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&ops);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    errCode = OH_PixelmapInitializationOptions_GetAlphaType(ops, nullptr);
    int32_t ret = (errCode == IMAGE_BAD_PARAMETER) ? IMAGE_SUCCESS : IMAGE_UNKNOWN_ERROR;
    OH_PixelmapInitializationOptions_Release(ops);
    return getJsResult(env, ret);
}

napi_value TestImageInfoGetWidthNullPtr(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    Image_ErrorCode errCode = OH_PixelmapImageInfo_Create(&imageInfo);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    errCode = OH_PixelmapImageInfo_GetWidth(imageInfo, nullptr);
    int32_t ret = (errCode == IMAGE_BAD_PARAMETER) ? IMAGE_SUCCESS : IMAGE_UNKNOWN_ERROR;
    OH_PixelmapImageInfo_Release(imageInfo);
    return getJsResult(env, ret);
}

napi_value TestImageInfoGetHeightNullPtr(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    Image_ErrorCode errCode = OH_PixelmapImageInfo_Create(&imageInfo);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    errCode = OH_PixelmapImageInfo_GetHeight(imageInfo, nullptr);
    int32_t ret = (errCode == IMAGE_BAD_PARAMETER) ? IMAGE_SUCCESS : IMAGE_UNKNOWN_ERROR;
    OH_PixelmapImageInfo_Release(imageInfo);
    return getJsResult(env, ret);
}
