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

#include "common/common.h"
#include "systemMaterial/MaterialTestDecl.h"

namespace ArkUICapiTest {
EXTERN_C_START

#define MAT_PROP(etsName, cppFn) \
    {etsName, nullptr, cppFn, nullptr, nullptr, nullptr, napi_default, nullptr}

static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        MAT_PROP("testImmersiveStyleEnumValues001", TestImmersiveStyleEnumValues001),
        MAT_PROP("testMaterialLevelEnumValues001", TestMaterialLevelEnumValues001),
        MAT_PROP("testGetSystemMaterialSupported001", TestGetSystemMaterialSupported001),
        MAT_PROP("testGetGlobalMaterialLevel001", TestGetGlobalMaterialLevel001),
        MAT_PROP("testImmersiveMaterialCreateDestroy001", TestImmersiveMaterialCreateDestroy001),
        MAT_PROP("testImmersiveMaterialSetGetStyle001", TestImmersiveMaterialSetGetStyle001),
        MAT_PROP("testImmersiveMaterialSetGetStyleInvalid001", TestImmersiveMaterialSetGetStyleInvalid001),
        MAT_PROP("testImmersiveMaterialSetGetColor001", TestImmersiveMaterialSetGetColor001),
        MAT_PROP("testImmersiveMaterialSetGetApplyShadow001", TestImmersiveMaterialSetGetApplyShadow001),
        MAT_PROP("testImmersiveMaterialSetGetInteractive001", TestImmersiveMaterialSetGetInteractive001),
        MAT_PROP("testImmersiveMaterialGetInteractiveNotSet001", TestImmersiveMaterialGetInteractiveNotSet001),
        MAT_PROP("testLightEffectOptionsLifecycle001", TestLightEffectOptionsLifecycle001),
        MAT_PROP("testImmersiveMaterialSetGetLightEffect001", TestImmersiveMaterialSetGetLightEffect001),
        MAT_PROP("testImmersiveMaterialGetLightEffectNotSet001", TestImmersiveMaterialGetLightEffectNotSet001),
        MAT_PROP("testCustomDialogSetSystemMaterial001", TestCustomDialogSetSystemMaterial001),
        MAT_PROP("testCustomDialogSetSystemMaterial002", TestCustomDialogSetSystemMaterial002),
        MAT_PROP("testCustomDialogSetSystemMaterial003", TestCustomDialogSetSystemMaterial003),
        MAT_PROP("testCustomDialogSetSystemMaterial004", TestCustomDialogSetSystemMaterial004),
        MAT_PROP("testCustomDialogSetSystemMaterial005", TestCustomDialogSetSystemMaterial005),
        MAT_PROP("testCustomDialogSetSystemMaterial006", TestCustomDialogSetSystemMaterial006),
        MAT_PROP("testCustomDialogSetSystemMaterial007", TestCustomDialogSetSystemMaterial007),
        MAT_PROP("testCustomDialogSetSystemMaterialInOptions001", TestCustomDialogSetSystemMaterialInOptions001),
        MAT_PROP("testCustomDialogSetSystemMaterialInOptions002", TestCustomDialogSetSystemMaterialInOptions002),
        MAT_PROP("testCustomDialogSetSystemMaterialInOptions003", TestCustomDialogSetSystemMaterialInOptions003),
        MAT_PROP("testCustomDialogSetSystemMaterialInOptions004", TestCustomDialogSetSystemMaterialInOptions004),
        MAT_PROP("testCustomDialogSetSystemMaterialInOptions005", TestCustomDialogSetSystemMaterialInOptions005),
        MAT_PROP("testCustomDialogSetSystemMaterialInOptions006", TestCustomDialogSetSystemMaterialInOptions006),
        MAT_PROP("testCustomDialogSetSystemMaterialInOptions007", TestCustomDialogSetSystemMaterialInOptions007),
        MAT_PROP("testNodeSystemMaterialAttrId001", TestNodeSystemMaterialAttrId001),
        MAT_PROP("testNodeSetSystemMaterial001", TestNodeSetSystemMaterial001),
    };
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }
    return exports;
}
EXTERN_C_END

static napi_module nativefuncModule = {.nm_version = 1,
                                       .nm_flags = 0,
                                       .nm_filename = nullptr,
                                       .nm_register_func = Init,
                                       .nm_modname = "nativefunc",
                                       .nm_priv = ((void *)0),
                                       .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativefuncModule); }
} // namespace ArkUICapiTest
