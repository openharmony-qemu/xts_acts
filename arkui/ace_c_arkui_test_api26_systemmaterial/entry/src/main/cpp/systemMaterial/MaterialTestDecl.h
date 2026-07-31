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

#ifndef ARKUI_CAPI_SYSTEM_MATERIAL_TEST_DECL_H
#define ARKUI_CAPI_SYSTEM_MATERIAL_TEST_DECL_H

#include <napi/native_api.h>

namespace ArkUICapiTest {

napi_value TestImmersiveStyleEnumValues001(napi_env env, napi_callback_info info);
napi_value TestMaterialLevelEnumValues001(napi_env env, napi_callback_info info);
napi_value TestGetSystemMaterialSupported001(napi_env env, napi_callback_info info);
napi_value TestGetGlobalMaterialLevel001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialCreateDestroy001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialSetGetStyle001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialSetGetStyleInvalid001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialSetGetColor001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialGetMaterialColorNull001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialSetGetApplyShadow001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialSetApplyShadowNull001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialGetApplyShadowNull001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialSetGetInteractive001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialSetInteractiveNull001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialGetInteractiveNull001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialGetInteractiveNotSet001(napi_env env, napi_callback_info info);
napi_value TestLightEffectOptionsLifecycle001(napi_env env, napi_callback_info info);
napi_value TestLightEffectOptionsDestroyNull001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialSetGetLightEffect001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialSetLightEffectNull001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialGetLightEffectColorNull001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialGetLightEffectNotSet001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialDestroyNull001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialSetMaterialColorBoundary001(napi_env env, napi_callback_info info);
napi_value TestImmersiveMaterialSetMaterialColorInvalid001(napi_env env, napi_callback_info info);
napi_value TestLightEffectOptionsSetColorBoundary001(napi_env env, napi_callback_info info);
napi_value TestLightEffectOptionsSetColorInvalid001(napi_env env, napi_callback_info info);

napi_value TestCustomDialogSetSystemMaterial001(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterial002(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterial003(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterial004(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterial005(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterial006(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterial007(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterialInOptions001(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterialInOptions002(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterialInOptions003(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterialInOptions004(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterialInOptions005(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterialInOptions006(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetSystemMaterialInOptions007(napi_env env, napi_callback_info info);

napi_value TestNodeSystemMaterialAttrId001(napi_env env, napi_callback_info info);
napi_value TestNodeSetSystemMaterial001(napi_env env, napi_callback_info info);

napi_value TestDialogDisplayModeEnumValues001(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetDisplayModeInSubWindow001(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetDisplayModeInSubWindow002(napi_env env, napi_callback_info info);
napi_value TestCustomDialogSetDisplayModeInSubWindow003(napi_env env, napi_callback_info info);

napi_value TestDialogOpenCallbackErrorEnumValues001(napi_env env, napi_callback_info info);
napi_value TestCustomDialogOpenDialogWithCallbackNullOptions001(napi_env env, napi_callback_info info);
napi_value TestCustomDialogOpenDialogWithCallbackUserData001(napi_env env, napi_callback_info info);
napi_value TestCustomDialogOpenDialogWithCallbackValidOptions001(napi_env env, napi_callback_info info);

napi_value TestGetNodeSnapshotSizeLimitationNull001(napi_env env, napi_callback_info info);
napi_value TestRenderNodeUtilsSetRectShapeOptionValueNull001(napi_env env, napi_callback_info info);
napi_value TestRenderNodeUtilsSetRoundRectShapeOptionValueNull001(napi_env env, napi_callback_info info);
napi_value TestRenderNodeUtilsDisposeBlurStyleOptionNull001(napi_env env, napi_callback_info info);
napi_value TestLinearGradientOptionsDestroyNull001(napi_env env, napi_callback_info info);
napi_value TestRadialGradientOptionsDestroyNull001(napi_env env, napi_callback_info info);
napi_value TestNativeWindowManagerGetKeyEventFilterNull001(napi_env env, napi_callback_info info);
napi_value TestNativeWindowManagerGetMouseEventFilterNull001(napi_env env, napi_callback_info info);
napi_value TestNativeWindowManagerGetTouchEventFilterNull001(napi_env env, napi_callback_info info);
napi_value TestFrameMetricsIsFirstDrawFrameNull001(napi_env env, napi_callback_info info);
napi_value TestFrameMetricsGetInputHandlingDurationNull001(napi_env env, napi_callback_info info);
napi_value TestFrameMetricsGetLayoutMeasureDurationNull001(napi_env env, napi_callback_info info);
napi_value TestFrameMetricsGetVsyncTimestampNull001(napi_env env, napi_callback_info info);
napi_value TestLineSpacingStyleDestroyNull001(napi_env env, napi_callback_info info);
napi_value TestFontConfigsGetFontWeightConfigsNull001(napi_env env, napi_callback_info info);
napi_value TestTextControllerDestroyNull001(napi_env env, napi_callback_info info);

} // namespace ArkUICapiTest

#endif
