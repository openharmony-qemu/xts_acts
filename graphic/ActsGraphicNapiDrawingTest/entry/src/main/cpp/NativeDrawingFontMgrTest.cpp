/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, Hardware
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cstring>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_font_mgr.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_text_typography.h>
#include <native_drawing/drawing_typeface.h>
#include "include/NativeCopyStyleTest.h"
#include "include/NativeDrawingFontMgrTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {
/**
 * @tc.name   OH_Drawing_FontMgrTest001
 * @tc.number OH_Drawing_FontMgrTest001
 * @tc.desc   test for creating and destroying font manager.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest001()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest002
 * @tc.number OH_Drawing_FontMgrTest002
 * @tc.desc   test for getting family name.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest002()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    int count = OH_Drawing_FontMgrGetFamilyCount(mgr);
    EXPECT_TRUE(count > 0);

    char* familyName = OH_Drawing_FontMgrGetFamilyName(mgr, 0);
    OH_Drawing_FontMgrDestroyFamilyName(familyName);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest003
 * @tc.number OH_Drawing_FontMgrTest003
 * @tc.desc   test for creating and destroying font style set by font mannager.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest003()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    EXPECT_NE(fontStyleSet, nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest004
 * @tc.number OH_Drawing_FontMgrTest004
 * @tc.desc   test for matching font family by family name.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest004()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrMatchFamily(mgr, matchFamilyName);
    EXPECT_NE(fontStyleSet, nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest005
 * @tc.number OH_Drawing_FontMgrTest005
 * @tc.desc   test for matching font typeface by family name and font style.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest005()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;
    OH_Drawing_Typeface* typeface = OH_Drawing_FontMgrMatchFamilyStyle(mgr, matchFamilyName, normalStyle);
    EXPECT_NE(typeface, nullptr);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest006
 * @tc.number OH_Drawing_FontMgrTest006
 * @tc.desc   test for matching font typeface by family name, font style and specific character.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest006()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest007
 * @tc.number OH_Drawing_FontMgrTest007
 * @tc.desc   test for getting family name.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest007()
{
    int count = OH_Drawing_FontMgrGetFamilyCount(nullptr);
    EXPECT_TRUE(count == 0);
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    char* familyName = OH_Drawing_FontMgrGetFamilyName(nullptr, 0);
    EXPECT_TRUE(familyName == nullptr);
    OH_Drawing_FontMgrDestroyFamilyName(familyName);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest008
 * @tc.number OH_Drawing_FontMgrTest008
 * @tc.desc   test for matching family style.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest008()
{
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(nullptr, 0);
    EXPECT_TRUE(fontStyleSet == nullptr);
    const char* matchFamilyName = "HarmonyOS-Sans";
    fontStyleSet = OH_Drawing_FontMgrMatchFamily(nullptr, matchFamilyName);
    EXPECT_TRUE(fontStyleSet == nullptr);

    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;
    OH_Drawing_Typeface* typeface = OH_Drawing_FontMgrMatchFamilyStyle(nullptr, matchFamilyName, normalStyle);
    EXPECT_TRUE(typeface == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest009
 * @tc.number OH_Drawing_FontMgrTest009
 * @tc.desc   test for matching family style character.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest009()
{
    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(nullptr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_TRUE(CharTypeface == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest010
 * @tc.number OH_Drawing_FontMgrTest010
 * @tc.desc   test for create a typeface for the given index.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest010()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    OH_Drawing_Typeface* typeface = OH_Drawing_FontStyleSetCreateTypeface(fontStyleSet, 0);
    EXPECT_NE(typeface, nullptr);
    typeface = OH_Drawing_FontStyleSetCreateTypeface(nullptr, 0);
    EXPECT_TRUE(typeface == nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest011
 * @tc.number OH_Drawing_FontMgrTest011
 * @tc.desc   test for get font style struct.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest011()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    OH_Drawing_FontStyleStruct normalStyle;
    char** styleName = nullptr;
    normalStyle = OH_Drawing_FontStyleSetGetStyle(fontStyleSet, 0, styleName);
    EXPECT_TRUE(normalStyle.weight == FONT_WEIGHT_400);
    OH_Drawing_FontStyleSetFreeStyleName(styleName);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest012
 * @tc.number OH_Drawing_FontMgrTest012
 * @tc.desc   test for get typeface by match style.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest012()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;
    OH_Drawing_Typeface* typeface = OH_Drawing_FontStyleSetMatchStyle(fontStyleSet, normalStyle);
    EXPECT_NE(typeface, nullptr);

    typeface = OH_Drawing_FontStyleSetMatchStyle(nullptr, normalStyle);
    EXPECT_TRUE(typeface == nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OH_Drawing_FontMgrTest013
 * @tc.number OH_Drawing_FontMgrTest013
 * @tc.desc   test for get font style set.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OH_Drawing_FontMgrTest013()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    int count = OH_Drawing_FontStyleSetCount(fontStyleSet);
    EXPECT_TRUE(count > 0);

    count = OH_Drawing_FontStyleSetCount(nullptr);
    EXPECT_TRUE(count == 0);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterNormalBcp47Null
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0100
 * @tc.desc   test for matching font is not a null pointer, but points to the default font, when bcp47 is a null pointer
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterNormalBcp47Null()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    OH_Drawing_Typeface* typeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, nullptr, 0, ' ');
    EXPECT_NE(typeface, nullptr);
    OH_Drawing_TypefaceDestroy(typeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterEmptyBcp47
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0200
 * @tc.desc   Test for matching font typeface with empty bcp47 array.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterEmptyBcp47()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = {};
    OH_Drawing_Typeface* typeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 0, ' ');

    EXPECT_NE(typeface, nullptr);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight900
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0300
 * @tc.desc   Test for matching font typeface with weight 900.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight900()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_900;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight100
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0400
 * @tc.desc   Test for matching font typeface with weight 100.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight100()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth1
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0500
 * @tc.desc   Test for matching font typeface with width 1.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWidth1()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth9
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0600
 * @tc.desc   Test for matching font typeface with width 9.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWidth9()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterStyleOblique
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0700
 * @tc.desc   Test for matching font typeface with style oblique.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterStyleOblique()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyNameNull
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0800
 * @tc.desc   Test for matching font typeface with familyName null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyNameNull()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = nullptr;
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0900
 * @tc.desc   Test for matching font typeface with familyName null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = nullptr;
    OH_Drawing_FontStyleStruct abnormalStyle;
    abnormalStyle.weight = OH_Drawing_FontWeight(99); // exceeding the defined max value
    abnormalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    abnormalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, abnormalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWidthExceedMaxValue
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0900
 * @tc.desc   Test for matching font typeface with familyName null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWidthExceedMaxValue()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = nullptr;
    OH_Drawing_FontStyleStruct abnormalStyle;
    abnormalStyle.weight = FONT_WEIGHT_100; // exceeding the defined max value
    abnormalStyle.width = OH_Drawing_FontWidth(99);
    abnormalStyle.slant = FONT_STYLE_OBLIQUE;
    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, abnormalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1000
 * @tc.desc   Test for matching font typeface with weight 200.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1100
 * @tc.desc   Test for matching font typeface with weight 300.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight400
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1200
 * @tc.desc   Test for matching font typeface with weight 400.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight400()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight500
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1300
 * @tc.desc   Test for matching font typeface with weight 500.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight500()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_500;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight600
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1400
 * @tc.desc   Test for matching font typeface with weight 600.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight600()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_600;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight700
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1500
 * @tc.desc   Test for matching font typeface with weight 700.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight700()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_700;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight800
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1600
 * @tc.desc   Test for matching font typeface with weight 800.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight800()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_800;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width1
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1700
 * @tc.desc   Test for matching font typeface with width 1.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width1()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth2
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1800
 * @tc.desc   Test for matching font typeface with width 2.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWidth2()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_EXTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth3
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1900
 * @tc.desc   Test for matching font typeface with width 3.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWidth3()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth4
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2000
 * @tc.desc   Test for matching font typeface with width 4.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWidth4()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_SEMI_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth6
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2100
 * @tc.desc   Test for matching font typeface with width 6.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWidth6()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_SEMI_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth7
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2200
 * @tc.desc   Test for matching font typeface with width 7.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWidth7()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth8
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2300
 * @tc.desc   Test for matching font typeface with width 8.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWidth8()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_EXTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width9
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2400
 * @tc.desc   Test for matching font typeface with width 9.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width9()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterStyle0
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2500
 * @tc.desc   Test for matching font typeface with style 0.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterStyle0()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterStyle1
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2600
 * @tc.desc   Test for matching font typeface with style 1.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterStyle1()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_ITALIC;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterStyle2
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2700
 * @tc.desc   Test for matching font typeface with style 2.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterStyle2()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style0
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2800
 * @tc.desc   Test for matching font typeface with weight 200 and style 0.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style0()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style1
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2900
 * @tc.desc   Test for matching font typeface with weight 200 and style 1.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style1()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_ITALIC;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style2
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_3000
 * @tc.desc   Test for matching font typeface with weight 200 and style 2.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style2()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style0
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_3100
 * @tc.desc   Test for matching font typeface with weight 300 and style 0.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style0()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style1
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2900
 * @tc.desc   Test for matching font typeface with weight 300 and style 1.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style1()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_ITALIC;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style2
 * @tc.number SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_3000
 * @tc.desc   Test for matching font typeface with weight 300 and style 2.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style2()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS