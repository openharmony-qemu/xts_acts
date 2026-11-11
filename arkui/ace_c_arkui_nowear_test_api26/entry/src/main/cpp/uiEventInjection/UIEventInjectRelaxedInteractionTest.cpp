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

namespace ArkUICapiTest {

static OH_ArkUI_NativeModule_UIJsonWrapper *CreateValidRelaxedClickCommand()
{
    const char *jsonStr =
        "{\"schemaVersion\":1,\"cmd\":{\"type\":\"click\",\"mode\":\"auto\","
        "\"action_info\":{\"coordinates\":{\"x1\":100,\"y1\":200}}}}";
    size_t jsonSize = std::strlen(jsonStr);
    OH_ArkUI_NativeModule_UIJsonWrapper *wrapper = nullptr;
    OH_ArkUI_NativeModule_UIJsonWrapperCreate(jsonStr, jsonSize, &wrapper);
    return wrapper;
}

static napi_value UIEventInjectRelaxedInteractionTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto command = CreateValidRelaxedClickCommand();
    ASSERT_EQ(command != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIEventInjectRelaxedInteraction(
        context, command, nullptr, nullptr);
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_NO_ERROR, PARAM_500 });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

static napi_value UIEventInjectRelaxedInteractionTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto command = CreateValidRelaxedClickCommand();
    ASSERT_EQ(command != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIEventInjectRelaxedInteraction(
        nullptr, command, nullptr, nullptr);
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_UI_CONTEXT_INVALID, PARAM_500 });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

static napi_value UIEventInjectRelaxedInteractionTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIEventInjectRelaxedInteraction(
        context, nullptr, nullptr, nullptr);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_PARAM_INVALID, PARAM_500 });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
