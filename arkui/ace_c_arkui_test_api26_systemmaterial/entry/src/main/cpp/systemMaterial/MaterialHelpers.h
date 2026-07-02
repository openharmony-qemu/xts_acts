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

#ifndef ARKUI_CAPI_SYSTEM_MATERIAL_HELPERS_H
#define ARKUI_CAPI_SYSTEM_MATERIAL_HELPERS_H

#include "common/common.h"
#include <arkui/error_code.h>
#include <arkui/native_dialog.h>
#include <arkui/native_material.h>
#include <arkui/native_node.h>

namespace ArkUICapiTest {

inline const ArkUI_NativeDialogAPI_1 *GetDialogApi()
{
    return reinterpret_cast<const ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
}

inline ArkUI_NativeNodeAPI_1 *GetNodeApi()
{
    return reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
}

inline ArkUI_ImmersiveMaterialHandle CreateMaterial(ArkUI_ImmersiveStyle style)
{
    return OH_ArkUI_NativeModule_ImmersiveMaterial_Create(style);
}

inline void DestroyMaterial(ArkUI_ImmersiveMaterialHandle handle)
{
    if (handle != nullptr) {
        OH_ArkUI_NativeModule_ImmersiveMaterial_Destroy(handle);
    }
}

} // namespace ArkUICapiTest

#endif
