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

#include "animate/native_anim_common.h"
#include "animate/native_anim_exports.h"

namespace ArkUICapiTest {

napi_value NativeAnimEnum001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ATTRIBUTE_FOUND != ARKUI_ERROR_CODE_SUB_ANIMATION_INVALID, true);
    ASSERT_EQ(ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND != ARKUI_ERROR_CODE_SUB_ANIMATION_INVALID, true);
    ASSERT_EQ(ARKUI_ERROR_CODE_ANIMATION_GROUP_REENTRANT_CALL != ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND,
        true);
    ASSERT_EQ(ARKUI_ERROR_CODE_ANIMATION_GROUP_INVALID_STATE != ARKUI_ERROR_CODE_ANIMATION_GROUP_REENTRANT_CALL,
        true);
    ASSERT_EQ(OH_ARKUI_ANIMATION_PROPERTY_OPACITY != OH_ARKUI_ANIMATION_PROPERTY_TRANSLATION, true);
    ASSERT_EQ(OH_ARKUI_ANIMATION_PROPERTY_BACKGROUND_COLOR != OH_ARKUI_ANIMATION_PROPERTY_OPACITY, true);
    ASSERT_EQ(OH_ARKUI_ANIMATION_GROUP_STATE_RUNNING != OH_ARKUI_ANIMATION_GROUP_STATE_PAUSED, true);
    ASSERT_EQ(OH_ARKUI_ANIMATION_GROUP_STATE_INACTIVE != OH_ARKUI_ANIMATION_GROUP_STATE_PAUSED, true);
    ASSERT_EQ(OH_ARKUI_ANIMATION_FINISH_TO_START != OH_ARKUI_ANIMATION_FINISH_TO_CURRENT, true);
    ASSERT_EQ(OH_ARKUI_ANIMATION_FINISH_TO_END != OH_ARKUI_ANIMATION_FINISH_TO_CURRENT, true);
    NAPI_END;
}
napi_value NativeAnimPropCreate002(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropDestroy003(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropSetFrom004(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue v = MakeF32(OPACITY_FROM);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, &v, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetFrom005(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetTo006(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue v = MakeF32(OPACITY_TO);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, &v, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetTo007(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetDur008(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDuration(anim, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetDur009(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetDelay010(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDelay(anim, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetDelay011(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetCurve012(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropGetCurve013(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetTempo014(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetTempo(anim, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetTempo015(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetAutoRev016(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetAutoReverse(anim, true), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetAutoRev017(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetIter018(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetIterations(anim, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetIter019(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetTarget020(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetTarget021(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropDestroyNull022(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(nullptr);
    NAPI_END;
}
napi_value NativeAnimPropSetFromNullAnim023(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NumberValue v = MakeF32(OPACITY_FROM);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, &v, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value NativeAnimPropSetFromNullVal024(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetFromNullAnim025(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NumberValue got;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetFromValue(nullptr, &got, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value NativeAnimPropGetFromNullOut026(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropSetToNullAnim027(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NumberValue v = MakeF32(OPACITY_TO);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, &v, PARAM_1), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value NativeAnimPropSetToNullVal028(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetToNullAnim029(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NumberValue got;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetToValue(nullptr, &got, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value NativeAnimPropGetToNullOut030(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_GetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropSetDurNull031(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDuration(nullptr, DURATION_MS),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value NativeAnimPropSetDurInvalid032(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDuration(anim, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetDurNull033(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetDelayNull034(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetDelay(nullptr, DELAY_MS), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value NativeAnimPropGetDelayNull035(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetCurveNull036(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetCurve(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetCurve(anim, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetCurveNull037(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetTempoNull038(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetTempo(nullptr, TEMPO_VALUE), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value NativeAnimPropGetTempoNull039(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetAutoRevNull040(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetAutoReverse(nullptr, true), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value NativeAnimPropGetAutoRevNull041(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetIterNull042(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetIterations(nullptr, PARAM_1), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetIterations(anim, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPropGetIterNull043(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropSetTargetNull044(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetTargetNode(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value NativeAnimPropGetTargetNull045(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeyCreate046(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimKeyDestroy047(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimKeySetKeyTimes048(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeyGetKeyTime049(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetKeyTime050(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetValue051(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue v = MakeF32(OPACITY_FROM);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetValue(anim, PARAM_0, &v, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimKeySetValues052(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeyGetValue053(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetCurves054(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetCurve055(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeyGetCurve056(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetDur057(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetDuration(anim, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimKeyGetDur058(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetDelay059(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetDelay(anim, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimKeyGetDelay060(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetTempo061(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetTempo(anim, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimKeyGetTempo062(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetAutoRev063(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetAutoReverse(anim, false), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimKeyGetAutoRev064(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetIter065(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetIterations(anim, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimKeyGetIter066(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetTarget067(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimKeyGetTarget068(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeyCreateInvalid069(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, PARAM_1);
    ASSERT_EQ(anim == nullptr, true);
    NAPI_END;
}
napi_value NativeAnimKeyDestroyNull070(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(nullptr);
    NAPI_END;
}
napi_value NativeAnimKeySetKeyTimesNull071(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeyGetKeyTimeNull072(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetKeyTimeNull073(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetValueNull074(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetValuesNull075(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeyGetValueNull076(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetCurvesNull077(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeySetCurveNull078(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetCurve(nullptr, PARAM_0, nullptr),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_KeyframeAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_OPACITY, KEYFRAME_SIZE);
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_KeyframeAnimation_SetCurve(anim, PARAM_0, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_KeyframeAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimKeyGetCurveNull079(napi_env env, napi_callback_info info)
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
napi_value NativeAnimKeyTimingNull080(napi_env env, napi_callback_info info)
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

} // namespace ArkUICapiTest
