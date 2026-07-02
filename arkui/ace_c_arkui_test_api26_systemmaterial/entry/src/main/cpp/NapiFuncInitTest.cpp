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

static napi_property_descriptor MakeMaterialProp(const char *name, napi_callback callback)
{
    napi_property_descriptor desc = {};
    desc.utf8name = name;
    desc.method = callback;
    desc.attributes = napi_default;
    return desc;
}

static napi_property_descriptor *GetMaterialProps(size_t *count)
{
    static napi_property_descriptor desc[] = {
        MakeMaterialProp("testImmersiveStyleEnumValues001", TestImmersiveStyleEnumValues001),
        MakeMaterialProp("testMaterialLevelEnumValues001", TestMaterialLevelEnumValues001),
        MakeMaterialProp("testGetSystemMaterialSupported001", TestGetSystemMaterialSupported001),
        MakeMaterialProp("testGetGlobalMaterialLevel001", TestGetGlobalMaterialLevel001),
        MakeMaterialProp("testImmersiveMaterialCreateDestroy001", TestImmersiveMaterialCreateDestroy001),
        MakeMaterialProp("testImmersiveMaterialSetGetStyle001", TestImmersiveMaterialSetGetStyle001),
        MakeMaterialProp("testImmersiveMaterialSetGetStyleInvalid001", TestImmersiveMaterialSetGetStyleInvalid001),
        MakeMaterialProp("testImmersiveMaterialSetGetColor001", TestImmersiveMaterialSetGetColor001),
        MakeMaterialProp("testImmersiveMaterialSetGetApplyShadow001", TestImmersiveMaterialSetGetApplyShadow001),
        MakeMaterialProp("testImmersiveMaterialSetGetInteractive001", TestImmersiveMaterialSetGetInteractive001),
        MakeMaterialProp("testImmersiveMaterialGetInteractiveNotSet001", TestImmersiveMaterialGetInteractiveNotSet001),
        MakeMaterialProp("testLightEffectOptionsLifecycle001", TestLightEffectOptionsLifecycle001),
        MakeMaterialProp("testImmersiveMaterialSetGetLightEffect001", TestImmersiveMaterialSetGetLightEffect001),
        MakeMaterialProp("testImmersiveMaterialGetLightEffectNotSet001", TestImmersiveMaterialGetLightEffectNotSet001),
        MakeMaterialProp("testCustomDialogSetSystemMaterial001", TestCustomDialogSetSystemMaterial001),
        MakeMaterialProp("testCustomDialogSetSystemMaterial002", TestCustomDialogSetSystemMaterial002),
        MakeMaterialProp("testCustomDialogSetSystemMaterial003", TestCustomDialogSetSystemMaterial003),
        MakeMaterialProp("testCustomDialogSetSystemMaterial004", TestCustomDialogSetSystemMaterial004),
        MakeMaterialProp("testCustomDialogSetSystemMaterial005", TestCustomDialogSetSystemMaterial005),
        MakeMaterialProp("testCustomDialogSetSystemMaterial006", TestCustomDialogSetSystemMaterial006),
        MakeMaterialProp("testCustomDialogSetSystemMaterial007", TestCustomDialogSetSystemMaterial007),
        MakeMaterialProp(
            "testCustomDialogSetSystemMaterialInOptions001", TestCustomDialogSetSystemMaterialInOptions001),
        MakeMaterialProp(
            "testCustomDialogSetSystemMaterialInOptions002", TestCustomDialogSetSystemMaterialInOptions002),
        MakeMaterialProp(
            "testCustomDialogSetSystemMaterialInOptions003", TestCustomDialogSetSystemMaterialInOptions003),
        MakeMaterialProp(
            "testCustomDialogSetSystemMaterialInOptions004", TestCustomDialogSetSystemMaterialInOptions004),
        MakeMaterialProp(
            "testCustomDialogSetSystemMaterialInOptions005", TestCustomDialogSetSystemMaterialInOptions005),
        MakeMaterialProp(
            "testCustomDialogSetSystemMaterialInOptions006", TestCustomDialogSetSystemMaterialInOptions006),
        MakeMaterialProp(
            "testCustomDialogSetSystemMaterialInOptions007", TestCustomDialogSetSystemMaterialInOptions007),
        MakeMaterialProp("testNodeSystemMaterialAttrId001", TestNodeSystemMaterialAttrId001),
        MakeMaterialProp("testNodeSetSystemMaterial001", TestNodeSetSystemMaterial001),
    };
    *count = sizeof(desc) / sizeof(desc[0]);
    return desc;
}

static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    size_t count = 0;
    napi_property_descriptor *desc = GetMaterialProps(&count);
    if (napi_define_properties(env, exports, count, desc) != napi_ok) {
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
