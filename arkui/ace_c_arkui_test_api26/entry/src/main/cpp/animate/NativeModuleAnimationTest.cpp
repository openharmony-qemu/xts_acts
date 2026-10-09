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
static void RegisterAnimProps00(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimEnum001", nullptr, NativeAnimEnum001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropCreate002", nullptr, NativeAnimPropCreate002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropDestroy003", nullptr, NativeAnimPropDestroy003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetFrom004", nullptr, NativeAnimPropSetFrom004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetFrom005", nullptr, NativeAnimPropGetFrom005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTo006", nullptr, NativeAnimPropSetTo006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTo007", nullptr, NativeAnimPropGetTo007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDur008", nullptr, NativeAnimPropSetDur008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDur009", nullptr, NativeAnimPropGetDur009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDelay010", nullptr, NativeAnimPropSetDelay010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDelay011", nullptr, NativeAnimPropGetDelay011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetCurve012", nullptr, NativeAnimPropSetCurve012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetCurve013", nullptr, NativeAnimPropGetCurve013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTempo014", nullptr, NativeAnimPropSetTempo014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTempo015", nullptr, NativeAnimPropGetTempo015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetAutoRev016", nullptr, NativeAnimPropSetAutoRev016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetAutoRev017", nullptr, NativeAnimPropGetAutoRev017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetIter018", nullptr, NativeAnimPropSetIter018, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps01(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimPropGetIter019", nullptr, NativeAnimPropGetIter019, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTarget020", nullptr, NativeAnimPropSetTarget020, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTarget021", nullptr, NativeAnimPropGetTarget021, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropDestroyNull022", nullptr, NativeAnimPropDestroyNull022, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetFromNullAnim023", nullptr, NativeAnimPropSetFromNullAnim023, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetFromNullVal024", nullptr, NativeAnimPropSetFromNullVal024, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetFromNullAnim025", nullptr, NativeAnimPropGetFromNullAnim025, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetFromNullOut026", nullptr, NativeAnimPropGetFromNullOut026, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetToNullAnim027", nullptr, NativeAnimPropSetToNullAnim027, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetToNullVal028", nullptr, NativeAnimPropSetToNullVal028, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetToNullAnim029", nullptr, NativeAnimPropGetToNullAnim029, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetToNullOut030", nullptr, NativeAnimPropGetToNullOut030, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDurNull031", nullptr, NativeAnimPropSetDurNull031, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDurInvalid032", nullptr, NativeAnimPropSetDurInvalid032, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDurNull033", nullptr, NativeAnimPropGetDurNull033, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDelayNull034", nullptr, NativeAnimPropSetDelayNull034, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDelayNull035", nullptr, NativeAnimPropGetDelayNull035, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetCurveNull036", nullptr, NativeAnimPropSetCurveNull036, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps02(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimPropGetCurveNull037", nullptr, NativeAnimPropGetCurveNull037, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTempoNull038", nullptr, NativeAnimPropSetTempoNull038, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTempoNull039", nullptr, NativeAnimPropGetTempoNull039, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetAutoRevNull040", nullptr, NativeAnimPropSetAutoRevNull040, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetAutoRevNull041", nullptr, NativeAnimPropGetAutoRevNull041, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetIterNull042", nullptr, NativeAnimPropSetIterNull042, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetIterNull043", nullptr, NativeAnimPropGetIterNull043, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTargetNull044", nullptr, NativeAnimPropSetTargetNull044, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTargetNull045", nullptr, NativeAnimPropGetTargetNull045, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyCreate046", nullptr, NativeAnimKeyCreate046, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyDestroy047", nullptr, NativeAnimKeyDestroy047, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetKeyTimes048", nullptr, NativeAnimKeySetKeyTimes048, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetKeyTime049", nullptr, NativeAnimKeyGetKeyTime049, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetKeyTime050", nullptr, NativeAnimKeySetKeyTime050, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValue051", nullptr, NativeAnimKeySetValue051, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValues052", nullptr, NativeAnimKeySetValues052, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetValue053", nullptr, NativeAnimKeyGetValue053, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetCurves054", nullptr, NativeAnimKeySetCurves054, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps03(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimKeySetCurve055", nullptr, NativeAnimKeySetCurve055, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetCurve056", nullptr, NativeAnimKeyGetCurve056, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetDur057", nullptr, NativeAnimKeySetDur057, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetDur058", nullptr, NativeAnimKeyGetDur058, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetDelay059", nullptr, NativeAnimKeySetDelay059, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetDelay060", nullptr, NativeAnimKeyGetDelay060, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetTempo061", nullptr, NativeAnimKeySetTempo061, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetTempo062", nullptr, NativeAnimKeyGetTempo062, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetAutoRev063", nullptr, NativeAnimKeySetAutoRev063, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetAutoRev064", nullptr, NativeAnimKeyGetAutoRev064, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetIter065", nullptr, NativeAnimKeySetIter065, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetIter066", nullptr, NativeAnimKeyGetIter066, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetTarget067", nullptr, NativeAnimKeySetTarget067, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetTarget068", nullptr, NativeAnimKeyGetTarget068, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyCreateInvalid069", nullptr, NativeAnimKeyCreateInvalid069, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyDestroyNull070", nullptr, NativeAnimKeyDestroyNull070, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetKeyTimesNull071", nullptr, NativeAnimKeySetKeyTimesNull071, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetKeyTimeNull072", nullptr, NativeAnimKeyGetKeyTimeNull072, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps04(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimKeySetKeyTimeNull073", nullptr, NativeAnimKeySetKeyTimeNull073, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValueNull074", nullptr, NativeAnimKeySetValueNull074, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValuesNull075", nullptr, NativeAnimKeySetValuesNull075, nullptr, nullptr, nullptr, napi_default, nullptr},
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
