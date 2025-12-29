//
// Created on 2025/12/27.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVETEXTRUNTEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVETEXTRUNTEST_H

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

struct NativeTextRunTestContext {
    OH_Drawing_TypographyStyle* typeStyle_ = nullptr;
    OH_Drawing_TextStyle* txtStyle_ = nullptr;
    OH_Drawing_FontCollection* fontCollection_ = nullptr;
    OH_Drawing_TypographyCreate* handler_ = nullptr;
    OH_Drawing_Typography* typography_ = nullptr;
    OH_Drawing_Array* runs_ = nullptr;
    OH_Drawing_Array* textLines_ = nullptr;
    std::string text_;

    NativeTextRunTestContext()
    {
    }

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
        double maxWidth = 500.0;
        typeStyle_ = OH_Drawing_CreateTypographyStyle();
        EXPECT_TRUE(typeStyle_ != nullptr);
        txtStyle_ = OH_Drawing_CreateTextStyle();
        EXPECT_TRUE(txtStyle_ != nullptr);
        fontCollection_ = OH_Drawing_CreateFontCollection();
        EXPECT_TRUE(fontCollection_ != nullptr);
        handler_ = OH_Drawing_CreateTypographyHandler(typeStyle_, fontCollection_);
        EXPECT_TRUE(handler_ != nullptr);
        OH_Drawing_SetTextStyleColor(txtStyle_, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
        double fontSize = 30;
        OH_Drawing_SetTextStyleFontSize(txtStyle_, fontSize);
        OH_Drawing_SetTextStyleFontWeight(txtStyle_, FONT_WEIGHT_400);
        bool halfLeading = true;
        OH_Drawing_SetTextStyleHalfLeading(txtStyle_, halfLeading);
        const char* fontFamilies[] = { "Roboto" };
        OH_Drawing_SetTextStyleFontFamilies(txtStyle_, 1, fontFamilies);
        OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
        OH_Drawing_TypographyHandlerAddText(handler_, text_.c_str());
        OH_Drawing_TypographyHandlerPopTextStyle(handler_);
        typography_ = OH_Drawing_CreateTypography(handler_);
        EXPECT_TRUE(typography_ != nullptr);
        OH_Drawing_TypographyLayout(typography_, maxWidth);
    }

    void PrepareCreateTextLineForGlyphDrawing()
    {
        double maxWidth = 1200.0;
        typeStyle_ = OH_Drawing_CreateTypographyStyle();
        EXPECT_NE(typeStyle_, nullptr);
        txtStyle_ = OH_Drawing_CreateTextStyle();
        EXPECT_NE(txtStyle_, nullptr);
        fontCollection_ = OH_Drawing_CreateFontCollection();
        EXPECT_NE(fontCollection_, nullptr);
        handler_ = OH_Drawing_CreateTypographyHandler(typeStyle_, fontCollection_);
        EXPECT_NE(handler_, nullptr);
        double fontSize = 100;
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
