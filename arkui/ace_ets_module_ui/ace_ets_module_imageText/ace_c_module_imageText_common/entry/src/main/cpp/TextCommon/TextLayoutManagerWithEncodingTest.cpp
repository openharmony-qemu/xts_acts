/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"
#include <arkui/styled_string.h>
#include <native_drawing/drawing_text_typography.h>

namespace ArkUICapiTest {

constexpr int32_t ARKUI_ERROR_CODE_NO_ERROR = 0;
constexpr int32_t ARKUI_ERROR_CODE_PARAM_INVALID = 401;
constexpr int32_t TEXT_ENCODING_UTF8 = 0;
constexpr int32_t TEXT_ENCODING_UTF16 = 1;
constexpr int32_t TEXT_ENCODING_INVALID = 99;
constexpr int32_t PARAM_1043 = 1043;

static ArkUI_TextLayoutManager* GetLayoutManagerFromNode(ArkUI_NodeHandle textNode)
{
    if (textNode == nullptr) {
        return nullptr;
    }
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    if (nodeAPI == nullptr) {
        return nullptr;
    }
    auto layoutManagerItem = nodeAPI->getAttribute(textNode, NODE_TEXT_LAYOUT_MANAGER);
    if (layoutManagerItem == nullptr || layoutManagerItem->object == nullptr) {
        return nullptr;
    }
    return reinterpret_cast<ArkUI_TextLayoutManager*>(layoutManagerItem->object);
}

static ArkUI_NodeHandle CreateTextWithContent()
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    if (nodeAPI == nullptr) {
        return nullptr;
    }
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);

    auto controller = OH_ArkUI_TextController_Create();
    if (controller != nullptr) {
        ArkUI_AttributeItem controllerItem = {.object = controller};
        nodeAPI->setAttribute(text, NODE_TEXT_CONTROLLER, &controllerItem);

        OH_ArkUI_SpanStyle *spanStyle = OH_ArkUI_SpanStyle_Create();
        if (spanStyle != nullptr) {
            const OH_ArkUI_SpanStyle *spanStyles[] = {spanStyle};
            ArkUI_StyledString_Descriptor *styledString =
                OH_ArkUI_StyledString_Descriptor_CreateWithString("世界Hello", spanStyles, PARAM_1);
            if (styledString != nullptr) {
                OH_ArkUI_TextController_SetStyledString(controller, styledString);
                OH_ArkUI_StyledString_Descriptor_Destroy(styledString);
            }
            OH_ArkUI_SpanStyle_Destroy(spanStyle);
        }
        OH_ArkUI_TextController_Destroy(controller);
    }

    ArkUI_NumberValue fontSizeValue[] = { { .f32 = 24.0f } };
    ArkUI_AttributeItem fontSizeItem = { fontSizeValue, PARAM_1 };
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &fontSizeItem);

    ArkUI_NumberValue widthValue[] = { { .f32 = 300.0f } };
    ArkUI_AttributeItem widthItem = { widthValue, PARAM_1 };
    nodeAPI->setAttribute(text, NODE_WIDTH, &widthItem);

    ArkUI_NumberValue heightValue[] = { { .f32 = 60.0f } };
    ArkUI_AttributeItem heightItem = { heightValue, PARAM_1 };
    nodeAPI->setAttribute(text, NODE_HEIGHT, &heightItem);

    return text;
}

