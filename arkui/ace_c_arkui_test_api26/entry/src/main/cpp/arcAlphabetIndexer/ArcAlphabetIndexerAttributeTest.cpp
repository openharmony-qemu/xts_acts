/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 
#include "../common/common.h"
#include "../manager/PluginManagerTest.h"
 
#include <cstdint>
#include <string>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_render.h>
 
namespace ArkUICapiTest {
 
static napi_value TestArcAlphabetIndexerColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    uint32_t color = COLOR_RED;
    ArkUI_NumberValue value[] = {{.u32 = color}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_COLOR, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_COLOR);
    ASSERT_EQ(result->value[PARAM_0].u32, color);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    uint32_t color = COLOR_GREEN;
    ArkUI_NumberValue value[] = {{.u32 = color}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_COLOR, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_COLOR);
    ASSERT_EQ(result->value[PARAM_0].u32, color);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerSelectedColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    uint32_t selectedColor = COLOR_BLUE;
    ArkUI_NumberValue value[] = {{.u32 = selectedColor}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_SELECTED_COLOR, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_SELECTED_COLOR);
    ASSERT_EQ(result->value[PARAM_0].u32, selectedColor);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerSelected001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    int32_t selected = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = selected}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_SELECTED, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_SELECTED);
    ASSERT_EQ(result->value[PARAM_0].i32, selected);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerSelected002(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    int32_t selected = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = selected}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_SELECTED, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_SELECTED);
    ASSERT_EQ(result->value[PARAM_0].i32, selected);
    NAPI_END;
}
 
static napi_value TestArcAlphabetPopupBackgroundBlurStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    int32_t blurStyle = ARKUI_BLUR_STYLE_NONE;
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_POPUP_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_POPUP_BACKGROUND_BLUR_STYLE);
    ASSERT_EQ(result->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerItemSize001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    float itemSize = PARAM_20;
    ArkUI_NumberValue value[] = {{.f32 = itemSize}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_ITEM_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_ITEM_SIZE);
    ASSERT_EQ(result->value[PARAM_0].f32, itemSize);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerItemSize002(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    float itemSize = PARAM_10;
    ArkUI_NumberValue value[] = {{.f32 = itemSize}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_ITEM_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_ITEM_SIZE);
    ASSERT_EQ(result->value[PARAM_0].f32, itemSize);
    NAPI_END;
}
 
static napi_value TestArcAlphabetFont001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    float fontSize = PARAM_10;
    ArkUI_NumberValue value[] = {{.f32 = fontSize}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_FONT, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_FONT);
    ASSERT_EQ(result->value[PARAM_0].f32, fontSize);
    NAPI_END;
}
 
static napi_value TestArcAlphabetFont002(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    float fontSize = PARAM_20;
    ArkUI_NumberValue value[] = {{.f32 = fontSize}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_FONT, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_FONT);
    ASSERT_EQ(result->value[PARAM_0].f32, fontSize);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerUsePopup001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    int32_t usePopup = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = usePopup}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_USE_POPUP, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_USE_POPUP);
    ASSERT_EQ(result->value[PARAM_0].i32, usePopup);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerUsePopup002(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    int32_t usePopup = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = usePopup}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_USE_POPUP, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_USE_POPUP);
    ASSERT_EQ(result->value[PARAM_0].i32, usePopup);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerPopupFont001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    float popupFontSize = PARAM_20;
    ArkUI_NumberValue value[] = {{.f32 = popupFontSize}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_POPUP_FONT, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_POPUP_FONT);
    ASSERT_EQ(result->value[PARAM_0].f32, popupFontSize);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerSelectedBackgroundColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    uint32_t selectedBackgroundColor = COLOR_YELLOW;
    ArkUI_NumberValue value[] = {{.u32 = selectedBackgroundColor}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_SELECTED_BACKGROUND_COLOR, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_SELECTED_BACKGROUND_COLOR);
    ASSERT_EQ(result->value[PARAM_0].u32, selectedBackgroundColor);
    NAPI_END;
}
 
static napi_value TestArcAlphabetAutoCollapse001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    int32_t autoCollapse = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = autoCollapse}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_AUTO_COLLAPSE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_AUTO_COLLAPSE);
    ASSERT_EQ(result->value[PARAM_0].i32, autoCollapse);
    NAPI_END;
}
 
static napi_value TestArcAlphabetAutoCollapse002(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    int32_t autoCollapse = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = autoCollapse}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_AUTO_COLLAPSE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_AUTO_COLLAPSE);
    ASSERT_EQ(result->value[PARAM_0].i32, autoCollapse);
    NAPI_END;
}
 
static napi_value TestArcAlphabetSelectedFont001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    float selectedFontSize = PARAM_20;
    ArkUI_NumberValue value[] = {{.f32 = selectedFontSize}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_SELECTED_FONT, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_SELECTED_FONT);
    ASSERT_EQ(result->value[PARAM_0].f32, selectedFontSize);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerPopupColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    uint32_t popupColor = COLOR_PURPLE;
    ArkUI_NumberValue value[] = {{.u32 = popupColor}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_POPUP_COLOR, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_POPUP_COLOR);
    ASSERT_EQ(result->value[PARAM_0].u32, popupColor);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerPopupBackgroundColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    uint32_t popupBackgroundColor = COLOR_GRAY;
    ArkUI_NumberValue value[] = {{.u32 = popupBackgroundColor}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_POPUP_BACKGROUND_COLOR, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_POPUP_BACKGROUND_COLOR);
    ASSERT_EQ(result->value[PARAM_0].u32, popupBackgroundColor);
    NAPI_END;
}
 
static napi_value TestArcAlphabetIndexerArray001(napi_env env, napi_callback_info info)
{
    NAPI_START(indexer, ARKUI_NODE_ARC_ALPHABET_INDEXER);
    const char* arrayValue[] = {
        "#", "A", "B", "C", "D", "E", "F", "G"
    };
    ArkUI_AttributeItem item = {.size = PARAM_8, .object = arrayValue};
    auto ret = nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_ARRAY, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
 
} // namespace ArkUICapiTest