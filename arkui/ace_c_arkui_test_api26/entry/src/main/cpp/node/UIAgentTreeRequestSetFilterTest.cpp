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

static napi_value UIAgentTreeRequestSetFilterTest001(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetFilterPureLayoutNodes(request, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetFilterTest002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetFilterPureLayoutNodes(request, false);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetFilterTest003(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetFilterPureLayoutNodes(nullptr, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetInteractionInfoTest001(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetInteractionInfo(request, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetInteractionInfoTest002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetInteractionInfo(request, false);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetInteractionInfoTest003(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetInteractionInfo(nullptr, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetAccessibilityInfoTest001(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetAccessibilityInfo(request, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetAccessibilityInfoTest002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetAccessibilityInfo(request, false);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetAccessibilityInfoTest003(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetAccessibilityInfo(nullptr, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetCollectVisualPropertiesTest001(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetCollectVisualProperties(request, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetCollectVisualPropertiesTest002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetCollectVisualProperties(request, false);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetCollectVisualPropertiesTest003(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetCollectVisualProperties(nullptr, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetCollectFunctionalPropertiesTest001(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetCollectFunctionalProperties(request, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetCollectFunctionalPropertiesTest002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(createRet, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetCollectFunctionalProperties(request, false);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestSetCollectFunctionalPropertiesTest003(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestSetCollectFunctionalProperties(nullptr, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

} // namespace ArkUICapiTest
