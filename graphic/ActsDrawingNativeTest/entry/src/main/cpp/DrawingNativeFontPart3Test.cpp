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

#include "include/DrawingNativeFontTest.h"
#include <cfloat>
#include <random>
#include "include/DrawingNativeScalarCommonTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Common SetUp and TearDown functions implementation
void DrawingNativeFontPart3TestSetUp()
{
    std::cout << "DrawingNativeFontPart3Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeFontPart3Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeFontPart3TestTearDown()
{
    std::cout << "DrawingNativeFontPart3Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeFontPart3Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testFontGetWidthsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_7900
 * @tc.desc   test for testFontGetWidthsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetWidthsAbnormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char* str = "Hello World";
    uint16_t glyphs[50] = { 0 }; // 50 means glyphs array number
    float widths[50] = { 0.f };
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    // 2. Set byteLength parameter to -1 for OH_Drawing_FontGetWidths interface
    // There is no byteLength parameter
    // 3. Set count parameter to -1 for OH_Drawing_FontGetWidths interface and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetWidths(font, glyphs, -1, widths);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Set widths parameter to -1 for OH_Drawing_FontGetWidths interface
    float widths2[50] = { -1 };
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths2);
    // 5. Set count parameter to a floating-point value greater than 0 for OH_Drawing_FontGetWidths interface
    OH_Drawing_FontGetWidths(font, glyphs, 2.0f, widths);
    // 6. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetWidthsMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8000
 * @tc.desc   test for testFontGetWidthsMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetWidthsMaximum()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char* str = "Hello World";
    uint16_t glyphs[50] = { 0 }; // 50 means glyphs array number
    float widths[50] = { 0.f };
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    // 2. Call OH_Drawing_FontGetWidths interface with maximum value for glyphs parameter
    uint16_t glyphs2[50] = { UINT16_MAX };
    OH_Drawing_FontGetWidths(font, glyphs2, glyphsCount, widths);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_FontGetWidths interface with maximum value for count parameter
    // Ignore, no need to test the case with maximum count parameter
    // 4. Call OH_Drawing_FontGetWidths interface with maximum value for widths parameter
    float widths2[50] = { FLT_MAX };
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetLinearTextNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8100
 * @tc.desc   test for testFontSetLinearTextNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetLinearTextNormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetLinearText with isLinearText parameter set to false, and then call
    // OH_Drawing_FontIsLinearText to check if the glyphs are scaled linearly
    OH_Drawing_FontSetLinearText(font, false);
    bool isLinearText = OH_Drawing_FontIsLinearText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isLinearText, false);
    // 3. Call OH_Drawing_FontSetLinearText with isLinearText parameter set to true, and then call
    // OH_Drawing_FontIsLinearText to check if the glyphs are scaled linearly
    OH_Drawing_FontSetLinearText(font, true);
    isLinearText = OH_Drawing_FontIsLinearText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isLinearText, true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetLinearTextNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8200
 * @tc.desc   test for testFontSetLinearTextNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetLinearTextNULL()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. Pass nullptr as the first parameter to OH_Drawing_FontSetLinearText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetLinearText(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Pass nullptr as the parameter to OH_Drawing_FontIsLinearText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsLinearText(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetLinearTextMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8300
 * @tc.desc   test for testFontSetLinearTextMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetLinearTextMultipleCalls()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetLinearText 10 times, and call OH_Drawing_FontIsLinearText to check if the glyphs are
    // scaled linearly
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetLinearText(font, i % 2 == 0);
        bool isLinearText = OH_Drawing_FontIsLinearText(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(isLinearText, i % 2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontIsLinearTextWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8400
 * @tc.desc   test for testFontIsLinearTextWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontIsLinearTextWhenNoSet()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsLinearText
    bool isLinearText = OH_Drawing_FontIsLinearText(font);
    EXPECT_EQ(isLinearText, false);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTextSkewXNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8500
 * @tc.desc   test for testFontSetTextSkewXNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetTextSkewXNormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to 10, and then call
    // OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    OH_Drawing_FontSetTextSkewX(font, 10);
    float skewX = OH_Drawing_FontGetTextSkewX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(skewX, 10);
    // 3. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to 0.55, and then call
    // OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    OH_Drawing_FontSetTextSkewX(font, 0.55);
    skewX = OH_Drawing_FontGetTextSkewX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(IsScalarAlmostEqual(skewX, 0.55), true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTextSkewXNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8600
 * @tc.desc   test for testFontSetTextSkewXNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetTextSkewXNULL()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Pass nullptr as the first parameter to OH_Drawing_FontSetTextSkewX and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetTextSkewX(nullptr, 10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass 0 as the second parameter to OH_Drawing_FontSetTextSkewX
    OH_Drawing_FontSetTextSkewX(font, 0);
    // 4. Pass nullptr as the parameter to OH_Drawing_FontGetTextSkewX and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetTextSkewX(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTextSkewXMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8700
 * @tc.desc   test for testFontSetTextSkewXMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetTextSkewXMultipleCalls()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX 10 times (with random skewX values), and call OH_Drawing_FontGetTextSkewX to
    // get the text skew on the x-axis each time
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 30);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        float val = dis(gen);
        OH_Drawing_FontSetTextSkewX(font, val);
        float skewX = OH_Drawing_FontGetTextSkewX(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(skewX, val);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetTextSkewXWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8800
 * @tc.desc   test for testFontGetTextSkewXWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetTextSkewXWhenNoSet()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    float skewX = OH_Drawing_FontGetTextSkewX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(skewX, 0);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTextSkewXAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8900
 * @tc.desc   test for testFontSetTextSkewXAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetTextSkewXAbnormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to -1, and then call
    // OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    OH_Drawing_FontSetTextSkewX(font, -1);
    float skewX = OH_Drawing_FontGetTextSkewX(font);
    EXPECT_EQ(skewX, -1);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTextSkewXMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9000
 * @tc.desc   test for testFontSetTextSkewXMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetTextSkewXMaximum()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to FLT_MAX
    OH_Drawing_FontSetTextSkewX(font, FLT_MAX);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetFakeBoldTextNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9100
 * @tc.desc   test for testFontSetFakeBoldTextNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetFakeBoldTextNormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetFakeBoldText interface with isFakeBoldText parameter set to false, and then call
    // OH_Drawing_FontIsFakeBoldText to check if the stroke width is increased to approximate bold text
    OH_Drawing_FontSetFakeBoldText(font, false);
    bool isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isFakeBoldText, false);
    // 3. Call OH_Drawing_FontSetFakeBoldText interface with isFakeBoldText parameter set to true, and then call
    // OH_Drawing_FontIsFakeBoldText to check if the stroke width is increased to approximate bold text
    OH_Drawing_FontSetFakeBoldText(font, true);
    isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isFakeBoldText, true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetFakeBoldTextNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9200
 * @tc.desc   test for testFontSetFakeBoldTextNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetFakeBoldTextNULL()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. Pass nullptr as the first parameter to OH_Drawing_FontSetFakeBoldText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetFakeBoldText(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Pass nullptr as the parameter to OH_Drawing_FontIsFakeBoldText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsFakeBoldText(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetFakeBoldTextMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9300
 * @tc.desc   test for testFontSetFakeBoldTextMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetFakeBoldTextMultipleCalls()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetFakeBoldText 10 times, and call OH_Drawing_FontIsFakeBoldText each time to check if the
    // stroke width is increased to approximate bold text
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetFakeBoldText(font, i % 2 == 0);
        bool isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(isFakeBoldText, i % 2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontIsFakeBoldTextWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9400
 * @tc.desc   test for testFontIsFakeBoldTextWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontIsFakeBoldTextWhenNoSet()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsFakeBoldText
    bool isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
    EXPECT_EQ(isFakeBoldText, false);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetScaleXNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9500
 * @tc.desc   test for testFontSetScaleXNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetScaleXNormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to 10, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, 10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    float scaleX = OH_Drawing_FontGetScaleX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(scaleX, 10);
    // 3. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to 0.55, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, 0.55);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    scaleX = OH_Drawing_FontGetScaleX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(IsScalarAlmostEqual(scaleX, 0.55), true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetScaleXNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9600
 * @tc.desc   test for testFontSetScaleXNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetScaleXNULL()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetScaleX(nullptr, 10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_FontSetScaleX with 0 as the second parameter
    OH_Drawing_FontSetScaleX(font, 0);
    // 4. Call OH_Drawing_FontGetScaleX with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetScaleX(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetScaleXMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9700
 * @tc.desc   test for testFontSetScaleXMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetScaleXMultipleCalls()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX 10 times (with random values for scaleX parameter), and call
    // OH_Drawing_FontGetScaleX each time to get the text scale on the x-axis
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 30);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        float val = dis(gen);
        OH_Drawing_FontSetScaleX(font, val);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        float scaleX = OH_Drawing_FontGetScaleX(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(scaleX, val);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetScaleXWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9800
 * @tc.desc   test for testFontGetScaleXWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetScaleXWhenNoSet()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    float scaleX = OH_Drawing_FontGetScaleX(font);
    EXPECT_EQ(scaleX, 1);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetScaleXAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9900
 * @tc.desc   test for testFontSetScaleXAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetScaleXAbnormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to -1, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, -1);
    float scaleX = OH_Drawing_FontGetScaleX(font);
    EXPECT_EQ(scaleX, -1);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetScaleXMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10000
 * @tc.desc   test for testFontSetScaleXMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetScaleXMaximum()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to FLT_MAX, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, FLT_MAX);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetHintingNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10100
 * @tc.desc   test for testFontSetHintingNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetHintingNormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontSetHinting enum value OH_Drawing_FontHinting coverage verification, call
    // OH_Drawing_FontGetHinting to get the font outline effect enum type
    OH_Drawing_FontHinting hinting[] = {
        FONT_HINTING_NONE,
        FONT_HINTING_SLIGHT,
        FONT_HINTING_NORMAL,
        FONT_HINTING_FULL,
    };
    for (OH_Drawing_FontHinting h : hinting) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetHinting(font, h);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_FontHinting hinting2 = OH_Drawing_FontGetHinting(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(hinting2, h);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetHintingNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10200
 * @tc.desc   test for testFontSetHintingNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetHintingNULL()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. Call OH_Drawing_FontSetHinting with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetHinting(nullptr, FONT_HINTING_NONE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontGetHinting with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetHinting(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetHintingMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10300
 * @tc.desc   test for testFontSetHintingMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetHintingMultipleCalls()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetHinting 10 times (with random enum values), and call OH_Drawing_FontGetHinting each
    // time to get the font outline effect enum type
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dis(0, 3);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_FontHinting hinting = static_cast<OH_Drawing_FontHinting>(dis(gen));
        OH_Drawing_FontSetHinting(font, hinting);
        OH_Drawing_FontHinting hinting2 = OH_Drawing_FontGetHinting(font);
        EXPECT_EQ(hinting2, hinting);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetHintingWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10400
 * @tc.desc   test for testFontGetHintingWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetHintingWhenNoSet()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetHinting
    OH_Drawing_FontHinting hinting = OH_Drawing_FontGetHinting(font);
    EXPECT_EQ(hinting, FONT_HINTING_NORMAL);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetEmbeddedBitmapsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10500
 * @tc.desc   test for testFontSetEmbeddedBitmapsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetEmbeddedBitmapsNormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetEmbeddedBitmaps with false as the isEmbeddedBitmaps parameter, and call
    // OH_Drawing_FontIsEmbeddedBitmaps to check if the glyph is converted to a bitmap
    OH_Drawing_FontSetEmbeddedBitmaps(font, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmbeddedBitmaps, false);
    // 3. Call OH_Drawing_FontSetEmbeddedBitmaps with true as the isEmbeddedBitmaps parameter, and call
    // OH_Drawing_FontIsEmbeddedBitmaps to check if the glyph is converted to a bitmap
    OH_Drawing_FontSetEmbeddedBitmaps(font, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmbeddedBitmaps, true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetEmbeddedBitmapsNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10600
 * @tc.desc   test for testFontSetEmbeddedBitmapsNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetEmbeddedBitmapsNULL()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. Call OH_Drawing_FontSetEmbeddedBitmaps with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetEmbeddedBitmaps(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontIsEmbeddedBitmaps with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsEmbeddedBitmaps(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetEmbeddedBitmapsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10700
 * @tc.desc   test for testFontSetEmbeddedBitmapsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetEmbeddedBitmapsMultipleCalls()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetEmbeddedBitmaps 10 times, and call OH_Drawing_FontIsEmbeddedBitmaps each time to check
    // if the glyph is converted to a bitmap
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetEmbeddedBitmaps(font, i % 2 == 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        bool isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(isEmbeddedBitmaps, i % 2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontIsEmbeddedBitmapsWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10800
 * @tc.desc   test for testFontIsEmbeddedBitmapsWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontIsEmbeddedBitmapsWhenNoSet()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsEmbeddedBitmaps
    bool isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
    EXPECT_EQ(isEmbeddedBitmaps, false);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetEdgingNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10900
 * @tc.desc   test for testFontSetEdgingNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetEdgingNormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontSetEdging enum value OH_Drawing_FontEdging coverage verification, call OH_Drawing_FontGetEdging
    // to get the font edge effect enum type
    OH_Drawing_FontEdging edging[] = {
        FONT_EDGING_ALIAS,
        FONT_EDGING_ANTI_ALIAS,
        FONT_EDGING_SUBPIXEL_ANTI_ALIAS,
    };
    for (OH_Drawing_FontEdging e : edging) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetEdging(font, e);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_FontEdging e2 = OH_Drawing_FontGetEdging(font);
        EXPECT_EQ(e2, e);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetEdgingNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11000
 * @tc.desc   test for testFontSetEdgingNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetEdgingNULL()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. Call OH_Drawing_FontSetEdging with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetEdging(nullptr, FONT_EDGING_ALIAS);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontGetEdging with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetEdging(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetEdgingMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11100
 * @tc.desc   test for testFontSetEdgingMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetEdgingMultipleCalls()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetEdging 10 times (with random enum values), and call OH_Drawing_FontGetEdging each time
    // to get the font edge effect enum type
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dis(0, 2);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontEdging edging = static_cast<OH_Drawing_FontEdging>(dis(gen));
        OH_Drawing_FontSetEdging(font, edging);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_FontEdging edging2 = OH_Drawing_FontGetEdging(font);
        EXPECT_EQ(edging2, edging);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetEdgingWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11200
 * @tc.desc   test for testFontGetEdgingWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetEdgingWhenNoSet()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetEdging
    OH_Drawing_FontEdging edging = OH_Drawing_FontGetEdging(font);
    EXPECT_EQ(edging, FONT_EDGING_ANTI_ALIAS);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasureSingleCharacterNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11300
 * @tc.desc   test for testFontMeasureSingleCharacterNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontMeasureSingleCharacterNormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. All OH_Drawing_FontMeasureSingleCharacter parameters are entered normally, including str single character,
    //  UTF8 encoded Chinese/English characters
    float textWidth = 0.f;
    const char* strOne = "a";
    OH_Drawing_FontMeasureSingleCharacter(font, strOne, &textWidth);
    strOne = "我";
    OH_Drawing_FontMeasureSingleCharacter(font, strOne, &textWidth);
    // 3. All OH_Drawing_FontMeasureSingleCharacter parameters are entered normally, including str multi-character,
    //  UTF8 encoded Chinese/English characters
    const char* strTwo = "你好";
    OH_Drawing_FontMeasureSingleCharacter(font, strTwo, &textWidth);
    strTwo = "baby";
    OH_Drawing_FontMeasureSingleCharacter(font, strTwo, &textWidth);
    // 4. free memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasureSingleCharacterNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11400
 * @tc.desc   test for testFontMeasureSingleCharacterNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontMeasureSingleCharacterNull()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontMeasureSingleCharacter with the parameter font as null
    float textWidth = 0.f;
    const char* strOne = "a";
    OH_Drawing_FontMeasureSingleCharacter(nullptr, strOne, &textWidth);
    // 3. OH_Drawing_FontMeasureSingleCharacter with the parameter str as null
    OH_Drawing_FontMeasureSingleCharacter(font, nullptr, &textWidth);
    // 4. OH_Drawing_FontMeasureSingleCharacter with the parameter textWidth as null
    OH_Drawing_FontMeasureSingleCharacter(font, strOne, nullptr);
    // 5. free memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasureSingleCharacterMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11500
 * @tc.desc   test for testFontMeasureSingleCharacterMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontMeasureSingleCharacterMultipleCalls()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontMeasureSingleCharacter API is called 10 times as a normal input parameter
    const char* str[] = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j" };
    float textWidth = 0.f;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_FontMeasureSingleCharacter(font, str[i], &textWidth);
    }
    // 3. free memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasuretextNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11600
 * @tc.desc   test for testFontMeasuretextNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontMeasuretextNormal()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(bounds, nullptr);
    // 2. OH_Drawing_FontMeasureText enumeration traversal
    const void* text = "abc";
    const size_t byteLength = 3;
    float textWidth = 0.f;
    OH_Drawing_TextEncoding encodes[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF16,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    for (int i = 0; i < 4; i++) {
        OH_Drawing_FontMeasureText(font, text, byteLength, encodes[i], bounds, &textWidth);
    }
    // 3. OH_Drawing_FontMeasureText with the fifth parameter as null(normally)
    OH_Drawing_FontMeasureText(font, text, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth);
    // 4. free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(bounds);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasuretextNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11700
 * @tc.desc   test for testFontMeasuretextNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontMeasuretextNull()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(bounds, nullptr);
    // 2. Call OH_Drawing_FontMeasureText with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    const void* text = "abc";
    const size_t byteLength = 3;
    float textWidth = 0.f;
    EXPECT_EQ(OH_Drawing_FontMeasureText(nullptr, text, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_FontMeasureText with nullptr as the second parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_FontMeasureText(font, nullptr, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_FontMeasureText with nullptr or 0 as the third parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_FontMeasureText(font, text, 0, TEXT_ENCODING_UTF8, bounds, &textWidth),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_FontMeasureText with nullptr as the sixth parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_FontMeasureText(font, text, byteLength, TEXT_ENCODING_UTF8, bounds, nullptr),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(bounds);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasuretextMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11800
 * @tc.desc   test for testFontMeasuretextMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontMeasuretextMultipleCalls()
{
    DrawingNativeFontPart3TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* fonts[10];
    for (int i = 0; i < 10; i++) {
        fonts[i] = OH_Drawing_FontCreate();
        // add assert
        EXPECT_NE(fonts[i], nullptr);
    }
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(bounds, nullptr);
    // 2. Call OH_Drawing_FontMeasureText 10 times
    const void* text = "abc";
    const size_t byteLength = 3;
    float textWidth = 0.f;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_FontMeasureText(fonts[i], text, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth);
    }
    // 3. free memory
    for (int i = 0; i < 10; i++) {
        OH_Drawing_FontDestroy(fonts[i]);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(bounds);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasureSingleCharacter
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11900
 * @tc.desc   test for testFontMeasureSingleCharacter.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestFontMeasureSingleCharacter()
{
    DrawingNativeFontPart3TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetTextSize(font, 50); // 50 means font text size
    const char* strOne = "a";
    const char* strTwo = "你好";
    float textWidth = 0.f;
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(nullptr, strOne, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, nullptr, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strOne, nullptr);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    const char* strThree = "";
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strThree, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strOne, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    EXPECT_TRUE(textWidth > 0);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strTwo, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    EXPECT_TRUE(textWidth > 0);
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS