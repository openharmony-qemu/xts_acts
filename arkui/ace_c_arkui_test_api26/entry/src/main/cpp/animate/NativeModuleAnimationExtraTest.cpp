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

napi_value NativeAnimKeyTargetNull081(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPathCreate082(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathDestroy083(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathSetDur084(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDuration(anim, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathGetDur085(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    int32_t duration = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDuration(anim, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDuration(anim, &duration), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathSetDelay086(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDelay(anim, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathGetDelay087(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    int32_t delay = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDelay(anim, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDelay(anim, &delay), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathSetTempo090(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTempo(anim, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathGetTempo091(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    float tempo = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTempo(anim, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTempo(anim, &tempo), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathSetAutoRev092(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoReverse(anim, true), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathGetAutoRev093(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    bool flag = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoReverse(anim, true), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoReverse(anim, &flag), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathSetIter094(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetIterations(anim, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathGetIter095(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    int32_t iterations = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetIterations(anim, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetIterations(anim, &iterations), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathSetAutoRot096(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoRotation(anim, true), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathGetAutoRot097(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    bool flag = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoRotation(anim, true), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoRotation(anim, &flag), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathSetTarget098(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathGetTarget099(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_RenderNodeHandle target = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTargetNode(anim, &target), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathCreateNull100(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(nullptr);
    ASSERT_EQ(anim == nullptr, true);
    NAPI_END;
}
napi_value NativeAnimPathDestroyNull101(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_NativeModule_PathAnimation_Destroy(nullptr);
    NAPI_END;
}
napi_value NativeAnimPathSetDurNull102(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDuration(nullptr, DURATION_MS), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDuration(anim, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathGetDurNull103(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t duration = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDuration(nullptr, &duration), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDuration(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathDelayNull104(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t delay = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetDelay(nullptr, DELAY_MS), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDelay(nullptr, &delay), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetDelay(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}

napi_value NativeAnimPathTempoNull106(napi_env env, napi_callback_info info)
{
    (void)info;
    float tempo = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTempo(nullptr, TEMPO_VALUE), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTempo(nullptr, &tempo), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTempo(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathAutoRevNull107(napi_env env, napi_callback_info info)
{
    (void)info;
    bool flag = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoReverse(nullptr, true), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoReverse(nullptr, &flag), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoReverse(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathIterNull108(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t iterations = PARAM_0;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetIterations(nullptr, PARAM_1), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetIterations(nullptr, &iterations), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetIterations(anim, PARAM_0), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetIterations(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathAutoRotNull109(napi_env env, napi_callback_info info)
{
    (void)info;
    bool flag = false;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetAutoRotation(nullptr, true), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoRotation(nullptr, &flag), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetAutoRotation(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimPathTargetNull110(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_RenderNodeHandle target = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_SetTargetNode(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTargetNode(nullptr, &target), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto anim = OH_ArkUI_NativeModule_PathAnimation_Create(SamplePathCommands());
    ASSERT_EQ(anim != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PathAnimation_GetTargetNode(anim, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PathAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimGroupCreate111(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
napi_value NativeAnimGroupDestroy112(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
napi_value NativeAnimGroupSetDur113(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetDuration(group, DURATION_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
napi_value NativeAnimGroupGetDur114(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupSetDelay115(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetDelay(group, DELAY_MS), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
napi_value NativeAnimGroupGetDelay116(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupSetCurve117(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupGetCurve118(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupSetTempo119(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetTempo(group, TEMPO_VALUE), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
napi_value NativeAnimGroupGetTempo120(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupSetAutoRev121(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetAutoReverse(group, false), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
napi_value NativeAnimGroupGetAutoRev122(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupSetIter123(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetIterations(group, PARAM_1), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
napi_value NativeAnimGroupGetIter124(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupSetFps125(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ArkUI_ExpectedFrameRateRange range = { FPS_MIN, FPS_MAX, FPS_EXPECTED };
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetExpectedFrameRateRange(group, &range), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
napi_value NativeAnimGroupGetFps126(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ArkUI_ExpectedFrameRateRange range = { FPS_MIN, FPS_MAX, FPS_EXPECTED };
    ArkUI_ExpectedFrameRateRange got = { 0, 0, 0 };
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetExpectedFrameRateRange(group, &range), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetExpectedFrameRateRange(group, &got), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
napi_value NativeAnimGroupRegFinish127(napi_env env, napi_callback_info info)
{
    (void)info;
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_RegisterOnFinishCallback(group, nullptr, OnGroupFinish),
        ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
napi_value NativeAnimGroupSetTarget128(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupGetTarget129(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupAddProp130(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupAddKey131(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupAddPath132(napi_env env, napi_callback_info info)
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
napi_value NativeAnimAddGroup133(napi_env env, napi_callback_info info)
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
napi_value NativeAnimHasGroup134(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    bool exists = true;
    ASSERT_EQ(OH_ArkUI_NativeModule_HasAnimationGroup(context, "xts_missing_key", &exists), ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
napi_value NativeAnimGetState135(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    OH_ArkUI_AnimationGroupState state = OH_ARKUI_ANIMATION_GROUP_STATE_RUNNING;
    ASSERT_EQ(OH_ArkUI_NativeModule_GetAnimationGroupState(context, "xts_missing_key", &state),
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}
napi_value NativeAnimRemoveGroup136(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_RemoveAnimationGroup(context, "xts_missing_key"),
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}
napi_value NativeAnimPauseGroup137(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_PauseAnimationGroup(context, "xts_missing_key"),
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}
napi_value NativeAnimResumeGroup138(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_ResumeAnimationGroup(context, "xts_missing_key"),
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}
napi_value NativeAnimFinishGroup139(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_FinishAnimationGroup(context, "xts_missing_key", OH_ARKUI_ANIMATION_FINISH_TO_END),
        ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}
napi_value NativeAnimGroupDestroyNull140(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(nullptr);
    NAPI_END;
}
napi_value NativeAnimGroupTimingNull141(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupCurveNull142(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_CurveHandle curve = nullptr;
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetCurve(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetCurve(nullptr, &curve), ARKUI_ERROR_CODE_PARAM_INVALID);
    auto group = OH_ArkUI_NativeModule_AnimationGroup_Create();
    ASSERT_EQ(group != nullptr, true);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_SetCurve(group, nullptr), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_AnimationGroup_GetCurve(group, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_AnimationGroup_Destroy(group);
    NAPI_END;
}
napi_value NativeAnimGroupFpsNull143(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_ExpectedFrameRateRange range = { FPS_MIN, FPS_MAX, FPS_EXPECTED };
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
napi_value NativeAnimGroupRegNull144(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupAddNull145(napi_env env, napi_callback_info info)
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
napi_value NativeAnimGroupTargetNull146(napi_env env, napi_callback_info info)
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
napi_value NativeAnimCtxNull147(napi_env env, napi_callback_info info)
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
napi_value NativeAnimCtrlNull148(napi_env env, napi_callback_info info)
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
napi_value NativeAnimPropTrans149(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_TRANSLATION);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_2] = { MakeF32(0.0f), MakeF32(0.0f) };
    ArkUI_NumberValue toVal[PARAM_2] = { MakeF32(TRANSLATE_X), MakeF32(TRANSLATE_Y) };
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_2), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_2), ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}
napi_value NativeAnimFinishModes150(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    int32_t finishStart = OH_ArkUI_NativeModule_FinishAnimationGroup(
        context, "xts_missing_key", OH_ARKUI_ANIMATION_FINISH_TO_START);
    ASSERT_EQ(finishStart, ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    int32_t finishCurrent = OH_ArkUI_NativeModule_FinishAnimationGroup(
        context, "xts_missing_key", OH_ARKUI_ANIMATION_FINISH_TO_CURRENT);
    ASSERT_EQ(finishCurrent, ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    int32_t finishEnd = OH_ArkUI_NativeModule_FinishAnimationGroup(
        context, "xts_missing_key", OH_ARKUI_ANIMATION_FINISH_TO_END);
    ASSERT_EQ(finishEnd, ARKUI_ERROR_CODE_ANIMATION_GROUP_NOT_FOUND);
    NAPI_END;
}

} // namespace ArkUICapiTest
