/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"
#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {

static napi_value TestSetForceDarkConfig(napi_env env, napi_callback_info info)
{
    auto ret1 = OH_ArkUI_SetForceDarkConfig(nullptr, false, ArkUI_NodeType::ARKUI_NODE_UNDEFINED, nullptr);
    auto ret2 = OH_ArkUI_SetForceDarkConfig(nullptr, true, ArkUI_NodeType::ARKUI_NODE_UNDEFINED, nullptr);
    auto ret3 = OH_ArkUI_SetForceDarkConfig(nullptr, true, ArkUI_NodeType::ARKUI_NODE_TEXT, nullptr);
    auto ret4 = OH_ArkUI_SetForceDarkConfig(nullptr, false, ArkUI_NodeType::ARKUI_NODE_BUTTON,
        [](uint32_t color) {return color;});
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_FORCE_DARK_CONFIG_INVALID);
    NAPI_END;
}

static napi_value TestSetForceDarkConfigNodeTypeInvalid(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto uiContext = OH_ArkUI_GetContextByNode(column);
    auto invalidNodeType = static_cast<ArkUI_NodeType>(9999);
    auto ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, invalidNodeType,
        [](uint32_t color) { return color; });
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_FORCE_DARK_CONFIG_INVALID);
    NAPI_END;
}

static napi_value TestSetForceDarkConfigNodeTypeCustom(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto uiContext = OH_ArkUI_GetContextByNode(column);
    auto ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_CUSTOM, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeCustom result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_SPAN, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeSpan result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_IMAGE_SPAN, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeImageSpan result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_IMAGE, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeImage result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_TOGGLE, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeToggle result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_LOADING_PROGRESS, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeLoadingProgress result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_TEXT_INPUT, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeTextInput result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_TEXT_AREA, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeTextArea result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_PROGRESS, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeProgress result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_CHECKBOX, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeCheckbox result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_XCOMPONENT, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeXComponent result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TestSetForceDarkConfigNodeTypeDatePicker(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto uiContext = OH_ArkUI_GetContextByNode(column);
    auto ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_DATE_PICKER, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeDatePicker result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_TIME_PICKER, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeTimePicker result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_TEXT_PICKER, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeTextPicker result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_CALENDAR_PICKER, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeCalendarPicker result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_SLIDER, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeSlider result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_RADIO, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeRadio result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_IMAGE_ANIMATOR, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeImageAnimator result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_XCOMPONENT_TEXTURE, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeXComponentTexture result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_CHECKBOX_GROUP, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeCheckboxGroup result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_TEXT_EDITOR, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeTextEditor result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_ARC_ALPHABET_INDEXER, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeArcAlphabetIndexer result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TestSetForceDarkConfigNodeTypeStack(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto uiContext = OH_ArkUI_GetContextByNode(column);
    auto ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_STACK, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeStack result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_SWIPER, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeSwiper result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_SCROLL, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeScroll result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_LIST_ITEM, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeListItem result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_LIST_ITEM_GROUP, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeListItemGroup result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_COLUMN, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeColumn result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_ROW, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeRow result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_FLEX, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeFlex result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_REFRESH, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeRefresh result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_WATER_FLOW, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeWaterFlow result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_FLOW_ITEM, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeFlowItem result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TestSetForceDarkConfigNodeTypeGrid(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto uiContext = OH_ArkUI_GetContextByNode(column);
    auto ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_GRID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeGrid result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_GRID_ITEM, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeGridItem result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_CUSTOM_SPAN, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeCustomSpan result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_EMBEDDED_COMPONENT, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeEmbeddedComponent result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_PICKER, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypePicker result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_ARC_LIST, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeArcList result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_ARC_LIST_ITEM, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeArcListItem result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_ARC_SCROLL_BAR, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeArcScrollBar result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_ARC_SWIPER, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeArcSwiper result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_SetForceDarkConfig(uiContext, true, ARKUI_NODE_RELATIVE_CONTAINER, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_SetForceDarkConfig TestSetForceDarkConfigNodeTypeRelativeContainer result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

} // namespace ArkUICapiTest
