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
#include <arkui/native_node_napi.h>
#include <arkui/ui_info_collection.h>
#include <arkui/ui_json_wrapper.h>
#include "UIAgentGetPageTextErrorCodeTest.h"

namespace ArkUICapiTest {

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value GetUiContext(napi_env env, napi_callback_info info, ArkUI_ContextHandle &context)
{
    size_t argc = PARAM_1;
    napi_value argv[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    if (argc != PARAM_1) {
        napi_throw_error(env, nullptr, "UIContext argument is required");
        return ReturnInt32(env, PARAM_NEGATIVE_1);
    }
    context = nullptr;
    auto ret = OH_ArkUI_GetContextFromNapiValue(env, argv[PARAM_0], &context);
    if ((ret != ARKUI_ERROR_CODE_NO_ERROR) || (context == nullptr)) {
        napi_throw_error(env, nullptr, "OH_ArkUI_GetContextFromNapiValue failed");
        return ReturnInt32(env, PARAM_NEGATIVE_1);
    }
    return nullptr;
}

napi_value UIAgentGetPageTextErrorCodeTest::UIAgentGetPageTextErrorCodeTest002(napi_env env, napi_callback_info info)
{
    ArkUI_ContextHandle context = nullptr;
    napi_value err = GetUiContext(env, info, context);
    if (err != nullptr) {
        return err;
    }

    OH_ArkUI_NativeModule_UIJsonWrapper *pageText = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetPageText(context, &pageText);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OnCollection",
            "kkk OH_ArkUI_NativeModule_UIAgentGetPageText=%{public}d", static_cast<int32_t>(ret));
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_INTERNAL_ERROR);
    ASSERT_EQ(pageText == nullptr, true);

    return ReturnInt32(env, static_cast<int32_t>(ret));
}

} // namespace ArkUICapiTest
