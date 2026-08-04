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

namespace ArkUICapiTest {

static napi_value TestTransitionEffectIdentity001(napi_env env, napi_callback_info info)
{
    auto effect = OH_ArkUI_CreateIdentityTransitionEffect();
    ASSERT_NOTNULL(effect);
    OH_ArkUI_TransitionEffect_Dispose(effect);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity002(napi_env env, napi_callback_info info)
{
    auto effect = OH_ArkUI_CreateIdentityTransitionEffect();
    ASSERT_NOTNULL(effect);
    OH_ArkUI_TransitionEffect_Dispose(effect);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity003(napi_env env, napi_callback_info info)
{
    OH_ArkUI_TransitionEffect_Dispose(nullptr);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity004(napi_env env, napi_callback_info info)
{
    auto firstEffect = OH_ArkUI_CreateIdentityTransitionEffect();
    ASSERT_NOTNULL(firstEffect);
    auto secondEffect = OH_ArkUI_CreateOpacityTransitionEffect(PARAM_0_POINT_5);
    ASSERT_NOTNULL(secondEffect);
    auto ret = OH_ArkUI_TransitionEffect_Combine(firstEffect, secondEffect);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_TransitionEffect_Dispose(firstEffect);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity005(napi_env env, napi_callback_info info)
{
    auto secondEffect = OH_ArkUI_CreateOpacityTransitionEffect(PARAM_0_POINT_5);
    ASSERT_NOTNULL(secondEffect);
    auto ret = OH_ArkUI_TransitionEffect_Combine(nullptr, secondEffect);
    ASSERT_EQ(ret, INVALID_PARAM);
    OH_ArkUI_TransitionEffect_Dispose(secondEffect);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity006(napi_env env, napi_callback_info info)
{
    auto firstEffect = OH_ArkUI_CreateIdentityTransitionEffect();
    ASSERT_NOTNULL(firstEffect);
    auto ret = OH_ArkUI_TransitionEffect_Combine(firstEffect, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TransitionEffect_Dispose(firstEffect);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity007(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_TransitionEffect_Combine(nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity008(napi_env env, napi_callback_info info)
{
    auto effect = OH_ArkUI_CreateIdentityTransitionEffect();
    ASSERT_NOTNULL(effect);
    auto animation = OH_ArkUI_AnimateOption_Create();
    ASSERT_NOTNULL(animation);
    auto ret = OH_ArkUI_TransitionEffect_SetAnimation(effect, animation);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_TransitionEffect_Dispose(effect);
    OH_ArkUI_AnimateOption_Dispose(animation);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity009(napi_env env, napi_callback_info info)
{
    auto animation = OH_ArkUI_AnimateOption_Create();
    ASSERT_NOTNULL(animation);
    auto ret = OH_ArkUI_TransitionEffect_SetAnimation(nullptr, animation);
    ASSERT_EQ(ret, INVALID_PARAM);
    OH_ArkUI_AnimateOption_Dispose(animation);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity010(napi_env env, napi_callback_info info)
{
    auto effect = OH_ArkUI_CreateIdentityTransitionEffect();
    ASSERT_NOTNULL(effect);
    auto ret = OH_ArkUI_TransitionEffect_SetAnimation(effect, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TransitionEffect_Dispose(effect);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity011(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_TransitionEffect_SetAnimation(nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity012(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto effect = OH_ArkUI_CreateIdentityTransitionEffect();
    ASSERT_NOTNULL(effect);
    ArkUI_AttributeItem valueItem;
    valueItem.object = effect;
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_TransitionEffect_Dispose(effect);
    NAPI_END;
}

static napi_value TestTransitionEffectIdentity013(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto firstEffect = OH_ArkUI_CreateIdentityTransitionEffect();
    ASSERT_NOTNULL(firstEffect);
    auto secondEffect = OH_ArkUI_CreateOpacityTransitionEffect(PARAM_0_POINT_5);
    ASSERT_NOTNULL(secondEffect);
    auto animation = OH_ArkUI_AnimateOption_Create();
    ASSERT_NOTNULL(animation);
    OH_ArkUI_AnimateOption_SetDuration(animation, PARAM_1000);
    auto combineRet = OH_ArkUI_TransitionEffect_Combine(firstEffect, secondEffect);
    ASSERT_EQ(combineRet, SUCCESS);
    auto animRet = OH_ArkUI_TransitionEffect_SetAnimation(firstEffect, animation);
    ASSERT_EQ(animRet, SUCCESS);
    ArkUI_AttributeItem valueItem;
    valueItem.object = firstEffect;
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    auto resetRet = nodeAPI->resetAttribute(column, NODE_TRANSITION);
    ASSERT_EQ(resetRet, SUCCESS);
    OH_ArkUI_TransitionEffect_Dispose(firstEffect);
    OH_ArkUI_AnimateOption_Dispose(animation);
    NAPI_END;
}

} // namespace ArkUICapiTest