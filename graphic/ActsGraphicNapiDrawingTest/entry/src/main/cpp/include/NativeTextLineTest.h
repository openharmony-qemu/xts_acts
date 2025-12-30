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
#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVETEXTLINETEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVETEXTLINETEST_H

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

#define NUM_1 1
#define NUM_2 2
#define NUM_3 3
#define NUM_4 4
#define NUM_5 5
#define NUM_6 6
#define NUM_7 7
#define NUM_10 10
#define NUM_20 20
#define NUM_600 600
#define NUM_700 700

struct NativeTextLineTestContext {
    OH_Drawing_TypographyStyle* typoStyle;
    OH_Drawing_TextStyle* txtStyle;
    OH_Drawing_FontCollection* fontCollection;
    OH_Drawing_TypographyCreate* handler;
    OH_Drawing_Typography* typography;

    NativeTextLineTestContext()
        : fontCollection(nullptr), txtStyle(nullptr), handler(nullptr), typography(nullptr), typoStyle(nullptr)
    {
    }

    ~NativeTextLineTestContext()
    {
        if (typography != nullptr) {
            OH_Drawing_DestroyTypography(typography);
            typography = nullptr;
        }
        if (handler != nullptr) {
            OH_Drawing_DestroyTypographyHandler(handler);
            handler = nullptr;
        }
        if (txtStyle != nullptr) {
            OH_Drawing_DestroyTextStyle(txtStyle);
            txtStyle = nullptr;
        }
        if (typoStyle != nullptr) {
            OH_Drawing_DestroyTypographyStyle(typoStyle);
            typoStyle = nullptr;
        }
        if (fontCollection != nullptr) {
            OH_Drawing_DestroyFontCollection(fontCollection);
            fontCollection = nullptr;
        }
    }

    void PrepareCreateTextLine(const std::string& text)
    {
        double maxWidth = 500.0;
        typoStyle = OH_Drawing_CreateTypographyStyle();
        EXPECT_TRUE(typoStyle != nullptr);
        txtStyle = OH_Drawing_CreateTextStyle();
        EXPECT_TRUE(txtStyle != nullptr);
        fontCollection = OH_Drawing_CreateFontCollection();
        EXPECT_TRUE(fontCollection != nullptr);
        handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
        EXPECT_TRUE(handler != nullptr);
        OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
        double fontSize = 30;
        OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
        OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
        bool halfLeading = true;
        OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
        const char* fontFamilies[] = { "Roboto" };
        OH_Drawing_SetTextStyleFontFamilies(txtStyle, NUM_1, fontFamilies);
        OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
        OH_Drawing_TypographyHandlerAddText(handler, text.c_str());
        OH_Drawing_TypographyHandlerPopTextStyle(handler);
        typography = OH_Drawing_CreateTypography(handler);
        EXPECT_TRUE(typography != nullptr);
        OH_Drawing_TypographyLayout(typography, maxWidth);
    }
};

namespace OHOS {
namespace Rosen {
namespace Drawing {
int TextLineTest001();
int TextLineTest002();
int TextLineTest003();
int TextLineTest004();
int TextLineTest005();
int TextLineTest006();
int TextLineTest007();
int TextLineTest008();
int TextLineTest009();
int TextLineTest010();
int TextLineTest011();
int TextLineTest012();
int TextLineTest013();
int TextLineTest014();
int TextLineTest015();
int TextLineTest016();
int TextLineTest017();
int TextLineTest018();
int TextLineTest019();
int TextLineTest020();
int TextLineTest021();
int TextLineTest022();
int TextLineTest023();
int TextLineTest024();
int TextLineTest025();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSGRAPHICNAPIDRAWINGTEST_NATIVETEXTLINETEST_H
