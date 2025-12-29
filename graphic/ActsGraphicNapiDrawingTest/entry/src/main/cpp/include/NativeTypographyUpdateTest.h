//
// Created on 2025/12/28.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYUPDATETEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYUPDATETEST_H

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

namespace {
const double DEFAULT_FONT_SIZE = 50;
const char* DEFAULT_TEXT = "text";
} // namespace

namespace OHOS {
struct NativeTypographyUpdateTestContext {
    OH_Drawing_TypographyCreate* fHandler{ nullptr };
    OH_Drawing_Typography* fTypography{ nullptr };
    OH_Drawing_TypographyStyle* fTypoStyle{ nullptr };
    OH_Drawing_TextStyle* fTxtStyle{ nullptr };
    int fLayoutWidth{ 50 };

    NativeTypographyUpdateTestContext()
        : fHandler(nullptr), fTypography(nullptr), fTypoStyle(nullptr), fTxtStyle(nullptr), fLayoutWidth(50)
    {
        fTypoStyle = OH_Drawing_CreateTypographyStyle();
        ASSERT_NE(fTypoStyle, nullptr);
        OH_Drawing_SetTypographyTextFontSize(fTypoStyle, DEFAULT_FONT_SIZE);
        fHandler = OH_Drawing_CreateTypographyHandler(fTypoStyle, OH_Drawing_CreateFontCollection());
        ASSERT_NE(fHandler, nullptr);
        fTxtStyle = OH_Drawing_CreateTextStyle();
        ASSERT_NE(fTxtStyle, nullptr);
        OH_Drawing_SetTextStyleFontSize(fTxtStyle, DEFAULT_FONT_SIZE);
        OH_Drawing_TypographyHandlerPushTextStyle(fHandler, fTxtStyle);
        OH_Drawing_TypographyHandlerAddText(fHandler, DEFAULT_TEXT);
        fTypography = OH_Drawing_CreateTypography(fHandler);
        ASSERT_NE(fTypography, nullptr);
        OH_Drawing_TypographyLayout(fTypography, fLayoutWidth);
    }

    ~NativeTypographyUpdateTestContext()
    {
        if (fHandler != nullptr) {
            OH_Drawing_DestroyTypographyHandler(fHandler);
            fHandler = nullptr;
        }
        if (fTypography != nullptr) {
            OH_Drawing_DestroyTypography(fTypography);
            fTypography = nullptr;
        }
        if (fTypoStyle != nullptr) {
            OH_Drawing_DestroyTypographyStyle(fTypoStyle);
            fTypoStyle = nullptr;
        }
        if (fTxtStyle != nullptr) {
            OH_Drawing_DestroyTextStyle(fTxtStyle);
            fTxtStyle = nullptr;
        }
    }

    void PrepareWorkForAlignmentTest()
    {
        fHandler = OH_Drawing_CreateTypographyHandler(fTypoStyle, OH_Drawing_CreateFontCollection());
        ASSERT_NE(fHandler, nullptr);
        fTxtStyle = OH_Drawing_CreateTextStyle();
        ASSERT_NE(fTxtStyle, nullptr);
        OH_Drawing_SetTextStyleFontSize(fTxtStyle, DEFAULT_FONT_SIZE);
        OH_Drawing_TypographyHandlerPushTextStyle(fHandler, fTxtStyle);
        OH_Drawing_TypographyHandlerAddText(fHandler, DEFAULT_TEXT);
        fTypography = OH_Drawing_CreateTypography(fHandler);
        ASSERT_NE(fTypography, nullptr);
        OH_Drawing_TypographyLayout(fTypography, fLayoutWidth);
    }
};

namespace Rosen {
namespace Drawing {
int OHDrawingTypographyUpdate001();
int OHDrawingTypographyUpdate002();
int OHDrawingTypographyUpdate003();
int OHDrawingTypographyUpdate004();
int OHDrawingTypographyUpdate005();
int OHDrawingTypographyUpdate006();
int OHDrawingTypographyUpdate007();
int OHDrawingTypographyUpdate008();
int OHDrawingTypographyUpdate009();
int OHDrawingTypographyUpdate010();
int OHDrawingTypographyUpdate011();
int OHDrawingTypographyUpdate012();
int OHDrawingTypographyUpdate013();
int OHDrawingSetTypographyTextTrailingSpaceOptimized001();
int OHDrawingTypographyUpdateDecorationColor001();
int OHDrawingSetTypographyVerticalAlignment001();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
#endif // ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYUPDATETEST_H
