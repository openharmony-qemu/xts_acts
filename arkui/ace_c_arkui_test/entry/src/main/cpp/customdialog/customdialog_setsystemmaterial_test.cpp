/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
#include <arkui/native_dialog.h>

namespace ArkUICapiTest {

static napi_value TestCustomDialogSetSystemMaterial001(napi_env env, napi_callback_info info)
{
    const ArkUI_NativeDialogAPI_1* dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    ArkUI_NativeDialogHandle customDialog = dialogAPI->create();
    ArkUI_ImmersiveStyle style = ARKUI_IMMERSIVE_STYLE_ULTRA_THIN;
    ArkUI_ImmersiveMaterialHandle handle = OH_ArkUI_NativeModule_ImmersiveMaterial_Create(style);
    auto ret = OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterial(customDialog, handle);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static napi_value TestCustomDialogSetSystemMaterial002(napi_env env, napi_callback_info info)
{
    const ArkUI_NativeDialogAPI_1* dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    ArkUI_NativeDialogHandle customDialog = dialogAPI->create();
    ArkUI_ImmersiveStyle style = ARKUI_IMMERSIVE_STYLE_THIN;
    ArkUI_ImmersiveMaterialHandle handle = OH_ArkUI_NativeModule_ImmersiveMaterial_Create(style);
    auto ret = OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterial(customDialog, handle);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static napi_value TestCustomDialogSetSystemMaterial003(napi_env env, napi_callback_info info)
{
    ArkUI_ImmersiveStyle style = ARKUI_IMMERSIVE_STYLE_ULTRA_THIN;
    ArkUI_ImmersiveMaterialHandle handle = OH_ArkUI_NativeModule_ImmersiveMaterial_Create(style);
    auto ret = OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterial(nullptr, handle);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCustomDialogSetSystemMaterial004(napi_env env, napi_callback_info info)
{
    const ArkUI_NativeDialogAPI_1* dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    ArkUI_NativeDialogHandle customDialog = dialogAPI->create();
    auto ret = OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterial(customDialog, nullptr);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static napi_value TestCustomDialogSetSystemMaterialInOptions001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeHandle content = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_CustomDialogOptions* options = OH_ArkUI_CustomDialog_CreateOptions(content);
    ArkUI_ImmersiveStyle style = ARKUI_IMMERSIVE_STYLE_ULTRA_THIN;
    ArkUI_ImmersiveMaterialHandle handle = OH_ArkUI_NativeModule_ImmersiveMaterial_Create(style);
    auto ret = OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterialInOptions(options, handle);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_CustomDialog_DisposeOptions(options);
    NAPI_END;
}

static napi_value TestCustomDialogSetSystemMaterialInOptions002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeHandle content = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_CustomDialogOptions* options = OH_ArkUI_CustomDialog_CreateOptions(content);
    ArkUI_ImmersiveStyle style = ARKUI_IMMERSIVE_STYLE_THIN;
    ArkUI_ImmersiveMaterialHandle handle = OH_ArkUI_NativeModule_ImmersiveMaterial_Create(style);
    auto ret = OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterialInOptions(options, handle);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_CustomDialog_DisposeOptions(options);
    NAPI_END;
}

static napi_value TestCustomDialogSetSystemMaterialInOptions003(napi_env env, napi_callback_info info)
{
    ArkUI_ImmersiveStyle style = ARKUI_IMMERSIVE_STYLE_ULTRA_THIN;
    ArkUI_ImmersiveMaterialHandle handle = OH_ArkUI_NativeModule_ImmersiveMaterial_Create(style);
    auto ret = OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterialInOptions(nullptr, handle);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCustomDialogSetSystemMaterialInOptions004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeHandle content = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_CustomDialogOptions* options = OH_ArkUI_CustomDialog_CreateOptions(content);
    auto ret = OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterialInOptions(options, nullptr);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_CustomDialog_DisposeOptions(options);
    NAPI_END;
}

static napi_value TestCustomDialogSetSystemMaterialInOptions005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeHandle content = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_CustomDialogOptions* options = OH_ArkUI_CustomDialog_CreateOptions(content);
    auto ret = OH_ArkUI_NativeModule_CustomDialog_SetSystemMaterialInOptions(nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    OH_ArkUI_CustomDialog_DisposeOptions(options);
    NAPI_END;
}

} // namespace ArkUICapiTest