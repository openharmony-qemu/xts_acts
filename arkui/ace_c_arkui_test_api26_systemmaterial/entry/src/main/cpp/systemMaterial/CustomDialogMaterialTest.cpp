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

static int32_t SetDialogMaterial(ArkUI_ImmersiveStyle style)
{
    const auto *dialogAPI = GetDialogApi();
    ArkUI_NativeDialogHandle dialog = dialogAPI->create();
    auto handle = CreateMaterial(style);
    auto ret = OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterial(dialog, handle);
    DestroyMaterial(handle);
    dialogAPI->dispose(dialog);
    return ret;
}

napi_value TestCustomDialogSetSystemMaterial001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetDialogMaterial(ARKUI_IMMERSIVE_STYLE_ULTRA_THIN), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterial002(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetDialogMaterial(ARKUI_IMMERSIVE_STYLE_THIN), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterial003(napi_env env, napi_callback_info info)
{
    (void)info;
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_ULTRA_THIN);
    ASSERT_EQ(OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterial(nullptr, handle), INVALID_PARAM);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterial004(napi_env env, napi_callback_info info)
{
    (void)info;
    const auto *dialogAPI = GetDialogApi();
    ArkUI_NativeDialogHandle dialog = dialogAPI->create();
    ASSERT_EQ(OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterial(dialog, nullptr), SUCCESS);
    dialogAPI->dispose(dialog);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterial005(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetDialogMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterial006(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetDialogMaterial(ARKUI_IMMERSIVE_STYLE_THICK), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterial007(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetDialogMaterial(ARKUI_IMMERSIVE_STYLE_ULTRA_THICK), SUCCESS);
    NAPI_END;
}

static int32_t SetOptionsMaterial(ArkUI_ImmersiveStyle style)
{
    auto *nodeAPI = GetNodeApi();
    ArkUI_NodeHandle content = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_CustomDialogOptions *options = OH_ArkUI_CustomDialog_CreateOptions(content);
    auto handle = CreateMaterial(style);
    auto ret = OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterialInOptions(options, handle);
    DestroyMaterial(handle);
    OH_ArkUI_CustomDialog_DisposeOptions(options);
    return ret;
}

napi_value TestCustomDialogSetSystemMaterialInOptions001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetOptionsMaterial(ARKUI_IMMERSIVE_STYLE_ULTRA_THIN), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterialInOptions002(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetOptionsMaterial(ARKUI_IMMERSIVE_STYLE_THIN), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterialInOptions003(napi_env env, napi_callback_info info)
{
    (void)info;
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_ULTRA_THIN);
    ASSERT_EQ(OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterialInOptions(nullptr, handle), INVALID_PARAM);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterialInOptions004(napi_env env, napi_callback_info info)
{
    (void)info;
    auto *nodeAPI = GetNodeApi();
    ArkUI_NodeHandle content = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_CustomDialogOptions *options = OH_ArkUI_CustomDialog_CreateOptions(content);
    ASSERT_EQ(OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterialInOptions(options, nullptr), SUCCESS);
    OH_ArkUI_CustomDialog_DisposeOptions(options);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterialInOptions005(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterialInOptions(nullptr, nullptr), INVALID_PARAM);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterialInOptions006(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetOptionsMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetSystemMaterialInOptions007(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetOptionsMaterial(ARKUI_IMMERSIVE_STYLE_ULTRA_THICK), SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest
