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

static napi_value RichEditorEnumTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_TYPE RichEditorEnumTest_001 result=%{public}d",
        NODE_TEXT_EDITOR_TYPE);
    ASSERT_EQ(PARAM_22031, NODE_TEXT_EDITOR_TYPE);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_SHOW_PASSWORD_ICON RichEditorEnumTest_002 result=%{public}d",
        NODE_TEXT_EDITOR_SHOW_PASSWORD_ICON);
    ASSERT_EQ(PARAM_22032, NODE_TEXT_EDITOR_SHOW_PASSWORD_ICON);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_PASSWORD_ICON RichEditorEnumTest_003 result=%{public}d",
        NODE_TEXT_EDITOR_PASSWORD_ICON);
    ASSERT_EQ(PARAM_22033, NODE_TEXT_EDITOR_PASSWORD_ICON);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_ENABLE_AUTO_FILL RichEditorEnumTest_004 result=%{public}d",
        NODE_TEXT_EDITOR_ENABLE_AUTO_FILL);
    ASSERT_EQ(PARAM_22034, NODE_TEXT_EDITOR_ENABLE_AUTO_FILL);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_CONTENT_TYPE RichEditorEnumTest_005 result=%{public}d",
        NODE_TEXT_EDITOR_CONTENT_TYPE);
    ASSERT_EQ(PARAM_22035, NODE_TEXT_EDITOR_CONTENT_TYPE);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_PASSWORD_RULES RichEditorEnumTest_006 result=%{public}d",
        NODE_TEXT_EDITOR_PASSWORD_RULES);
    ASSERT_EQ(PARAM_22036, NODE_TEXT_EDITOR_PASSWORD_RULES);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_ENABLE_FILL_ANIMATION RichEditorEnumTest_007 result=%{public}d",
        NODE_TEXT_EDITOR_ENABLE_FILL_ANIMATION);
    ASSERT_EQ(PARAM_22037, NODE_TEXT_EDITOR_ENABLE_FILL_ANIMATION);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_SHOW_UNDERLINE RichEditorEnumTest_008 result=%{public}d",
        NODE_TEXT_EDITOR_SHOW_UNDERLINE);
    ASSERT_EQ(PARAM_22038, NODE_TEXT_EDITOR_SHOW_UNDERLINE);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_UNDERLINE_COLOR RichEditorEnumTest_009 result=%{public}d",
        NODE_TEXT_EDITOR_UNDERLINE_COLOR);
    ASSERT_EQ(PARAM_22039, NODE_TEXT_EDITOR_UNDERLINE_COLOR);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_010(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_CARET_STYLE RichEditorEnumTest_010 result=%{public}d",
        NODE_TEXT_EDITOR_CARET_STYLE);
    ASSERT_EQ(PARAM_22040, NODE_TEXT_EDITOR_CARET_STYLE);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_011(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_SELECT_ALL RichEditorEnumTest_011 result=%{public}d",
        NODE_TEXT_EDITOR_SELECT_ALL);
    ASSERT_EQ(PARAM_22041, NODE_TEXT_EDITOR_SELECT_ALL);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_012(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_BLUR_ON_SUBMIT RichEditorEnumTest_012 result=%{public}d",
        NODE_TEXT_EDITOR_BLUR_ON_SUBMIT);
    ASSERT_EQ(PARAM_22042, NODE_TEXT_EDITOR_BLUR_ON_SUBMIT);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_013(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_CONTENT_RECT RichEditorEnumTest_013 result=%{public}d",
        NODE_TEXT_EDITOR_CONTENT_RECT);
    ASSERT_EQ(PARAM_22043, NODE_TEXT_EDITOR_CONTENT_RECT);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_014(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_SELECTION_MENU_HIDDEN RichEditorEnumTest_014 result=%{public}d",
        NODE_TEXT_EDITOR_SELECTION_MENU_HIDDEN);
    ASSERT_EQ(PARAM_22044, NODE_TEXT_EDITOR_SELECTION_MENU_HIDDEN);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_015(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_ENABLE_SKIP_PREVIEW_LONG_PRESS RichEditorEnumTest_015 result=%{public}d",
        NODE_TEXT_EDITOR_ENABLE_SKIP_PREVIEW_LONG_PRESS);
    ASSERT_EQ(PARAM_22045, NODE_TEXT_EDITOR_ENABLE_SKIP_PREVIEW_LONG_PRESS);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_016(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_CANCEL_BUTTON RichEditorEnumTest_016 result=%{public}d",
        NODE_TEXT_EDITOR_CANCEL_BUTTON);
    ASSERT_EQ(PARAM_22046, NODE_TEXT_EDITOR_CANCEL_BUTTON);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_017(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_SHOW_COUNTER RichEditorEnumTest_017 result=%{public}d",
        NODE_TEXT_EDITOR_SHOW_COUNTER);
    ASSERT_EQ(PARAM_22047, NODE_TEXT_EDITOR_SHOW_COUNTER);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_018(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_INPUT_FILTER RichEditorEnumTest_018 result=%{public}d",
        NODE_TEXT_EDITOR_INPUT_FILTER);
    ASSERT_EQ(PARAM_22048, NODE_TEXT_EDITOR_INPUT_FILTER);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_019(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_ON_CONTENT_SCROLL RichEditorEnumTest_019 result=%{public}d",
        NODE_TEXT_EDITOR_ON_CONTENT_SCROLL);
    ASSERT_EQ(PARAM_22009, NODE_TEXT_EDITOR_ON_CONTENT_SCROLL);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_020(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_ON_CONTENT_SIZE_CHANGE RichEditorEnumTest_020 result=%{public}d",
        NODE_TEXT_EDITOR_ON_CONTENT_SIZE_CHANGE);
    ASSERT_EQ(PARAM_22010, NODE_TEXT_EDITOR_ON_CONTENT_SIZE_CHANGE);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_021(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_ON_INPUT_FILTER_ERROR RichEditorEnumTest_021 result=%{public}d",
        NODE_TEXT_EDITOR_ON_INPUT_FILTER_ERROR);
    ASSERT_EQ(PARAM_22011, NODE_TEXT_EDITOR_ON_INPUT_FILTER_ERROR);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_022(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_TEXT_EDITOR_TYPE_NORMAL RichEditorEnumTest_022 result=%{public}d",
        OH_ARKUI_TEXT_EDITOR_TYPE_NORMAL);
    ASSERT_EQ(PARAM_0, OH_ARKUI_TEXT_EDITOR_TYPE_NORMAL);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_023(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER RichEditorEnumTest_023 result=%{public}d",
        OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER);
    ASSERT_EQ(PARAM_2, OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_024(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_TEXT_EDITOR_TYPE_PHONE_NUMBER RichEditorEnumTest_024 result=%{public}d",
        OH_ARKUI_TEXT_EDITOR_TYPE_PHONE_NUMBER);
    ASSERT_EQ(PARAM_3, OH_ARKUI_TEXT_EDITOR_TYPE_PHONE_NUMBER);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_025(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_TEXT_EDITOR_TYPE_EMAIL RichEditorEnumTest_025 result=%{public}d",
        OH_ARKUI_TEXT_EDITOR_TYPE_EMAIL);
    ASSERT_EQ(PARAM_5, OH_ARKUI_TEXT_EDITOR_TYPE_EMAIL);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_026(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_TEXT_EDITOR_TYPE_PASSWORD RichEditorEnumTest_026 result=%{public}d",
        OH_ARKUI_TEXT_EDITOR_TYPE_PASSWORD);
    ASSERT_EQ(PARAM_7, OH_ARKUI_TEXT_EDITOR_TYPE_PASSWORD);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_027(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_PASSWORD RichEditorEnumTest_027 result=%{public}d",
        OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_PASSWORD);
    ASSERT_EQ(PARAM_8, OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_PASSWORD);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_028(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_TEXT_EDITOR_TYPE_SCREEN_LOCK_PASSWORD RichEditorEnumTest_028 result=%{public}d",
        OH_ARKUI_TEXT_EDITOR_TYPE_SCREEN_LOCK_PASSWORD);
    ASSERT_EQ(PARAM_9, OH_ARKUI_TEXT_EDITOR_TYPE_SCREEN_LOCK_PASSWORD);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_029(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_TEXT_EDITOR_TYPE_USER_NAME RichEditorEnumTest_029 result=%{public}d",
        OH_ARKUI_TEXT_EDITOR_TYPE_USER_NAME);
    ASSERT_EQ(PARAM_10, OH_ARKUI_TEXT_EDITOR_TYPE_USER_NAME);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_030(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_TEXT_EDITOR_TYPE_NEW_PASSWORD RichEditorEnumTest_030 result=%{public}d",
        OH_ARKUI_TEXT_EDITOR_TYPE_NEW_PASSWORD);
    ASSERT_EQ(PARAM_11, OH_ARKUI_TEXT_EDITOR_TYPE_NEW_PASSWORD);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_031(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_DECIMAL RichEditorEnumTest_031 result=%{public}d",
        OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_DECIMAL);
    ASSERT_EQ(PARAM_12, OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_DECIMAL);
    NAPI_END(Custom);
}

static napi_value RichEditorEnumTest_032(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_TEXT_EDITOR_TYPE_ONE_TIME_CODE RichEditorEnumTest_032 result=%{public}d",
        OH_ARKUI_TEXT_EDITOR_TYPE_ONE_TIME_CODE);
    ASSERT_EQ(PARAM_14, OH_ARKUI_TEXT_EDITOR_TYPE_ONE_TIME_CODE);
    NAPI_END(Custom);
}

}