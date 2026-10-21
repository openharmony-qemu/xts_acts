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
#include <arkui/native_type_visual.h>

namespace ArkUICapiTest {

napi_value TestLinearGradientBlurCreateDestroy001(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurDestroyNull002(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(nullptr);
    NAPI_END;
}

napi_value TestLinearGradientBlurSetGetRadius003(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    float radius = 50.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetBlurRadius(options, radius),
        ARKUI_ERROR_CODE_NO_ERROR);
    float gotRadius = 0.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetBlurRadius(options, &gotRadius),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(gotRadius, radius);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurGetRadiusDefault004(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    float gotRadius = -1.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetBlurRadius(options, &gotRadius),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(gotRadius, 0.0f);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurSetRadiusZero005(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetBlurRadius(options, 0.0f),
        ARKUI_ERROR_CODE_NO_ERROR);
    float gotRadius = -1.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetBlurRadius(options, &gotRadius),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(gotRadius, 0.0f);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurSetRadiusLarge006(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    float largeRadius = 10000.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetBlurRadius(options, largeRadius),
        ARKUI_ERROR_CODE_NO_ERROR);
    float gotRadius = 0.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetBlurRadius(options, &gotRadius),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(gotRadius, largeRadius);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurSetRadiusNull007(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetBlurRadius(nullptr, 50.0f),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TestLinearGradientBlurGetRadiusNull008(napi_env env, napi_callback_info info)
{
    (void)info;
    float radius = 0.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetBlurRadius(nullptr, &radius),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetBlurRadius(options, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurSetGetFractionStops009(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    float stops[] = {0.0f, 0.0f, 0.0f, 1.0f};
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetFractionStops(options, stops, PARAM_4),
        ARKUI_ERROR_CODE_NO_ERROR);
    float gotStops[PARAM_4] = {};
    int32_t writeLen = 0;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetFractionStops(options, gotStops, PARAM_4, &writeLen),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(writeLen, PARAM_4);
    ASSERT_EQ(gotStops[PARAM_0], 0.0f);
    ASSERT_EQ(gotStops[PARAM_3], 1.0f);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurSetFractionStopsCustom010(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    float stops[] = {0.2f, 0.5f, 0.8f, 1.0f};
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetFractionStops(options, stops, PARAM_4),
        ARKUI_ERROR_CODE_NO_ERROR);
    float gotStops[PARAM_4] = {};
    int32_t writeLen = 0;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetFractionStops(options, gotStops, PARAM_4, &writeLen),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(gotStops[PARAM_0], 0.2f);
    ASSERT_EQ(gotStops[PARAM_1], 0.5f);
    ASSERT_EQ(gotStops[PARAM_2], 0.8f);
    ASSERT_EQ(gotStops[PARAM_3], 1.0f);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurSetFractionStopsNull011(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetFractionStops(nullptr, nullptr, PARAM_4),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetFractionStops(options, nullptr, PARAM_4),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    float stops[] = {0.0f, 1.0f, 0.0f, 1.0f};
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetFractionStops(nullptr, stops, PARAM_4),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurGetFractionStopsNull012(napi_env env, napi_callback_info info)
{
    (void)info;
    float gotStops[PARAM_4] = {};
    int32_t writeLen = 0;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetFractionStops(nullptr, gotStops, PARAM_4, &writeLen),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetFractionStops(options, nullptr, PARAM_4, &writeLen),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetFractionStops(options, gotStops, PARAM_4, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurSetGetDirection013(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetDirection(options,
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LinearGradientBlurDirection dir = OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetDirection(options, &dir),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(dir, OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurDirectionEnum014(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    OH_ArkUI_LinearGradientBlurDirection dirs[] = {
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM,
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_TOP,
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT,
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT,
    };
    for (auto dir : dirs) {
        ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetDirection(options, dir),
            ARKUI_ERROR_CODE_NO_ERROR);
        OH_ArkUI_LinearGradientBlurDirection gotDir = OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM;
        ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetDirection(options, &gotDir),
            ARKUI_ERROR_CODE_NO_ERROR);
        ASSERT_EQ(gotDir, dir);
    }
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurSetDirectionNull015(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetDirection(nullptr,
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TestLinearGradientBlurGetDirectionNull016(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_LinearGradientBlurDirection dir = OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetDirection(nullptr, &dir),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetDirection(options, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurGetDefaultDirection017(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    OH_ArkUI_LinearGradientBlurDirection dir =
        static_cast<OH_ArkUI_LinearGradientBlurDirection>(PARAM_NEGATIVE_1);
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetDirection(options, &dir),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(dir, OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurGetDefaultFractionStops018(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    float gotStops[PARAM_4] = {};
    int32_t writeLen = 0;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetFractionStops(options, gotStops, PARAM_4, &writeLen),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(writeLen, PARAM_4);
    ASSERT_EQ(gotStops[PARAM_0], 0.0f);
    ASSERT_EQ(gotStops[PARAM_1], 0.0f);
    ASSERT_EQ(gotStops[PARAM_2], 0.0f);
    ASSERT_EQ(gotStops[PARAM_3], 1.0f);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

napi_value TestLinearGradientBlurUpdateAllParams019(napi_env env, napi_callback_info info)
{
    (void)info;
    auto options = OH_ArkUI_NativeModule_LinearGradientBlurOptions_Create();
    ASSERT_EQ(options != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetBlurRadius(options, 100.0f),
        ARKUI_ERROR_CODE_NO_ERROR);
    float stops[] = {0.1f, 0.3f, 0.6f, 1.0f};
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetFractionStops(options, stops, PARAM_4),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_SetDirection(options,
        OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_TOP), ARKUI_ERROR_CODE_NO_ERROR);
    float gotRadius = 0.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetBlurRadius(options, &gotRadius),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(gotRadius, 100.0f);
    float gotStops[PARAM_4] = {};
    int32_t writeLen = 0;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetFractionStops(options, gotStops, PARAM_4, &writeLen),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(gotStops[PARAM_0], 0.1f);
    ASSERT_EQ(gotStops[PARAM_3], 1.0f);
    OH_ArkUI_LinearGradientBlurDirection gotDir = OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM;
    ASSERT_EQ(OH_ArkUI_NativeModule_LinearGradientBlurOptions_GetDirection(options, &gotDir),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(gotDir, OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_TOP);
    OH_ArkUI_NativeModule_LinearGradientBlurOptions_Destroy(options);
    NAPI_END;
}

} // namespace ArkUICapiTest
