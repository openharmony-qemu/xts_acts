/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "../manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node.h>
#include <hilog/log.h>
namespace ArkUICapiTest {

static napi_value TestRenderNodeBlurStyleOption_001(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    ArkUI_RenderBlurStyleOption* option = OH_ArkUI_RenderNodeUtils_CreateBlurStyleOption();
    auto ret = OH_ArkUI_RenderNodeUtils_SetBackgroundBlurOption(rsNode, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_001 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value TestRenderNodeBlurStyleOption_002(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret = OH_ArkUI_RenderNodeUtils_ResetBackgroundBlurOption(rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_002 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value TestRenderNodeBlurStyleOption_003(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    ArkUI_RenderBlurStyleOption* option = OH_ArkUI_RenderNodeUtils_CreateBlurStyleOption();
    auto ret = OH_ArkUI_RenderNodeUtils_SetForegroundBlurOption(rsNode, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_003 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value TestRenderNodeBlurStyleOption_004(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret = OH_ArkUI_RenderNodeUtils_ResetForegroundBlurOption(rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_004 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value TestRenderNodeBlurStyleOption_005(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    ArkUI_RenderBlurStyleOption* option = OH_ArkUI_RenderNodeUtils_CreateBlurStyleOption();
    auto ret = OH_ArkUI_RenderNodeUtils_SetContentBlurOption(rsNode, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_005 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value TestRenderNodeBlurStyleOption_006(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret = OH_ArkUI_RenderNodeUtils_ResetContentBlurOption(rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_006 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value TestRenderNodeBlurStyleOption_007(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    ArkUI_RenderBlurStyleOption* option = OH_ArkUI_RenderNodeUtils_CreateBlurStyleOption();
    auto result = OH_ArkUI_RenderNodeUtils_SetBackgroundBlurOption(adoptRSNode, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_006 result=%{public}d", result);
    OH_ArkUI_RenderNodeUtils_DisposeBlurStyleOption(option);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestRenderNodeBlurStyleOption_008(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto result = OH_ArkUI_RenderNodeUtils_ResetBackgroundBlurOption(adoptRSNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_008 result=%{public}d", result);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestRenderNodeBlurStyleOption_009(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    ArkUI_RenderBlurStyleOption* option = OH_ArkUI_RenderNodeUtils_CreateBlurStyleOption();
    auto result = OH_ArkUI_RenderNodeUtils_SetForegroundBlurOption(adoptRSNode, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_009 result=%{public}d", result);
    OH_ArkUI_RenderNodeUtils_DisposeBlurStyleOption(option);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestRenderNodeBlurStyleOption_010(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);

    auto result = OH_ArkUI_RenderNodeUtils_ResetForegroundBlurOption(adoptRSNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_010 result=%{public}d", result);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestRenderNodeBlurStyleOption_011(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    ArkUI_RenderBlurStyleOption* option = OH_ArkUI_RenderNodeUtils_CreateBlurStyleOption();
    auto result = OH_ArkUI_RenderNodeUtils_SetContentBlurOption(adoptRSNode, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_011 result=%{public}d", result);
    OH_ArkUI_RenderNodeUtils_DisposeBlurStyleOption(option);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestRenderNodeBlurStyleOption_012(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto result = OH_ArkUI_RenderNodeUtils_ResetContentBlurOption(adoptRSNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "Manager", "TestRenderNodeBlurStyleOption_012 result=%{public}d", result);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

// ========== OH_ArkUI_RenderNodeUtils_SetBlurStyleOptionRadius ==========
static napi_value TestRenderNodeBlurStyleOption_013(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);

    ArkUI_RenderBlurStyleOption* option = OH_ArkUI_RenderNodeUtils_CreateBlurStyleOption();
    ASSERT_EQ(option != nullptr, true);
    auto ret = OH_ArkUI_RenderNodeUtils_SetBlurStyleOptionRadius(nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_SetBlurStyleOptionRadius ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);

    ret = OH_ArkUI_RenderNodeUtils_SetBlurStyleOptionRadius(option, -1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_SetBlurStyleOptionRadius -1 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    ret = OH_ArkUI_RenderNodeUtils_SetBlurStyleOptionRadius(option, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_SetBlurStyleOptionRadius 0 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);

    ret = OH_ArkUI_RenderNodeUtils_SetBlurStyleOptionRadius(option, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_SetBlurStyleOptionRadius 1 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);

    auto result = OH_ArkUI_RenderNodeUtils_SetContentBlurOption(rsNode, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_SetContentBlurOption result=%{public}d", result);
    OH_ArkUI_RenderNodeUtils_DisposeBlurStyleOption(option);
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    NAPI_END;
}

// ========== 组合测试 ==========
static napi_value TestRenderNodeBlurStyleOption_014(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(rsNode != nullptr, true);
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    ArkUI_RenderBlurStyleOption* option = OH_ArkUI_RenderNodeUtils_CreateBlurStyleOption();
    OH_ArkUI_RenderNodeUtils_SetBlurStyleOptionRadius(option, 1);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetBackgroundBlurOption(rsNode, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_014 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetForegroundBlurOption(rsNode, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_014 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result3 = OH_ArkUI_RenderNodeUtils_SetContentBlurOption(rsNode, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_014 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_ResetBackgroundBlurOption(rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_014 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result5 = OH_ArkUI_RenderNodeUtils_ResetForegroundBlurOption(rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_014 result5=%{public}d", result5);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result6 = OH_ArkUI_RenderNodeUtils_ResetContentBlurOption(rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_014 result6=%{public}d", result6);
    OH_ArkUI_RenderNodeUtils_DisposeBlurStyleOption(option);
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNode);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

// ========== 组合测试 ==========
static napi_value TestRenderNodeBlurStyleOption_015(napi_env env, napi_callback_info info)
{
    ArkUI_RenderBlurStyleOption* option = OH_ArkUI_RenderNodeUtils_CreateBlurStyleOption();
    OH_ArkUI_RenderNodeUtils_SetBlurStyleOptionRadius(option, 1);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetBackgroundBlurOption(nullptr, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_015 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetForegroundBlurOption(nullptr, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_015 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    auto result3 = OH_ArkUI_RenderNodeUtils_SetContentBlurOption(nullptr, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_015 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_ResetBackgroundBlurOption(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_015 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    auto result5 = OH_ArkUI_RenderNodeUtils_ResetForegroundBlurOption(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_015 result5=%{public}d", result5);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    auto result6 = OH_ArkUI_RenderNodeUtils_ResetContentBlurOption(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TestRenderNodeBlurStyleOption_015 result6=%{public}d", result6);
    OH_ArkUI_RenderNodeUtils_DisposeBlurStyleOption(option);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
}