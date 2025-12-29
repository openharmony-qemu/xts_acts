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

#include "include/NativeTypographyAutoSpaceTest.h"
#include <cstring>
#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_text_declaration.h>
#include <native_drawing/drawing_text_run.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/NativeCopyStyleTest.h"
#include "include/NativeTextRunTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {
/**
 * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest001
 * @tc.number OHDrawingSetTypographyTextAutoSpaceTest001
 * @tc.desc   test for set auto space when paragraph with single run
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingSetTypographyTextAutoSpaceTest001()
{
    NativeTypographyAutoSpaceTestContext ctx;
    std::string text = "SingRun©2002-2001";
    ctx.PrepareWorkForTypographyStyleTest();

    // paragraph1
    ctx.typoStyle_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle_, true);
    ctx.handler_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler_, text.c_str());
    ctx.typography_ = OH_Drawing_CreateTypography(ctx.handler_);
    ASSERT_NE(ctx.typography_, nullptr);
    OH_Drawing_TypographyLayout(ctx.typography_, OHOS::DEFAULT_LAYOUT_WIDTH);
    double longestLineTrue = OH_Drawing_TypographyGetLongestLine(ctx.typography_);
    double line1True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, 0);
    EXPECT_NEAR(longestLineTrue, line1True, OHOS::FLOAT_DATA_EPSILON);

    // paragraph2
    ctx.typoStyle2_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle2_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle2_, false);
    ctx.handler2_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle2_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler2_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler2_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler2_, text.c_str());
    ctx.typography2_ = OH_Drawing_CreateTypography(ctx.handler2_);
    ASSERT_NE(ctx.typography2_, nullptr);
    OH_Drawing_TypographyLayout(ctx.typography2_, OHOS::DEFAULT_LAYOUT_WIDTH);
    double longestLineFalse = OH_Drawing_TypographyGetLongestLine(ctx.typography2_);
    double line1False = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, 0);
    EXPECT_NEAR(longestLineFalse, line1False, OHOS::FLOAT_DATA_EPSILON);

    // compare paragraph1 and paragraph2
    EXPECT_NEAR(longestLineTrue, longestLineFalse + OHOS::DEFAULT_FONT_SIZE / 8 * 2, OHOS::FLOAT_DATA_EPSILON);
    EXPECT_NEAR(line1True, line1False + OHOS::DEFAULT_FONT_SIZE / 8 * 2, OHOS::FLOAT_DATA_EPSILON);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest002
 * @tc.number OHDrawingSetTypographyTextAutoSpaceTest002
 * @tc.desc   test for set auto space when paragraph with single run and the layout width is at the boundary value.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingSetTypographyTextAutoSpaceTest002()
{
    NativeTypographyAutoSpaceTestContext ctx;
    std::string text = "SingRun©2002-2001";
    ctx.PrepareWorkForTypographyStyleTest();

    // test boundary value：Use longestline without autospace as layout width when autospace enabled, line count + 1
    // paragraph1
    ctx.typoStyle_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle_, true);
    ctx.handler_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler_, text.c_str());
    ctx.typography_ = OH_Drawing_CreateTypography(ctx.handler_);
    ASSERT_NE(ctx.typography_, nullptr);
    double layoutWidth = 388.319641; // boundary value
    OH_Drawing_TypographyLayout(ctx.typography_, layoutWidth);
    double longestLineTrue = OH_Drawing_TypographyGetLongestLine(ctx.typography_);
    double line1True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, 0);
    double line2True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, 1);
    size_t lineCount = OH_Drawing_TypographyGetLineCount(ctx.typography_);
    EXPECT_NEAR(longestLineTrue, std::max(line1True, line2True), OHOS::FLOAT_DATA_EPSILON);
    EXPECT_GT(layoutWidth, longestLineTrue);
    EXPECT_GT(layoutWidth, line1True);
    EXPECT_GT(line2True, 0);

    // paragraph2
    ctx.typoStyle2_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle2_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle2_, false);
    ctx.handler2_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle2_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler2_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler2_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler2_, text.c_str());
    ctx.typography2_ = OH_Drawing_CreateTypography(ctx.handler2_);
    ASSERT_NE(ctx.typography2_, nullptr);
    OH_Drawing_TypographyLayout(ctx.typography2_, layoutWidth);
    double longestLineFalse2 = OH_Drawing_TypographyGetLongestLine(ctx.typography2_);
    double line1False2 = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, 0);
    size_t lineCount2 = OH_Drawing_TypographyGetLineCount(ctx.typography2_);
    EXPECT_NEAR(longestLineFalse2, line1False2, OHOS::FLOAT_DATA_EPSILON);
    EXPECT_NEAR(longestLineFalse2, layoutWidth, OHOS::FLOAT_DATA_EPSILON);
    EXPECT_NEAR(line1False2, layoutWidth, OHOS::FLOAT_DATA_EPSILON);

    // compare paragraph1 and paragraph2
    EXPECT_GT(longestLineFalse2, longestLineTrue);
    EXPECT_GT(line1False2, line1True);
    EXPECT_EQ(lineCount, lineCount2 + 1);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest003
 * @tc.number OHDrawingSetTypographyTextAutoSpaceTest003
 * @tc.desc   test for set auto space when paragraph with many lines
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingSetTypographyTextAutoSpaceTest003()
{
    NativeTypographyAutoSpaceTestContext ctx;
    std::string text = "嫌疑者X的牺牲\n版权所有©2002-2001华为技术有限公司保留一切权利\n卸载USB设备";
    ctx.PrepareWorkForTypographyStyleTest();

    // paragraph1
    ctx.typoStyle_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle_, true);
    ctx.handler_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler_, text.c_str());
    ctx.typography_ = OH_Drawing_CreateTypography(ctx.handler_);
    ASSERT_NE(ctx.typography_, nullptr);
    OH_Drawing_TypographyLayout(ctx.typography_, OHOS::DEFAULT_LAYOUT_WIDTH);
    double longestLineTrue = OH_Drawing_TypographyGetLongestLine(ctx.typography_);
    double line1True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, 0);
    double line2True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, 1);
    double line3True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, 2);
    EXPECT_NEAR(longestLineTrue, std::max(line1True, std::max(line2True, line3True)), OHOS::FLOAT_DATA_EPSILON);

    // paragraph2
    ctx.typoStyle2_ = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle2_, false);
    ctx.handler2_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle2_, ctx.fontCollection_);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler2_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler2_, text.c_str());
    ctx.typography2_ = OH_Drawing_CreateTypography(ctx.handler2_);
    OH_Drawing_TypographyLayout(ctx.typography2_, OHOS::DEFAULT_LAYOUT_WIDTH);
    double longestLineFalse = OH_Drawing_TypographyGetLongestLine(ctx.typography2_);
    double line1False = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, 0);
    double line2False = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, 1);
    double line3False = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, 2);
    EXPECT_NEAR(longestLineFalse, std::max(line1False, std::max(line2False, line3False)), OHOS::FLOAT_DATA_EPSILON);

    // compare paragraph1 and paragraph2
    EXPECT_NEAR(longestLineTrue, longestLineFalse + OHOS::DEFAULT_FONT_SIZE / 8 * 3, OHOS::FLOAT_DATA_EPSILON);
    EXPECT_NEAR(line1True, line1False + OHOS::DEFAULT_FONT_SIZE / 8 * 2, OHOS::FLOAT_DATA_EPSILON);
    EXPECT_NEAR(line2True, line2False + OHOS::DEFAULT_FONT_SIZE / 8 * 3, OHOS::FLOAT_DATA_EPSILON);
    EXPECT_NEAR(line3True, line3False + OHOS::DEFAULT_FONT_SIZE / 8 * 2, OHOS::FLOAT_DATA_EPSILON);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest004
 * @tc.number OHDrawingSetTypographyTextAutoSpaceTest004
 * @tc.desc   test for set auto space when paragraph is many lines and the layout width is at the boundary value.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingSetTypographyTextAutoSpaceTest004()
{
    NativeTypographyAutoSpaceTestContext ctx;
    std::string text = "嫌疑者X的牺牲\n版权所有©2002-2001华为技术有限公司保留一切权利\n卸载USB设备";
    ctx.PrepareWorkForTypographyStyleTest();

    // test boundary value：Use longestline without autospace as layout width when autospace enabled, line count + 1
    // paragraph2
    ctx.typoStyle_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle_, true);
    ctx.handler_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler_, text.c_str());
    ctx.typography_ = OH_Drawing_CreateTypography(ctx.handler_);
    ASSERT_NE(ctx.typography_, nullptr);
    double layoutWidth = 956.159546; // boundary value
    OH_Drawing_TypographyLayout(ctx.typography_, layoutWidth);
    double longestLineTrue = OH_Drawing_TypographyGetLongestLine(ctx.typography_);
    double line1True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, 0);
    double line2True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, 1);
    double line3True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, 2);
    double line4True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, 3);
    size_t lineCount = OH_Drawing_TypographyGetLineCount(ctx.typography_);
    EXPECT_GT(layoutWidth, longestLineTrue);
    EXPECT_GT(layoutWidth, line1True);
    EXPECT_GT(line3True, 0);

    // paragraph2
    ctx.typoStyle2_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle2_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle2_, false);
    ctx.handler2_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle2_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler2_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler2_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler2_, text.c_str());
    ctx.typography2_ = OH_Drawing_CreateTypography(ctx.handler2_);
    ASSERT_NE(ctx.typography2_, nullptr);
    OH_Drawing_TypographyLayout(ctx.typography2_, layoutWidth);
    double longestLineFalse2 = OH_Drawing_TypographyGetLongestLine(ctx.typography2_);
    double line1False2 = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, 0);
    double line2False2 = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, 1);
    double line3False2 = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, 2);
    size_t lineCount2 = OH_Drawing_TypographyGetLineCount(ctx.typography2_);
    EXPECT_NEAR(longestLineFalse2, layoutWidth, OHOS::FLOAT_DATA_EPSILON);
    EXPECT_NEAR(line2False2, layoutWidth, OHOS::FLOAT_DATA_EPSILON);

    // compare paragraph1 and paragraph2
    EXPECT_GT(longestLineFalse2, longestLineTrue);
    EXPECT_GT(line1True, line1False2);
    // The critical width value squeezed the second line down, so the characters are fewer, and the width is shorter.
    EXPECT_GT(line2False2, line2True);
    EXPECT_GT(line4True, line3False2);
    EXPECT_EQ(lineCount, lineCount2 + 1);
    return TEST_SUCCESS_CODE;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS