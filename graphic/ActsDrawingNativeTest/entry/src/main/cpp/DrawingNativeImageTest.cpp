 /*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "include/DrawingNativeImageTest.h"
#include <cstdlib>
#include <ctime>
#include <random>
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_400 400
#define DRAWING_NUMBER_565 565
#define DRAWING_NUMBER_2160 2160
#define DRAWING_NUMBER_4096 4096
#define DRAWING_NUMBER_4444 4444
#define DRAWING_NUMBER_8888 8888

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeImageTestSetUp()
{
    std::cout << "DrawingNativeImageTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeImageTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeImageTestTearDown()
{
    std::cout << "DrawingNativeImageTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeImageTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testImageCreateDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_NUMBER_100
 * @tc.desc   Test for creating and destroying an image object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestImageCreateDestroyNormal() {
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 2. OH_Drawing_ImageDestroy
    OH_Drawing_ImageDestroy(image);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageCreateDestroyNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0101
 * @tc.desc   Test for destroying an image object with a NULL parameter.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageCreateDestroyNULL() {
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageDestroy with a NULL parameter
    OH_Drawing_Image *image = nullptr;
    OH_Drawing_ImageDestroy(nullptr);
    EXPECT_EQ(image, nullptr);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageCreateDestroyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0102
 * @tc.desc   Test for multiple calls of creating and destroying an image object.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageCreateDestroyMultipleCalls() {
    DrawingNativeImageTestSetUp();
    // 1. Call OH_Drawing_ImageCreate and OH_Drawing_ImageDestroy 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_ImageDestroy(image);
    }
    // 2. Call OH_Drawing_ImageCreate 10 times continuously
    OH_Drawing_Image *images[DRAWING_NUMBER_10];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        images[i] = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(images[i], nullptr);
    }
    // 3. Call OH_Drawing_ImageDestroy 10 times continuously
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ImageDestroy(images[i]);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageBuildFromBitmapNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_NUMBER_200
 * @tc.desc   Test for building an image from a bitmap with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestImageBuildFromBitmapNormal() {
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = DRAWING_NUMBER_200;
    uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    // 3. OH_Drawing_ImageBuildFromBitmap successfully constructs the image content
    bool ret = OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(bitmap, nullptr);
    EXPECT_EQ(ret, true);
    // 4. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageBuildFromBitmapNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0201
 * @tc.desc   Test for building an image from a bitmap with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageBuildFromBitmapNULL() {
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 3. OH_Drawing_ImageBuildFromBitmap with a null parameter, check the error code with OH_Drawing_ErrorCodeGet
    bool ret = OH_Drawing_ImageBuildFromBitmap(nullptr, bitmap);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_ImageBuildFromBitmap with a null parameter, check the error code with OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_ImageBuildFromBitmap(image, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageBuildFromBitmapMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0202
 * @tc.desc   Test for multiple calls of building an image from a bitmap.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageBuildFromBitmapMultipleCalls() {
    DrawingNativeImageTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        uint32_t height = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        bool ret = OH_Drawing_ImageBuildFromBitmap(image, bitmap);
        EXPECT_EQ(ret, true);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageBuildFromBitmapMultipleCallsBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0203
 * @tc.desc   Test for multiple calls of building an boundary value image from a bitmap.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageBuildFromBitmapMultipleCallsBoundary() {
    DrawingNativeImageTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_4096;
        uint32_t height = DRAWING_NUMBER_2160;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_ImageBuildFromBitmap(image, bitmap);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageGetWidthHeightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0300
 * @tc.desc   Test for getting width and height of an image with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestImageGetWidthHeightNormal() {
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    // 2. OH_Drawing_ImageGetWidth
    int32_t width_ = OH_Drawing_ImageGetWidth(image);
    EXPECT_EQ(width_, DRAWING_NUMBER_200);
    // 3. OH_Drawing_ImageGetHeight
    int32_t height_ = OH_Drawing_ImageGetHeight(image);
    EXPECT_EQ(height_, DRAWING_NUMBER_200);
    // 4. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageGetWidthHeightNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0301
 * @tc.desc   Test for getting width and height of an image with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageGetWidthHeightNULL() {
    DrawingNativeImageTestSetUp();
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = DRAWING_NUMBER_200;
    uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    // 1. OH_Drawing_ImageGetWidth with a null parameter, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_ImageGetWidth(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_ImageGetHeight with a null parameter, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_ImageGetHeight(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageGetWidthHeightMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0302
 * @tc.desc   Test for multiple calls of getting width and height of an image.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageGetWidthHeightMultipleCalls() {
    DrawingNativeImageTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        uint32_t height = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_ImageBuildFromBitmap(image, bitmap);
        int32_t width_ = OH_Drawing_ImageGetWidth(image);
        EXPECT_EQ(width_, DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10);
        int32_t height_ = OH_Drawing_ImageGetHeight(image);
        EXPECT_EQ(height_, DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageGetWidthHeightMultipleCallsBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0302
 * @tc.desc   Test for multiple calls of getting width and height of an boundary value image.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageGetWidthHeightMultipleCallsBoundary() {
    DrawingNativeImageTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_4096;
        uint32_t height = DRAWING_NUMBER_2160;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_ImageBuildFromBitmap(image, bitmap);
        EXPECT_NE(image, nullptr);
        int32_t width_ = OH_Drawing_ImageGetWidth(image);
        EXPECT_EQ(width_, DRAWING_NUMBER_4096);
        int32_t height_ = OH_Drawing_ImageGetHeight(image);
        EXPECT_EQ(height_, DRAWING_NUMBER_2160);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageGetImageInfoNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_NUMBER_400
 * @tc.desc   Test for getting image info with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestImageGetImageInfoNormal() {
    DrawingNativeImageTestSetUp();
    OH_Drawing_ColorFormat cfs[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat afs[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    for (OH_Drawing_ColorFormat cf : cfs) {
        for (OH_Drawing_AlphaFormat af : afs) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_Image *image = OH_Drawing_ImageCreate();
            // add assert
            EXPECT_NE(image, nullptr);
            OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
            // add assert
            EXPECT_NE(bitmap, nullptr);
            OH_Drawing_BitmapFormat cFormat{cf, af};
            uint32_t width = DRAWING_NUMBER_400;
            uint32_t height = DRAWING_NUMBER_400;
            OH_Drawing_Image_Info imageInfo;
            OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
            OH_Drawing_ImageGetImageInfo(image, &imageInfo);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
            OH_Drawing_ImageDestroy(image);
            OH_Drawing_BitmapDestroy(bitmap);
        }
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageGetImageInfoNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0401
 * @tc.desc   Test for getting image info with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageGetImageInfoNULL() {
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 2. OH_Drawing_Image_Info
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = DRAWING_NUMBER_400;
    uint32_t height = DRAWING_NUMBER_400;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    // 3. OH_Drawing_ImageGetImageInfo with a null parameter, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_ImageGetImageInfo(nullptr, &imageInfo);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageGetImageInfoMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0402
 * @tc.desc   Test for multiple calls of getting image info.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageGetImageInfoMultipleCalls() {
    DrawingNativeImageTestSetUp();
    OH_Drawing_ColorFormat cf[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat af[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        srand(static_cast<unsigned int>(time(0)));
        OH_Drawing_BitmapFormat cFormat{cf[rand() % DRAWING_NUMBER_5 + DRAWING_NUMBER_1], af[rand() % DRAWING_NUMBER_3 +
            DRAWING_NUMBER_1]};
        uint32_t width = rand() % DRAWING_NUMBER_100 + DRAWING_NUMBER_1;
        uint32_t height = rand() % DRAWING_NUMBER_100 + DRAWING_NUMBER_1;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_Image_Info imageInfo;
        OH_Drawing_ImageGetImageInfo(image, &imageInfo);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageGetImageInfoAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0403
 * @tc.desc   Test for getting image info with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageGetImageInfoAbnormal() {
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 2. OH_Drawing_ImageGetImageInfo creates OH_Drawing_Image_Info with width=-400 and height=-400
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = -DRAWING_NUMBER_400;
    uint32_t height = -DRAWING_NUMBER_400;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    // 3. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageGetImageInfoMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0404
 * @tc.desc   Test for getting image info with maximum values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageGetImageInfoMaximum() {
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 2. OH_Drawing_ImageGetImageInfo creates OH_Drawing_Image_Info with width=maximum value and height=maximum value
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = UINT32_MAX;
    uint32_t height = UINT32_MAX;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    // 3. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageGetImageInfoBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0405
 * @tc.desc   Test for getting image info with Boundary value.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageGetImageInfoBoundary() {
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 2. OH_Drawing_ImageGetImageInfo creates OH_Drawing_Image_Info with width=maximum value and height=maximum value
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = DRAWING_NUMBER_4096;
    uint32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    EXPECT_NE(image, nullptr);
    // 3. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS