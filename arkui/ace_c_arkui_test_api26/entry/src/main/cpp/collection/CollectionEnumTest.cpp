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
#include "manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>
 
namespace ArkUICapiTest {
 
static napi_value CollectionEnumTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_001 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_NONE);
    ASSERT_EQ(PARAM_0, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_NONE);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_002 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP);
    ASSERT_EQ(PARAM_1, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_003 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_CLICK);
    ASSERT_EQ(PARAM_2, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_CLICK);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_004 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_LONG_PRESS);
    ASSERT_EQ(PARAM_4, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_LONG_PRESS);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_005 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PAN);
    ASSERT_EQ(PARAM_8, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PAN);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_006 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PINCH);
    ASSERT_EQ(PARAM_16, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PINCH);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_007 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_ROTATION);
    ASSERT_EQ(PARAM_32, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_ROTATION);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_008 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_SWIPE);
    ASSERT_EQ(PARAM_64, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_SWIPE);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_009 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_DRAG);
    ASSERT_EQ(PARAM_128, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_DRAG);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_010(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_010 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TOUCH);
    ASSERT_EQ(PARAM_256, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TOUCH);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_011(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_011 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE);
    ASSERT_EQ(PARAM_1, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_012(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_012 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL);
    ASSERT_EQ(PARAM_2, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_013(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_013 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_OVERLAY);
    ASSERT_EQ(PARAM_4, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_OVERLAY);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_014(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_014 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL);
    ASSERT_EQ(PARAM_4294967295, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_015(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_015 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLBY);
    ASSERT_EQ(PARAM_1, OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLBY);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_016(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_016 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLTO);
    ASSERT_EQ(PARAM_2, OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLTO);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_017(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_017 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_TOAST);
    ASSERT_EQ(PARAM_4, OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_TOAST);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_018(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_018 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_START);
    ASSERT_EQ(PARAM_0, OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_START);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_019(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_019 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_END);
    ASSERT_EQ(PARAM_1, OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_END);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_020(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_020 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_START);
    ASSERT_EQ(PARAM_2, OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_START);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_021(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_021 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_END);
    ASSERT_EQ(PARAM_3, OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_END);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_022(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_022 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_SHOW);
    ASSERT_EQ(PARAM_4, OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_SHOW);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_023(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_023 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_HIDE);
    ASSERT_EQ(PARAM_5, OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_HIDE);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_024(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_024 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_START);
    ASSERT_EQ(PARAM_6, OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_START);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_025(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_025 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_END);
    ASSERT_EQ(PARAM_7, OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_END);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_026(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_026 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_CANCEL);
    ASSERT_EQ(PARAM_8, OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_CANCEL);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_027(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_027 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_TABS_START);
    ASSERT_EQ(PARAM_9, OH_ARKUI_NATIVEMODULE_EVENT_TABS_START);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_028(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_028 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_TABS_END);
    ASSERT_EQ(PARAM_10, OH_ARKUI_NATIVEMODULE_EVENT_TABS_END);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_029(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_029 result=%{public}d",
        OH_ARKUI_NATIVEMODULE_EVENT_TABS_CANCEL);
    ASSERT_EQ(PARAM_11, OH_ARKUI_NATIVEMODULE_EVENT_TABS_CANCEL);
    NAPI_END(Custom);
}

static napi_value CollectionEnumTest_030(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_030 result=%{public}d",
        ARKUI_ERROR_CODE_COMMAND_UNFINISHED);
    ASSERT_EQ(PARAM_106409, ARKUI_ERROR_CODE_COMMAND_UNFINISHED);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_031(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_031 result=%{public}d",
        ARKUI_ERROR_CODE_NODE_NOT_FOUND);
    ASSERT_EQ(PARAM_106410, ARKUI_ERROR_CODE_NODE_NOT_FOUND);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_032(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_032 result=%{public}d",
        ARKUI_ERROR_CODE_RESULT_TOO_LARGE);
    ASSERT_EQ(PARAM_106411, ARKUI_ERROR_CODE_RESULT_TOO_LARGE);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_033(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_033 result=%{public}d",
        ARKUI_ERROR_CODE_RESOURCE_EXHAUSTED);
    ASSERT_EQ(PARAM_106412, ARKUI_ERROR_CODE_RESOURCE_EXHAUSTED);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_034(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_034 result=%{public}d",
        ARKUI_ERROR_CODE_DUPLICATE_NODE_ID);
    ASSERT_EQ(PARAM_106413, ARKUI_ERROR_CODE_DUPLICATE_NODE_ID);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_035(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_035 result=%{public}d",
        ARKUI_ERROR_CODE_COLLECTION_PARTIAL_FAILED);
    ASSERT_EQ(PARAM_106414, ARKUI_ERROR_CODE_COLLECTION_PARTIAL_FAILED);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_036(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_036 result=%{public}d",
        ARKUI_ERROR_CODE_COLLECTION_ITEM_NOT_FOUND);
    ASSERT_EQ(PARAM_106415, ARKUI_ERROR_CODE_COLLECTION_ITEM_NOT_FOUND);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_037(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_037 result=%{public}d",
        ARKUI_ERROR_CODE_COLLECTION_ITEM_ALREADY_TAKEN);
    ASSERT_EQ(PARAM_106416, ARKUI_ERROR_CODE_COLLECTION_ITEM_ALREADY_TAKEN);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_038(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_038 result=%{public}d",
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT);
    ASSERT_EQ(PARAM_0, OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_039(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_039 result=%{public}d",
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_TOP);
    ASSERT_EQ(PARAM_1, OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_TOP);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_040(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_040 result=%{public}d",
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT);
    ASSERT_EQ(PARAM_2, OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_041(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_041 result=%{public}d",
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM);
    ASSERT_EQ(PARAM_3, OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_042(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_042 result=%{public}d",
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_TOP);
    ASSERT_EQ(PARAM_4, OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_TOP);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_043(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_043 result=%{public}d",
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_BOTTOM);
    ASSERT_EQ(PARAM_5, OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_BOTTOM);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_044(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_044 result=%{public}d",
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_TOP);
    ASSERT_EQ(PARAM_6, OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_TOP);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_045(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_045 result=%{public}d",
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_BOTTOM);
    ASSERT_EQ(PARAM_7, OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_BOTTOM);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_046(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_046 result=%{public}d",
        OH_ARKUI_NATIVE_MODULE_UI_JSON_COMPACT);
    ASSERT_EQ(PARAM_0, OH_ARKUI_NATIVE_MODULE_UI_JSON_COMPACT);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_047(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_047 result=%{public}d",
        OH_ARKUI_NATIVE_MODULE_UI_JSON_PRETTY);
    ASSERT_EQ(PARAM_1, OH_ARKUI_NATIVE_MODULE_UI_JSON_PRETTY);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_048(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_048 result=%{public}d",
        ARKUI_NAV_DESTINATION_STATE_ON_ACTIVE);
    ASSERT_EQ(PARAM_8, ARKUI_NAV_DESTINATION_STATE_ON_ACTIVE);
    NAPI_END(Custom);
}
 
static napi_value CollectionEnumTest_049(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "CollectionEnumTest_049 result=%{public}d",
        ARKUI_NAV_DESTINATION_STATE_ON_INACTIVE);
    ASSERT_EQ(PARAM_9, ARKUI_NAV_DESTINATION_STATE_ON_INACTIVE);
    NAPI_END(Custom);
}
}