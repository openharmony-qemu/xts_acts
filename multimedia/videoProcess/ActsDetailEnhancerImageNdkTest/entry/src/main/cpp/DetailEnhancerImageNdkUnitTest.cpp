/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/video_processing_engine/image_processing.h>
#include <multimedia/video_processing_engine/image_processing_types.h>
#include <native_buffer/buffer_common.h>
#include <native_buffer/native_buffer.h>
#include <unistd.h>
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Media {
namespace VideoProcessingEngine {

namespace {
constexpr int SUCCESS_CODE = 0;
}

const ImageProcessing_ColorSpaceInfo param_srgb = {
    0,
    OH_COLORSPACE_SRGB_FULL,
    NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
};

const ImageProcessing_ColorSpaceInfo param_p3 = {
    0,
    OH_COLORSPACE_P3_FULL,
    NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
};

const ImageProcessing_ColorSpaceInfo param_bt709 = {
    0,
    OH_COLORSPACE_BT709_FULL,
    NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
};

const ImageProcessing_ColorSpaceInfo param_not_support = {
    0,
    OH_COLORSPACE_BT601_EBU_FULL,
    NATIVEBUFFER_PIXEL_FMT_BGRX_8888,
};

const ImageProcessing_ColorSpaceInfo param5 = {
    0,
    OH_COLORSPACE_BT2020_PQ_LIMIT,
    NATIVEBUFFER_PIXEL_FMT_RGBA_1010102,
};

void CreateEmptyPixelmap(OH_PixelmapNative** pixelMap, int32_t width, int32_t height, int format)
{
    OH_Pixelmap_InitializationOptions* options = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&options);
    (void)OH_PixelmapInitializationOptions_SetWidth(options, width);
    (void)OH_PixelmapInitializationOptions_SetHeight(options, height);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(options, format);
    (void)OH_PixelmapNative_CreateEmptyPixelmap(options, pixelMap);
}

bool IsSupportImageSR()
{
    if (!access("/sys_prod/lib64/VideoProcessingEngine/libdisplay_aipq_imagesr.so", 0) &&
        !access("/sys_prod/etc/VideoProcessingEngine/image_aisr_algo_config.xml", 0) &&
        !access("/sys_prod/etc/VideoProcessingEngine/Image_SR_Model_576x576_20240402.omc", 0)) {
        return true;
    }
    return false;
}

// initialize environment
/**
 * @tc.name   vpeImageNdk_01
 * @tc.number vpeImageNdk_01
 * @tc.desc   vpeImageNdk_01
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_01()
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_InitializeEnvironment();
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// initialize and de-initialize
/**
 * @tc.name   vpeImageNdk_02
 * @tc.number vpeImageNdk_02
 * @tc.desc   vpeImageNdk_02
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_02()
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_InitializeEnvironment();
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    ret = OH_ImageProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// de-initialize without initialize
/**
 * @tc.name   vpeImageNdk_03
 * @tc.number vpeImageNdk_03
 * @tc.desc   vpeImageNdk_03
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_03()
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_DeinitializeEnvironment();
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// create instance
/**
 * @tc.name   vpeImageNdk_04
 * @tc.number vpeImageNdk_04
 * @tc.desc   vpeImageNdk_04
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_04()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// create instance with wrong type
/**
 * @tc.name   vpeImageNdk_05
 * @tc.number vpeImageNdk_05
 * @tc.desc   vpeImageNdk_05
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_05()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance, 11);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// destroy instance
/**
 * @tc.name   vpeImageNdk_06
 * @tc.number vpeImageNdk_06
 * @tc.desc   vpeImageNdk_06
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_06()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Destroy(instance);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}


// destroy null instance
/**
 * @tc.name   vpeImageNdk_07
 * @tc.number vpeImageNdk_07
 * @tc.desc   vpeImageNdk_07
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_07()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Destroy(instance);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// set parameter normally
/**
 * @tc.name   vpeImageNdk_08
 * @tc.number vpeImageNdk_08
 * @tc.desc   vpeImageNdk_08
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_08()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, 10);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// set parameter with null
/**
 * @tc.name   vpeImageNdk_09
 * @tc.number vpeImageNdk_09
 * @tc.desc   vpeImageNdk_09
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_09()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}


// set parameter but instance is null
/**
 * @tc.name   vpeImageNdk_10
 * @tc.number vpeImageNdk_10
 * @tc.desc   vpeImageNdk_10
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_10()
{
    OH_ImageProcessing* instance = nullptr;
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// get parameter after set parameter
/**
 * @tc.name   vpeImageNdk_11
 * @tc.number vpeImageNdk_11
 * @tc.desc   vpeImageNdk_11
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_11()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, IMAGE_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_ImageProcessing_SetParameter(instance, parameter);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// get parameter after set parameter: level none
/**
 * @tc.name   vpeImageNdk_11_2
 * @tc.number vpeImageNdk_11_2
 * @tc.desc   vpeImageNdk_11_2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_11_2()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, IMAGE_DETAIL_ENHANCER_QUALITY_LEVEL_NONE);
    OH_ImageProcessing_SetParameter(instance, parameter);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// get parameter after set parameter: level low
/**
 * @tc.name   vpeImageNdk_11_3
 * @tc.number vpeImageNdk_11_3
 * @tc.desc   vpeImageNdk_11_3
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_11_3()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, IMAGE_DETAIL_ENHANCER_QUALITY_LEVEL_LOW);
    OH_ImageProcessing_SetParameter(instance, parameter);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// get parameter after set parameter: level medium
/**
 * @tc.name   vpeImageNdk_11_4
 * @tc.number vpeImageNdk_11_4
 * @tc.desc   vpeImageNdk_11_4
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_11_4()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, IMAGE_DETAIL_ENHANCER_QUALITY_LEVEL_MEDIUM);
    OH_ImageProcessing_SetParameter(instance, parameter);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// get parameter after set parameter: invalid param
/**
 * @tc.name   vpeImageNdk_11_5
 * @tc.number vpeImageNdk_11_5
 * @tc.desc   vpeImageNdk_11_5
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_11_5()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, -1); // -1 invalid param
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_ERROR_INVALID_PARAMETER);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// get parameter but parameter is null
/**
 * @tc.name   vpeImageNdk_12
 * @tc.number vpeImageNdk_12
 * @tc.desc   vpeImageNdk_12
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_12()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}


// get parameter but instance is null set
/**
 * @tc.name   vpeImageNdk_13
 * @tc.number vpeImageNdk_13
 * @tc.desc   vpeImageNdk_13
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_13()
{
    OH_ImageProcessing* instance = nullptr;
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// get parameter but parameter is not null
/**
 * @tc.name   vpeImageNdk_14
 * @tc.number vpeImageNdk_14
 * @tc.desc   vpeImageNdk_14
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_14()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}


// colorspaceconversion support check 1
/**
 * @tc.name   vpeImageNdk_15
 * @tc.number vpeImageNdk_15
 * @tc.desc   vpeImageNdk_15
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_15()
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_srgb, &param_p3);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// colorspaceconversion support check 2
/**
 * @tc.name   vpeImageNdk_16
 * @tc.number vpeImageNdk_16
 * @tc.desc   vpeImageNdk_16
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_16()
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_p3, &param_bt709);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// colorspaceconversion support check 3
/**
 * @tc.name   vpeImageNdk_17
 * @tc.number vpeImageNdk_17
 * @tc.desc   vpeImageNdk_17
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_17()
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_bt709, &param_not_support);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// colorspaceconversion support check 4
/**
 * @tc.name   vpeImageNdk_18
 * @tc.number vpeImageNdk_18
 * @tc.desc   vpeImageNdk_18
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_18()
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_p3, &param_srgb);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// conposition support check 1
/**
 * @tc.name   vpeImageNdk_19
 * @tc.number vpeImageNdk_19
 * @tc.desc   vpeImageNdk_19
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_19()
{
    bool ret = OH_ImageProcessing_IsCompositionSupported(&param_srgb, &param_srgb, &param_p3);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// conposition support check 2
/**
 * @tc.name   vpeImageNdk_20
 * @tc.number vpeImageNdk_20
 * @tc.desc   vpeImageNdk_20
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_20()
{
    bool ret = OH_ImageProcessing_IsCompositionSupported(&param_not_support, &param_not_support, &param_not_support);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// conposition support check 3
/**
 * @tc.name   vpeImageNdk_21
 * @tc.number vpeImageNdk_21
 * @tc.desc   vpeImageNdk_21
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_21()
{
    bool ret = OH_ImageProcessing_IsCompositionSupported(&param_srgb, &param_srgb, &param_srgb);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// deconposition support check 1
/**
 * @tc.name   vpeImageNdk_22
 * @tc.number vpeImageNdk_22
 * @tc.desc   vpeImageNdk_22
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_22()
{
    bool ret = OH_ImageProcessing_IsDecompositionSupported(&param_srgb, &param_p3, &param_bt709);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// deconposition support check 2
/**
 * @tc.name   vpeImageNdk_23
 * @tc.number vpeImageNdk_23
 * @tc.desc   vpeImageNdk_23
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_23()
{
    bool ret = OH_ImageProcessing_IsDecompositionSupported(&param_not_support, &param_not_support, &param_not_support);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// deconposition support check 3
/**
 * @tc.name   vpeImageNdk_24
 * @tc.number vpeImageNdk_24
 * @tc.desc   vpeImageNdk_24
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_24()
{
    bool ret = OH_ImageProcessing_IsDecompositionSupported(&param_srgb, &param_srgb, &param_srgb);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// metadata generation support check 1
/**
 * @tc.name   vpeImageNdk_25
 * @tc.number vpeImageNdk_25
 * @tc.desc   vpeImageNdk_25
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_25()
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param5);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// metadata generation support check 2
/**
 * @tc.name   vpeImageNdk_26
 * @tc.number vpeImageNdk_26
 * @tc.desc   vpeImageNdk_26
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_26()
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param_p3);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// metadata generation support check 3
/**
 * @tc.name   vpeImageNdk_27
 * @tc.number vpeImageNdk_27
 * @tc.desc   vpeImageNdk_27
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_27()
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param_bt709);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// metadata generation support check 4
/**
 * @tc.name   vpeImageNdk_28
 * @tc.number vpeImageNdk_28
 * @tc.desc   vpeImageNdk_28
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_28()
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param_not_support);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// convert color space RGBA to BGRA impl
/**
 * @tc.name   vpeImageNdk_29
 * @tc.number vpeImageNdk_29
 * @tc.desc   vpeImageNdk_29
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_29()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_ConvertColorSpace(instance2, srcImg, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// convert color space BGRA to RGBA impl
/**
 * @tc.name   vpeImageNdk_30
 * @tc.number vpeImageNdk_30
 * @tc.desc   vpeImageNdk_30
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_30()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_ConvertColorSpace(instance2, srcImg, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// convert color space nullptr
/**
 * @tc.name   vpeImageNdk_31
 * @tc.number vpeImageNdk_31
 * @tc.desc   vpeImageNdk_31
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_31()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// compose RGBA impl
/**
 * @tc.name   vpeImageNdk_32
 * @tc.number vpeImageNdk_32
 * @tc.desc   vpeImageNdk_32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_32()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&gainmap, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Compose(instance2, srcImg, gainmap, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Compose(instance, srcImg, gainmap, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// compose BGRA impl
/**
 * @tc.name   vpeImageNdk_33
 * @tc.number vpeImageNdk_33
 * @tc.desc   vpeImageNdk_33
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_33()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&gainmap, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Compose(instance2, srcImg, gainmap, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Compose(instance, srcImg, gainmap, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// compose nullptr
/**
 * @tc.name   vpeImageNdk_34
 * @tc.number vpeImageNdk_34
 * @tc.desc   vpeImageNdk_34
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_34()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Compose(instance, srcImg, gainmap, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// decompose RGBA impl
/**
 * @tc.name   vpeImageNdk_35
 * @tc.number vpeImageNdk_35
 * @tc.desc   vpeImageNdk_35
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_35()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&gainmap, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Decompose(instance2, srcImg, dstImg, gainmap);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Decompose(instance, srcImg, dstImg, gainmap);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// decompose BGRA impl
/**
 * @tc.name   vpeImageNdk_36
 * @tc.number vpeImageNdk_36
 * @tc.desc   vpeImageNdk_36
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_36()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&gainmap, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Decompose(instance2, srcImg, dstImg, gainmap);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Decompose(instance, srcImg, dstImg, gainmap);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// decompose nullptr
/**
 * @tc.name   vpeImageNdk_37
 * @tc.number vpeImageNdk_37
 * @tc.desc   vpeImageNdk_37
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_37()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Decompose(instance, srcImg, dstImg, gainmap);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// generate metadata RGBA impl
/**
 * @tc.name   vpeImageNdk_38
 * @tc.number vpeImageNdk_38
 * @tc.desc   vpeImageNdk_38
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_38()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_GenerateMetadata(instance2, srcImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GenerateMetadata(instance, srcImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// generate metadata BGRA impl
/**
 * @tc.name   vpeImageNdk_39
 * @tc.number vpeImageNdk_39
 * @tc.desc   vpeImageNdk_39
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_39()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_GenerateMetadata(instance2, srcImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GenerateMetadata(instance, srcImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// generate metadata nullptr
/**
 * @tc.name   vpeImageNdk_40
 * @tc.number vpeImageNdk_40
 * @tc.desc   vpeImageNdk_40
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_40()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GenerateMetadata(instance, srcImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// detail enhance RGBA
/**
 * @tc.name   vpeImageNdk_41
 * @tc.number vpeImageNdk_41
 * @tc.desc   vpeImageNdk_41
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_41()
{
    if (!IsSupportImageSR()) {
        return SUCCESS_CODE;
    }
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, 1440, 1920, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_EnhanceDetail(instance, srcImg, dstImg);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// detail enhance BGRA
/**
 * @tc.name   vpeImageNdk_42
 * @tc.number vpeImageNdk_42
 * @tc.desc   vpeImageNdk_42
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_42()
{
    if (!IsSupportImageSR()) {
        return SUCCESS_CODE;
    }
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, 1440, 1920, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_EnhanceDetail(instance, srcImg, dstImg);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// detail enhance nullptr
/**
 * @tc.name   vpeImageNdk_43
 * @tc.number vpeImageNdk_43
 * @tc.desc   vpeImageNdk_43
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_43()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_EnhanceDetail(instance, srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// DeinitializeEnvironment without initialization
/**
 * @tc.name   vpeImageNdk_44
 * @tc.number vpeImageNdk_44
 * @tc.desc   vpeImageNdk_44
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_44()
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, IMAGE_PROCESSING_ERROR_OPERATION_NOT_PERMITTED);
    return SUCCESS_CODE;
}

// invalid parameter to create
/**
 * @tc.name   vpeImageNdk_45
 * @tc.number vpeImageNdk_45
 * @tc.desc   vpeImageNdk_45
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_45()
{
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance, -1); // -1 invalid type
    EXPECT_EQ(ret, IMAGE_PROCESSING_ERROR_INVALID_PARAMETER);
    return SUCCESS_CODE;
}

// invalid instance to create
/**
 * @tc.name   vpeImageNdk_46
 * @tc.number vpeImageNdk_46
 * @tc.desc   vpeImageNdk_46
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_46()
{
    OH_ImageProcessing** instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    EXPECT_EQ(ret, IMAGE_PROCESSING_ERROR_INVALID_INSTANCE);
    return SUCCESS_CODE;
}

// invalid instance to destroy
/**
 * @tc.name   vpeImageNdk_47
 * @tc.number vpeImageNdk_47
 * @tc.desc   vpeImageNdk_47
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int vpeImageNdk_47()
{
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Destroy(instance);
    EXPECT_EQ(ret, IMAGE_PROCESSING_ERROR_INVALID_INSTANCE);
    return SUCCESS_CODE;
}
} // namespace VideoProcessingEngine
} // namespace Media
} // namespace OHOS