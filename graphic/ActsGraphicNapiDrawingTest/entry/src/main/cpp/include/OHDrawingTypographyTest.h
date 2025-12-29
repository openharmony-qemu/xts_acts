//
// Created on 2025/12/28.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef ACTSGRAPHICNAPIDRAWINGTEST_OHDRAWINGTYPOGRAPHYTEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_OHDRAWINGTYPOGRAPHYTEST_H

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

namespace OHOS {

struct OHDrawingTypographyTest {
    OH_Drawing_TypographyStyle* typoStyle_{ nullptr };
    OH_Drawing_TextStyle* txtStyle_{ nullptr };
    OH_Drawing_FontCollection* fontCollection_{ nullptr };
    OH_Drawing_TypographyCreate* handler_{ nullptr };
    OH_Drawing_Typography* typography_{ nullptr };
    OH_Drawing_Bitmap* cBitmap_{ nullptr };
    OH_Drawing_Canvas* canvas_{ nullptr };
    

    OHDrawingTypographyTest()
    {
      
    }

    ~OHDrawingTypographyTest()
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
    
    
void PrepareCreateTextLine(const std::string& text)
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
};

namespace Rosen {
namespace Drawing {
// OH_Drawing_TypographyTest functions (001-086, 102-105, WithIndent)
int OH_Drawing_TypographyTest001();
int OH_Drawing_TypographyTest002();
int OH_Drawing_TypographyTest003();
int OH_Drawing_TypographyTest004();
int OH_Drawing_TypographyTest005();
int OH_Drawing_TypographyTest006();
int OH_Drawing_TypographyTest007();
int OH_Drawing_TypographyTest008();
int OH_Drawing_TypographyTest009();
int OH_Drawing_TypographyTest010();
int OH_Drawing_TypographyTest011();
int OH_Drawing_TypographyTest012();
int OH_Drawing_TypographyTest013();
int OH_Drawing_TypographyTest014();
int OH_Drawing_TypographyTest015();
int OH_Drawing_TypographyTest016();
int OH_Drawing_TypographyTest017();
int OH_Drawing_TypographyTest018();
int OH_Drawing_TypographyTest019();
int OH_Drawing_TypographyTest020();
int OH_Drawing_TypographyTest021();
int OH_Drawing_TypographyTest022();
int OH_Drawing_TypographyTest023();
int OH_Drawing_TypographyTest024();
int OH_Drawing_TypographyTest025();
int OH_Drawing_TypographyTest026();
int OH_Drawing_TypographyTest027();
int OH_Drawing_TypographyTest028();
int OH_Drawing_TypographyTest029();
int OH_Drawing_TypographyTest030();
int OH_Drawing_TypographyTest031();
int OH_Drawing_TypographyTest032();
int OH_Drawing_TypographyTest033();
int OH_Drawing_TypographyTest034();
int OH_Drawing_TypographyTest035();
int OH_Drawing_TypographyTest036();
int OH_Drawing_TypographyTest037();
int OH_Drawing_TypographyTest038();
int OH_Drawing_TypographyTest039();
int OH_Drawing_TypographyTest040();
int OH_Drawing_TypographyTest041();
int OH_Drawing_TypographyTest042();
int OH_Drawing_TypographyTest043();
int OH_Drawing_TypographyTest044();
int OH_Drawing_TypographyTest045();
int OH_Drawing_TypographyTest046();
int OH_Drawing_TypographyTest047();
int OH_Drawing_TypographyTest048();
int OH_Drawing_TypographyTest049();
int OH_Drawing_TypographyTest050();
int OH_Drawing_TypographyTest051();
int OH_Drawing_TypographyTest052();
int OH_Drawing_TypographyTest053();
int OH_Drawing_TypographyTest054();
int OH_Drawing_TypographyTest055();
int OH_Drawing_TypographyTest056();
int OH_Drawing_TypographyTest057();
int OH_Drawing_TypographyTest058();
int OH_Drawing_TypographyTest059();
int OH_Drawing_TypographyTest060();
int OH_Drawing_TypographyTest061();
int OH_Drawing_TypographyTest062();
int OH_Drawing_TypographyTest063();
int OH_Drawing_TypographyTest064();
int OH_Drawing_TypographyTest065();
int OH_Drawing_TypographyTest066();
int OH_Drawing_TypographyTest067();
int OH_Drawing_TypographyTest068();
int OH_Drawing_TypographyTest069();
int OH_Drawing_TypographyTest070();
int OH_Drawing_TypographyTest071();
int OH_Drawing_TypographyTest072();
int OH_Drawing_TypographyTest073();
int OH_Drawing_TypographyTest074();
int OH_Drawing_TypographyTest075();
int OH_Drawing_TypographyTest076();
int OH_Drawing_TypographyTest077();
int OH_Drawing_TypographyTest078();
int OH_Drawing_TypographyTest079();
int OH_Drawing_TypographyTest080();
int OH_Drawing_TypographyTest081();
int OH_Drawing_TypographyTest082();
int OH_Drawing_TypographyTest083();
int OH_Drawing_TypographyTest084();
int OH_Drawing_TypographyTest085();
int OH_Drawing_TypographyTest086();
int OH_Drawing_TypographyTest102();
int OH_Drawing_TypographyTest103();
int OH_Drawing_TypographyTest104();
int OH_Drawing_TypographyTest105();
int OH_Drawing_TypographyTestWithIndent();
// Other functions
int OHDrawingAddTextStyleDecoration001();
int OHDrawingSetTypographyTextTab001();
int OHDrawingTextLineEnumerateCaretOffsets001();
int OHDrawingSetTextHighContrast001();
int OHDrawingSetTextHighContrast002();
int testOHDrawingUnregisterFont001();
int testOHDrawingUnregisterFont002();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif //ACTSGRAPHICNAPIDRAWINGTEST_OHDRAWINGTYPOGRAPHYTEST_H
