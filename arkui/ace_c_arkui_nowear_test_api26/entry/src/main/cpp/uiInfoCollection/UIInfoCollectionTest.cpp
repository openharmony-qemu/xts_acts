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
#include <arkui/ui_info_collection.h>
#include <cstdint>

namespace ArkUICapiTest {

static void OnInteractionEventCallback(const OH_ArkUI_NativeModule_UIJsonWrapper *json, void *userData)
{
    (void)json;
    (void)userData;
}

static napi_value UIInfoCollectionRegisterObserverTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    uint32_t registerID = PARAM_0;
    auto regRet = OH_ArkUI_NativeModule_UIInfoCollectionRegisterInteractionObserver(
        context, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP,
        &registerID, &OnInteractionEventCallback, nullptr);
    auto regError = ErrCodeAnyOfFailed(env, static_cast<int32_t>(regRet),
        { ARKUI_ERROR_CODE_NO_ERROR, PARAM_500 });
    if (regError) {
        return regError;
    }
    if (static_cast<int32_t>(regRet) == ARKUI_ERROR_CODE_NO_ERROR) {
        ASSERT_EQ(registerID > PARAM_0, true);
        auto unregRet =
            OH_ArkUI_NativeModule_UIInfoCollectionUnregisterInteractionObserver(registerID);
        auto unregError = ErrCodeAnyOfFailed(env, static_cast<int32_t>(unregRet),
            { ARKUI_ERROR_CODE_NO_ERROR, PARAM_500 });
        if (unregError) {
            return unregError;
        }
    }
    NAPI_END;
}

static napi_value UIInfoCollectionRegisterObserverTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    uint32_t registerID = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_UIInfoCollectionRegisterInteractionObserver(
        nullptr, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP,
        &registerID, &OnInteractionEventCallback, nullptr);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_UI_CONTEXT_INVALID, PARAM_500 });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

static napi_value UIInfoCollectionRegisterObserverTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    uint32_t registerID = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_UIInfoCollectionRegisterInteractionObserver(
        context, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_NONE,
        &registerID, &OnInteractionEventCallback, nullptr);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_PARAM_INVALID, PARAM_500 });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

static napi_value UIInfoCollectionRegisterObserverTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    uint32_t registerID = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_UIInfoCollectionRegisterInteractionObserver(
        context, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP,
        &registerID, nullptr, nullptr);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_PARAM_INVALID, PARAM_500 });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

static napi_value UIInfoCollectionRegisterObserverTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIInfoCollectionRegisterInteractionObserver(
        context, OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP,
        nullptr, &OnInteractionEventCallback, nullptr);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_PARAM_INVALID, PARAM_500 });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

static napi_value UIInfoCollectionUnregisterObserverTest001(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UIInfoCollectionUnregisterInteractionObserver(PARAM_0);
    auto errorRet = ErrCodeAnyOfFailed(env, static_cast<int32_t>(ret),
        { ARKUI_ERROR_CODE_PARAM_INVALID, PARAM_500 });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
