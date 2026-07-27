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

static napi_property_descriptor *GetMaterialCoreProps(size_t *count)
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
        MakeMaterialProp("testImmersiveMaterialGetMaterialColorNull001",
            TestImmersiveMaterialGetMaterialColorNull001),
        MakeMaterialProp("testImmersiveMaterialSetGetApplyShadow001", TestImmersiveMaterialSetGetApplyShadow001),
        MakeMaterialProp("testImmersiveMaterialSetApplyShadowNull001", TestImmersiveMaterialSetApplyShadowNull001),
        MakeMaterialProp("testImmersiveMaterialGetApplyShadowNull001", TestImmersiveMaterialGetApplyShadowNull001),
        MakeMaterialProp("testImmersiveMaterialSetGetInteractive001", TestImmersiveMaterialSetGetInteractive001),
        MakeMaterialProp("testImmersiveMaterialSetInteractiveNull001", TestImmersiveMaterialSetInteractiveNull001),
        MakeMaterialProp("testImmersiveMaterialGetInteractiveNull001", TestImmersiveMaterialGetInteractiveNull001),
        MakeMaterialProp("testImmersiveMaterialGetInteractiveNotSet001", TestImmersiveMaterialGetInteractiveNotSet001),
        MakeMaterialProp("testLightEffectOptionsLifecycle001", TestLightEffectOptionsLifecycle001),
        MakeMaterialProp("testLightEffectOptionsDestroyNull001", TestLightEffectOptionsDestroyNull001),
        MakeMaterialProp("testImmersiveMaterialSetGetLightEffect001", TestImmersiveMaterialSetGetLightEffect001),
        MakeMaterialProp("testImmersiveMaterialSetLightEffectNull001", TestImmersiveMaterialSetLightEffectNull001),
        MakeMaterialProp("testImmersiveMaterialGetLightEffectColorNull001",
            TestImmersiveMaterialGetLightEffectColorNull001),
        MakeMaterialProp("testImmersiveMaterialGetLightEffectNotSet001", TestImmersiveMaterialGetLightEffectNotSet001),
        MakeMaterialProp("testImmersiveMaterialDestroyNull001", TestImmersiveMaterialDestroyNull001),
        MakeMaterialProp("testImmersiveMaterialSetMaterialColorBoundary001",
            TestImmersiveMaterialSetMaterialColorBoundary001),
        MakeMaterialProp("testImmersiveMaterialSetMaterialColorInvalid001",
            TestImmersiveMaterialSetMaterialColorInvalid001),
        MakeMaterialProp("testLightEffectOptionsSetColorBoundary001", TestLightEffectOptionsSetColorBoundary001),
        MakeMaterialProp("testLightEffectOptionsSetColorInvalid001", TestLightEffectOptionsSetColorInvalid001),
    };
    *count = sizeof(desc) / sizeof(desc[0]);
    return desc;
}

static napi_property_descriptor *GetMaterialDialogProps(size_t *count)
{
    static napi_property_descriptor desc[] = {
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
        MakeMaterialProp("testDialogDisplayModeEnumValues001", TestDialogDisplayModeEnumValues001),
        MakeMaterialProp("testCustomDialogSetDisplayModeInSubWindow001",
            TestCustomDialogSetDisplayModeInSubWindow001),
        MakeMaterialProp("testCustomDialogSetDisplayModeInSubWindow002",
            TestCustomDialogSetDisplayModeInSubWindow002),
        MakeMaterialProp("testCustomDialogSetDisplayModeInSubWindow003",
            TestCustomDialogSetDisplayModeInSubWindow003),
    };
    *count = sizeof(desc) / sizeof(desc[0]);
    return desc;
}

static napi_property_descriptor *GetMaterialNullPointerProps(size_t *count)
{
    static napi_property_descriptor desc[] = {
        MakeMaterialProp("testGetNodeSnapshotSizeLimitationNull001", TestGetNodeSnapshotSizeLimitationNull001),
        MakeMaterialProp("testRenderNodeUtilsSetRectShapeOptionValueNull001",
            TestRenderNodeUtilsSetRectShapeOptionValueNull001),
        MakeMaterialProp("testRenderNodeUtilsSetRoundRectShapeOptionValueNull001",
            TestRenderNodeUtilsSetRoundRectShapeOptionValueNull001),
        MakeMaterialProp("testRenderNodeUtilsDisposeBlurStyleOptionNull001",
            TestRenderNodeUtilsDisposeBlurStyleOptionNull001),
        MakeMaterialProp("testLinearGradientOptionsDestroyNull001", TestLinearGradientOptionsDestroyNull001),
        MakeMaterialProp("testRadialGradientOptionsDestroyNull001", TestRadialGradientOptionsDestroyNull001),
        MakeMaterialProp("testNativeWindowManagerGetKeyEventFilterNull001",
            TestNativeWindowManagerGetKeyEventFilterNull001),
        MakeMaterialProp("testNativeWindowManagerGetMouseEventFilterNull001",
            TestNativeWindowManagerGetMouseEventFilterNull001),
        MakeMaterialProp("testNativeWindowManagerGetTouchEventFilterNull001",
            TestNativeWindowManagerGetTouchEventFilterNull001),
        MakeMaterialProp("testFrameMetricsIsFirstDrawFrameNull001", TestFrameMetricsIsFirstDrawFrameNull001),
        MakeMaterialProp("testFrameMetricsGetInputHandlingDurationNull001",
            TestFrameMetricsGetInputHandlingDurationNull001),
        MakeMaterialProp("testFrameMetricsGetLayoutMeasureDurationNull001",
            TestFrameMetricsGetLayoutMeasureDurationNull001),
        MakeMaterialProp("testFrameMetricsGetVsyncTimestampNull001", TestFrameMetricsGetVsyncTimestampNull001),
        MakeMaterialProp("testLineSpacingStyleDestroyNull001", TestLineSpacingStyleDestroyNull001),
        MakeMaterialProp("testFontConfigsGetFontWeightConfigsNull001", TestFontConfigsGetFontWeightConfigsNull001),
        MakeMaterialProp("testTextControllerDestroyNull001", TestTextControllerDestroyNull001),
    };
    *count = sizeof(desc) / sizeof(desc[0]);
    return desc;
}

static bool DefineMaterialProps(napi_env env, napi_value exports)
{
    size_t coreCount = 0;
    size_t dialogCount = 0;
    size_t nullCount = 0;
    napi_property_descriptor *coreDesc = GetMaterialCoreProps(&coreCount);
    napi_property_descriptor *dialogDesc = GetMaterialDialogProps(&dialogCount);
    napi_property_descriptor *nullDesc = GetMaterialNullPointerProps(&nullCount);
    if (napi_define_properties(env, exports, coreCount, coreDesc) != napi_ok) {
        return false;
    }
    if (napi_define_properties(env, exports, dialogCount, dialogDesc) != napi_ok) {
        return false;
    }
    if (napi_define_properties(env, exports, nullCount, nullDesc) != napi_ok) {
        return false;
    }
    return true;
}

static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }
    if (!DefineMaterialProps(env, exports)) {
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
