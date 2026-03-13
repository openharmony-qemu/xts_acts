/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_font.h"
#include "drawing_font_collection.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_text_declaration.h"
#include "drawing_text_typography.h"
#include "drawing_text_line.h"
#include "drawing_text_lineTypography.h"
#include "rosen_text/typography.h"
#include "rosen_text/typography_create.h"
#include "drawing_text_global.h"
#include "drawing_text_blob.h"
#include "global_config/text_global_config.h"
#include "text/text_blob.h"
#include "text_style.h"
#include "typography.h"
#include "drawing_register_font.h"

#include <string>
#include <fstream>

using namespace OHOS::Rosen;
using namespace testing;
using namespace testing::ext;

namespace OHOS {
class OH_Drawing_TypographyTest : public testing::Test {
public:
    void SetUp() override
    {
        typoStyle_ = nullptr;
        txtStyle_ = nullptr;
        fontCollection_ = nullptr;
        handler_ = nullptr;
        typography_ = nullptr;
        cBitmap_ = nullptr;
        canvas_ = nullptr;
    }

    void TearDown() override
    {
        if (canvas_ != nullptr) {
            OH_Drawing_CanvasDestroy(canvas_);
            canvas_ = nullptr;
        }
        if (typography_ != nullptr) {
            OH_Drawing_DestroyTypography(typography_);
            typography_ = nullptr;
        }
        if (handler_ != nullptr) {
            OH_Drawing_DestroyTypographyHandler(handler_);
            handler_ = nullptr;
        }
        if (txtStyle_ != nullptr) {
            OH_Drawing_DestroyTextStyle(txtStyle_);
            txtStyle_ = nullptr;
        }
        if (typoStyle_ != nullptr) {
            OH_Drawing_DestroyTypographyStyle(typoStyle_);
            typoStyle_ = nullptr;
        }
        if (cBitmap_ != nullptr) {
            OH_Drawing_BitmapDestroy(cBitmap_);
            cBitmap_ = nullptr;
        }
        if (fontCollection_ != nullptr) {
            OH_Drawing_DestroyFontCollection(fontCollection_);
            fontCollection_ = nullptr;
        }
    }

