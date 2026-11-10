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

static napi_value UIAgentTreeRequestCreateTest001(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestCreateTest002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE, &request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestCreateTest003(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentTreeRequestCreateTest004(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        static_cast<OH_ArkUI_NativeModule_UIAgentTreeType>(PARAM_2), &request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentTreeRequestCreateTest005(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request1 = nullptr;
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request2 = nullptr;
    auto ret1 = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request1 != nullptr, true);
    auto ret2 = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE, &request2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request2 != nullptr, true);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request1);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request2);
    NAPI_END;
}

static napi_value UIAgentTreeRequestCreateTest006(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(PARAM_0, OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(PARAM_1, OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE);
    NAPI_END;
}

static napi_value UIAgentTreeRequestCreateTest007(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(nullptr);
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(request != nullptr, true);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    NAPI_END;
}

static napi_value UIAgentTreeRequestCreateTest008(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(PARAM_106411, ARKUI_ERROR_CODE_RESULT_TOO_LARGE);
    ASSERT_EQ(PARAM_106412, ARKUI_ERROR_CODE_RESOURCE_EXHAUSTED);
    ASSERT_EQ(PARAM_106414, ARKUI_ERROR_CODE_COLLECTION_PARTIAL_FAILED);
    NAPI_END;
}

} // namespace ArkUICapiTest
