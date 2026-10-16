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
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value SetUiDvsyncSwitchTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto ret = OH_ArkUI_NodeUtils_SetUiDvsyncSwitch(context, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "SetUiDvsyncSwitchTest_001 enable ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(column);
}

static napi_value SetUiDvsyncSwitchTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto ret = OH_ArkUI_NodeUtils_SetUiDvsyncSwitch(context, false);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "SetUiDvsyncSwitchTest_002 disable ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(column);
}

static napi_value SetUiDvsyncSwitchTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto ret1 = OH_ArkUI_NodeUtils_SetUiDvsyncSwitch(context, true);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NodeUtils_SetUiDvsyncSwitch(context, false);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_NodeUtils_SetUiDvsyncSwitch(context, true);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret4 = OH_ArkUI_NodeUtils_SetUiDvsyncSwitch(context, false);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(column);
}

static napi_value SetUiDvsyncSwitchTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_NodeUtils_SetUiDvsyncSwitch(nullptr, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "SetUiDvsyncSwitchTest_004 nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(column);
}

}
