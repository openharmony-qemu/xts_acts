/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/node_attributes/text.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value LineSpacingOptionsTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto lineSpacingOptions = OH_ArkUI_NativeModule_LineSpacingOptions_Create();
    ASSERT_EQ((lineSpacingOptions != nullptr), true);
    OH_ArkUI_NativeModule_LineSpacingOptions_Destroy(lineSpacingOptions);
    NAPI_END(text);
}

static napi_value LineSpacingOptionsTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_LineSpacingOptions_Destroy(nullptr);
    NAPI_END(text);
}

static napi_value LineSpacingOptionsTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto lineSpacingOptions = OH_ArkUI_NativeModule_LineSpacingOptions_Create();
    ASSERT_EQ((lineSpacingOptions != nullptr), true);
    auto ret = OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines(lineSpacingOptions, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LineSpacingOptionsTest_005 SetOnlyBetweenLines true ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_LineSpacingOptions_Destroy(lineSpacingOptions);
    NAPI_END(text);
}

static napi_value LineSpacingOptionsTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto lineSpacingOptions = OH_ArkUI_NativeModule_LineSpacingOptions_Create();
    ASSERT_EQ((lineSpacingOptions != nullptr), true);
    auto ret = OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines(lineSpacingOptions, false);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LineSpacingOptionsTest_006 SetOnlyBetweenLines false ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_LineSpacingOptions_Destroy(lineSpacingOptions);
    NAPI_END(text);
}

static napi_value LineSpacingOptionsTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines(nullptr, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LineSpacingOptionsTest_007 SetOnlyBetweenLines nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value LineSpacingOptionsTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto lineSpacingOptions = OH_ArkUI_NativeModule_LineSpacingOptions_Create();
    ASSERT_EQ((lineSpacingOptions != nullptr), true);
    bool onlyBetweenLines = true;
    auto ret = OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines(lineSpacingOptions, &onlyBetweenLines);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LineSpacingOptionsTest_008 GetOnlyBetweenLines default ret=%{public}d onlyBetweenLines=%{public}d", ret,
        static_cast<int32_t>(onlyBetweenLines));
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(static_cast<int32_t>(onlyBetweenLines), PARAM_0);
    OH_ArkUI_NativeModule_LineSpacingOptions_Destroy(lineSpacingOptions);
    NAPI_END(text);
}

static napi_value LineSpacingOptionsTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto lineSpacingOptions = OH_ArkUI_NativeModule_LineSpacingOptions_Create();
    ASSERT_EQ((lineSpacingOptions != nullptr), true);
    OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines(lineSpacingOptions, true);
    bool onlyBetweenLines = false;
    auto ret = OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines(lineSpacingOptions, &onlyBetweenLines);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LineSpacingOptionsTest_009 GetOnlyBetweenLines after set true ret=%{public}d onlyBetweenLines=%{public}d", ret,
        static_cast<int32_t>(onlyBetweenLines));
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(static_cast<int32_t>(onlyBetweenLines), PARAM_1);
    OH_ArkUI_NativeModule_LineSpacingOptions_Destroy(lineSpacingOptions);
    NAPI_END(text);
}

static napi_value LineSpacingOptionsTest_010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto lineSpacingOptions = OH_ArkUI_NativeModule_LineSpacingOptions_Create();
    ASSERT_EQ((lineSpacingOptions != nullptr), true);
    OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines(lineSpacingOptions, false);
    bool onlyBetweenLines = true;
    auto ret = OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines(lineSpacingOptions, &onlyBetweenLines);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LineSpacingOptionsTest_010 GetOnlyBetweenLines after set false ret=%{public}d onlyBetweenLines=%{public}d", ret,
        static_cast<int32_t>(onlyBetweenLines));
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(static_cast<int32_t>(onlyBetweenLines), PARAM_0);
    OH_ArkUI_NativeModule_LineSpacingOptions_Destroy(lineSpacingOptions);
    NAPI_END(text);
}

static napi_value LineSpacingOptionsTest_011(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    bool onlyBetweenLines = false;
    auto ret = OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines(nullptr, &onlyBetweenLines);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LineSpacingOptionsTest_011 GetOnlyBetweenLines nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value LineSpacingOptionsTest_012(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto lineSpacingOptions = OH_ArkUI_NativeModule_LineSpacingOptions_Create();
    ASSERT_EQ((lineSpacingOptions != nullptr), true);
    auto ret = OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines(lineSpacingOptions, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LineSpacingOptionsTest_012 GetOnlyBetweenLines nullptr out-param ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_LineSpacingOptions_Destroy(lineSpacingOptions);
    NAPI_END(text);
}

static napi_value LineSpacingOptionsTest_013(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto lineSpacingOptions = OH_ArkUI_NativeModule_LineSpacingOptions_Create();
    ASSERT_EQ((lineSpacingOptions != nullptr), true);
    auto retSetTrue = OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines(lineSpacingOptions, true);
    ASSERT_EQ(retSetTrue, ARKUI_ERROR_CODE_NO_ERROR);
    bool onlyBetweenLines = false;
    auto retGetTrue = OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines(lineSpacingOptions,
        &onlyBetweenLines);
    ASSERT_EQ(retGetTrue, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(static_cast<int32_t>(onlyBetweenLines), PARAM_1);
    auto retSetFalse = OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines(lineSpacingOptions, false);
    ASSERT_EQ(retSetFalse, ARKUI_ERROR_CODE_NO_ERROR);
    onlyBetweenLines = true;
    auto retGetFalse = OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines(lineSpacingOptions,
        &onlyBetweenLines);
    ASSERT_EQ(retGetFalse, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(static_cast<int32_t>(onlyBetweenLines), PARAM_0);
    OH_ArkUI_NativeModule_LineSpacingOptions_Destroy(lineSpacingOptions);
    NAPI_END(text);
}

}
