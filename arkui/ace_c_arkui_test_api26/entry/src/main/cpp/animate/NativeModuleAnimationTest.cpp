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
#include <arkui/error_code.h>
#include <arkui/native_animate.h>
#include <arkui/native_node.h>
#include <arkui/native_render.h>
#include <arkui/native_type_visual.h>

namespace ArkUICapiTest {

static const int32_t DURATION_MS = 200;
static const int32_t DELAY_MS = 10;
static const int32_t KEYFRAME_SIZE = 2;
static const float TEMPO_VALUE = 1.0f;
static const float KEY_TIME_START = 0.0f;
static const float KEY_TIME_END = 1.0f;
static const float OPACITY_FROM = 0.2f;
static const float OPACITY_TO = 1.0f;

using CurveByTypeFn = ArkUI_CurveHandle (*)(ArkUI_AnimationCurve);
using CurveCubicFn = ArkUI_CurveHandle (*)(float, float, float, float);

static void OnGroupFinish(void *userData)
{
    (void)userData;
}

static ArkUI_NumberValue MakeF32(float value)
{
    ArkUI_NumberValue numberValue;
    numberValue.f32 = value;
    return numberValue;
}

static ArkUI_CurveHandle MakeCurve()
{
    auto curve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    if (curve != nullptr) {
        return curve;
    }
    curve = OH_ArkUI_Curve_CreateCubicBezierCurve(0.42f, 0.0f, 0.58f, 1.0f);
    if (curve != nullptr) {
        return curve;
    }
    auto byType = AnimFp<CurveByTypeFn>("OH_ArkUI_Curve_CreateCurveByType");
    if (byType != nullptr) {
        curve = byType(ARKUI_CURVE_LINEAR);
        if (curve != nullptr) {
            return curve;
        }
    }
    auto cubic = AnimFp<CurveCubicFn>("OH_ArkUI_Curve_CreateCubicBezierCurve");
    if (cubic == nullptr) {
        return nullptr;
    }
    return cubic(0.42f, 0.0f, 0.58f, 1.0f);
}

static void DisposeCurve(ArkUI_CurveHandle curve)
{
    if (curve == nullptr) {
        return;
    }
    OH_ArkUI_Curve_DisposeCurve(curve);
}

static void PrepareProp(OH_ArkUI_PropertyAnimationHandle anim, ArkUI_RenderNodeHandle target)
{
    ArkUI_NumberValue fromValue = MakeF32(OPACITY_FROM);
    ArkUI_NumberValue toValue = MakeF32(OPACITY_TO);
    OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, &fromValue, PARAM_1);
    OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, &toValue, PARAM_1);
    OH_ArkUI_NativeModule_PropertyAnimation_SetDuration(anim, DURATION_MS);
    OH_ArkUI_NativeModule_PropertyAnimation_SetTargetNode(anim, target);
}

static void PrepareKey(OH_ArkUI_KeyframeAnimationHandle anim, ArkUI_RenderNodeHandle target)
{
    float keyTimes[KEYFRAME_SIZE] = { KEY_TIME_START, KEY_TIME_END };
    ArkUI_NumberValue values[KEYFRAME_SIZE];
    values[PARAM_0] = MakeF32(OPACITY_FROM);
    values[PARAM_1] = MakeF32(OPACITY_TO);
    OH_ArkUI_NativeModule_KeyframeAnimation_SetKeyTimes(anim, keyTimes, KEYFRAME_SIZE);
    OH_ArkUI_NativeModule_KeyframeAnimation_SetValues(anim, values, KEYFRAME_SIZE);
    OH_ArkUI_NativeModule_KeyframeAnimation_SetDuration(anim, DURATION_MS);
    OH_ArkUI_NativeModule_KeyframeAnimation_SetTargetNode(anim, target);
}

static void PreparePath(OH_ArkUI_PathAnimationHandle anim, ArkUI_RenderNodeHandle target)
{
    OH_ArkUI_NativeModule_PathAnimation_SetDuration(anim, DURATION_MS);
    OH_ArkUI_NativeModule_PathAnimation_SetTargetNode(anim, target);
}

