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

#include "nativeFontNdk.h"
#include "napi/native_api.h"
#include "native_common.h"
#include <cfloat>
#include "native_drawing/drawing_color.h"
#include "native_drawing/drawing_color_filter.h"
#include "native_drawing/drawing_filter.h"
#include "native_drawing/drawing_font.h"
#include "native_drawing/drawing_font_collection.h"
#include "native_drawing/drawing_register_font.h"
#include "native_drawing/drawing_text_declaration.h"
#include "native_drawing/drawing_text_font_descriptor.h"
#include "native_drawing/drawing_text_typography.h"
#include "native_drawing/drawing_text_run.h"
#include "native_drawing/drawing_text_line.h"
#include "native_drawing/drawing_text_lineTypography.h"
#include <cstdio>
#include <cstdlib>
#include <string>
#include "common.h"

#define SUCCESS 0

namespace {
    // 测试常量
    const double DEFAULT_FONT_SIZE = 50;
    const double MAX_WIDTH = 800.0;
    const int ZERO_MINUS_ONE = -1;
    const int MIN_FONT_WEIGHT = 100;
    const int MAX_FONT_WEIGHT = 1000;
    const int TEST_FONT_SIZE = 12;
    const double TEST_LINE_HEIGHT = 1.5;
    const int TEST_TEXT_ALIGN = 1;
    const int INVALID_ATTRIBUTE_ID = 9999;
    const int INVALID_VALUE = -1;
    const float TEST_WIDTH = 200.0f;
    const int TEST_MAX_LINES = 1;
}

napi_value OHDrawingSetTextStyleAttributeInt004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    OH_Drawing_TextStyle* style = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    OH_Drawing_ErrorCode ret = OH_Drawing_SetTextStyleAttributeInt(
        style, TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, MIN_FONT_WEIGHT);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);
    OH_Drawing_DestroyTextStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Text exceeds max lines (returns true)
napi_value OHDrawingTypographyDidExceedMaxLines004(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    
    // Create typography style
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);
    
    // Set max lines on the style (correct usage)
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, TEST_MAX_LINES);
    
    // Create font collection
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);
    
    // Create typography handler (returns OH_Drawing_TypographyCreate*)
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    NAPI_ASSERT_NO_MES(handler != nullptr);
    
    // Create text style
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);
    
    // Configure text style
    OH_Drawing_SetTextStyleFontSize(txtStyle, 16.0);
    const char* fontFamilies[] = {"HarmonyOS Sans SC"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    
    // Push text style to handler
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    
    // Add long text that will exceed max lines
    std::string longText = "This is a very long text that will definitely exceed "
                          "the maximum line limit when rendered with narrow width. "
                          "Adding more content to ensure line breaks occur.";
    OH_Drawing_TypographyHandlerAddText(handler, longText.c_str());
    
    // Create typography from handler
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT_NO_MES(typography != nullptr);
    
    // Layout typography
    OH_Drawing_TypographyLayout(typography, TEST_WIDTH);
    
    // Verify text exceeds max lines
    bool exceeded = OH_Drawing_TypographyDidExceedMaxLines(typography);
    NAPI_ASSERT_NO_MES(exceeded == true);
    
    // Clean up
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler); // Destroy handler, not typography
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyStyleGetEffectiveAlignment003(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    
    // Create typography style
    OH_Drawing_TypographyStyle* style = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);
    
    OH_Drawing_SetTypographyTextAlign(style, TEXT_ALIGN_END);
    
    // Get effective alignment, TEXT_ALIGN_END can't get, refer to its definition
    OH_Drawing_TextAlign alignment = OH_Drawing_TypographyStyleGetEffectiveAlignment(style);
    NAPI_ASSERT_NO_MES(alignment != TEXT_ALIGN_END);
    
    // Clean up
    OH_Drawing_DestroyTypographyStyle(style);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}