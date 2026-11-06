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
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <arkui/ui_info_collection.h>
#include <arkui/ui_json_wrapper.h>

namespace ArkUICapiTest {

namespace {
constexpr int32_t CALLBACK_NOT_INVOKED = PARAM_NEGATIVE_2;
constexpr int32_t CALLBACK_INVOKED_WITH_ERROR = PARAM_NEGATIVE_1;

int32_t g_treeJsonUserDataValue = PARAM_100;
bool g_treeJsonCallbackInvoked = false;
bool g_treeJsonCallbackHasJson = false;
int32_t g_treeJsonCallbackError = CALLBACK_NOT_INVOKED;
} // namespace

static void OnTreeJsonCallback(ArkUI_ContextHandle context, uint64_t requestId, ArkUI_ErrorCode errorCode,
    OH_ArkUI_NativeModule_UIJsonWrapper *json, void *userData)
{
    (void)context;
    (void)requestId;
    (void)userData;
    g_treeJsonCallbackInvoked = true;
    g_treeJsonCallbackError = static_cast<int32_t>(errorCode);
    g_treeJsonCallbackHasJson = (json != nullptr);
    if (json != nullptr) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(json);
    }
}

static OH_ArkUI_NativeModule_UIAgentTreeRequest *CreateTreeRequest(
    OH_ArkUI_NativeModule_UIAgentTreeType treeType)
{
    OH_ArkUI_NativeModule_UIAgentTreeRequest *request = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(treeType, &request);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        return nullptr;
    }
    return request;
}

static napi_value UIAgentGetTreeJsonAsyncTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request != nullptr, true);
    g_treeJsonCallbackInvoked = false;
    g_treeJsonCallbackHasJson = false;
    g_treeJsonCallbackError = CALLBACK_NOT_INVOKED;
    uint64_t requestId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJsonAsync(context, request,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, OnTreeJsonCallback, &g_treeJsonUserDataValue, &requestId);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonAsyncTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE);
    ASSERT_EQ(request != nullptr, true);
    uint64_t requestId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJsonAsync(context, request,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_INDENTED, OnTreeJsonCallback, nullptr, &requestId);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonAsyncTest003(napi_env env, napi_callback_info info)
{
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request != nullptr, true);
    uint64_t requestId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJsonAsync(nullptr, request,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, OnTreeJsonCallback, nullptr, &requestId);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_UI_CONTEXT_INVALID);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonAsyncTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    uint64_t requestId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJsonAsync(context, nullptr,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, OnTreeJsonCallback, nullptr, &requestId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonAsyncTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request != nullptr, true);
    uint64_t requestId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJsonAsync(context, request,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, nullptr, nullptr, &requestId);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonAsyncTest006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJsonAsync(context, request,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, OnTreeJsonCallback, nullptr, nullptr);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonAsyncTest007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request != nullptr, true);
    uint64_t requestId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJsonAsync(context, request,
        static_cast<OH_ArkUI_NativeModule_UIJsonFormat>(PARAM_100), OnTreeJsonCallback, nullptr, &requestId);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonAsyncTest008(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto request1 = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request1 != nullptr, true);
    uint64_t requestId1 = PARAM_0;
    auto ret1 = OH_ArkUI_NativeModule_UIAgentGetTreeJsonAsync(context, request1,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, OnTreeJsonCallback, nullptr, &requestId1);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto request2 = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request2 != nullptr, true);
    uint64_t requestId2 = PARAM_0;
    auto ret2 = OH_ArkUI_NativeModule_UIAgentGetTreeJsonAsync(context, request2,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, OnTreeJsonCallback, nullptr, &requestId2);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_COMMAND_UNFINISHED);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonAsyncCallbackResult(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (!g_treeJsonCallbackInvoked) {
        napi_create_int32(env, CALLBACK_NOT_INVOKED, &result);
        return result;
    }
    if (g_treeJsonCallbackError != ARKUI_ERROR_CODE_NO_ERROR || !g_treeJsonCallbackHasJson) {
        napi_create_int32(env, CALLBACK_INVOKED_WITH_ERROR, &result);
        return result;
    }
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value UIAgentGetTreeJsonTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request != nullptr, true);
    OH_ArkUI_NativeModule_UIJsonWrapper *json = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJson(context, request,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, &json);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(json != nullptr, true);
    if (json != nullptr) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(json);
    }
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE);
    ASSERT_EQ(request != nullptr, true);
    OH_ArkUI_NativeModule_UIJsonWrapper *json = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJson(context, request,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_INDENTED, &json);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(json != nullptr, true);
    if (json != nullptr) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(json);
    }
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonTest003(napi_env env, napi_callback_info info)
{
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request != nullptr, true);
    OH_ArkUI_NativeModule_UIJsonWrapper *json = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJson(nullptr, request,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, &json);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_UI_CONTEXT_INVALID);
    ASSERT_EQ(json == nullptr, true);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    OH_ArkUI_NativeModule_UIJsonWrapper *json = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJson(context, nullptr,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, &json);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(json == nullptr, true);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJson(context, request,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, nullptr);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonTest006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request != nullptr, true);
    OH_ArkUI_NativeModule_UIJsonWrapper *json = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetTreeJson(context, request,
        static_cast<OH_ArkUI_NativeModule_UIJsonFormat>(PARAM_100), &json);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(json == nullptr, true);
    NAPI_END;
}

static napi_value UIAgentGetTreeJsonTest007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto request = CreateTreeRequest(OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL);
    ASSERT_EQ(request != nullptr, true);
    OH_ArkUI_NativeModule_UIJsonWrapper *json1 = nullptr;
    auto ret1 = OH_ArkUI_NativeModule_UIAgentGetTreeJson(context, request,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, &json1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(json1 != nullptr, true);
    OH_ArkUI_NativeModule_UIJsonWrapper *json2 = nullptr;
    auto ret2 = OH_ArkUI_NativeModule_UIAgentGetTreeJson(context, request,
        OH_ARKUI_NATIVE_MODULE_UI_JSON_FORMAT_COMPACT, &json2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(json2 != nullptr, true);
    OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy(request);
    if (json1 != nullptr) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(json1);
    }
    if (json2 != nullptr) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(json2);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
