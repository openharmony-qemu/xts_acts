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

#include "gtest/gtest.h"

#include "DrawingNativeCanvasCommon.h"
#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_memory_stream.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeCanvasPart4Test : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeCanvasPart4Test Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasPart4Test errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeCanvasPart4Test Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasPart4Test errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testCanvasSkewNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2900
 * @tc.desc   test for testCanvasSkewNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSkewNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with positive skew values on the x and y axes
    OH_Drawing_CanvasSkew(canvas, 1.0, 1.0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call drawing class interface
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect1);
    // 4. OH_Drawing_CanvasSkew with negative skew values on the x and y axes
    OH_Drawing_CanvasSkew(canvas, -1.0, -1.0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call drawing class interface
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect2);
    // 6. OH_Drawing_CanvasSkew with positive skew value on the x-axis and negative skew value on the y-axis
    OH_Drawing_CanvasSkew(canvas, 1.0, -1.0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Call drawing class interface
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect3);
    // 8. Free memory
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSkewNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2901
 * @tc.desc   test for testCanvasSkewNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSkewNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with the first parameter as null
    OH_Drawing_CanvasSkew(nullptr, 2, 2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CanvasSkew with the second parameter as 0
    OH_Drawing_CanvasSkew(canvas, 0, 2);
    // 4. OH_Drawing_CanvasSkew with the third parameter as 0
    OH_Drawing_CanvasSkew(canvas, 2, 0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSkewMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2903
 * @tc.desc   test for testCanvasSkewMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSkewMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with the skew amount sx on the x-axis as the maximum value
    OH_Drawing_CanvasSkew(canvas, FLT_MAX, 1);
    // 3. OH_Drawing_CanvasSkew with the skew amount sy on the y-axis as the maximum value
    OH_Drawing_CanvasSkew(canvas, 1, FLT_MAX);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSkewInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2904
 * @tc.desc   test for testCanvasSkewInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSkewInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasSkewMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2905
 * @tc.desc   test for testCanvasSkewMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSkewMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasSkew 10 times, each time with a different skew value
    for (int i = 0; i < 10; i++) {
        float skew = i * 0.1;
        OH_Drawing_CanvasSkew(canvas, skew, skew);
    }
    // 3. Call drawing class interface
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3000
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetWidthtestCanvasGetHeightNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas using OH_Drawing_CanvasBind, and verify the canvas information by
    // calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);
    int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
    int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
    EXPECT_EQ(canvasWidth, width);
    EXPECT_EQ(canvasHeight, height);
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3001
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetWidthtestCanvasGetHeightNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasGetHeight with null input
    int32_t canvasHeight = OH_Drawing_CanvasGetHeight(nullptr);
    EXPECT_EQ(canvasHeight, 0);
    // 3. OH_Drawing_CanvasGetWidth with null input
    int32_t canvasWidth = OH_Drawing_CanvasGetWidth(nullptr);
    EXPECT_EQ(canvasWidth, 0);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3002
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetWidthtestCanvasGetHeightMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth after each switch
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, width);
        EXPECT_EQ(canvasHeight, height);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // 4. Call OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth 10 times to verify the canvas
    for (int i = 0; i < 10; i++) {
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, 200 + 90);
        EXPECT_EQ(canvasHeight, 200 + 90);
    }

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3003
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetWidthtestCanvasGetHeightInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3004
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth after each switch
    constexpr uint32_t width = 4096;
    constexpr uint32_t height = 2160;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, width);
        EXPECT_EQ(canvasHeight, height);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // 4. Call OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth 10 times to verify the canvas
    for (int i = 0; i < 10; i++) {
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, width);
        EXPECT_EQ(canvasHeight, height);
    }

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3100
 * @tc.desc   test for testCanvasGetLocalClipBoundsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasGetLocalClipBounds
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_CanvasDrawRect
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3101
 * @tc.desc   test for testCanvasGetLocalClipBoundsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasGetLocalClipBounds with the first parameter as null
    OH_Drawing_CanvasGetLocalClipBounds(nullptr, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasGetLocalClipBounds with the second parameter as null
    OH_Drawing_CanvasGetLocalClipBounds(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect created with left, top, right, bottom as 0
    rect = OH_Drawing_RectCreate(0, 100, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, 0, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, 100, 0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 6. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect created with all values as 0
    rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3102
 * @tc.desc   test for testCanvasGetLocalClipBoundsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect created with negative values for left, top, right,
    // and bottom
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(-100, 100, 100, 100);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect1);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(100, -100, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect2);
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(100, 100, -100, 100);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect3);
    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(100, 100, 100, -100);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect4);
    // 3. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate equal to the
    // bottom-right coordinate or the top-left coordinate equal to the bottom-right coordinate
    OH_Drawing_Rect *rect5 = OH_Drawing_RectCreate(100, 200, 200, 200);
    // add assert
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect5);
    OH_Drawing_Rect *rect6 = OH_Drawing_RectCreate(200, 100, 200, 200);
    // add assert
    EXPECT_NE(rect6, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect6);
    // 4. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate equal to the
    // bottom-right coordinate
    OH_Drawing_Rect *rect7 = OH_Drawing_RectCreate(100, 100, 100, 100);
    // add assert
    EXPECT_NE(rect7, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect7);
    // 5. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate greater than
    // the bottom-right coordinate
    OH_Drawing_Rect *rect8 = OH_Drawing_RectCreate(200, 200, 100, 100);
    // add assert
    EXPECT_NE(rect8, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect8);
    // 6. Free memory
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RectDestroy(rect5);
    OH_Drawing_RectDestroy(rect6);
    OH_Drawing_RectDestroy(rect7);
    OH_Drawing_RectDestroy(rect8);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3103
 * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetLocalClipBounds after each switch
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200;
        uint32_t height = 200;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 4. Call OH_Drawing_CanvasGetLocalClipBounds 10 times to verify the canvas
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    }
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3104
 * @tc.desc   test for testCanvasGetLocalClipBoundsInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsMultipleCallsBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3105
 * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCallsBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsMultipleCallsBoundary, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetLocalClipBounds after each switch
    uint32_t width = 4096;
    uint32_t height = 2160;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 4. Call OH_Drawing_CanvasGetLocalClipBounds 10 times to verify the canvas
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    }
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3200
 * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_Matrix *totalMatrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(totalMatrix, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);
    EXPECT_NE(totalMatrix, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(totalMatrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasConcatMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3201
 * @tc.desc   test for testCanvasConcatMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasConcatMatrixNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. OH_Drawing_CanvasConcatMatrix with the first parameter as null
    OH_Drawing_CanvasConcatMatrix(nullptr, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasConcatMatrix with the second parameter as null
    OH_Drawing_CanvasConcatMatrix(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetTotalMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3202
 * @tc.desc   test for testCanvasGetTotalMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetTotalMatrixNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 3. OH_Drawing_CanvasGetTotalMatrix with the first parameter as null
    OH_Drawing_CanvasGetTotalMatrix(nullptr, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasGetTotalMatrix with the second parameter as null
    OH_Drawing_CanvasGetTotalMatrix(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3203
 * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreateScale
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(10, 10, 10, 10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 3. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    OH_Drawing_Matrix *totalMatrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(totalMatrix, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);
    // 4. OH_Drawing_MatrixCreateRotation
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, 1, 1);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 5. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix2);
    OH_Drawing_Matrix *totalMatrix2 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(totalMatrix2, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix2);
    // 6. OH_Drawing_MatrixCreateTranslation
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateTranslation(10, 10);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 7. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix3);
    OH_Drawing_Matrix *totalMatrix3 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(totalMatrix3, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix3);
    // 8. Repeat steps 2-7 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(10, 10, 10, 10);
        // add assert
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix);
        OH_Drawing_Matrix *totalMatrix = OH_Drawing_MatrixCreate();
        // add assert
        EXPECT_NE(totalMatrix, nullptr);
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);

        OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, 1, 1);
        // add assert
        EXPECT_NE(matrix2, nullptr);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix2);
        OH_Drawing_Matrix *totalMatrix2 = OH_Drawing_MatrixCreate();
        // add assert
        EXPECT_NE(totalMatrix2, nullptr);
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix2);

        OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateTranslation(10, 10);
        // add assert
        EXPECT_NE(matrix3, nullptr);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix3);
        OH_Drawing_Matrix *totalMatrix3 = OH_Drawing_MatrixCreate();
        // add assert
        EXPECT_NE(totalMatrix3, nullptr);
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix3);

        OH_Drawing_MatrixDestroy(matrix);
        OH_Drawing_MatrixDestroy(matrix2);
        OH_Drawing_MatrixDestroy(matrix3);
        OH_Drawing_MatrixDestroy(totalMatrix);
        OH_Drawing_MatrixDestroy(totalMatrix2);
        OH_Drawing_MatrixDestroy(totalMatrix3);
    }
    // 9. Call OH_Drawing_CanvasConcatMatrix 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    }

    // 10. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(totalMatrix);
}

