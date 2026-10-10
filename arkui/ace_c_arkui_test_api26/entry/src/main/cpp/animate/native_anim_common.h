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

#ifndef NATIVE_ANIM_COMMON_H
#define NATIVE_ANIM_COMMON_H

#include "common/common.h"
#include <arkui/error_code.h>
#include <arkui/native_animate.h>
#include <arkui/native_node.h>
#include <arkui/native_render.h>
#include <arkui/native_type_visual.h>
#include "animate/native_anim_fp.h"

namespace ArkUICapiTest {


constexpr int32_t DURATION_MS = 200;
constexpr int32_t DELAY_MS = 10;
constexpr int32_t KEYFRAME_SIZE = 2;
constexpr int32_t FPS_MIN = 15;
constexpr int32_t FPS_MAX = 60;
constexpr int32_t FPS_EXPECTED = 30;
constexpr float TEMPO_VALUE = 1.0f;
constexpr float KEY_TIME_START = 0.0f;
constexpr float KEY_TIME_END = 1.0f;
constexpr float OPACITY_FROM = 0.2f;
constexpr float OPACITY_TO = 1.0f;
constexpr float TRANSLATE_X = 10.0f;
constexpr float TRANSLATE_Y = 20.0f;

inline const char *SamplePathCommands()
{
    return "M 0 0 L 100 0";
}

using CurveByTypeFn = ArkUI_CurveHandle (*)(ArkUI_AnimationCurve);
using CurveCubicFn = ArkUI_CurveHandle (*)(float, float, float, float);

inline void OnGroupFinish(void *userData)
{
    (void)userData;
}

inline ArkUI_NumberValue MakeF32(float value)
{
    ArkUI_NumberValue numberValue;
    numberValue.f32 = value;
    return numberValue;
}

ArkUI_CurveHandle MakeCurve();

inline void DisposeCurve(ArkUI_CurveHandle curve)
{
    if (curve == nullptr) {
        return;
    }
    OH_ArkUI_Curve_DisposeCurve(curve);
}

inline void PrepareProp(OH_ArkUI_PropertyAnimationHandle anim, ArkUI_RenderNodeHandle target)
{
    ArkUI_NumberValue fromValue = MakeF32(OPACITY_FROM);
    ArkUI_NumberValue toValue = MakeF32(OPACITY_TO);
    OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, &fromValue, PARAM_1);
    OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, &toValue, PARAM_1);
    OH_ArkUI_NativeModule_PropertyAnimation_SetDuration(anim, DURATION_MS);
    OH_ArkUI_NativeModule_PropertyAnimation_SetTargetNode(anim, target);
}

inline void PrepareKey(OH_ArkUI_KeyframeAnimationHandle anim, ArkUI_RenderNodeHandle target)
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

inline void PreparePath(OH_ArkUI_PathAnimationHandle anim, ArkUI_RenderNodeHandle target)
{
    OH_ArkUI_NativeModule_PathAnimation_SetDuration(anim, DURATION_MS);
    OH_ArkUI_NativeModule_PathAnimation_SetTargetNode(anim, target);
}


} // namespace ArkUICapiTest

#endif
