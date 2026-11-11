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

#include "common/common.h"
#include <arkui/native_interface.h>
#include <arkui/ui_info_collection.h>

namespace ArkUICapiTest {

static napi_value RequestSetFilterOccludedTest001(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetFilterOccludedNodes(request, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value RequestSetFilterOccludedTest002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetFilterOccludedNodes(request, false);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value RequestSetFilterOccludedTest003(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetFilterOccludedNodes(request, false);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value RequestSetFilterOccludedTest004(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetFilterOccludedNodes(request, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value RequestSetFilterOccludedTest005(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetFilterOccludedNodes(nullptr, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value RequestSetOcclusionOpacityThresholdTest001(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetOcclusionOpacityThreshold(request, PARAM_0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value RequestSetOcclusionOpacityThresholdTest002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetOcclusionOpacityThreshold(request, PARAM_1_POINT_0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value RequestSetOcclusionOpacityThresholdTest003(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetOcclusionOpacityThreshold(nullptr, PARAM_0_POINT_5);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value RequestSetOcclusionOpacityThresholdTest004(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetOcclusionOpacityThreshold(request, PARAM_1_POINT_5);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value RequestSetOcclusionOpacityThresholdTest005(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetOcclusionOpacityThreshold(request, PARAM_0_POINT_5);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value RequestSetOcclusionOpacityThresholdTest006(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetOcclusionOpacityThreshold(request, PARAM_NEGATIVE_1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

} // namespace ArkUICapiTest