    void PrepareCreateTextLine(const std::string& text);

protected:
    OH_Drawing_TypographyStyle* typoStyle_ = nullptr;
    OH_Drawing_TextStyle* txtStyle_ = nullptr;
    OH_Drawing_FontCollection* fontCollection_ = nullptr;
    OH_Drawing_TypographyCreate* handler_ = nullptr;
    OH_Drawing_Typography* typography_ = nullptr;
    OH_Drawing_Bitmap* cBitmap_ = nullptr;
    OH_Drawing_Canvas* canvas_ = nullptr;
};

const double ARC_FONT_SIZE = 30;
const double MAX_WIDTH = 800.0;
const double RADIAN_TER = 180.0;
const double LEFT_POS = 50.0;
const double RIGHT_POS = 150.0;
const char* EXISTFONTPATH = "/system/fonts/HarmonyOS_Sans.ttf";
const char* OHOS_THEME_FONT = "OhosThemeFont";

static TypographyStyle* ConvertToOriginalText(OH_Drawing_TypographyStyle* style)
{
    return reinterpret_cast<TypographyStyle*>(style);
}

static TextStyle* ConvertToOriginalText(OH_Drawing_TextStyle* style)
{
    return reinterpret_cast<TextStyle*>(style);
}

static uint32_t GetTextHighContrast()
{
    auto &instance = Rosen::Drawing::ProcessTextConstrast::Instance();
    return static_cast<uint32_t>(instance.GetTextContrast());
}

void OH_Drawing_TypographyTest::PrepareCreateTextLine(const std::string& text)
{
    double maxWidth = 500.0;
    uint32_t height = 40;
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    EXPECT_TRUE(typoStyle_ != nullptr);
    txtStyle_ = OH_Drawing_CreateTextStyle();
    EXPECT_TRUE(txtStyle_ != nullptr);
    fontCollection_ = OH_Drawing_CreateFontCollection();
    EXPECT_TRUE(fontCollection_ != nullptr);
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    EXPECT_TRUE(handler_ != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle_, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle_, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle_, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle_, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle_, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
    OH_Drawing_TypographyHandlerAddText(handler_, text.c_str());
    OH_Drawing_TypographyHandlerPopTextStyle(handler_);
    typography_ = OH_Drawing_CreateTypography(handler_);
    EXPECT_TRUE(typography_ != nullptr);
    OH_Drawing_TypographyLayout(typography_, maxWidth);
    double position[2] = {10.0, 15.0};
    cBitmap_ = OH_Drawing_BitmapCreate();
    EXPECT_TRUE(cBitmap_ != nullptr);
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    OH_Drawing_BitmapBuild(cBitmap_, width, height, &cFormat);
    canvas_ = OH_Drawing_CanvasCreate();
    EXPECT_TRUE(canvas_ != nullptr);
    OH_Drawing_CanvasBind(canvas_, cBitmap_);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography_, canvas_, position[0], position[1]);
}

/**
 * @tc.name   OH_Drawing_TypographyTest011
 * @tc.number OH_Drawing_TypographyTest011
 * @tc.desc   test for text decoration color
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest011, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecorationColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationColor, 0xFF000000);
    OH_Drawing_SetTextStyleDecorationColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationColor, 0xFFFF0000);
}

/**
 * @tc.name   OH_Drawing_TypographyTest012
 * @tc.number OH_Drawing_TypographyTest012
 * @tc.desc   test for font height
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest012, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontHeight(txtStyle, 0.0);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->heightScale, 0.0);
}

/**
 * @tc.name   OH_Drawing_TypographyTest013
 * @tc.number OH_Drawing_TypographyTest013
 * @tc.desc   test for font families
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest013, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    std::vector<std::string> fontFamiliesResult = {"Roboto"};
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontFamilies, fontFamiliesResult);
}

/**
 * @tc.name   OH_Drawing_TypographyTest014
 * @tc.number OH_Drawing_TypographyTest014
 * @tc.desc   test for font italic
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest014, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontStyle(txtStyle, FONT_STYLE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::NORMAL);
    OH_Drawing_SetTextStyleFontStyle(txtStyle, FONT_STYLE_ITALIC);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::ITALIC);
    OH_Drawing_SetTextStyleFontStyle(txtStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::NORMAL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest015
 * @tc.number OH_Drawing_TypographyTest015
 * @tc.desc   test for font locale
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest015, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleLocale(txtStyle, "en");
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->locale, "en");
}

/**
 * @tc.name   OH_Drawing_TypographyTest016
 * @tc.number OH_Drawing_TypographyTest016
 * @tc.desc   test for typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest016, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);

    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    const float indents[] = {1.2, 3.4};
    OH_Drawing_TypographySetIndents(typography, 2, indents);
    float indent = 3.4;
    EXPECT_EQ(indent, OH_Drawing_TypographyGetIndentsWithIndex(typography, 1));
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(cBitmap));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(cBitmap));

    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));

    EXPECT_EQ(OH_Drawing_TypographyGetHeight(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLongestLine(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetMinIntrinsicWidth(typography) <=
        OH_Drawing_TypographyGetMaxIntrinsicWidth(typography), true);
    EXPECT_EQ(OH_Drawing_TypographyGetAlphabeticBaseline(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetIdeographicBaseline(typography) != 0.0, true);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest017
 * @tc.number OH_Drawing_TypographyTest017
 * @tc.desc   test for break strategy
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest017, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_GREEDY);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::GREEDY);
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_HIGH_QUALITY);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::HIGH_QUALITY);
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_BALANCED);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::BALANCED);
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::GREEDY);
}

/**
 * @tc.name   OH_Drawing_TypographyTest018
 * @tc.number OH_Drawing_TypographyTest018
 * @tc.desc   test for word break type
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest018, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::NORMAL);
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_ALL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::BREAK_ALL);
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_WORD);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::BREAK_WORD);
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::BREAK_WORD);
}

/**
 * @tc.name   OH_Drawing_TypographyTest019
 * @tc.number OH_Drawing_TypographyTest019
 * @tc.desc   test for ellipsis modal
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest019, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, ELLIPSIS_MODAL_HEAD);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::HEAD);
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, ELLIPSIS_MODAL_MIDDLE);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::MIDDLE);
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, ELLIPSIS_MODAL_TAIL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::TAIL);
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::TAIL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest020
 * @tc.number OH_Drawing_TypographyTest020
 * @tc.desc   test for decoration style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest020, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_SOLID);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::SOLID);
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DOUBLE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::DOUBLE);
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DOTTED);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::DOTTED);
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DASHED);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::DASHED);
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_WAVY);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::WAVY);
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::SOLID);
}

/**
 * @tc.name   OH_Drawing_TypographyTest021
 * @tc.number OH_Drawing_TypographyTest021
 * @tc.desc   test for decoration thickness scale
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest021, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecorationThicknessScale(txtStyle, 10);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationThicknessScale, 10);
    OH_Drawing_SetTextStyleDecorationThicknessScale(txtStyle, 20);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationThicknessScale, 20);
}

/**
 * @tc.name   OH_Drawing_TypographyTest022
 * @tc.number OH_Drawing_TypographyTest022
 * @tc.desc   test for letter spacing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest022, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleLetterSpacing(txtStyle, 10);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->letterSpacing, 10);
    OH_Drawing_SetTextStyleLetterSpacing(txtStyle, 20);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->letterSpacing, 20);
}

/**
 * @tc.name   OH_Drawing_TypographyTest023
 * @tc.number OH_Drawing_TypographyTest023
 * @tc.desc   test for word spacing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest023, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleWordSpacing(txtStyle, 10);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->wordSpacing, 10);
    OH_Drawing_SetTextStyleWordSpacing(txtStyle, 20);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->wordSpacing, 20);
}

/**
 * @tc.name   OH_Drawing_TypographyTest024
 * @tc.number OH_Drawing_TypographyTest024
 * @tc.desc   test for ellipsis modal
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest024, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_HEAD);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::HEAD);
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_MIDDLE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::MIDDLE);
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_TAIL);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::TAIL);
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::TAIL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest025
 * @tc.number OH_Drawing_TypographyTest025
 * @tc.desc   test for set ellipsis
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest025, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleEllipsis(txtStyle, "...");
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsis, u"...");
}

/**
 * @tc.name   OH_Drawing_TypographyTest026
 * @tc.number OH_Drawing_TypographyTest026
 * @tc.desc   test for typography and txtStyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest026, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_PlaceholderSpan placeholderSpan = {20, 40,
        ALIGNMENT_OFFSET_AT_BASELINE, TEXT_BASELINE_ALPHABETIC, 10};
    OH_Drawing_TypographyHandlerAddPlaceholder(handler, &placeholderSpan);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    EXPECT_EQ(OH_Drawing_TypographyDidExceedMaxLines(typography) != true, true);
    OH_Drawing_RectHeightStyle heightStyle = RECT_HEIGHT_STYLE_TIGHT;
    OH_Drawing_RectWidthStyle widthStyle = RECT_WIDTH_STYLE_TIGHT;
    EXPECT_EQ(OH_Drawing_TypographyGetRectsForRange(typography, 1, 2, heightStyle, widthStyle) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetRectsForPlaceholders(typography) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetGlyphPositionAtCoordinate(typography, 1, 0) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetGlyphPositionAtCoordinateWithCluster(typography, 1, 0) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetWordBoundary(typography, 1) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLineTextRange(typography, 1, true) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLineCount(typography) != 0, true);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest027
 * @tc.number OH_Drawing_TypographyTest027
 * @tc.desc   test for getting line info for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest027, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    int lineNum = 0;
    bool oneLine = true;
    bool includeWhitespace = true;
    OH_Drawing_LineMetrics lineMetrics;
    EXPECT_EQ(OH_Drawing_TypographyGetLineInfo(typography, lineNum, oneLine, includeWhitespace, nullptr), false);
    EXPECT_EQ(OH_Drawing_TypographyGetLineInfo(typography, -1, oneLine, includeWhitespace, &lineMetrics), false);
    EXPECT_EQ(OH_Drawing_TypographyGetLineInfo(typography, lineNum, oneLine, includeWhitespace, &lineMetrics), true);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest028
 * @tc.number OH_Drawing_TypographyTest028
 * @tc.desc   test for getting line info for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest028, Function | MediumTest | Level1)
{
    OH_Drawing_TextShadow* textShadow = OH_Drawing_CreateTextShadow();
    EXPECT_EQ(textShadow == nullptr, false);
    OH_Drawing_DestroyTextShadow(textShadow);
    OH_Drawing_DestroyTextShadow(nullptr);
}

/**
 * @tc.name   OH_Drawing_TypographyTest029
 * @tc.number OH_Drawing_TypographyTest029
 * @tc.desc   test for font weight of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest029, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_100);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W100);
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_200);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W200);
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_300);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W300);
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_400);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W400);
}

/**
 * @tc.name   OH_Drawing_TypographyTest030
 * @tc.number OH_Drawing_TypographyTest030
 * @tc.desc   test for font style of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest030, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontStyle(typoStyle, FONT_STYLE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontStyle, FontStyle::NORMAL);
    OH_Drawing_SetTypographyTextFontStyle(typoStyle, FONT_STYLE_ITALIC);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontStyle, FontStyle::ITALIC);
    OH_Drawing_SetTypographyTextFontStyle(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontStyle, FontStyle::NORMAL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest031
 * @tc.number OH_Drawing_TypographyTest031
 * @tc.desc   test for font family of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest031, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontFamily(typoStyle, "monospace");
    EXPECT_EQ(ConvertToOriginalText(typoStyle)-> fontFamily, "monospace");
}

/**
 * @tc.name   OH_Drawing_TypographyTest032
 * @tc.number OH_Drawing_TypographyTest032
 * @tc.desc   test for font size of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest032, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontSize(typoStyle, 80);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontSize, 80);
    OH_Drawing_SetTypographyTextFontSize(typoStyle, 40);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontSize, 40);
}

/**
 * @tc.name   OH_Drawing_TypographyTest033
 * @tc.number OH_Drawing_TypographyTest033
 * @tc.desc   test for font height of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest033, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontHeight(typoStyle, 0.0);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->heightScale, 0.0);
}

/**
 * @tc.name   OH_Drawing_TypographyTest034
 * @tc.number OH_Drawing_TypographyTest034
 * @tc.desc   test for font weight of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest034, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_100);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W100);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_200);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W200);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_300);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W300);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_400);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W400);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_500);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W500);
}

/**
 * @tc.name   OH_Drawing_TypographyTest035
 * @tc.number OH_Drawing_TypographyTest035
 * @tc.desc   test for font style of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest035, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, FONT_STYLE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontStyle, FontStyle::NORMAL);
    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, FONT_STYLE_ITALIC);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontStyle, FontStyle::ITALIC);
    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontStyle, FontStyle::NORMAL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest036
 * @tc.number OH_Drawing_TypographyTest036
 * @tc.desc   test for font families of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest036, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTypographyTextLineStyleFontFamilies(typoStyle, 1, fontFamilies);
    std::vector<std::string> fontFamiliesResult = {"Roboto"};
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontFamilies, fontFamiliesResult);
}

/**
 * @tc.name   OH_Drawing_TypographyTest037
 * @tc.number OH_Drawing_TypographyTest037
 * @tc.desc   test for font size of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest037, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontSize(typoStyle, 80);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontSize, 80);
    OH_Drawing_SetTypographyTextLineStyleFontSize(typoStyle, 40);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontSize, 40);
}

/**
 * @tc.name   OH_Drawing_TypographyTest038
 * @tc.number OH_Drawing_TypographyTest038
 * @tc.desc   test for font height of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest038, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontHeight(typoStyle, 0.0);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleHeightScale, 0.0);
}

/**
 * @tc.name   OH_Drawing_TypographyTest039
 * @tc.number OH_Drawing_TypographyTest039
 * @tc.desc   test for spacing scale of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest039, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleSpacingScale(typoStyle, 1.0);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleSpacingScale, 1.0);
    OH_Drawing_SetTypographyTextLineStyleSpacingScale(typoStyle, 2.0);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleSpacingScale, 2.0);
}

/**
 * @tc.name   OH_Drawing_TypographyTest040
 * @tc.number OH_Drawing_TypographyTest040
 * @tc.desc   test for line metrics for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest040, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_NE(handler, nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_FontDescriptor *descriptor = OH_Drawing_CreateFontDescriptor();
    OH_Drawing_FontParser* parser = OH_Drawing_CreateFontParser();

    static const std::string FILE_NAME = "/system/fonts/visibility_list.json";
    std::ifstream fileStream(FILE_NAME.c_str());
    if (fileStream.is_open()) {
        size_t fontNum;
        char** list = OH_Drawing_FontParserGetSystemFontList(parser, &fontNum);
        EXPECT_NE(list, nullptr);
        const char *name = list[0];
        EXPECT_NE(OH_Drawing_FontParserGetFontByName(parser, name), nullptr);
        OH_Drawing_DestroySystemFontList(list, fontNum);
    }
    OH_Drawing_DestroyFontParser(parser);
    OH_Drawing_DestroyFontDescriptor(descriptor);
    OH_Drawing_LineMetrics* vectorMetrics = OH_Drawing_TypographyGetLineMetrics(typography);
    EXPECT_NE(vectorMetrics, nullptr);
    EXPECT_NE(OH_Drawing_LineMetricsGetSize(vectorMetrics), 0);
    OH_Drawing_DestroyLineMetrics(vectorMetrics);
    OH_Drawing_LineMetrics* metrics = new OH_Drawing_LineMetrics();
    EXPECT_TRUE(OH_Drawing_TypographyGetLineMetricsAt(typography, 0, metrics));
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest041
 * @tc.number OH_Drawing_TypographyTest041
 * @tc.desc   test for font weight of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest041, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_600);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W600);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_700);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W700);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_800);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W800);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_900);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W900);
}

/**
 * @tc.name   OH_Drawing_TypographyTest042
 * @tc.number OH_Drawing_TypographyTest042
 * @tc.desc   test for text shadow for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest042, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    EXPECT_EQ(OH_Drawing_TextStyleGetShadows(txtStyle) != nullptr, true);
    OH_Drawing_TextStyleClearShadows(txtStyle);
    OH_Drawing_TextShadow* textshadows = OH_Drawing_TextStyleGetShadows(txtStyle);
    OH_Drawing_DestroyTextShadows(textshadows);
    OH_Drawing_DestroyTextShadows(nullptr);
    OH_Drawing_TextStyleAddShadow(txtStyle, nullptr);
    OH_Drawing_TextStyleAddShadow(txtStyle, OH_Drawing_CreateTextShadow());
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(txtStyle, 0) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(txtStyle, 10000000) == nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(nullptr, 0) == nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowCount(txtStyle), 1);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowCount(nullptr), 0);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest043
 * @tc.number OH_Drawing_TypographyTest043
 * @tc.desc   test for effectiveAlignment, isLineUnlimited, isEllipsized for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest043, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_Font_Metrics fontmetrics;
    EXPECT_EQ(OH_Drawing_TextStyleGetFontMetrics(typography, txtStyle, &fontmetrics), true);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontMetrics(nullptr, txtStyle, &fontmetrics), false);
    OH_Drawing_DisableFontCollectionFallback(OH_Drawing_CreateFontCollection());
    OH_Drawing_DisableFontCollectionFallback(nullptr);
    OH_Drawing_DisableFontCollectionSystemFont(OH_Drawing_CreateFontCollection());
    OH_Drawing_SetTypographyTextEllipsis(typoStyle, text);
    OH_Drawing_SetTypographyTextLocale(typoStyle, text);
    OH_Drawing_SetTypographyTextSplitRatio(typoStyle, fontSize);
    OH_Drawing_TypographyGetTextStyle(typoStyle);
    EXPECT_EQ(OH_Drawing_TypographyGetEffectiveAlignment(typoStyle) >= 0, true);
    EXPECT_EQ(OH_Drawing_TypographyIsLineUnlimited(typoStyle) != 0, true);
    EXPECT_EQ(OH_Drawing_TypographyIsEllipsized(typoStyle) != 0, true);
    OH_Drawing_SetTypographyTextStyle(typoStyle, txtStyle);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest052
 * @tc.number OH_Drawing_TypographyTest052
 * @tc.desc   test for setting the mode of leading over and under text
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest052, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_ALL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textHeightBehavior, TextHeightBehavior::ALL);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_FIRST_ASCENT);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textHeightBehavior, TextHeightBehavior::DISABLE_FIRST_ASCENT);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_LAST_ASCENT);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textHeightBehavior, TextHeightBehavior::DISABLE_LAST_ASCENT);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_ALL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textHeightBehavior, TextHeightBehavior::DISABLE_ALL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest076
 * @tc.number OH_Drawing_TypographyTest076
 * @tc.desc   test for sets and gets isPlaceholder for TextStyle objects
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest076, Function | MediumTest | Level1)
{
    EXPECT_EQ(OH_Drawing_TextStyleIsPlaceholder(nullptr), false);
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_EQ(OH_Drawing_TextStyleIsPlaceholder(txtStyle), false);
    OH_Drawing_TextStyleSetPlaceholder(nullptr);
    OH_Drawing_TextStyleSetPlaceholder(txtStyle);
    EXPECT_EQ(OH_Drawing_TextStyleIsPlaceholder(txtStyle), true);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->isPlaceholder, true);
    OH_Drawing_DestroyTextStyle(txtStyle);
}

/**
 * @tc.name   OH_Drawing_TypographyTest079
 * @tc.number OH_Drawing_TypographyTest079
 * @tc.desc   test for setting the hinting of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest079, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyStyleSetHintsEnabled(typoStyle, true);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->hintingIsOn, true);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
}

/**
 * @tc.name   OHDrawingSetTypographyTextTab001
 * @tc.number OHDrawingSetTypographyTextTab001
 * @tc.desc   test for Set Typography Text Tab
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OHDrawingSetTypographyTextTab001, Function | MediumTest | Level1)
{
    OH_Drawing_TextTab* textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, -1.0);
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextTab(typoStyle, textTab);
    OH_Drawing_SetTypographyTextTab(nullptr, textTab);
    OH_Drawing_SetTypographyTextTab(typoStyle, nullptr);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->tab.alignment, TextAlign::LEFT);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->tab.location, -1.0);
    OH_Drawing_DestroyTextTab(textTab);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
}

/**
 * @tc.name   OHDrawingSetTextHighContrast001
 * @tc.number OHDrawingSetTextHighContrast001
 * @tc.desc   test for text high contrast mode
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OHDrawingSetTextHighContrast001, Function | MediumTest | Level1)
{
    OH_Drawing_SetTextHighContrast(OH_Drawing_TextHighContrast::TEXT_FOLLOW_SYSTEM_HIGH_CONTRAST);
    EXPECT_EQ(GetTextHighContrast(), OH_Drawing_TextHighContrast::TEXT_FOLLOW_SYSTEM_HIGH_CONTRAST);

    OH_Drawing_SetTextHighContrast(OH_Drawing_TextHighContrast::TEXT_APP_DISABLE_HIGH_CONTRAST);
    EXPECT_EQ(GetTextHighContrast(), OH_Drawing_TextHighContrast::TEXT_APP_DISABLE_HIGH_CONTRAST);

    OH_Drawing_SetTextHighContrast(OH_Drawing_TextHighContrast::TEXT_APP_ENABLE_HIGH_CONTRAST);
    EXPECT_EQ(GetTextHighContrast(), OH_Drawing_TextHighContrast::TEXT_APP_ENABLE_HIGH_CONTRAST);
}

/**
 * @tc.name   OHDrawingSetTextHighContrast002
 * @tc.number OHDrawingSetTextHighContrast002
 * @tc.desc   test for text high contrast mode(Invalid)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OHDrawingSetTextHighContrast002, Function | MediumTest | Level1)
{
    uint32_t preValue = GetTextHighContrast();
    OH_Drawing_SetTextHighContrast(static_cast<OH_Drawing_TextHighContrast>(Rosen::SrvText::TEXT_HIGH_CONTRAST_BUTT));
    EXPECT_EQ(GetTextHighContrast(), preValue);
}
}