static napi_value GetGlyphRangeForCharacterRangeWithEncodingTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_Drawing_Range* outGlyphRange = nullptr;
    OH_Drawing_Range* outActualCharRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRangeWithEncoding(
        nullptr, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, &outGlyphRange, &outActualCharRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetGlyphRangeForCharacterRangeWithEncodingTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outGlyphRange = nullptr;
    OH_Drawing_Range* outActualCharRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRangeWithEncoding(
        layoutManager, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, &outGlyphRange, &outActualCharRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetGlyphRangeForCharacterRangeWithEncodingTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outActualCharRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRangeWithEncoding(
        layoutManager, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, nullptr, &outActualCharRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetGlyphRangeForCharacterRangeWithEncodingTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outGlyphRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRangeWithEncoding(
        layoutManager, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, &outGlyphRange, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetGlyphRangeForCharacterRangeWithEncodingTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outGlyphRange = nullptr;
    OH_Drawing_Range* outActualCharRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRangeWithEncoding(
        layoutManager, nullptr, static_cast<OH_ArkUI_TextEncoding>(TEXT_ENCODING_UTF8),
        &outGlyphRange, &outActualCharRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetGlyphRangeForCharacterRangeWithEncodingTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outGlyphRange = nullptr;
    OH_Drawing_Range* outActualCharRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRangeWithEncoding(
        layoutManager, nullptr, static_cast<OH_ArkUI_TextEncoding>(TEXT_ENCODING_UTF16),
        &outGlyphRange, &outActualCharRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetGlyphRangeForCharacterRangeWithEncodingTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outGlyphRange = nullptr;
    OH_Drawing_Range* outActualCharRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRangeWithEncoding(
        layoutManager, nullptr, static_cast<OH_ArkUI_TextEncoding>(TEXT_ENCODING_INVALID),
        &outGlyphRange, &outActualCharRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetGlyphRangeForCharacterRangeWithEncodingTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_Drawing_Range* outGlyphRange = nullptr;
    OH_Drawing_Range* outActualCharRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRangeWithEncoding(
        nullptr, nullptr, static_cast<OH_ArkUI_TextEncoding>(TEXT_ENCODING_UTF8),
        nullptr, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetGlyphRangeForCharacterRangeWithEncodingTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    if (layoutManager == nullptr) {
        OH_Drawing_Range* outGlyphRange = nullptr;
        OH_Drawing_Range* outActualCharRange = nullptr;
        auto ret = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRangeWithEncoding(
            nullptr, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, &outGlyphRange, &outActualCharRange);
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
        NAPI_END(text);
    }
    OH_Drawing_Range* outGlyphRange = nullptr;
    OH_Drawing_Range* outActualCharRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRangeWithEncoding(
        layoutManager, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, &outGlyphRange, &outActualCharRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterRangeForGlyphRangeWithEncodingTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_Drawing_Range* outCharRange = nullptr;
    OH_Drawing_Range* outActualGlyphRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRangeWithEncoding(
        nullptr, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, &outCharRange, &outActualGlyphRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterRangeForGlyphRangeWithEncodingTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outCharRange = nullptr;
    OH_Drawing_Range* outActualGlyphRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRangeWithEncoding(
        layoutManager, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, &outCharRange, &outActualGlyphRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterRangeForGlyphRangeWithEncodingTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outActualGlyphRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRangeWithEncoding(
        layoutManager, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, nullptr, &outActualGlyphRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterRangeForGlyphRangeWithEncodingTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outCharRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRangeWithEncoding(
        layoutManager, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, &outCharRange, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterRangeForGlyphRangeWithEncodingTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outCharRange = nullptr;
    OH_Drawing_Range* outActualGlyphRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRangeWithEncoding(
        layoutManager, nullptr, static_cast<OH_ArkUI_TextEncoding>(TEXT_ENCODING_UTF8),
        &outCharRange, &outActualGlyphRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterRangeForGlyphRangeWithEncodingTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outCharRange = nullptr;
    OH_Drawing_Range* outActualGlyphRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRangeWithEncoding(
        layoutManager, nullptr, static_cast<OH_ArkUI_TextEncoding>(TEXT_ENCODING_UTF16),
        &outCharRange, &outActualGlyphRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterRangeForGlyphRangeWithEncodingTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_Range* outCharRange = nullptr;
    OH_Drawing_Range* outActualGlyphRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRangeWithEncoding(
        layoutManager, nullptr, static_cast<OH_ArkUI_TextEncoding>(TEXT_ENCODING_INVALID),
        &outCharRange, &outActualGlyphRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterRangeForGlyphRangeWithEncodingTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_Drawing_Range* outCharRange = nullptr;
    OH_Drawing_Range* outActualGlyphRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRangeWithEncoding(
        nullptr, nullptr, static_cast<OH_ArkUI_TextEncoding>(TEXT_ENCODING_UTF8),
        nullptr, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterRangeForGlyphRangeWithEncodingTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    if (layoutManager == nullptr) {
        OH_Drawing_Range* outCharRange = nullptr;
        OH_Drawing_Range* outActualGlyphRange = nullptr;
        auto ret = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRangeWithEncoding(
            nullptr, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, &outCharRange, &outActualGlyphRange);
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
        NAPI_END(text);
    }
    OH_Drawing_Range* outCharRange = nullptr;
    OH_Drawing_Range* outActualGlyphRange = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRangeWithEncoding(
        layoutManager, nullptr, OH_ARKUI_TEXT_ENCODING_UTF8, &outCharRange, &outActualGlyphRange);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterPositionAtCoordinateWithEncodingTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_Drawing_PositionAndAffinity* outPos = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinateWithEncoding(
        nullptr, PARAM_0, PARAM_0, OH_ARKUI_TEXT_ENCODING_UTF8, &outPos);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterPositionAtCoordinateWithEncodingTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinateWithEncoding(
        layoutManager, PARAM_0, PARAM_0, OH_ARKUI_TEXT_ENCODING_UTF8, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterPositionAtCoordinateWithEncodingTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_PositionAndAffinity* outPos = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinateWithEncoding(
        layoutManager, PARAM_0, PARAM_0, static_cast<OH_ArkUI_TextEncoding>(TEXT_ENCODING_UTF8), &outPos);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR && ret != ARKUI_ERROR_CODE_PARAM_INVALID) {
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    }
    if (outPos != nullptr) {
        OH_Drawing_DestroyPositionAndAffinity(outPos);
    }
    NAPI_END(text);
}

static napi_value GetCharacterPositionAtCoordinateWithEncodingTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_PositionAndAffinity* outPos = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinateWithEncoding(
        layoutManager, PARAM_0, PARAM_0, static_cast<OH_ArkUI_TextEncoding>(TEXT_ENCODING_UTF16), &outPos);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR && ret != ARKUI_ERROR_CODE_PARAM_INVALID) {
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    }
    if (outPos != nullptr) {
        OH_Drawing_DestroyPositionAndAffinity(outPos);
    }
    NAPI_END(text);
}

static napi_value GetCharacterPositionAtCoordinateWithEncodingTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_PositionAndAffinity* outPos = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinateWithEncoding(
        layoutManager, PARAM_0, PARAM_0,
        static_cast<OH_ArkUI_TextEncoding>(TEXT_ENCODING_INVALID), &outPos);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterPositionAtCoordinateWithEncodingTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_PositionAndAffinity* outPos = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinateWithEncoding(
        layoutManager, PARAM_NEGATIVE_1, PARAM_NEGATIVE_1, OH_ARKUI_TEXT_ENCODING_UTF8, &outPos);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR && ret != ARKUI_ERROR_CODE_PARAM_INVALID) {
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    }
    if (outPos != nullptr) {
        OH_Drawing_DestroyPositionAndAffinity(outPos);
    }
    NAPI_END(text);
}

static napi_value GetCharacterPositionAtCoordinateWithEncodingTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_PositionAndAffinity* outPos = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinateWithEncoding(
        layoutManager, PARAM_10000, PARAM_10000, OH_ARKUI_TEXT_ENCODING_UTF8, &outPos);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR && ret != ARKUI_ERROR_CODE_PARAM_INVALID) {
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    }
    if (outPos != nullptr) {
        OH_Drawing_DestroyPositionAndAffinity(outPos);
    }
    NAPI_END(text);
}

static napi_value GetCharacterPositionAtCoordinateWithEncodingTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_Drawing_PositionAndAffinity* outPos = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinateWithEncoding(
        nullptr, PARAM_0, PARAM_0, OH_ARKUI_TEXT_ENCODING_UTF8, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value GetCharacterPositionAtCoordinateWithEncodingTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_PositionAndAffinity* outPos = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinateWithEncoding(
        layoutManager, PARAM_0_POINT_5, PARAM_0_POINT_5, OH_ARKUI_TEXT_ENCODING_UTF16, &outPos);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR && ret != ARKUI_ERROR_CODE_PARAM_INVALID) {
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    }
    if (outPos != nullptr) {
        OH_Drawing_DestroyPositionAndAffinity(outPos);
    }
    NAPI_END(text);
}

static napi_value GetCharacterPositionAtCoordinateWithEncodingTest_010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto layoutManager = GetLayoutManagerFromNode(text);
    OH_Drawing_PositionAndAffinity* outPos = nullptr;
    auto ret = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinateWithEncoding(
        layoutManager, SIZE_200, SIZE_50, OH_ARKUI_TEXT_ENCODING_UTF8, &outPos);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR && ret != ARKUI_ERROR_CODE_PARAM_INVALID) {
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    }
    if (outPos != nullptr) {
        OH_Drawing_DestroyPositionAndAffinity(outPos);
    }
    NAPI_END(text);
}

}