static napi_value NativeAnimEnum001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ATTRIBUTE_FOUND, 106211);
    ASSERT_EQ(ARKUI_ERROR_CODE_SUB_ANIMATION_INVALID, 106212);
    ASSERT_EQ(ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND, 106213);
    ASSERT_EQ(ARKUI_ERROR_CODE_ANIMATION_GROUP_REENTRANT_CALL, 106214);
    ASSERT_EQ(ARKUI_ERROR_CODE_ANIMATION_GROUP_INVALID_STATE, 106215);
    ASSERT_EQ(OH_ARKUI_ANIMATION_PROPERTY_TRANSLATION, 0);
    ASSERT_EQ(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, 11);
    ASSERT_EQ(OH_ARKUI_ANIMATION_PROPERTY_BACKGROUND_COLOR, 17);
    ASSERT_EQ(OH_ARKUI_ANIMATION_GROUP_STATE_RUNNING, 0);
    ASSERT_EQ(OH_ARKUI_ANIMATION_GROUP_STATE_PAUSED, 1);
    ASSERT_EQ(OH_ARKUI_ANIMATION_GROUP_STATE_INACTIVE, 2);
    ASSERT_EQ(OH_ARKUI_ANIMATION_FINISH_TO_START, 0);
    ASSERT_EQ(OH_ARKUI_ANIMATION_FINISH_TO_CURRENT, 1);
    ASSERT_EQ(OH_ARKUI_ANIMATION_FINISH_TO_END, 2);
    NAPI_END;
}
static napi_value NativeAnimPropCreate002(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropDestroy003(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetFrom004(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue v = MakeF32(OPACITY_FROM);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, &v, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetFrom005(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue v = MakeF32(OPACITY_FROM);
    ArkUI_NumberValue got;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, &v, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetFromValue(anim, &got, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetTo006(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue v = MakeF32(OPACITY_TO);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, &v, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetTo007(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue v = MakeF32(OPACITY_TO);
    ArkUI_NumberValue got;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, &v, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetToValue(anim, &got, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetDur008(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDuration(anim, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetDur009(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    int32_t duration = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDuration(anim, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetDuration(anim, &duration), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(duration, DURATION_MS);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetDelay010(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDelay(anim, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetDelay011(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    int32_t delay = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDelay(anim, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetDelay(anim, &delay), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetCurve012(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_CurveHandle curve = MakeCurve();
    ASSERT_EQ(curve != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetCurve(anim, curve), ARKUI_ERROR_CODE_NO_ERROR);
    DisposeCurve(curve);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetCurve013(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_CurveHandle curve = MakeCurve();
    ArkUI_CurveHandle got = nullptr;
    ASSERT_EQ(curve != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetCurve(anim, curve), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetCurve(anim, &got), ARKUI_ERROR_CODE_NO_ERROR);
    DisposeCurve(curve);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetTempo014(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetTempo(anim, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetTempo015(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    float tempo = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetTempo(anim, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetTempo(anim, &tempo), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetAutoRev016(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetAutoReverse(anim, true), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetAutoRev017(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    bool autoReverse = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetAutoReverse(anim, true), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetAutoReverse(anim, &autoReverse), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetIter018(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetIterations(anim, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetIter019(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    int32_t iterations = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetIterations(anim, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetIterations(anim, &iterations), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetTarget020(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetTarget021(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_RenderNodeHandle target = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetTargetNode(anim, &target), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropDestroyNull022(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(nullptr);
    NAPI_END;
}
static napi_value NativeAnimPropSetFromNullAnim023(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NumberValue v = MakeF32(OPACITY_FROM);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, &v, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value NativeAnimPropSetFromNullVal024(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetFromNullAnim025(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NumberValue got;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetFromValue(nullptr, &got, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value NativeAnimPropGetFromNullOut026(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetToNullAnim027(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NumberValue v = MakeF32(OPACITY_TO);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, &v, PARAM_1), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value NativeAnimPropSetToNullVal028(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetToNullAnim029(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NumberValue got;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetToValue(nullptr, &got, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value NativeAnimPropGetToNullOut030(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetDurNull031(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDuration(nullptr, DURATION_MS),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value NativeAnimPropSetDurInvalid032(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDuration(anim, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetDurNull033(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t duration = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetDuration(nullptr, &duration), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetDuration(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetDelayNull034(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDelay(nullptr, DELAY_MS), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value NativeAnimPropGetDelayNull035(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t delay = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetDelay(nullptr, &delay), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetDelay(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetCurveNull036(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetCurve(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetCurve(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetCurveNull037(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_CurveHandle curve = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetCurve(nullptr, &curve), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetCurve(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetTempoNull038(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetTempo(nullptr, TEMPO_VALUE), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value NativeAnimPropGetTempoNull039(napi_env env, napi_callback_info info)
{
    (void)info;
    float tempo = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetTempo(nullptr, &tempo), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetTempo(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetAutoRevNull040(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetAutoReverse(nullptr, true), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value NativeAnimPropGetAutoRevNull041(napi_env env, napi_callback_info info)
{
    (void)info;
    bool flag = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetAutoReverse(nullptr, &flag), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetAutoReverse(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetIterNull042(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetIterations(nullptr, PARAM_1), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetIterations(anim, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropGetIterNull043(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t iterations = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetIterations(nullptr, &iterations),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetIterations(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPropSetTargetNull044(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetTargetNode(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value NativeAnimPropGetTargetNull045(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_RenderNodeHandle target = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetTargetNode(nullptr, &target), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyCreate046(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyDestroy047(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetKeyTimes048(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    float keyTimes[KEYFRAME_SIZE] = { KEY_TIME_START, KEY_TIME_END };
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetKeyTimes(anim, keyTimes, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetKeyTime049(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    float keyTimes[KEYFRAME_SIZE] = { KEY_TIME_START, KEY_TIME_END };
    float keyTime = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetKeyTimes(anim, keyTimes, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetKeyTime(anim, PARAM_0, &keyTime), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetKeyTime050(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    float keyTimes[KEYFRAME_SIZE] = { KEY_TIME_START, KEY_TIME_END };
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetKeyTimes(anim, keyTimes, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetKeyTime(anim, PARAM_0, KEY_TIME_START),
        ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetValue051(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue v = MakeF32(OPACITY_FROM);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetValue(anim, PARAM_0, &v, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetValues052(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue values[KEYFRAME_SIZE] = { MakeF32(OPACITY_FROM), MakeF32(OPACITY_TO) };
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetValues(anim, values, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetValue053(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue values[KEYFRAME_SIZE] = { MakeF32(OPACITY_FROM), MakeF32(OPACITY_TO) };
    ArkUI_NumberValue got;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetValues(anim, values, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetValue(anim, PARAM_0, &got, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetCurves054(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_CurveHandle curve = MakeCurve();
    ASSERT_EQ(curve != nullptr, true);
    ArkUI_CurveHandle curves[KEYFRAME_SIZE] = { curve, curve };
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetCurves(anim, curves, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_NO_ERROR);
    DisposeCurve(curve);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetCurve055(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_CurveHandle curve = MakeCurve();
    ASSERT_EQ(curve != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetCurve(anim, PARAM_0, curve), ARKUI_ERROR_CODE_NO_ERROR);
    DisposeCurve(curve);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetCurve056(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_CurveHandle curve = MakeCurve();
    ArkUI_CurveHandle got = nullptr;
    ASSERT_EQ(curve != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetCurve(anim, PARAM_0, curve), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetCurve(anim, PARAM_0, &got), ARKUI_ERROR_CODE_NO_ERROR);
    DisposeCurve(curve);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetDur057(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetDuration(anim, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetDur058(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    int32_t duration = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetDuration(anim, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetDuration(anim, &duration), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetDelay059(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetDelay(anim, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetDelay060(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    int32_t delay = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetDelay(anim, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetDelay(anim, &delay), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetTempo061(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetTempo(anim, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetTempo062(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    float tempo = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetTempo(anim, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetTempo(anim, &tempo), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetAutoRev063(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetAutoReverse(anim, false), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetAutoRev064(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    bool flag = true;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetAutoReverse(anim, false), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetAutoReverse(anim, &flag), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetIter065(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetIterations(anim, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetIter066(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    int32_t iterations = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetIterations(anim, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetIterations(anim, &iterations), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetTarget067(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetTarget068(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_RenderNodeHandle target = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetTargetNode(anim, &target), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyCreateInvalid069(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, PARAM_1);
    ASSERT_EQ(anim == nullptr, true);
    NAPI_END;
}
static napi_value NativeAnimKeyDestroyNull070(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(nullptr);
    NAPI_END;
}
static napi_value NativeAnimKeySetKeyTimesNull071(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetKeyTimes(nullptr, nullptr, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetKeyTimes(anim, nullptr, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetKeyTimeNull072(napi_env env, napi_callback_info info)
{
    (void)info;
    float keyTime = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetKeyTime(nullptr, PARAM_0, &keyTime),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetKeyTime(anim, PARAM_0, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetKeyTimeNull073(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetKeyTime(nullptr, PARAM_0, KEY_TIME_START),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetKeyTime(anim, PARAM_2, KEY_TIME_END),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetValueNull074(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NumberValue v = MakeF32(OPACITY_FROM);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetValue(nullptr, PARAM_0, &v, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetValue(anim, PARAM_0, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetValuesNull075(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetValues(nullptr, nullptr, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetValues(anim, nullptr, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetValueNull076(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NumberValue got;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetValue(nullptr, PARAM_0, &got, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetValue(anim, PARAM_0, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetCurvesNull077(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetCurves(nullptr, nullptr, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetCurves(anim, nullptr, KEYFRAME_SIZE),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeySetCurveNull078(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetCurve(nullptr, PARAM_0, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetCurve(anim, PARAM_0, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyGetCurveNull079(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_CurveHandle curve = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetCurve(nullptr, PARAM_0, &curve),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetCurve(anim, PARAM_0, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyTimingNull080(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetDuration(nullptr, DURATION_MS),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetDelay(nullptr, DELAY_MS), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetTempo(nullptr, TEMPO_VALUE), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetAutoReverse(nullptr, true), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetIterations(nullptr, PARAM_1), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetDuration(anim, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetIterations(anim, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetDuration(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimKeyTargetNull081(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_RenderNodeHandle target = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetTargetNode(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetTargetNode(nullptr, &target), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_GetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathCreate082(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathDestroy083(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathSetDur084(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDuration(anim, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathGetDur085(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    int32_t duration = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDuration(anim, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDuration(anim, &duration), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathSetDelay086(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDelay(anim, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathGetDelay087(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    int32_t delay = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDelay(anim, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDelay(anim, &delay), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathSetCurve088(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_CurveHandle curve = MakeCurve();
    ASSERT_EQ(curve != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetCurve(anim, curve), ARKUI_ERROR_CODE_NO_ERROR);
    DisposeCurve(curve);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathGetCurve089(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_CurveHandle curve = MakeCurve();
    ArkUI_CurveHandle got = nullptr;
    ASSERT_EQ(curve != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetCurve(anim, curve), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetCurve(anim, &got), ARKUI_ERROR_CODE_NO_ERROR);
    DisposeCurve(curve);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathSetTempo090(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTempo(anim, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathGetTempo091(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    float tempo = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTempo(anim, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTempo(anim, &tempo), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathSetAutoRev092(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoReverse(anim, true), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathGetAutoRev093(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    bool flag = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoReverse(anim, true), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoReverse(anim, &flag), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathSetIter094(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetIterations(anim, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathGetIter095(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    int32_t iterations = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetIterations(anim, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetIterations(anim, &iterations), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathSetAutoRot096(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoRotation(anim, true), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathGetAutoRot097(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    bool flag = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoRotation(anim, true), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoRotation(anim, &flag), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathSetTarget098(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathGetTarget099(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_RenderNodeHandle target = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTargetNode(anim, &target), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathCreateNull100(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(nullptr);
    ASSERT_EQ(anim == nullptr, true);
    NAPI_END;
}
static napi_value NativeAnimPathDestroyNull101(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_NativeModule_PathAnimation_Destroy(nullptr);
    NAPI_END;
}
static napi_value NativeAnimPathSetDurNull102(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDuration(nullptr, DURATION_MS), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDuration(anim, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathGetDurNull103(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t duration = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDuration(nullptr, &duration), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDuration(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathDelayNull104(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t delay = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDelay(nullptr, DELAY_MS), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDelay(nullptr, &delay), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDelay(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathCurveNull105(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_CurveHandle curve = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetCurve(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetCurve(nullptr, &curve), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetCurve(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetCurve(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathTempoNull106(napi_env env, napi_callback_info info)
{
    (void)info;
    float tempo = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTempo(nullptr, TEMPO_VALUE), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTempo(nullptr, &tempo), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTempo(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathAutoRevNull107(napi_env env, napi_callback_info info)
{
    (void)info;
    bool flag = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoReverse(nullptr, true), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoReverse(nullptr, &flag), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoReverse(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathIterNull108(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t iterations = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetIterations(nullptr, PARAM_1), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetIterations(nullptr, &iterations), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetIterations(anim, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetIterations(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathAutoRotNull109(napi_env env, napi_callback_info info)
{
    (void)info;
    bool flag = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoRotation(nullptr, true), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoRotation(nullptr, &flag), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoRotation(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimPathTargetNull110(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_RenderNodeHandle target = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTargetNode(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTargetNode(nullptr, &target), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 100 0");
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimGroupCreate111(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupDestroy112(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupSetDur113(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetDuration(group, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupGetDur114(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    int32_t duration = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetDuration(group, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetDuration(group, &duration), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupSetDelay115(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetDelay(group, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupGetDelay116(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    int32_t delay = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetDelay(group, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetDelay(group, &delay), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupSetCurve117(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ArkUI_CurveHandle curve = MakeCurve();
    ASSERT_EQ(curve != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetCurve(group, curve), ARKUI_ERROR_CODE_NO_ERROR);
    DisposeCurve(curve);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupGetCurve118(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ArkUI_CurveHandle curve = MakeCurve();
    ArkUI_CurveHandle got = nullptr;
    ASSERT_EQ(curve != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetCurve(group, curve), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetCurve(group, &got), ARKUI_ERROR_CODE_NO_ERROR);
    DisposeCurve(curve);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupSetTempo119(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetTempo(group, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupGetTempo120(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    float tempo = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetTempo(group, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetTempo(group, &tempo), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupSetAutoRev121(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetAutoReverse(group, false), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupGetAutoRev122(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    bool flag = true;
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetAutoReverse(group, false), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetAutoReverse(group, &flag), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupSetIter123(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetIterations(group, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupGetIter124(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    int32_t iterations = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetIterations(group, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetIterations(group, &iterations), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupSetFps125(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ArkUI_ExpectedFrameRateRange range = { 15, 60, 30 };
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetExpectedFrameRateRange(group, &range), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupGetFps126(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ArkUI_ExpectedFrameRateRange range = { 15, 60, 30 };
    ArkUI_ExpectedFrameRateRange got = { 0, 0, 0 };
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetExpectedFrameRateRange(group, &range), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetExpectedFrameRateRange(group, &got), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupRegFinish127(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_RegisterOnFinishCallback(group, nullptr, OnGroupFinish),
        ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupSetTarget128(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    auto renderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(renderNode != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetTargetNode(group, renderNode), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    OH_ArkUI_RenderNodeUtils_DisposeNode(renderNode);
    NAPI_END;
}
static napi_value NativeAnimGroupGetTarget129(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    auto renderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    ArkUI_RenderNodeHandle target = nullptr;
    ASSERT_EQ(renderNode != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetTargetNode(group, renderNode), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetTargetNode(group, &target), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    OH_ArkUI_RenderNodeUtils_DisposeNode(renderNode);
    NAPI_END;
}
static napi_value NativeAnimGroupAddProp130(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    auto prop = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    auto renderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(prop != nullptr, true);
    ASSERT_EQ(renderNode != nullptr, true);
    PrepareProp(prop, renderNode);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_AddPropertyAnimation(group, prop), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(prop);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    OH_ArkUI_RenderNodeUtils_DisposeNode(renderNode);
    NAPI_END;
}
static napi_value NativeAnimGroupAddKey131(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    auto key = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    auto renderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(key != nullptr, true);
    ASSERT_EQ(renderNode != nullptr, true);
    PrepareKey(key, renderNode);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_AddKeyframeAnimation(group, key), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(key);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    OH_ArkUI_RenderNodeUtils_DisposeNode(renderNode);
    NAPI_END;
}
static napi_value NativeAnimGroupAddPath132(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    (void)column;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    auto path = OH_ArkUI_NativeModule_PathAnimation_Create("M 0 0 L 50 50");
    auto renderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(path != nullptr, true);
    ASSERT_EQ(renderNode != nullptr, true);
    PreparePath(path, renderNode);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_AddPathAnimation(group, path), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(path);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    OH_ArkUI_RenderNodeUtils_DisposeNode(renderNode);
    NAPI_END;
}
static napi_value NativeAnimAddGroup133(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    auto addRet = OH_ArkUI_NativeModule_AddAnimationGroup(context, group, "xts_anim_key");
    bool addOk = addRet == ARKUI_ERROR_CODE_SUB_ANIMATION_INVALID ||
        addRet == ARKUI_ERROR_CODE_PARAM_INVALID || addRet == ARKUI_ERROR_CODE_NO_ERROR;
    ASSERT_EQ(addOk, true);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimHasGroup134(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    bool exists = true;
    ASSERT_EQ(OH_ArkUI_NativeModule_HasAnimationGroup(context, "xts_missing_key", &exists), ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
static napi_value NativeAnimGetState135(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    OH_ArkUI_AnimationGroupState state = OH_ARKUI_ANIMATION_GROUP_STATE_RUNNING;
    ASSERT_EQ(OH_ArkUI_NativeModule_GetAnimationGroupState(context, "xts_missing_key", &state),
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}
static napi_value NativeAnimRemoveGroup136(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_RemoveAnimationGroup(context, "xts_missing_key"),
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}
static napi_value NativeAnimPauseGroup137(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PauseAnimationGroup(context, "xts_missing_key"),
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}
static napi_value NativeAnimResumeGroup138(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_ResumeAnimationGroup(context, "xts_missing_key"),
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}
static napi_value NativeAnimFinishGroup139(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_FinishAnimationGroup(context, "xts_missing_key", OH_ARKUI_ANIMATION_FINISH_TO_END),
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}
static napi_value NativeAnimGroupDestroyNull140(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(nullptr);
    NAPI_END;
}
static napi_value NativeAnimGroupTimingNull141(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetDuration(nullptr, DURATION_MS), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetDelay(nullptr, DELAY_MS), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetTempo(nullptr, TEMPO_VALUE), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetAutoReverse(nullptr, true), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetIterations(nullptr, PARAM_1), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetDuration(group, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetIterations(group, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetDuration(group, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupCurveNull142(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_CurveHandle curve = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetCurve(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetCurve(nullptr, &curve), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetCurve(group, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetCurve(group, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupFpsNull143(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_ExpectedFrameRateRange range = { 15, 60, 30 };
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetExpectedFrameRateRange(nullptr, &range),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetExpectedFrameRateRange(group, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetExpectedFrameRateRange(group, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupRegNull144(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_RegisterOnFinishCallback(group, nullptr, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_RegisterOnFinishCallback(nullptr, nullptr, OnGroupFinish),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupAddNull145(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_AddPropertyAnimation(group, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_AddKeyframeAnimation(group, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_AddPathAnimation(group, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_AddPropertyAnimation(nullptr, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimGroupTargetNull146(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_RenderNodeHandle target = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetTargetNode(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetTargetNode(nullptr, &target), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetTargetNode(group, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimCtxNull147(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    bool exists = false;
    OH_ArkUI_AnimationGroupState state = OH_ARKUI_ANIMATION_GROUP_STATE_INACTIVE;
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AddAnimationGroup(nullptr, group, "k"), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AddAnimationGroup(context, nullptr, "k"), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AddAnimationGroup(context, group, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_RemoveAnimationGroup(nullptr, "k"), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_RemoveAnimationGroup(context, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_HasAnimationGroup(nullptr, "k", &exists), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_HasAnimationGroup(context, nullptr, &exists), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_HasAnimationGroup(context, "k", nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_GetAnimationGroupState(nullptr, "k", &state), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_GetAnimationGroupState(context, nullptr, &state), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_GetAnimationGroupState(context, "k", nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
static napi_value NativeAnimCtrlNull148(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PauseAnimationGroup(nullptr, "k"), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PauseAnimationGroup(context, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_ResumeAnimationGroup(nullptr, "k"), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_ResumeAnimationGroup(context, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_FinishAnimationGroup(nullptr, "k", OH_ARKUI_ANIMATION_FINISH_TO_END),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_FinishAnimationGroup(context, nullptr, OH_ARKUI_ANIMATION_FINISH_TO_END),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value NativeAnimPropTrans149(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_TRANSLATION);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_2] = { MakeF32(0.0f), MakeF32(0.0f) };
    ArkUI_NumberValue toVal[PARAM_2] = { MakeF32(10.0f), MakeF32(20.0f) };
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_2), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_2), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
static napi_value NativeAnimFinishModes150(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_FinishAnimationGroup(context,
        "xts_missing_key",
        OH_ARKUI_ANIMATION_FINISH_TO_START)
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    ASSERT_EQ(OH_ArkUI_NativeModule_FinishAnimationGroup(context,
        "xts_missing_key",
        OH_ARKUI_ANIMATION_FINISH_TO_CURRENT)
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    ASSERT_EQ(OH_ArkUI_NativeModule_FinishAnimationGroup(context, "xts_missing_key", OH_ARKUI_ANIMATION_FINISH_TO_END),
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}
static void RegisterAnimProps00(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimEnum001", nullptr, NativeAnimEnum001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropCreate002", nullptr, NativeAnimPropCreate002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropDestroy003", nullptr,
            NativeAnimPropDestroy003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetFrom004", nullptr,
            NativeAnimPropSetFrom004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetFrom005", nullptr,
            NativeAnimPropGetFrom005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTo006", nullptr, NativeAnimPropSetTo006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTo007", nullptr, NativeAnimPropGetTo007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDur008", nullptr, NativeAnimPropSetDur008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDur009", nullptr, NativeAnimPropGetDur009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDelay010", nullptr,
            NativeAnimPropSetDelay010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDelay011", nullptr,
            NativeAnimPropGetDelay011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetCurve012", nullptr,
            NativeAnimPropSetCurve012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetCurve013", nullptr,
            NativeAnimPropGetCurve013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTempo014", nullptr,
            NativeAnimPropSetTempo014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTempo015", nullptr,
            NativeAnimPropGetTempo015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetAutoRev016", nullptr,
            NativeAnimPropSetAutoRev016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetAutoRev017", nullptr,
            NativeAnimPropGetAutoRev017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetIter018", nullptr,
            NativeAnimPropSetIter018, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}
static void RegisterAnimProps01(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimPropGetIter019", nullptr,
            NativeAnimPropGetIter019, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTarget020", nullptr,
            NativeAnimPropSetTarget020, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTarget021", nullptr,
            NativeAnimPropGetTarget021, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropDestroyNull022", nullptr,
            NativeAnimPropDestroyNull022, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetFromNullAnim023", nullptr,
            NativeAnimPropSetFromNullAnim023, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetFromNullVal024", nullptr,
            NativeAnimPropSetFromNullVal024, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetFromNullAnim025", nullptr,
            NativeAnimPropGetFromNullAnim025, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetFromNullOut026", nullptr,
            NativeAnimPropGetFromNullOut026, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetToNullAnim027", nullptr,
            NativeAnimPropSetToNullAnim027, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetToNullVal028", nullptr,
            NativeAnimPropSetToNullVal028, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetToNullAnim029", nullptr,
            NativeAnimPropGetToNullAnim029, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetToNullOut030", nullptr,
            NativeAnimPropGetToNullOut030, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDurNull031", nullptr,
            NativeAnimPropSetDurNull031, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDurInvalid032", nullptr,
            NativeAnimPropSetDurInvalid032, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDurNull033", nullptr,
            NativeAnimPropGetDurNull033, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDelayNull034", nullptr,
            NativeAnimPropSetDelayNull034, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDelayNull035", nullptr,
            NativeAnimPropGetDelayNull035, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetCurveNull036", nullptr,
            NativeAnimPropSetCurveNull036, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}
static void RegisterAnimProps02(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimPropGetCurveNull037", nullptr,
            NativeAnimPropGetCurveNull037, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTempoNull038", nullptr,
            NativeAnimPropSetTempoNull038, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTempoNull039", nullptr,
            NativeAnimPropGetTempoNull039, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetAutoRevNull040", nullptr,
            NativeAnimPropSetAutoRevNull040, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetAutoRevNull041", nullptr,
            NativeAnimPropGetAutoRevNull041, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetIterNull042", nullptr,
            NativeAnimPropSetIterNull042, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetIterNull043", nullptr,
            NativeAnimPropGetIterNull043, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTargetNull044", nullptr,
            NativeAnimPropSetTargetNull044, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTargetNull045", nullptr,
            NativeAnimPropGetTargetNull045, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyCreate046", nullptr, NativeAnimKeyCreate046, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyDestroy047", nullptr, NativeAnimKeyDestroy047, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetKeyTimes048", nullptr,
            NativeAnimKeySetKeyTimes048, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetKeyTime049", nullptr,
            NativeAnimKeyGetKeyTime049, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetKeyTime050", nullptr,
            NativeAnimKeySetKeyTime050, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValue051", nullptr,
            NativeAnimKeySetValue051, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValues052", nullptr,
            NativeAnimKeySetValues052, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetValue053", nullptr,
            NativeAnimKeyGetValue053, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetCurves054", nullptr,
            NativeAnimKeySetCurves054, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}
static void RegisterAnimProps03(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimKeySetCurve055", nullptr,
            NativeAnimKeySetCurve055, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetCurve056", nullptr,
            NativeAnimKeyGetCurve056, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetDur057", nullptr, NativeAnimKeySetDur057, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetDur058", nullptr, NativeAnimKeyGetDur058, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetDelay059", nullptr,
            NativeAnimKeySetDelay059, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetDelay060", nullptr,
            NativeAnimKeyGetDelay060, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetTempo061", nullptr,
            NativeAnimKeySetTempo061, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetTempo062", nullptr,
            NativeAnimKeyGetTempo062, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetAutoRev063", nullptr,
            NativeAnimKeySetAutoRev063, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetAutoRev064", nullptr,
            NativeAnimKeyGetAutoRev064, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetIter065", nullptr, NativeAnimKeySetIter065, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetIter066", nullptr, NativeAnimKeyGetIter066, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetTarget067", nullptr,
            NativeAnimKeySetTarget067, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetTarget068", nullptr,
            NativeAnimKeyGetTarget068, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyCreateInvalid069", nullptr,
            NativeAnimKeyCreateInvalid069, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyDestroyNull070", nullptr,
            NativeAnimKeyDestroyNull070, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetKeyTimesNull071", nullptr,
            NativeAnimKeySetKeyTimesNull071, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetKeyTimeNull072", nullptr,
            NativeAnimKeyGetKeyTimeNull072, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}
static void RegisterAnimProps04(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimKeySetKeyTimeNull073", nullptr,
            NativeAnimKeySetKeyTimeNull073, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValueNull074", nullptr,
            NativeAnimKeySetValueNull074, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValuesNull075", nullptr,
            NativeAnimKeySetValuesNull075, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetValueNull076", nullptr,
            NativeAnimKeyGetValueNull076, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetCurvesNull077", nullptr,
            NativeAnimKeySetCurvesNull077, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetCurveNull078", nullptr,
            NativeAnimKeySetCurveNull078, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetCurveNull079", nullptr,
            NativeAnimKeyGetCurveNull079, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyTimingNull080", nullptr,
            NativeAnimKeyTimingNull080, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyTargetNull081", nullptr,
            NativeAnimKeyTargetNull081, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathCreate082", nullptr, NativeAnimPathCreate082, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathDestroy083", nullptr,
            NativeAnimPathDestroy083, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetDur084", nullptr, NativeAnimPathSetDur084, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetDur085", nullptr, NativeAnimPathGetDur085, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetDelay086", nullptr,
            NativeAnimPathSetDelay086, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetDelay087", nullptr,
            NativeAnimPathGetDelay087, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetCurve088", nullptr,
            NativeAnimPathSetCurve088, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetCurve089", nullptr,
            NativeAnimPathGetCurve089, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetTempo090", nullptr,
            NativeAnimPathSetTempo090, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}
static void RegisterAnimProps05(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimPathGetTempo091", nullptr,
            NativeAnimPathGetTempo091, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetAutoRev092", nullptr,
            NativeAnimPathSetAutoRev092, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetAutoRev093", nullptr,
            NativeAnimPathGetAutoRev093, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetIter094", nullptr,
            NativeAnimPathSetIter094, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetIter095", nullptr,
            NativeAnimPathGetIter095, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetAutoRot096", nullptr,
            NativeAnimPathSetAutoRot096, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetAutoRot097", nullptr,
            NativeAnimPathGetAutoRot097, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetTarget098", nullptr,
            NativeAnimPathSetTarget098, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetTarget099", nullptr,
            NativeAnimPathGetTarget099, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathCreateNull100", nullptr,
            NativeAnimPathCreateNull100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathDestroyNull101", nullptr,
            NativeAnimPathDestroyNull101, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetDurNull102", nullptr,
            NativeAnimPathSetDurNull102, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetDurNull103", nullptr,
            NativeAnimPathGetDurNull103, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathDelayNull104", nullptr,
            NativeAnimPathDelayNull104, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathCurveNull105", nullptr,
            NativeAnimPathCurveNull105, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathTempoNull106", nullptr,
            NativeAnimPathTempoNull106, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathAutoRevNull107", nullptr,
            NativeAnimPathAutoRevNull107, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathIterNull108", nullptr,
            NativeAnimPathIterNull108, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}
static void RegisterAnimProps06(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimPathAutoRotNull109", nullptr,
            NativeAnimPathAutoRotNull109, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathTargetNull110", nullptr,
            NativeAnimPathTargetNull110, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupCreate111", nullptr,
            NativeAnimGroupCreate111, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupDestroy112", nullptr,
            NativeAnimGroupDestroy112, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetDur113", nullptr,
            NativeAnimGroupSetDur113, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetDur114", nullptr,
            NativeAnimGroupGetDur114, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetDelay115", nullptr,
            NativeAnimGroupSetDelay115, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetDelay116", nullptr,
            NativeAnimGroupGetDelay116, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetCurve117", nullptr,
            NativeAnimGroupSetCurve117, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetCurve118", nullptr,
            NativeAnimGroupGetCurve118, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetTempo119", nullptr,
            NativeAnimGroupSetTempo119, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetTempo120", nullptr,
            NativeAnimGroupGetTempo120, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetAutoRev121", nullptr,
            NativeAnimGroupSetAutoRev121, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetAutoRev122", nullptr,
            NativeAnimGroupGetAutoRev122, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetIter123", nullptr,
            NativeAnimGroupSetIter123, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetIter124", nullptr,
            NativeAnimGroupGetIter124, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetFps125", nullptr,
            NativeAnimGroupSetFps125, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetFps126", nullptr,
            NativeAnimGroupGetFps126, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}
static void RegisterAnimProps07(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimGroupRegFinish127", nullptr,
            NativeAnimGroupRegFinish127, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetTarget128", nullptr,
            NativeAnimGroupSetTarget128, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetTarget129", nullptr,
            NativeAnimGroupGetTarget129, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupAddProp130", nullptr,
            NativeAnimGroupAddProp130, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupAddKey131", nullptr,
            NativeAnimGroupAddKey131, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupAddPath132", nullptr,
            NativeAnimGroupAddPath132, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimAddGroup133", nullptr, NativeAnimAddGroup133, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimHasGroup134", nullptr, NativeAnimHasGroup134, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGetState135", nullptr, NativeAnimGetState135, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimRemoveGroup136", nullptr,
            NativeAnimRemoveGroup136, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPauseGroup137", nullptr, NativeAnimPauseGroup137, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimResumeGroup138", nullptr,
            NativeAnimResumeGroup138, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimFinishGroup139", nullptr,
            NativeAnimFinishGroup139, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupDestroyNull140", nullptr,
            NativeAnimGroupDestroyNull140, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupTimingNull141", nullptr,
            NativeAnimGroupTimingNull141, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupCurveNull142", nullptr,
            NativeAnimGroupCurveNull142, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupFpsNull143", nullptr,
            NativeAnimGroupFpsNull143, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupRegNull144", nullptr,
            NativeAnimGroupRegNull144, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}
static void RegisterAnimProps08(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimGroupAddNull145", nullptr,
            NativeAnimGroupAddNull145, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupTargetNull146", nullptr,
            NativeAnimGroupTargetNull146, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimCtxNull147", nullptr, NativeAnimCtxNull147, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimCtrlNull148", nullptr, NativeAnimCtrlNull148, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropTrans149", nullptr, NativeAnimPropTrans149, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimFinishModes150", nullptr,
            NativeAnimFinishModes150, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    RegisterAnimProps00(env, exports);
    RegisterAnimProps01(env, exports);
    RegisterAnimProps02(env, exports);
    RegisterAnimProps03(env, exports);
    RegisterAnimProps04(env, exports);
    RegisterAnimProps05(env, exports);
    RegisterAnimProps06(env, exports);
    RegisterAnimProps07(env, exports);
    RegisterAnimProps08(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module nativeanimModule = {.nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativeanim",
    .nm_priv = ((void *)0),
    .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterNativeAnimModule(void)
{
    napi_module_register(&nativeanimModule);
}

} // namespace ArkUICapiTest
