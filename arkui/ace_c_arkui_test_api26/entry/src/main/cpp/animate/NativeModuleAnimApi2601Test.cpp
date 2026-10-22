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

constexpr int32_t ERR_TARGET_NODE_NOT_IN_SAME_CONTEXT = 106216;
constexpr int32_t BOUNDS_FROM_X = PARAM_10;
constexpr int32_t BOUNDS_FROM_Y = PARAM_20;
constexpr int32_t BOUNDS_FROM_W = SIZE_30;
constexpr int32_t BOUNDS_FROM_H = SIZE_40;
constexpr int32_t BOUNDS_TO_X = PARAM_20;
constexpr int32_t BOUNDS_TO_Y = SIZE_40;
constexpr int32_t BOUNDS_TO_W = SIZE_60;
constexpr int32_t BOUNDS_TO_H = SIZE_80;


napi_value NativeAnimApi2601ErrSameCtx001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(ARKUI_ERROR_CODE_TARGET_NODE_NOT_IN_SAME_CONTEXT != ARKUI_ERROR_CODE_NO_ERROR, true);
    ASSERT_EQ(ARKUI_ERROR_CODE_TARGET_NODE_NOT_IN_SAME_CONTEXT != ARKUI_ERROR_CODE_PARAM_INVALID, true);
    ASSERT_EQ(ARKUI_ERROR_CODE_TARGET_NODE_NOT_IN_SAME_CONTEXT !=
        ARKUI_ERROR_CODE_ANIMATION_GROUP_INVALID_STATE, true);
    ASSERT_EQ(static_cast<int32_t>(ARKUI_ERROR_CODE_TARGET_NODE_NOT_IN_SAME_CONTEXT),
        ERR_TARGET_NODE_NOT_IN_SAME_CONTEXT);
    NAPI_END;
}


napi_value NativeAnimApi2601Transform3D002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue matrix[PARAM_16] = {};
    for (int32_t i = 0; i < PARAM_16; i += PARAM_5) {
        matrix[i].f32 = 1.0f;
    }
    ArkUI_AttributeItem item = {matrix, PARAM_16};
    ASSERT_EQ(nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item), ARKUI_ERROR_CODE_NO_ERROR);
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    ASSERT_EQ(got != nullptr, true);
    ASSERT_EQ(got->size >= PARAM_16, true);
    ArkUI_NumberValue bad[PARAM_1] = {MakeF32(1.0f)};
    ArkUI_AttributeItem badItem = {bad, PARAM_1};
    ASSERT_EQ(nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &badItem) != ARKUI_ERROR_CODE_NO_ERROR, true);
    ASSERT_EQ(nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, nullptr) != ARKUI_ERROR_CODE_NO_ERROR, true);
    NAPI_END;
}


napi_value NativeAnimApi2601TransX003(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_TRANSLATION_X);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].f32 = 0.1f;
    toVal[PARAM_0].f32 = 1.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601TransY004(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_TRANSLATION_Y);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].f32 = 0.1f;
    toVal[PARAM_0].f32 = 1.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601TransZ005(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_TRANSLATION_Z);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].f32 = 0.1f;
    toVal[PARAM_0].f32 = 1.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601Scale006(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_SCALE);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].f32 = 0.1f;
    fromVal[PARAM_1].f32 = 0.2f;
    toVal[PARAM_0].f32 = 1.0f;
    toVal[PARAM_1].f32 = 1.1f;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_2),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_2),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_2),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_2),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_2),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_2),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601ScaleX007(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_SCALE_X);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].f32 = 0.1f;
    toVal[PARAM_0].f32 = 1.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601ScaleY008(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_SCALE_Y);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].f32 = 0.1f;
    toVal[PARAM_0].f32 = 1.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601Rot009(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_ROTATION);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].f32 = 0.1f;
    fromVal[PARAM_1].f32 = 0.2f;
    fromVal[PARAM_2].f32 = 0.3f;
    toVal[PARAM_0].f32 = 1.0f;
    toVal[PARAM_1].f32 = 1.1f;
    toVal[PARAM_2].f32 = 1.2f;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_3),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_3),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_3),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_3),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_3),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_3),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601RotX010(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_ROTATION_X);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].f32 = 0.1f;
    toVal[PARAM_0].f32 = 1.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601RotY011(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_ROTATION_Y);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].f32 = 0.1f;
    toVal[PARAM_0].f32 = 1.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601RotZ012(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_ROTATION_Z);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].f32 = 0.1f;
    toVal[PARAM_0].f32 = 1.0f;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601Bounds013(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_BOUNDS);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].i32 = BOUNDS_FROM_X;
    fromVal[PARAM_1].i32 = BOUNDS_FROM_Y;
    fromVal[PARAM_2].i32 = BOUNDS_FROM_W;
    fromVal[PARAM_3].i32 = BOUNDS_FROM_H;
    toVal[PARAM_0].i32 = BOUNDS_TO_X;
    toVal[PARAM_1].i32 = BOUNDS_TO_Y;
    toVal[PARAM_2].i32 = BOUNDS_TO_W;
    toVal[PARAM_3].i32 = BOUNDS_TO_H;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_4),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_4),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_4),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_4),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_4),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_4),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601BoundsX014(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_BOUNDS_X);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].i32 = BOUNDS_FROM_X;
    toVal[PARAM_0].i32 = BOUNDS_TO_X;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601BoundsY015(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_BOUNDS_Y);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].i32 = BOUNDS_FROM_X;
    toVal[PARAM_0].i32 = BOUNDS_TO_X;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601BoundsW016(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_BOUNDS_WIDTH);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].i32 = BOUNDS_FROM_X;
    toVal[PARAM_0].i32 = BOUNDS_TO_X;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}


napi_value NativeAnimApi2601BoundsH017(napi_env env, napi_callback_info info)
{
    (void)info;
    auto anim = OH_ArkUI_NativeModule_PropertyAnimation_Create(OH_ARKUI_ANIMATION_PROPERTY_BOUNDS_HEIGHT);
    ASSERT_EQ(anim != nullptr, true);
    ArkUI_NumberValue fromVal[PARAM_4] = {};
    ArkUI_NumberValue toVal[PARAM_4] = {};
    fromVal[PARAM_0].i32 = BOUNDS_FROM_X;
    toVal[PARAM_0].i32 = BOUNDS_TO_X;
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, toVal, PARAM_1),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(nullptr, fromVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetFromValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(nullptr, toVal, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_NativeModule_PropertyAnimation_SetToValue(anim, nullptr, PARAM_1),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_NativeModule_PropertyAnimation_Destroy(anim);
    NAPI_END;
}

} // namespace ArkUICapiTest
