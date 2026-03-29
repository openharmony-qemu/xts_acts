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

#include "include/DrawingNativeCanvasCommonTest.h"
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_6 6
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_11 11
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_50 50
#define DRAWING_NUMBER_66 66
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_120 120
#define DRAWING_NUMBER_150 150
#define DRAWING_NUMBER_180 180
#define DRAWING_NUMBER_190 190
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_300 300
#define DRAWING_NUMBER_340 340
#define DRAWING_NUMBER_360 360
#define DRAWING_NUMBER_410 410
#define DRAWING_NUMBER_500 500
#define DRAWING_NUMBER_650 650
#define DRAWING_NUMBER_1000 1000
#define DRAWING_NUMBER_999999 999999

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeCanvasPar5TestSetUp()
{
    std::cout << "DrawingNativeCanvasPart5Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart5Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeCanvasPart5TestTearDown()
{
    std::cout << "DrawingNativeCanvasPart5Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart5Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testCanvasQuickRejectPathNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4800
 * @tc.desc   test for testCanvasQuickRejectPathNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasQuickRejectPathNull()
{
    DrawingNativeCanvasPar5TestSetUp();
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    bool quickReject = false;

    // canvas参数传nullptr
    auto result1 = OH_Drawing_CanvasQuickRejectPath(nullptr, path, &quickReject);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // path参数传nullptr
    auto result2 = OH_Drawing_CanvasQuickRejectPath(canvas, nullptr, &quickReject);
    EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // quickReject参数传nullptr
    auto result3 = OH_Drawing_CanvasQuickRejectPath(canvas, path, nullptr);
    EXPECT_EQ(result3, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 调用销毁函数销毁指针
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasQuickRejectPathNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4801
 * @tc.desc   test for testCanvasQuickRejectPathNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_VERTOFFEST_1
 */
int TestCanvasQuickRejectPathNormal()
{
    DrawingNativeCanvasPar5TestSetUp();
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    bool quickReject = false;

    // 正常传参，path部分在画布内
    OH_Drawing_PathAddRect(path, -DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    auto result1 = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
    // add assert
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，path在画布外
    OH_Drawing_PathAddRect(path, -DRAWING_NUMBER_100, DRAWING_NUMBER_100, -DRAWING_NUMBER_200, DRAWING_NUMBER_300,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    auto result2 = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
    // add assert
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 正常传参，path只有一个顶点与画布相接
    OH_Drawing_PathAddRect(path, -DRAWING_NUMBER_100, -DRAWING_NUMBER_100, 0, 0,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    auto result3 = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
    // add assert
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasQuickRejectPathCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4802
 * @tc.desc   test for testCanvasQuickRejectPathCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_MESHWIDTH_2
 */
int TestCanvasQuickRejectPathCalls()
{
    DrawingNativeCanvasPar5TestSetUp();
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    bool quickReject = false;

    // 正常传参，path在画布内，调用1000次
    for (int i = 0; i < DRAWING_NUMBER_1000; ++i) {
        OH_Drawing_PathAddRect(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
                               OH_Drawing_PathDirection::PATH_DIRECTION_CW);
        auto result = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
        // add assert
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasQuickRejectRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4900
 * @tc.desc   test for testCanvasQuickRejectRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasQuickRejectRectNull()
{
    DrawingNativeCanvasPar5TestSetUp();
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // OH_Drawing_RectCreate
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    bool quickReject = false;

    // canvas参数传nullptr
    auto result1 = OH_Drawing_CanvasQuickRejectRect(nullptr, rect, &quickReject);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // rect参数传nullptr
    auto result2 = OH_Drawing_CanvasQuickRejectRect(canvas, nullptr, &quickReject);
    EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // quickReject参数传nullptr
    auto result3 = OH_Drawing_CanvasQuickRejectRect(canvas, rect, nullptr);
    EXPECT_EQ(result3, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasQuickRejectRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4901
 * @tc.desc   test for testCanvasQuickRejectRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_VERTOFFEST_1
 */
int TestCanvasQuickRejectRectNormal()
{
    DrawingNativeCanvasPar5TestSetUp();
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    bool quickReject = false;

    // 正常传参，rect部分在画布内
    OH_Drawing_Rect* rect1 = OH_Drawing_RectCreate(-DRAWING_NUMBER_100, 0, DRAWING_NUMBER_300, DRAWING_NUMBER_200);
    EXPECT_NE(rect1, nullptr);
    auto result1 = OH_Drawing_CanvasQuickRejectRect(canvas, rect1, &quickReject);
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，rect在画布外
    OH_Drawing_Rect* rect2 = OH_Drawing_RectCreate(-DRAWING_NUMBER_100, -DRAWING_NUMBER_100, -DRAWING_NUMBER_200,
                                                   -DRAWING_NUMBER_200);
    EXPECT_NE(rect2, nullptr);
    auto result2 = OH_Drawing_CanvasQuickRejectRect(canvas, rect2, &quickReject);
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 正常传参，rect比画布大包含画布
    OH_Drawing_Rect* rect3 = OH_Drawing_RectCreate(-DRAWING_NUMBER_20, -DRAWING_NUMBER_20, DRAWING_NUMBER_999999,
                                                   DRAWING_NUMBER_999999);
    EXPECT_NE(rect3, nullptr);
    auto result3 = OH_Drawing_CanvasQuickRejectRect(canvas, rect3, &quickReject);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasQuickRejectRectCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4902
 * @tc.desc   test for testCanvasQuickRejectRectCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_MESHWIDTH_2
 */
int TestCanvasQuickRejectRectCalls()
{
    DrawingNativeCanvasPar5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
                                                  DRAWING_NUMBER_200);
    bool quickReject = false;

    // 正常传参，rect在画布内，调用1000次
    for (int i = 0; i < DRAWING_NUMBER_1000; ++i) {
        auto result = OH_Drawing_CanvasQuickRejectRect(canvas, rect, &quickReject);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawArcWithCenterNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5000
 * @tc.desc   test for testCanvasDrawArcWithCenterNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawArcWithCenterNull()
{
    DrawingNativeCanvasPar5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);

    // canvas参数传nullptr
    auto result = OH_Drawing_CanvasDrawArcWithCenter(nullptr, rect, 0, DRAWING_NUMBER_180, false);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // rect参数传nullptr
    result = OH_Drawing_CanvasDrawArcWithCenter(canvas, nullptr, 0, DRAWING_NUMBER_180, false);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawArcWithCenterNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5001
 * @tc.desc   test for testCanvasDrawArcWithCenterNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_VERTOFFEST_1
 */
int TestCanvasDrawArcWithCenterNormal()
{
    DrawingNativeCanvasPar5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 正常传参，useCenter参数传true
    OH_Drawing_Rect* rect1 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect1, nullptr);
    auto result1 = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect1, 0, DRAWING_NUMBER_180, true);
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，useCenter参数传true，起始角度小于0，扫描角度大于360
    OH_Drawing_Rect* rect2 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect2, nullptr);
    auto result2 = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect2, -DRAWING_NUMBER_10,
                                                                        DRAWING_NUMBER_650, true);
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 正常传参，useCenter参数传false，起始角度大于0，扫描角度小于0
    OH_Drawing_Rect* rect3 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect3, nullptr);
    auto result3 = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect3, DRAWING_NUMBER_66, -DRAWING_NUMBER_120, false);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawArcWithCenterCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5002
 * @tc.desc   test for testCanvasDrawArcWithCenterCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_MESHWIDTH_2
 */
int TestCanvasDrawArcWithCenterCalls()
{
    DrawingNativeCanvasPar5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300, DRAWING_NUMBER_300);

    // 正常传参，rect在画布内，调用1000次
    for (int i = 0; i < DRAWING_NUMBER_1000; ++i) {
        auto result = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect, 0, DRAWING_NUMBER_180, true);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawNestedRoundRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5100
 * @tc.desc   test for testCanvasDrawNestedRoundRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawNestedRoundRectNull()
{
    DrawingNativeCanvasPar5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_RoundRect* outer = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_RoundRect* inner = OH_Drawing_RoundRectCreate(rect1, DRAWING_NUMBER_10, DRAWING_NUMBER_10);

    // canvas参数传nullptr
    auto result = OH_Drawing_CanvasDrawNestedRoundRect(nullptr, outer, inner);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // outer参数传nullptr
    result = OH_Drawing_CanvasDrawNestedRoundRect(canvas, nullptr, inner);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // inner参数传nullptr
    result = OH_Drawing_CanvasDrawNestedRoundRect(canvas, outer, nullptr);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 调用销毁函数销毁指针
    OH_Drawing_RoundRectDestroy(inner);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RoundRectDestroy(outer);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawNestedRoundRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5101
 * @tc.desc   test for testCanvasDrawNestedRoundRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_VERTOFFEST_1
 */
int TestCanvasDrawNestedRoundRectNormal()
{
    DrawingNativeCanvasPar5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_RoundRect* outer = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_RoundRect* inner = OH_Drawing_RoundRectCreate(rect1, DRAWING_NUMBER_10, DRAWING_NUMBER_10);

    // 正常传参，outer>inner
    auto result1 = OH_Drawing_CanvasDrawNestedRoundRect(canvas, outer, inner);
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，outer<inner
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    outer = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    rect1 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    inner = OH_Drawing_RoundRectCreate(rect1, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    auto result2 = OH_Drawing_CanvasDrawNestedRoundRect(canvas, outer, inner);
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_RoundRectDestroy(inner);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RoundRectDestroy(outer);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawNestedRoundRectCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5102
 * @tc.desc   test for testCanvasDrawNestedRoundRectCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_MESHWIDTH_2
 */
int TestCanvasDrawNestedRoundRectCalls()
{
    DrawingNativeCanvasPar5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_RoundRect* outer = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_RoundRect* inner = OH_Drawing_RoundRectCreate(rect1, DRAWING_NUMBER_10, DRAWING_NUMBER_10);

    // 正常传参，rect在画布内，调用1000次
    for (int i = 0; i < DRAWING_NUMBER_1000; ++i) {
        auto result = OH_Drawing_CanvasDrawNestedRoundRect(canvas, outer, inner);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_RoundRectDestroy(inner);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RoundRectDestroy(outer);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapNineNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5200
 * @tc.desc   test for testCanvasDrawPixelMapNineNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapNineNull()
{
    DrawingNativeCanvasPar5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    int imageWidth = DRAWING_NUMBER_100;
    int imageHeight = DRAWING_NUMBER_100;
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* bitmapAddr = malloc(bufferSize);
    EXPECT_NE(bitmapAddr, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = 0xFF0000FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Rect* center = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_Rect* dstRect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);

    auto result1 = OH_Drawing_CanvasDrawPixelMapNine(nullptr, pixelMap, center, dstRect,
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    auto result2 = OH_Drawing_CanvasDrawPixelMapNine(canvas, nullptr, center, dstRect,
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);
    auto result3 = OH_Drawing_CanvasDrawPixelMapNine(canvas, pixelMap, nullptr, dstRect,
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);
    auto result4 = OH_Drawing_CanvasDrawPixelMapNine(canvas, pixelMap, center, nullptr,
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result4, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 调用销毁函数销毁指针
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_PixelmapNative_Release(pixelMapNative);
    free(bitmapAddr);
    OH_PixelmapInitializationOptions_Release(createOps);
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_RectDestroy(dstRect);
    OH_Drawing_RectDestroy(center);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapNineNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5201
 * @tc.desc   test for testCanvasDrawPixelMapNineNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_VERTOFFEST_1
 */
int TestCanvasDrawPixelMapNineNormal()
{
    DrawingNativeCanvasPar5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    int32_t imageWidth = DRAWING_NUMBER_100;
    int32_t imageHeight = DRAWING_NUMBER_100;
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        return -DRAWING_NUMBER_1;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = 0xFF0000FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Rect* center = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(center, nullptr);
    OH_Drawing_Rect* dstRect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(dstRect, nullptr);
    // 正常传参
    auto result = OH_Drawing_CanvasDrawPixelMapNine(canvas, pixelMap, center, dstRect,
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    // 调用销毁函数销毁指针
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_PixelmapNative_Release(pixelMapNative);
    free(bitmapAddr);
    OH_PixelmapInitializationOptions_Release(createOps);
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_RectDestroy(dstRect);
    OH_Drawing_RectDestroy(center);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapNineCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5202
 * @tc.desc   test for testCanvasDrawPixelMapNineCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_MESHWIDTH_2
 */
int TestCanvasDrawPixelMapNineCalls()
{
    DrawingNativeCanvasPar5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    int32_t imageWidth = DRAWING_NUMBER_100;
    int32_t imageHeight = DRAWING_NUMBER_100;
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        return -DRAWING_NUMBER_1;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = 0xFF0000FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Rect* center = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(center, nullptr);
    OH_Drawing_Rect* dstRect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(dstRect, nullptr);
    // 正常传参，调用1000次
    for (int i = 0; i < DRAWING_NUMBER_1000; ++i) {
        auto result = OH_Drawing_CanvasDrawPixelMapNine(canvas, pixelMap, center,
            dstRect, OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }
    // 调用销毁函数销毁指针
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_PixelmapNative_Release(pixelMapNative);
    free(bitmapAddr);
    OH_PixelmapInitializationOptions_Release(createOps);
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_RectDestroy(dstRect);
    OH_Drawing_RectDestroy(center);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasCreateWithPixelMapNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5300
 * @tc.desc   test for testCanvasCreateWithPixelMapNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_MESHWIDTH_2
 */
int TestCanvasCreateWithPixelMapNormal()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_500;
    uint32_t imageHeight = DRAWING_NUMBER_500;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        return -DRAWING_NUMBER_1;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = 0xFF0000FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Canvas* offScreenCanvas = OH_Drawing_CanvasCreateWithPixelMap(pixelMap);
    EXPECT_NE(offScreenCanvas, nullptr);
    OH_Drawing_CanvasDestroy(offScreenCanvas);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(bitmapAddr);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasCreateWithPixelMapNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5301
 * @tc.desc   test for testCanvasCreateWithPixelMapNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasCreateWithPixelMapNull()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_500;
    uint32_t imageHeight = DRAWING_NUMBER_500;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        return -DRAWING_NUMBER_1;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = 0xFF0000FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Canvas* offScreenCanvas = OH_Drawing_CanvasCreateWithPixelMap(nullptr);
    EXPECT_EQ(offScreenCanvas, nullptr);
    OH_Drawing_CanvasDestroy(offScreenCanvas);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(bitmapAddr);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasCreateWithPixelMapMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5302
 * @tc.desc   test for testCanvasCreateWithPixelMapMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasCreateWithPixelMapMultipleCalls()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_500;
    uint32_t imageHeight = DRAWING_NUMBER_500;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        return -DRAWING_NUMBER_1;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = 0xFF0000FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Canvas* offScreenCanvas = OH_Drawing_CanvasCreateWithPixelMap(pixelMap);
        EXPECT_NE(offScreenCanvas, nullptr);
        OH_Drawing_CanvasDestroy(offScreenCanvas);
    }
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(bitmapAddr);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5400
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVELDRAWING_MESHWIDTH_2
 */
int TestCanvasDrawPixelMapRectConstraintNormal()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return -DRAWING_NUMBER_1;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    // 1. The interface of OH_Drawing_CanvasDrawPixelMapRectConstraint is called normally.
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_ErrorCode errorCode = {};
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, pixelMap, src, dst, samplingOptions, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 2. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5401
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapRectConstraintNull()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) { return -DRAWING_NUMBER_1; }
    for (int i = 0; i < imageWidth * imageHeight; i++) { ((uint32_t*)buffer)[i] = 0xFFFF00FF; }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_ErrorCode errorCode = {};
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        nullptr, pixelMap, src, dst, samplingOptions, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, nullptr, src, dst, samplingOptions, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, pixelMap, nullptr, dst, samplingOptions, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, pixelMap, src, nullptr, samplingOptions, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, pixelMap, src, dst, nullptr, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5402
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapRectConstraintAbnormal()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return -DRAWING_NUMBER_1;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    // 1. The last parameter of the verification interface passes an enumeration value that is out of range.
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, pixelMap, src, dst, samplingOptions, static_cast<OH_Drawing_SrcRectConstraint>(DRAWING_NUMBER_3));
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 2. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5403
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapRectConstraintMultiCalls()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return -DRAWING_NUMBER_1;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    // 1. The interface of OH_Drawing_ShaderEffectCreatePixelMapShader is called 10 times.
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_ErrorCode errorCode = {};
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
            canvas, pixelMap, src, dst, samplingOptions, OH_Drawing_SrcRectConstraint::FAST_SRC_RECT_CONSTRAINT);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 2. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5500
 * @tc.desc   test for testCanvasDrawPixelMapMeshNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawPixelMapMeshNormal()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = DRAWING_NUMBER_2;
    uint32_t meshHeight = DRAWING_NUMBER_2;
    uint32_t vertOffest = DRAWING_NUMBER_2;
    uint32_t colorOffest = DRAWING_NUMBER_2;
    std::vector<float> vertices = {
        DRAWING_NUMBER_10, DRAWING_NUMBER_50, DRAWING_NUMBER_180, DRAWING_NUMBER_180, 0, 0, DRAWING_NUMBER_20, 0,
        DRAWING_NUMBER_410, 0, 0, DRAWING_NUMBER_180, DRAWING_NUMBER_180, DRAWING_NUMBER_150, DRAWING_NUMBER_410,
        DRAWING_NUMBER_180, 0, DRAWING_NUMBER_360, DRAWING_NUMBER_190, DRAWING_NUMBER_340, DRAWING_NUMBER_410,
        DRAWING_NUMBER_360
    };
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000,
        0xFF000000, 0xFF000000, 0xFF000000, 0xFF000000, 0xFF000000, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits parameters normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull01
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5501
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull01
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshNull01()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = DRAWING_NUMBER_2;
    uint32_t meshHeight = DRAWING_NUMBER_2;
    uint32_t vertOffest = DRAWING_NUMBER_1;
    uint32_t colorOffest = DRAWING_NUMBER_1;
    std::vector<float> vertices = {0, 0, DRAWING_NUMBER_50, 0, DRAWING_NUMBER_410, 0, 0, DRAWING_NUMBER_180};
    std::vector<uint32_t> colors = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF};
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(nullptr, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, nullptr,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        0, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull02
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5502
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull02
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshNull02()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = DRAWING_NUMBER_2;
    uint32_t meshHeight = DRAWING_NUMBER_2;
    uint32_t vertOffest = DRAWING_NUMBER_1;
    uint32_t colorOffest = DRAWING_NUMBER_1;
    std::vector<float> vertices = {0, 0, DRAWING_NUMBER_50, 0, DRAWING_NUMBER_410, 0, 0, DRAWING_NUMBER_180};
    std::vector<uint32_t> colors = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF};
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, 0, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, nullptr, vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), 0, vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull03
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5503
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull03
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshNull03()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = DRAWING_NUMBER_1;
    uint32_t meshHeight = DRAWING_NUMBER_1;
    uint32_t vertOffest = DRAWING_NUMBER_1;
    uint32_t colorOffest = DRAWING_NUMBER_1;
    std::vector<float> vertices = {0, 0, DRAWING_NUMBER_50, 0, DRAWING_NUMBER_410, 0, 0, DRAWING_NUMBER_180};
    std::vector<uint32_t> colors = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000};
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), 0, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, nullptr, colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), 0, colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull04
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5504
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull04
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshNull04()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = DRAWING_NUMBER_1;
    uint32_t meshHeight = DRAWING_NUMBER_1;
    uint32_t vertOffest = DRAWING_NUMBER_1;
    std::vector<float> vertices = {0, 0, DRAWING_NUMBER_50, 0, DRAWING_NUMBER_410, 0, 0, DRAWING_NUMBER_180,
        DRAWING_NUMBER_50, DRAWING_NUMBER_180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), 0);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshBindAndUnbind
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5505
 * @tc.desc   test for testCanvasDrawPixelMapMeshBindAndUnbind
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshBindAndUnbind()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = DRAWING_NUMBER_1;
    uint32_t meshHeight = DRAWING_NUMBER_1;
    uint32_t vertOffest = DRAWING_NUMBER_1;
    uint32_t colorOffest = DRAWING_NUMBER_1;
    std::vector<float> vertices = {0, 0, DRAWING_NUMBER_50, 0, DRAWING_NUMBER_410, 0, 0, DRAWING_NUMBER_180,
        DRAWING_NUMBER_50, DRAWING_NUMBER_180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    OH_Drawing_CanvasAttachPen(canvas, pen);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachPen(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal01
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5506
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal01
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshAbnormal01()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = DRAWING_NUMBER_1;
    uint32_t meshHeight = DRAWING_NUMBER_1;
    uint32_t vertOffest = DRAWING_NUMBER_1;
    uint32_t colorOffest = DRAWING_NUMBER_1;
    std::vector<float> vertices = {0, 0, DRAWING_NUMBER_50, 0, DRAWING_NUMBER_410, 0, 0, DRAWING_NUMBER_180,
        DRAWING_NUMBER_50, DRAWING_NUMBER_180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits negative number.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, -DRAWING_NUMBER_1, meshHeight,
        vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, -DRAWING_NUMBER_1, vertices.data(),
        vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal02
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5507
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal02
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshAbnormal02()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = DRAWING_NUMBER_1;
    uint32_t meshHeight = DRAWING_NUMBER_1;
    uint32_t vertOffest = DRAWING_NUMBER_1;
    uint32_t colorOffest = DRAWING_NUMBER_1;
    std::vector<float> vertices = {0, 0, DRAWING_NUMBER_50, 0, DRAWING_NUMBER_410, 0, 0, DRAWING_NUMBER_180,
        DRAWING_NUMBER_50, DRAWING_NUMBER_180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits negative number.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight,
        vertices.data(), -DRAWING_NUMBER_1, vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight, vertices.data(),
        vertices.size(), vertOffest, colors.data(), -DRAWING_NUMBER_1, colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal03
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5508
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal03
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshAbnormal03()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = DRAWING_NUMBER_1;
    uint32_t meshHeight = DRAWING_NUMBER_1;
    uint32_t vertOffest = DRAWING_NUMBER_1;
    uint32_t colorOffest = DRAWING_NUMBER_1;
    std::vector<float> vertices = {0, 0, DRAWING_NUMBER_50, 0, DRAWING_NUMBER_410, 0, 0, DRAWING_NUMBER_180,
        DRAWING_NUMBER_50, DRAWING_NUMBER_180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits negative number.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight,
        vertices.data(), vertices.size(), -DRAWING_NUMBER_1, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight, vertices.data(),
        vertices.size(), vertOffest, colors.data(), colors.size(), -DRAWING_NUMBER_1);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal04
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5509
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal04
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshAbnormal04()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = DRAWING_NUMBER_1;
    uint32_t meshHeight = DRAWING_NUMBER_1;
    uint32_t vertOffest = DRAWING_NUMBER_1;
    uint32_t colorOffest = DRAWING_NUMBER_1;
    std::vector<float> vertices = {0, 0, DRAWING_NUMBER_50, 0, DRAWING_NUMBER_410, 0, 0, DRAWING_NUMBER_180,
        DRAWING_NUMBER_50, DRAWING_NUMBER_180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits a number greater than the actual quantity.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight,
        vertices.data(), DRAWING_NUMBER_11, vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight, vertices.data(),
        vertices.size(), vertOffest, colors.data(), DRAWING_NUMBER_6, colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5510
 * @tc.desc   test for testCanvasDrawPixelMapMeshMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshMultipleCalls()
{
    DrawingNativeCanvasPar5TestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = DRAWING_NUMBER_1;
    uint32_t meshHeight = DRAWING_NUMBER_1;
    uint32_t vertOffest = DRAWING_NUMBER_1;
    uint32_t colorOffest = DRAWING_NUMBER_1;
    std::vector<float> vertices = {0, 0, DRAWING_NUMBER_50, 0, DRAWING_NUMBER_410, 0, 0, DRAWING_NUMBER_180,
        DRAWING_NUMBER_50, DRAWING_NUMBER_180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_ErrorCode errorCode = {};
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh is called 10 times.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight,
            vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS