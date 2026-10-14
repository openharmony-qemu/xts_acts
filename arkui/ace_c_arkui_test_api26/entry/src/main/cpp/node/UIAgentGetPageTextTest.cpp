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

static napi_value UIAgentGetPageTextTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    OH_ArkUI_NativeModule_UIJsonWrapper *pageText = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetPageText(context, &pageText);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(pageText != nullptr, true);
    if (pageText) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(pageText);
    }
    NAPI_END;
}

static napi_value UIAgentGetPageTextTest002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIJsonWrapper *pageText = nullptr;
    auto ret = OH_ArkUI_NativeModule_UIAgentGetPageText(nullptr, &pageText);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_UI_CONTEXT_INVALID);
    ASSERT_EQ(pageText == nullptr, true);
    NAPI_END;
}

static napi_value UIAgentGetPageTextTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UIAgentGetPageText(context, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UIAgentGetPageTextTest004(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UIAgentGetPageText(nullptr, nullptr);
    auto errorRet = ErrCodeAnyOfFailed(
        env, ret, { ARKUI_ERROR_CODE_PARAM_INVALID, ARKUI_ERROR_CODE_UI_CONTEXT_INVALID });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

static napi_value UIAgentGetPageTextTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    OH_ArkUI_NativeModule_UIJsonWrapper *pageText1 = nullptr;
    auto ret1 = OH_ArkUI_NativeModule_UIAgentGetPageText(context, &pageText1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_UIJsonWrapper *pageText2 = nullptr;
    auto ret2 = OH_ArkUI_NativeModule_UIAgentGetPageText(context, &pageText2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    if (pageText1) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(pageText1);
    }
    if (pageText2) {
        OH_ArkUI_NativeModule_UIJsonWrapperDestroy(pageText2);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
