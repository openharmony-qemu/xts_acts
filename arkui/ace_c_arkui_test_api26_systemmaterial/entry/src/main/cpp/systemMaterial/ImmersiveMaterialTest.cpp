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

napi_value TestImmersiveStyleEnumValues001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(ARKUI_IMMERSIVE_STYLE_ULTRA_THIN, PARAM_0);
    ASSERT_EQ(ARKUI_IMMERSIVE_STYLE_THIN, PARAM_1);
    ASSERT_EQ(ARKUI_IMMERSIVE_STYLE_REGULAR, PARAM_2);
    ASSERT_EQ(ARKUI_IMMERSIVE_STYLE_THICK, PARAM_3);
    ASSERT_EQ(ARKUI_IMMERSIVE_STYLE_ULTRA_THICK, PARAM_4);
    NAPI_END;
}

napi_value TestMaterialLevelEnumValues001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(ARKUI_MATERIAL_LEVEL_EXQUISITE, PARAM_0);
    ASSERT_EQ(ARKUI_MATERIAL_LEVEL_GENTLE, PARAM_1);
    ASSERT_EQ(ARKUI_MATERIAL_LEVEL_SMOOTH, PARAM_2);
    NAPI_END;
}

napi_value TestGetSystemMaterialSupported001(napi_env env, napi_callback_info info)
{
    (void)info;
    const bool supported = OH_ArkUI_NativeModule_GetSystemMaterialSupported();
    ASSERT_EQ(supported, true);
    NAPI_END;
}

napi_value TestGetGlobalMaterialLevel001(napi_env env, napi_callback_info info)
{
    (void)info;
    const auto level = OH_ArkUI_NativeModule_GetGlobalMaterialLevel();
    const bool isValidLevel = level == ARKUI_MATERIAL_LEVEL_EXQUISITE ||
                              level == ARKUI_MATERIAL_LEVEL_GENTLE ||
                              level == ARKUI_MATERIAL_LEVEL_SMOOTH;
    ASSERT_EQ(isValidLevel, true);
    NAPI_END;
}

napi_value TestImmersiveMaterialCreateDestroy001(napi_env env, napi_callback_info info)
{
    (void)info;
    const ArkUI_ImmersiveStyle styles[] = {
        ARKUI_IMMERSIVE_STYLE_ULTRA_THIN, ARKUI_IMMERSIVE_STYLE_THIN, ARKUI_IMMERSIVE_STYLE_REGULAR,
        ARKUI_IMMERSIVE_STYLE_THICK, ARKUI_IMMERSIVE_STYLE_ULTRA_THICK,
    };
    for (auto style : styles) {
        auto handle = CreateMaterial(style);
        ASSERT_NOTNULL(handle);
        DestroyMaterial(handle);
    }
    NAPI_END;
}

napi_value TestImmersiveMaterialSetGetStyle001(napi_env env, napi_callback_info info)
{
    (void)info;
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_SetStyle(handle, ARKUI_IMMERSIVE_STYLE_THIN),
              ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_ImmersiveStyle out = ARKUI_IMMERSIVE_STYLE_ULTRA_THICK;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetStyle(handle, &out), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(out, ARKUI_IMMERSIVE_STYLE_THIN);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestImmersiveMaterialSetGetStyleInvalid001(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_ImmersiveStyle out = ARKUI_IMMERSIVE_STYLE_REGULAR;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_SetStyle(nullptr, ARKUI_IMMERSIVE_STYLE_THIN),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetStyle(nullptr, &out),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TestImmersiveMaterialSetGetColor001(napi_env env, napi_callback_info info)
{
    (void)info;
    const uint32_t color = 0xFF112233;
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_SetMaterialColor(handle, color),
              ARKUI_ERROR_CODE_NO_ERROR);
    uint32_t out = 0;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetMaterialColor(handle, &out),
              ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(out, color);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestImmersiveMaterialGetMaterialColorNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    uint32_t out = 0;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetMaterialColor(nullptr, &out),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetMaterialColor(handle, nullptr),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestImmersiveMaterialSetGetApplyShadow001(napi_env env, napi_callback_info info)
{
    (void)info;
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_SetApplyShadow(handle, false),
              ARKUI_ERROR_CODE_NO_ERROR);
    bool out = true;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetApplyShadow(handle, &out),
              ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(out, false);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestImmersiveMaterialSetApplyShadowNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_SetApplyShadow(nullptr, false),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TestImmersiveMaterialGetApplyShadowNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    bool out = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetApplyShadow(nullptr, &out),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetApplyShadow(handle, nullptr),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestImmersiveMaterialSetGetInteractive001(napi_env env, napi_callback_info info)
{
    (void)info;
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_SetInteractive(handle, true),
              ARKUI_ERROR_CODE_NO_ERROR);
    bool out = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetInteractive(handle, &out),
              ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(out, true);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestImmersiveMaterialSetInteractiveNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_SetInteractive(nullptr, true),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TestImmersiveMaterialGetInteractiveNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    bool out = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetInteractive(nullptr, &out),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetInteractive(handle, nullptr),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestImmersiveMaterialGetInteractiveNotSet001(napi_env env, napi_callback_info info)
{
    (void)info;
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    bool out = true;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetInteractive(handle, &out),
              ARKUI_ERROR_CODE_PARAM_ERROR);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestLightEffectOptionsLifecycle001(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LightEffectOptions_Create();
    ASSERT_NOTNULL(options);
    const uint32_t color = 0xFFFF8800;
    ASSERT_EQ(OH_ArkUI_NativeModule_LightEffectOptions_SetColor(options, color), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_LightEffectOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLightEffectOptionsDestroyNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_NativeModule_LightEffectOptions_Destroy(nullptr);
    NAPI_END;
}

napi_value TestImmersiveMaterialSetGetLightEffect001(napi_env env, napi_callback_info info)
{
    (void)info;
    const uint32_t color = 0xFF00FF00;
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    auto options = OH_ArkUI_NativeModule_LightEffectOptions_Create();
    ASSERT_NOTNULL(handle);
    ASSERT_NOTNULL(options);
    ASSERT_EQ(OH_ArkUI_NativeModule_LightEffectOptions_SetColor(options, color), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_SetLightEffect(handle, options),
              ARKUI_ERROR_CODE_NO_ERROR);
    uint32_t out = 0;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetLightEffectColor(handle, &out),
              ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(out, color);
    OH_ArkUI_NativeModule_LightEffectOptions_Destroy(options);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestImmersiveMaterialSetLightEffectNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LightEffectOptions_Create();
    ASSERT_NOTNULL(options);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_SetLightEffect(nullptr, options),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_SetLightEffect(nullptr, nullptr),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    // NULL options is legal: disables light effect.
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_SetLightEffect(handle, nullptr),
              ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_LightEffectOptions_Destroy(options);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestImmersiveMaterialGetLightEffectColorNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    uint32_t out = 0;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetLightEffectColor(nullptr, &out),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetLightEffectColor(handle, nullptr),
              ARKUI_ERROR_CODE_PARAM_INVALID);
    DestroyMaterial(handle);
    NAPI_END;
}

napi_value TestImmersiveMaterialGetLightEffectNotSet001(napi_env env, napi_callback_info info)
{
    (void)info;
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    uint32_t out = 0;
    ASSERT_EQ(OH_ArkUI_NativeModule_ImmersiveMaterial_GetLightEffectColor(handle, &out),
              ARKUI_ERROR_CODE_PARAM_ERROR);
    DestroyMaterial(handle);
    NAPI_END;
}

} // namespace ArkUICapiTest
