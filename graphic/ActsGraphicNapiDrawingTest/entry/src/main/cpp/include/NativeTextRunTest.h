/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVETEXTRUNTEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVETEXTRUNTEST_H

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

// Text run test constants
constexpr double TEXT_RUN_MAX_WIDTH = 500.0;
constexpr double TEXT_RUN_MAX_WIDTH_GLYPH = 1200.0;
constexpr double TEXT_RUN_FONT_SIZE = 30.0;
constexpr double TEXT_RUN_FONT_SIZE_GLYPH = 100.0;
constexpr int TEXT_RUN_FONT_FAMILIES_COUNT = 1;
constexpr int TEXT_RUN_GLYPH_COUNT = 6;
constexpr int TEXT_RUN_NEGATIVE_INDEX = -1;
constexpr int TEXT_RUN_GLYPH_COUNT_2 = 2;
constexpr int TEXT_RUN_GLYPH_COUNT_1 = 1;
constexpr int TEXT_RUN_GLYPH_COUNT_5 = 5;
constexpr int TEXT_RUN_STRING_INDEX_6 = 6;
constexpr int TEXT_RUN_STRING_INDEX_7 = 7;
constexpr int TEXT_RUN_LOCATION_0 = 0;
constexpr int TEXT_RUN_LOCATION_6 = 6;
constexpr int TEXT_RUN_LOCATION_8 = 8;
constexpr int TEXT_RUN_LOCATION_9 = 9;
constexpr int TEXT_RUN_LOCATION_14 = 14;
constexpr int TEXT_RUN_LOCATION_19 = 19;

struct NativeTextRunTestContext {
    OH_Drawing_TypographyStyle* typeStyle_ = nullptr;
    OH_Drawing_TextStyle* txtStyle_ = nullptr;
    OH_Drawing_FontCollection* fontCollection_ = nullptr;
    OH_Drawing_TypographyCreate* handler_ = nullptr;
    OH_Drawing_Typography* typography_ = nullptr;
    OH_Drawing_Array* runs_ = nullptr;
    OH_Drawing_Array* textLines_ = nullptr;
    std::string text_;

    NativeTextRunTestContext() {}

    ~NativeTextRunTestContext()
    {
        OH_Drawing_DestroyTypography(typography_);
        typography_ = nullptr;
        OH_Drawing_DestroyTypographyHandler(handler_);
        handler_ = nullptr;
        OH_Drawing_DestroyFontCollection(fontCollection_);
        fontCollection_ = nullptr;
        OH_Drawing_DestroyTextStyle(txtStyle_);
        txtStyle_ = nullptr;
        OH_Drawing_DestroyTypographyStyle(typeStyle_);
        typeStyle_ = nullptr;
        text_ = "";
        if (textLines_ != nullptr) {
            OH_Drawing_DestroyTextLines(textLines_);
            textLines_ = nullptr;
        }
        if (runs_ != nullptr) {
            OH_Drawing_DestroyRuns(runs_);
            runs_ = nullptr;
        }
    }

    void PrepareCreateTextLine()
    {
        double maxWidth = TEXT_RUN_MAX_WIDTH;
        typeStyle_ = OH_Drawing_CreateTypographyStyle();
        EXPECT_TRUE(typeStyle_ != nullptr);
        txtStyle_ = OH_Drawing_CreateTextStyle();
        EXPECT_TRUE(txtStyle_ != nullptr);
        fontCollection_ = OH_Drawing_CreateFontCollection();
        EXPECT_TRUE(fontCollection_ != nullptr);
        handler_ = OH_Drawing_CreateTypographyHandler(typeStyle_, fontCollection_);
        EXPECT_TRUE(handler_ != nullptr);
        OH_Drawing_SetTextStyleColor(txtStyle_, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_BLACK, COLOR_RGB_BLACK, COLOR_RGB_BLACK));
        double fontSize = TEXT_RUN_FONT_SIZE;
        OH_Drawing_SetTextStyleFontSize(txtStyle_, fontSize);
        OH_Drawing_SetTextStyleFontWeight(txtStyle_, FONT_WEIGHT_400);
        bool halfLeading = true;
        OH_Drawing_SetTextStyleHalfLeading(txtStyle_, halfLeading);
        const char* fontFamilies[] = { "Roboto" };
        OH_Drawing_SetTextStyleFontFamilies(txtStyle_, TEXT_RUN_FONT_FAMILIES_COUNT, fontFamilies);
        OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
        OH_Drawing_TypographyHandlerAddText(handler_, text_.c_str());
        OH_Drawing_TypographyHandlerPopTextStyle(handler_);
        typography_ = OH_Drawing_CreateTypography(handler_);
        EXPECT_TRUE(typography_ != nullptr);
        OH_Drawing_TypographyLayout(typography_, maxWidth);
    }

    void PrepareCreateTextLineForGlyphDrawing()
    {
        double maxWidth = TEXT_RUN_MAX_WIDTH_GLYPH;
        typeStyle_ = OH_Drawing_CreateTypographyStyle();
        EXPECT_NE(typeStyle_, nullptr);
        txtStyle_ = OH_Drawing_CreateTextStyle();
        EXPECT_NE(txtStyle_, nullptr);
        fontCollection_ = OH_Drawing_CreateFontCollection();
        EXPECT_NE(fontCollection_, nullptr);
        handler_ = OH_Drawing_CreateTypographyHandler(typeStyle_, fontCollection_);
        EXPECT_NE(handler_, nullptr);
        double fontSize = TEXT_RUN_FONT_SIZE_GLYPH;
        OH_Drawing_SetTextStyleFontSize(txtStyle_, fontSize);
        OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
        OH_Drawing_TypographyHandlerAddText(handler_, text_.c_str());
        typography_ = OH_Drawing_CreateTypography(handler_);
        EXPECT_NE(typography_, nullptr);
        OH_Drawing_TypographyLayout(typography_, maxWidth);
        textLines_ = OH_Drawing_TypographyGetTextLines(typography_);
        EXPECT_NE(textLines_, nullptr);
        size_t size = OH_Drawing_GetDrawingArraySize(textLines_);
        EXPECT_TRUE(size != 0);
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines_, 0);
        EXPECT_NE(textLine, nullptr);
        runs_ = OH_Drawing_TextLineGetGlyphRuns(textLine);
        EXPECT_NE(runs_, nullptr);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs_);
        EXPECT_TRUE(runsSize != 0);
    }
};

namespace OHOS {
namespace Rosen {
namespace Drawing {
int RunTest001();
int RunTest002();
int RunTest003();
int RunTest004();
int RunTest005();
int RunTest006();
int RunTest007();
int RunTest008();
int RunTest009();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSGRAPHICNAPIDRAWINGTEST_NATIVETEXTRUNTEST_H
