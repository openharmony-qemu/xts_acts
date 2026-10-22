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

#include "NodeTransform3DTest.h"
#include "../common/common.h"
#include <cmath>

namespace ArkUICapiTest {

static ArkUI_NativeNodeAPI_1 *GetNodeAPI()
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    return nodeAPI;
}

napi_value NodeTransform3D_SetGet001(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue matrix[PARAM_16] = {
        {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 10.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 20.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 5.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item = {matrix, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = TrueFailed(env, got->size >= PARAM_16)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_0].f32, 1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_7].f32, 20.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_11].f32, 5.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_15].f32, 1.0f)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_Reset002(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue matrix[PARAM_16] = {
        {.f32 = 2.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 10.0f},
        {.f32 = 0.0f}, {.f32 = 2.0f}, {.f32 = 0.0f}, {.f32 = 20.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 2.0f}, {.f32 = 5.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item = {matrix, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    if (auto err = EqFailed(env, nodeAPI->resetAttribute(column, NODE_TRANSFORM_3D),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_0].f32, 1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_5].f32, 1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_10].f32, 1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_15].f32, 1.0f)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_InvalidSize003(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue bad[PARAM_1] = {{.f32 = 1.0f}};
    ArkUI_AttributeItem badItem = {bad, PARAM_1};
    if (auto err = TrueFailed(env,
        nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &badItem) != ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    ArkUI_NumberValue bad2[PARAM_15] = {};
    ArkUI_AttributeItem badItem2 = {bad2, PARAM_15};
    if (auto err = TrueFailed(env,
        nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &badItem2) != ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    ArkUI_NumberValue bad3[PARAM_17] = {};
    for (int32_t i = 0; i < PARAM_17; i++) { bad3[i].f32 = 1.0f; }
    ArkUI_AttributeItem badItem3 = {bad3, PARAM_17};
    if (auto err = TrueFailed(env,
        nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &badItem3) != ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_NullParam004(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    if (auto err = TrueFailed(env,
        nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, nullptr) != ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_IdentityMatrix005(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue identity[PARAM_16] = {
        {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item = {identity, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_0].f32, 1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_5].f32, 1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_10].f32, 1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_15].f32, 1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_1].f32, 0.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_4].f32, 0.0f)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_RotationMatrix006(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    float angle = 45.0f * 3.14159265f / 180.0f;
    float cosA = cosf(angle);
    float sinA = sinf(angle);
    ArkUI_NumberValue rotMatrix[PARAM_16] = {
        {.f32 = cosA}, {.f32 = -sinA}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = sinA}, {.f32 = cosA},  {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f},  {.f32 = 1.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f},  {.f32 = 0.0f}, {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item = {rotMatrix, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_0].f32, cosA)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_1].f32, -sinA)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_4].f32, sinA)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_5].f32, cosA)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_ScaleMatrix007(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue scaleMatrix[PARAM_16] = {
        {.f32 = 2.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 3.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 4.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item = {scaleMatrix, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_0].f32, 2.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_5].f32, 3.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_10].f32, 4.0f)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_TranslationMatrix008(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue transMatrix[PARAM_16] = {
        {.f32 = 1.0f},  {.f32 = 0.0f},  {.f32 = 0.0f},  {.f32 = 100.0f},
        {.f32 = 0.0f},  {.f32 = 1.0f},  {.f32 = 0.0f},  {.f32 = 200.0f},
        {.f32 = 0.0f},  {.f32 = 0.0f},  {.f32 = 1.0f},  {.f32 = 50.0f},
        {.f32 = 0.0f},  {.f32 = 0.0f},  {.f32 = 0.0f},  {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item = {transMatrix, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_3].f32, 100.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_7].f32, 200.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_11].f32, 50.0f)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_GetDefault009(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = TrueFailed(env, got->size >= PARAM_16)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_0].f32, 1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_5].f32, 1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_10].f32, 1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_15].f32, 1.0f)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_UpdateMatrix010(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue matrix1[PARAM_16] = {
        {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 10.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 20.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 5.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item1 = {matrix1, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item1),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got1 = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = EqFailed(env, got1->value[PARAM_3].f32, 10.0f)) { return err; }

    ArkUI_NumberValue matrix2[PARAM_16] = {
        {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 50.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 60.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 70.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item2 = {matrix2, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item2),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got2 = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = EqFailed(env, got2->value[PARAM_3].f32, 50.0f)) { return err; }
    if (auto err = EqFailed(env, got2->value[PARAM_7].f32, 60.0f)) { return err; }
    if (auto err = EqFailed(env, got2->value[PARAM_11].f32, 70.0f)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_ZeroMatrix011(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue zeroMatrix[PARAM_16] = {};
    ArkUI_AttributeItem item = {zeroMatrix, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_0].f32, 0.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_15].f32, 0.0f)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_NegativeValues012(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue negMatrix[PARAM_16] = {
        {.f32 = -1.0f}, {.f32 = 0.0f},  {.f32 = 0.0f},  {.f32 = -10.0f},
        {.f32 = 0.0f},  {.f32 = -1.0f}, {.f32 = 0.0f},  {.f32 = -20.0f},
        {.f32 = 0.0f},  {.f32 = 0.0f},  {.f32 = -1.0f}, {.f32 = -5.0f},
        {.f32 = 0.0f},  {.f32 = 0.0f},  {.f32 = 0.0f},  {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item = {negMatrix, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_0].f32, -1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_5].f32, -1.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_3].f32, -10.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_15].f32, 1.0f)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_PerpectiveMatrix013(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue perspMatrix[PARAM_16] = {
        {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},  {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f},  {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f},  {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.001f}, {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item = {perspMatrix, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_14].f32, 0.001f)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_DifferentNodeTypes014(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    ArkUI_NumberValue matrix[PARAM_16] = {
        {.f32 = 1.5f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 15.0f},
        {.f32 = 0.0f}, {.f32 = 1.5f}, {.f32 = 0.0f}, {.f32 = 25.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.5f}, {.f32 = 35.0f},
        {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item = {matrix, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    if (auto err = EqFailed(env, nodeAPI->setAttribute(stack, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto gotCol = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    auto gotStack = nodeAPI->getAttribute(stack, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, gotCol != nullptr)) { return err; }
    if (auto err = TrueFailed(env, gotStack != nullptr)) { return err; }
    if (auto err = EqFailed(env, gotCol->value[PARAM_0].f32, 1.5f)) { return err; }
    if (auto err = EqFailed(env, gotStack->value[PARAM_0].f32, 1.5f)) { return err; }
    nodeAPI->disposeNode(stack);
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_LargeValues015(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue largeMatrix[PARAM_16] = {
        {.f32 = 10000.0f}, {.f32 = 0.0f},     {.f32 = 0.0f},     {.f32 = 99999.0f},
        {.f32 = 0.0f},     {.f32 = 10000.0f}, {.f32 = 0.0f},     {.f32 = 99999.0f},
        {.f32 = 0.0f},     {.f32 = 0.0f},     {.f32 = 10000.0f}, {.f32 = 99999.0f},
        {.f32 = 0.0f},     {.f32 = 0.0f},     {.f32 = 0.0f},     {.f32 = 1.0f},
    };
    ArkUI_AttributeItem item = {largeMatrix, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_0].f32, 10000.0f)) { return err; }
    if (auto err = EqFailed(env, got->value[PARAM_3].f32, 99999.0f)) { return err; }
    return NapiReturnSuccessInt32(env);
}

napi_value NodeTransform3D_AllElementsVerify016(napi_env env, napi_callback_info info)
{
    auto nodeAPI = GetNodeAPI();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    float testValues[PARAM_16] = {
        1.0f, 2.0f, 3.0f, 4.0f,
        5.0f, 6.0f, 7.0f, 8.0f,
        9.0f, 10.0f, 11.0f, 12.0f,
        13.0f, 14.0f, 15.0f, 16.0f
    };
    ArkUI_NumberValue matrix[PARAM_16];
    for (int32_t i = 0; i < PARAM_16; i++) { matrix[i].f32 = testValues[i]; }
    ArkUI_AttributeItem item = {matrix, PARAM_16};
    if (auto err = EqFailed(env, nodeAPI->setAttribute(column, NODE_TRANSFORM_3D, &item),
        ARKUI_ERROR_CODE_NO_ERROR)) { return err; }
    auto got = nodeAPI->getAttribute(column, NODE_TRANSFORM_3D);
    if (auto err = TrueFailed(env, got != nullptr)) { return err; }
    if (auto err = TrueFailed(env, got->size >= PARAM_16)) { return err; }
    for (int32_t i = 0; i < PARAM_16; i++) {
        if (auto err = EqFailed(env, got->value[i].f32, testValues[i])) { return err; }
    }
    return NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest
