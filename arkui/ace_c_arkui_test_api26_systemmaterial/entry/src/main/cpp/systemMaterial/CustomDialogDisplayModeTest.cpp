/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "systemMaterial/MaterialHelpers.h"
#include "systemMaterial/MaterialTestDecl.h"

namespace ArkUICapiTest {

napi_value TestDialogDisplayModeEnumValues001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ARKUI_DIALOG_DISPLAY_MODE_SCREEN_BASED, PARAM_0);
    ASSERT_EQ(OH_ARKUI_DIALOG_DISPLAY_MODE_WINDOW_BASED, PARAM_1);
    NAPI_END;
}

static int32_t SetDisplayMode(OH_ArkUI_DialogDisplayModeInSubWindow mode)
{
    auto *nodeAPI = GetNodeApi();
    ArkUI_NodeHandle content = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_CustomDialogOptions *options = OH_ArkUI_CustomDialog_CreateOptions(content);
    auto ret = OH_ArkUI_CustomDialog_SetDisplayModeInSubWindow(options, mode);
    OH_ArkUI_CustomDialog_DisposeOptions(options);
    return ret;
}

napi_value TestCustomDialogSetDisplayModeInSubWindow001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetDisplayMode(OH_ARKUI_DIALOG_DISPLAY_MODE_SCREEN_BASED), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetDisplayModeInSubWindow002(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetDisplayMode(OH_ARKUI_DIALOG_DISPLAY_MODE_WINDOW_BASED), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetDisplayModeInSubWindow003(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_CustomDialog_SetDisplayModeInSubWindow(
        nullptr, OH_ARKUI_DIALOG_DISPLAY_MODE_SCREEN_BASED),
        INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUICapiTest
