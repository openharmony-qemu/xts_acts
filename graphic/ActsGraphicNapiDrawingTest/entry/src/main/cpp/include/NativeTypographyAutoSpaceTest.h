//
// Created on 2025/12/27.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYTESTAUTOSPACETEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYTESTAUTOSPACETEST_H

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"
namespace OHOS {
constexpr static float FLOAT_DATA_EPSILON = 1e-6f;
const double DEFAULT_FONT_SIZE = 40;
const double DEFAULT_LAYOUT_WIDTH = 1000;
} // namespace OHOS

struct NativeTypographyAutoSpaceTestContext {
    OH_Drawing_FontCollection* fontCollection_{ nullptr };
    OH_Drawing_TextStyle* txtStyle_{ nullptr };
    OH_Drawing_TypographyCreate* handler_{ nullptr };
    OH_Drawing_Typography* typography_{ nullptr };
    OH_Drawing_TypographyStyle* typoStyle_{ nullptr };
    OH_Drawing_TypographyCreate* handler2_{ nullptr };
    OH_Drawing_Typography* typography2_{ nullptr };
    OH_Drawing_TypographyStyle* typoStyle2_{ nullptr };

    NativeTypographyAutoSpaceTestContext()
        : fontCollection_(nullptr),
          typoStyle_(nullptr),
          handler_(nullptr),
          typography_(nullptr),
          txtStyle_(nullptr),
          handler2_(nullptr),
          typography2_(nullptr),
          typoStyle2_(nullptr)
    {
    }

    ~NativeTypographyAutoSpaceTestContext()
    {
        if (fontCollection_ != nullptr) {
            OH_Drawing_DestroyFontCollection(fontCollection_);
            fontCollection_ = nullptr;
        }
        if (txtStyle_ != nullptr) {
            OH_Drawing_DestroyTextStyle(txtStyle_);
            txtStyle_ = nullptr;
        }
        if (handler_ != nullptr) {
            OH_Drawing_DestroyTypographyHandler(handler_);
            handler_ = nullptr;
        }
        if (typography_ != nullptr) {
            OH_Drawing_DestroyTypography(typography_);
            typography_ = nullptr;
        }
        if (typoStyle_ != nullptr) {
            OH_Drawing_DestroyTypographyStyle(typoStyle_);
            typoStyle_ = nullptr;
        }
        if (handler2_ != nullptr) {
            OH_Drawing_DestroyTypographyHandler(handler2_);
            handler2_ = nullptr;
        }
        if (typography2_ != nullptr) {
            OH_Drawing_DestroyTypography(typography2_);
            typography2_ = nullptr;
        }
        if (typoStyle2_ != nullptr) {
            OH_Drawing_DestroyTypographyStyle(typoStyle2_);
            typoStyle2_ = nullptr;
        }
    }

    void PrepareWorkForTypographyStyleTest()
    {
        txtStyle_ = OH_Drawing_CreateTextStyle();
        ASSERT_NE(txtStyle_, nullptr);
        fontCollection_ = OH_Drawing_CreateSharedFontCollection();
        ASSERT_NE(fontCollection_, nullptr);
        OH_Drawing_SetTextStyleFontSize(txtStyle_, OHOS::DEFAULT_FONT_SIZE);
    }
};

namespace OHOS {
namespace Rosen {
namespace Drawing {
int OHDrawingSetTypographyTextAutoSpaceTest001();
int OHDrawingSetTypographyTextAutoSpaceTest002();
int OHDrawingSetTypographyTextAutoSpaceTest003();
int OHDrawingSetTypographyTextAutoSpaceTest004();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYTESTAUTOSPACETEST_H
