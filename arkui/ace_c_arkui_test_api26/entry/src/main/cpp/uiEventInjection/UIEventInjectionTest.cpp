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
#include <arkui/native_node.h>
#include <arkui/ui_json_wrapper.h>
#include <arkui/ui_event_injection.h>
#include <cstdint>
#include <cstring>
#include <string>

namespace ArkUICapiTest {

static int32_t g_injectionCallbackResult = PARAM_NEGATIVE_1;
static bool g_injectionCallbackInvoked = false;

static void TestInjectionCallback(OH_ArkUI_NativeModule_UIEventInjection_ResultCode result, void *userData)
{
    g_injectionCallbackResult = static_cast<int32_t>(result);
    g_injectionCallbackInvoked = true;
}

static OH_ArkUI_NativeModule_UIJsonWrapper *CreateValidCommand()
{
    const char *jsonStr = "{\"schemaVersion\": 1, \"cmd\": {\"type\": \"click\", \"action_info\": {}}}";
    size_t jsonSize = std::strlen(jsonStr);
    OH_ArkUI_NativeModule_UIJsonWrapper *wrapper = nullptr;
    OH_ArkUI_NativeModule_UIJsonWrapperCreate(jsonStr, jsonSize, &wrapper);
    return wrapper;
}

static napi_value UIEventInjectionResultCodeTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_SUCCESS, PARAM_0);
    NAPI_END;
}

static napi_value UIEventInjectionResultCodeTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_TARGET_NOT_FOUND, PARAM_1);
    NAPI_END;
}

static napi_value UIEventInjectionResultCodeTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_COMMAND_NOT_SUPPORTED, PARAM_2);
    NAPI_END;
}

static napi_value UIEventInjectionResultCodeTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_INTERRUPTED_BY_USER, PARAM_3);
    NAPI_END;
}

static napi_value UIEventInjectCompositeCommandTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    uint32_t uniqueId = 0;
    auto getIdRet = OH_ArkUI_NodeUtils_GetNodeUniqueId(column, &uniqueId);
    ASSERT_EQ(getIdRet, ARKUI_ERROR_CODE_NO_ERROR);
    auto command = CreateValidCommand();
    ASSERT_EQ(command != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
        context, uniqueId, command, TestInjectionCallback, nullptr);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_NO_ERROR, ARKUI_ERROR_CODE_COMMAND_UNFINISHED });
    if (errorRet) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
        return errorRet;
    }
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
    NAPI_END;
}

static napi_value UIEventInjectCompositeCommandTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto command = CreateValidCommand();
    auto ret = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
        nullptr, PARAM_1, command, TestInjectionCallback, nullptr);
    ASSERT_EQ(static_cast<int32_t>(ret), ARKUI_ERROR_CODE_UI_CONTEXT_INVALID);
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
    NAPI_END;
}

static napi_value UIEventInjectCompositeCommandTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
        context, PARAM_1, nullptr, TestInjectionCallback, nullptr);
    ASSERT_EQ(static_cast<int32_t>(ret), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIEventInjectCompositeCommandTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto command = CreateValidCommand();
    ASSERT_EQ(command != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
        context, PARAM_1, command, nullptr, nullptr);
    ASSERT_EQ(static_cast<int32_t>(ret), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
    NAPI_END;
}

static napi_value UIEventInjectCompositeCommandTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    const uint32_t invalidUniqueId = 0xFFFFFFFF;
    auto command = CreateValidCommand();
    ASSERT_EQ(command != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
        context, invalidUniqueId, command, TestInjectionCallback, nullptr);
    ASSERT_EQ(static_cast<int32_t>(ret), ARKUI_ERROR_CODE_NODE_NOT_FOUND);
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
    NAPI_END;
}

static napi_value UIEventInjectCompositeCommandTest006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    uint32_t uniqueId = 0;
    auto getIdRet = OH_ArkUI_NodeUtils_GetNodeUniqueId(column, &uniqueId);
    ASSERT_EQ(getIdRet, ARKUI_ERROR_CODE_NO_ERROR);
    auto command = CreateValidCommand();
    ASSERT_EQ(command != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
        context, uniqueId, command, TestInjectionCallback, nullptr);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_NO_ERROR, ARKUI_ERROR_CODE_COMMAND_UNFINISHED });
    if (errorRet) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
        return errorRet;
    }
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
    NAPI_END;
}