/**
 * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3204
 * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasDrawShadowNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3300
 * @tc.desc   test for testCanvasDrawShadowNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawShadowNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow, iterate through the OH_Drawing_CanvasShadowFlags enumeration values
    OH_Drawing_CanvasShadowFlags flags[] = {
        SHADOW_FLAGS_NONE,
        SHADOW_FLAGS_TRANSPARENT_OCCLUDER,
        SHADOW_FLAGS_GEOMETRIC_ONLY,
        SHADOW_FLAGS_ALL,
    };
    OH_Drawing_Point3D p1{0.0, 0.0, 0.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    for (int i = 0; i < 4; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFF000000, 0xFF000000, flags[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawShadowNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3301
 * @tc.desc   test for testCanvasDrawShadowNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawShadowNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow with the first parameter as null
    OH_Drawing_Point3D p1{0.0, 0.0, 0.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    OH_Drawing_CanvasDrawShadow(nullptr, path, p1, p2, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawShadow with the second parameter as null
    OH_Drawing_CanvasDrawShadow(canvas, nullptr, p1, p2, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasDrawShadow with the third parameter as null
    // Unable to test, compilation error
    // 6. OH_Drawing_CanvasDrawShadow with the fourth parameter as null
    // Unable to test, compilation error
    // 7. OH_Drawing_CanvasDrawShadow with the fifth parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 0, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 8. OH_Drawing_CanvasDrawShadow with the sixth parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0, 0xFF000000, SHADOW_FLAGS_ALL);
    // 9. OH_Drawing_CanvasDrawShadow with the seventh parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFF000000, 0, SHADOW_FLAGS_ALL);
    // 10. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawShadowAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3302
 * @tc.desc   test for testCanvasDrawShadowAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawShadowAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow, the third parameter planeParams x, y, z are set to negative values
    OH_Drawing_Point3D p1{-1.0, -1.0, -1.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 4. OH_Drawing_CanvasDrawShadow, the fourth parameter devLightPos x, y, z are set to negative values
    OH_Drawing_Point3D p3{0.0, 0.0, 0.0};
    OH_Drawing_Point3D p4{-10.0, -10.0, -10.0};
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 5. OH_Drawing_CanvasDrawShadow, the fifth parameter lightRadius is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, -10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 6. OH_Drawing_CanvasDrawShadow, the sixth parameter ambientColor is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, 10, -0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 7. OH_Drawing_CanvasDrawShadow, the seventh parameter spotColor is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, 10, 0xFF000000, -0xFF000000, SHADOW_FLAGS_ALL);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawShadowMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3303
 * @tc.desc   test for testCanvasDrawShadowMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawShadowMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Point3D p1{1.0, 1.0, 1.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    // 3. OH_Drawing_CanvasDrawShadow, set the x, y, z values in the planeParams parameter to maximum values
    p1 = {FLT_MAX, FLT_MAX, FLT_MAX};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 4. OH_Drawing_CanvasDrawShadow, set the x, y, z values in the devLightPos parameter to maximum values
    p1 = {1.0, 1.0, 1.0};
    p2 = {FLT_MAX, FLT_MAX, FLT_MAX};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 5. OH_Drawing_CanvasDrawShadow, set the lightRadius parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, FLT_MAX, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 6. OH_Drawing_CanvasDrawShadow, set the ambientColor parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 7. OH_Drawing_CanvasDrawShadow, set the spotColor parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawShadowInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3304
 * @tc.desc   test for testCanvasDrawShadowInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawShadowInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasClearNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3400
 * @tc.desc   test for testCanvasClearNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear, covering the minimum value 0x00000000 and the maximum value 0xFFFFFFFF for color
    OH_Drawing_CanvasClear(canvas, 0x00000000);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasClearNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3401
 * @tc.desc   test for testCanvasClearNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear with the first parameter as null
    OH_Drawing_CanvasClear(nullptr, 0x00000000);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasClearAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3402
 * @tc.desc   test for testCanvasClearAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear with the parameter color set to a negative value
    OH_Drawing_CanvasClear(canvas, -1);
    // 3. OH_Drawing_CanvasClear with the parameter color set to a floating-point value
    // compile error, ignore
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasClearMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3403
 * @tc.desc   test for testCanvasClearMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasClear 10 times, each time with a different color
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasClear(canvas, 0x11111111 + i * 10);
    }
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasClearInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3404
 * @tc.desc   test for testCanvasClearInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasClearMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3405
 * @tc.desc   test for testCanvasClearMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear with the parameter color set to the maximum value
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSetMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3500
 * @tc.desc   test for testCanvasSetMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSetMatrixNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasSetMatrix and use OH_Drawing_MatrixGetValue to get the matrix information
    OH_Drawing_CanvasSetMatrix(canvas, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    float val = OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_EQ(val, 1);

    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSetMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3501
 * @tc.desc   test for testCanvasSetMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSetMatrixNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. OH_Drawing_CanvasSetMatrix with the first parameter as null
    OH_Drawing_CanvasSetMatrix(nullptr, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasSetMatrix with the second parameter as null
    OH_Drawing_CanvasSetMatrix(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}
/**
 * @tc.name   testCanvasSetMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3502
 * @tc.desc   test for testCanvasSetMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSetMatrixMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasSetMatrix 10 times, and after each call, call OH_Drawing_MatrixGetValue to get the
    // matrix information
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
        float val = OH_Drawing_MatrixGetValue(matrix, 0);
        EXPECT_EQ(val, 1);
    }
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSetMatrixInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3503
 * @tc.desc   test for testCanvasSetMatrixInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSetMatrixInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasResetMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3600
 * @tc.desc   test for testCanvasResetMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasResetMatrixNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasResetMatrix
    OH_Drawing_CanvasResetMatrix(canvas);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasResetMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3601
 * @tc.desc   test for testCanvasResetMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasResetMatrixNull, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_CanvasResetMatrix with a null parameter
    OH_Drawing_CanvasResetMatrix(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   testCanvasResetMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3603
 * @tc.desc   test for testCanvasResetMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasResetMatrixMultipleCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasSetMatrix 10 times, call OH_Drawing_CanvasResetMatrix 10 times, and get matrix
    // information using OH_Drawing_MatrixGetValue
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
    }
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasResetMatrix(canvas);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. Call OH_Drawing_CanvasSetMatrix, OH_Drawing_CanvasResetMatrix, and get matrix information using
    // OH_Drawing_MatrixGetValue
    OH_Drawing_CanvasSetMatrix(canvas, matrix);
    OH_Drawing_CanvasResetMatrix(canvas);
    float val = OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_EQ(val, 1);
    // 5. Repeat steps 4 for 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
        OH_Drawing_CanvasResetMatrix(canvas);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), 1);
    }
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawImageRectWithSrcNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3700
 * @tc.desc   test for testCanvasDrawImageRectWithSrcNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawImageRectWithSrcNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_ImageCreate to create an image object
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    // 3. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 4. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    // 5. Call OH_Drawing_SamplingOptionsCreate to create a sampling options object
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
                                                                           OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    EXPECT_NE(options, nullptr);
    // 6. Call OH_Drawing_CanvasDrawImageRectWithSrc with the sixth parameter iterating through the enumeration
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, rect, rect2, options, STRICT_SRC_RECT_CONSTRAINT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, rect, rect2, options, FAST_SRC_RECT_CONSTRAINT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_CanvasDestroy(canvas);
}

/**