static napi_value UIEventInjectCompositeCommandTest007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    const char *invalidJson = "invalid json";
    size_t jsonSize = std::strlen(invalidJson);
    OH_ArkUI_NativeModule_UIJsonWrapper *wrapper = nullptr;
    auto createRet = OH_ArkUI_NativeModule_UIJsonWrapperCreate(invalidJson, jsonSize, &wrapper);
    if (createRet == ARKUI_ERROR_CODE_NO_ERROR && wrapper != nullptr) {
        auto ret = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
            context, PARAM_1, wrapper, TestInjectionCallback, nullptr);
        auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
            { ARKUI_ERROR_CODE_PARAM_INVALID, ARKUI_ERROR_CODE_NODE_NOT_FOUND });
        if (errorRet) {
            OH_ArkUI_NativeModule_UIJsonWrapperDestroy(wrapper);
            return errorRet;
        }
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(wrapper);
    } else {
        auto ret = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
            context, PARAM_1, nullptr, TestInjectionCallback, nullptr);
        ASSERT_EQ(static_cast<int32_t>(ret), ARKUI_ERROR_CODE_PARAM_INVALID);
    }
    NAPI_END;
}

static napi_value UIEventInjectCompositeCommandTest008(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
        nullptr, PARAM_1, nullptr, nullptr, nullptr);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_UI_CONTEXT_INVALID, ARKUI_ERROR_CODE_PARAM_INVALID });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

static napi_value UIEventInjectCompositeCommandTest009(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    uint32_t uniqueId = 0;
    auto getIdRet = OH_ArkUI_NodeUtils_GetNodeUniqueId(column, &uniqueId);
    ASSERT_EQ(getIdRet, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
        context, uniqueId, nullptr, nullptr, nullptr);
    ASSERT_EQ(static_cast<int32_t>(ret), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIEventInjectCompositeCommandTest010(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    uint32_t uniqueId = 0;
    auto getIdRet = OH_ArkUI_NodeUtils_GetNodeUniqueId(column, &uniqueId);
    ASSERT_EQ(getIdRet, ARKUI_ERROR_CODE_NO_ERROR);
    auto command = CreateValidCommand();
    ASSERT_EQ(command != nullptr, true);
    int32_t userDataValue = PARAM_100;
    auto ret = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
        context, uniqueId, command, TestInjectionCallback, &userDataValue);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_NO_ERROR, ARKUI_ERROR_CODE_COMMAND_UNFINISHED });
    if (errorRet) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
        return errorRet;
    }
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
    NAPI_END;
}

static napi_value UIEventInjectCompositeCommandTest011(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    uint32_t uniqueId = 0;
    ASSERT_EQ(OH_ArkUI_NodeUtils_GetNodeUniqueId(column, &uniqueId), ARKUI_ERROR_CODE_NO_ERROR);
    auto command = CreateValidCommand();
    ASSERT_EQ(command != nullptr, true);
    auto ret1 = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
        context, uniqueId, command, TestInjectionCallback, nullptr);
    auto errorRet1 = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret1),
        { ARKUI_ERROR_CODE_NO_ERROR, ARKUI_ERROR_CODE_COMMAND_UNFINISHED });
    if (errorRet1) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
        return errorRet1;
    }
    auto ret2 = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(
        context, uniqueId, command, TestInjectionCallback, nullptr);
    auto errorRet2 = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret2),
        { ARKUI_ERROR_CODE_NO_ERROR, ARKUI_ERROR_CODE_COMMAND_UNFINISHED });
    if (errorRet2) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
        return errorRet2;
    }
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
    NAPI_END;
}

static napi_value UIEventInjectionCallbackTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(g_injectionCallbackInvoked, true);
    auto errorRet = ErrCodeAnyOfFailed(env, g_injectionCallbackResult,
        { OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_SUCCESS,
          OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_TARGET_NOT_FOUND,
          OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_COMMAND_NOT_SUPPORTED,
          OH_ARKUI_NATIVE_MODULE_UI_EVENT_INJECTION_RESULT_INTERRUPTED_BY_USER });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

static napi_value UIEventInjectionCallbackTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(g_injectionCallbackResult >= PARAM_0, true);
    ASSERT_EQ(g_injectionCallbackResult <= PARAM_3, true);
    NAPI_END;
}

} // namespace ArkUICapiTest
