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

#include "../common/common.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>

namespace ArkUICapiTest {

static napi_value TestNodeAdoptChildWithPolicy001(napi_env env, napi_callback_info info)
{
    // ArkUI_NodeHandle column1;
    // ArkUI_NodeHandle text1;
    // auto ret = OH_ArkUI_NativeModule_AdoptChildWithPolicy(column1, text1,
    //     OH_ARKUI_NATIVE_MODULE_ADOPT_POLICY_OVERLAY_POSITION_FOLLOWS_ADOPT_PARENT_CHAIN);
    // {
    //     napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_CAPI_INIT_ERROR));
    //     if (assertEqErr != nullptr) {
    //         return assertEqErr;
    //     }
    // }
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    {
        napi_value assertTrueErr = TrueFailed(env, (nodeAPI != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_NativeModule_AdoptChildWithPolicy(column, text,
        OH_ARKUI_NATIVE_MODULE_ADOPT_POLICY_OVERLAY_POSITION_FOLLOWS_ADOPT_PARENT_CHAIN);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestNodeAdoptChildWithPolicy002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    {
        napi_value assertTrueErr = TrueFailed(env, (nodeAPI != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text);
    auto ret = OH_ArkUI_NativeModule_AdoptChildWithPolicy(column, text,
        OH_ARKUI_NATIVE_MODULE_ADOPT_POLICY_OVERLAY_POSITION_FOLLOWS_ADOPT_PARENT_CHAIN);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NODE_HAS_PARENT));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestNodeAdoptChildWithPolicy003(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    {
        napi_value assertTrueErr = TrueFailed(env, (argc == PARAM_1));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    {
        napi_value assertTrueErr = TrueFailed(env, (nodeAPI != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    ArkUI_ContextHandle context = nullptr;
    auto ret = OH_ArkUI_GetContextFromNapiValue(env, args[PARAM_0], &context);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    {
        napi_value assertTrueErr = TrueFailed(env, (context != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    ArkUI_NodeHandle root = nullptr;
    ret = OH_ArkUI_NativeModule_GetPageRootNodeHandleByContext(context, &root);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    {
        napi_value assertTrueErr = TrueFailed(env, (root != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ret = OH_ArkUI_NativeModule_AdoptChildWithPolicy(column, root,
        OH_ARKUI_NATIVE_MODULE_ADOPT_POLICY_OVERLAY_POSITION_FOLLOWS_ADOPT_PARENT_CHAIN);
    int32_t removeRoot = ARKUI_ERROR_CODE_NO_ERROR;
    if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
        removeRoot = OH_ArkUI_NativeModule_RemoveAdoptedChild(column, root);
    }
    if (removeRoot == ARKUI_ERROR_CODE_NO_ERROR) {
        nodeAPI->disposeNode(column);
    }
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NODE_CAN_NOT_BE_ADOPTED));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestNodeAdoptChildWithPolicy004(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    {
        napi_value assertTrueErr = TrueFailed(env, (argc == PARAM_1));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    {
        napi_value assertTrueErr = TrueFailed(env, (nodeAPI != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    ArkUI_ContextHandle context = nullptr;
    auto ret = OH_ArkUI_GetContextFromNapiValue(env, args[PARAM_0], &context);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    {
        napi_value assertTrueErr = TrueFailed(env, (context != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    ArkUI_NodeHandle root = nullptr;
    ret = OH_ArkUI_NativeModule_GetPageRootNodeHandleByContext(context, &root);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    {
        napi_value assertTrueErr = TrueFailed(env, (root != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ret = OH_ArkUI_NativeModule_AdoptChildWithPolicy(root, text,
        OH_ARKUI_NATIVE_MODULE_ADOPT_POLICY_OVERLAY_POSITION_FOLLOWS_ADOPT_PARENT_CHAIN);
    int32_t removeChild = ARKUI_ERROR_CODE_NO_ERROR;
    if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
        removeChild = OH_ArkUI_NativeModule_RemoveAdoptedChild(root, text);
    }
    if (removeChild == ARKUI_ERROR_CODE_NO_ERROR) {
        nodeAPI->disposeNode(text);
    }
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NODE_CAN_NOT_ADOPT_TO));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestNodeAdoptChildWithPolicy005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    {
        napi_value assertTrueErr = TrueFailed(env, (nodeAPI != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_NativeModule_AdoptChildWithPolicy(column, text,
        OH_ARKUI_NATIVE_MODULE_ADOPT_POLICY_OVERLAY_POSITION_FOLLOWS_ADOPT_PARENT_CHAIN);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    ret = OH_ArkUI_NativeModule_RemoveAdoptedChild(column, text);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestSetAdoptedChildOverlayPositionCompensation001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    {
        napi_value assertTrueErr = TrueFailed(env, (nodeAPI != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_NativeModule_AdoptChildWithPolicy(column, text,
        OH_ARKUI_NATIVE_MODULE_ADOPT_POLICY_OVERLAY_POSITION_FOLLOWS_ADOPT_PARENT_CHAIN);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    ArkUI_PointF offset = { SIZE_10, SIZE_20 };
    float elements[PARAM_16] = {
        2.0f, 0.0f, 0.0f, 0.0f,
        0.0f, 3.0f, 0.0f, 0.0f,
        0.0f, 0.0f, 1.0f, 0.0f,
        0.0f, 0.0f, 0.0f, 1.0f
    };
    ArkUI_Matrix4 *transform = OH_ArkUI_Matrix4_CreateByElements(elements);
    {
        napi_value assertTrueErr = TrueFailed(env, (transform != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto result = OH_ArkUI_NativeModule_SetAdoptedChildOverlayPositionCompensation(text, &offset, transform);
    OH_ArkUI_Matrix4_Dispose(transform);
    {
        napi_value assertEqErr = EqFailed(env, (result), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestSetAdoptedChildOverlayPositionCompensation002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    {
        napi_value assertTrueErr = TrueFailed(env, (nodeAPI != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_NativeModule_AdoptChildWithPolicy(column, text,
        OH_ARKUI_NATIVE_MODULE_ADOPT_POLICY_OVERLAY_POSITION_FOLLOWS_ADOPT_PARENT_CHAIN);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    ArkUI_Matrix4 *transform = OH_ArkUI_Matrix4_CreateIdentity();
    {
        napi_value assertTrueErr = TrueFailed(env, (transform != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    ArkUI_PointF offset = { PARAM_NEGATIVE_50_POINT_5, PARAM_NEGATIVE_100 };
    auto result1 = OH_ArkUI_NativeModule_SetAdoptedChildOverlayPositionCompensation(text, &offset, transform);
    ArkUI_PointF zeroOffset = { PARAM_0, PARAM_0 };
    auto result2 = OH_ArkUI_NativeModule_SetAdoptedChildOverlayPositionCompensation(text, &zeroOffset, transform);
    OH_ArkUI_Matrix4_Dispose(transform);
    for (auto err : { result1, result2 }) {
        napi_value assertEqErr = EqFailed(env, (err), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestSetAdoptedChildOverlayPositionCompensation003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    {
        napi_value assertTrueErr = TrueFailed(env, (nodeAPI != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_PointF offset = { SIZE_10, SIZE_20 };
    ArkUI_Matrix4 *transform = OH_ArkUI_Matrix4_CreateIdentity();
    {
        napi_value assertTrueErr = TrueFailed(env, (transform != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto result = OH_ArkUI_NativeModule_SetAdoptedChildOverlayPositionCompensation(text, &offset, transform);
    OH_ArkUI_Matrix4_Dispose(transform);
    {
        napi_value assertEqErr = EqFailed(env, (result), (ARKUI_ERROR_CODE_NODE_IS_NOT_IN_ADOPTED_CHILDREN));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestSetAdoptedChildOverlayPositionCompensation004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    {
        napi_value assertTrueErr = TrueFailed(env, (nodeAPI != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_NativeModule_AdoptChild(column, text);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    ArkUI_PointF offset = { SIZE_10, SIZE_20 };
    ArkUI_Matrix4 *transform = OH_ArkUI_Matrix4_CreateIdentity();
    {
        napi_value assertTrueErr = TrueFailed(env, (transform != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto result = OH_ArkUI_NativeModule_SetAdoptedChildOverlayPositionCompensation(text, &offset, transform);
    OH_ArkUI_Matrix4_Dispose(transform);
    {
        napi_value assertEqErr = EqFailed(env, (result), (ARKUI_ERROR_CODE_NODE_IS_NOT_IN_ADOPTED_CHILDREN));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestSetAdoptedChildOverlayPositionCompensation005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    {
        napi_value assertTrueErr = TrueFailed(env, (nodeAPI != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_PointF offset = { SIZE_10, SIZE_20 };
    ArkUI_Matrix4 *transform = OH_ArkUI_Matrix4_CreateIdentity();
    {
        napi_value assertTrueErr = TrueFailed(env, (transform != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto ret1 = OH_ArkUI_NativeModule_SetAdoptedChildOverlayPositionCompensation(nullptr, &offset, transform);
    auto ret2 = OH_ArkUI_NativeModule_SetAdoptedChildOverlayPositionCompensation(text, nullptr, transform);
    auto ret3 = OH_ArkUI_NativeModule_SetAdoptedChildOverlayPositionCompensation(text, &offset, nullptr);
    OH_ArkUI_Matrix4_Dispose(transform);
    for (auto err : { ret1, ret2, ret3 }) {
        napi_value assertEqErr = EqFailed(env, (err), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestSetAdoptedChildOverlayPositionCompensation006(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    {
        napi_value assertTrueErr = TrueFailed(env, (nodeAPI != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_NativeModule_AdoptChildWithPolicy(column, text,
        OH_ARKUI_NATIVE_MODULE_ADOPT_POLICY_OVERLAY_POSITION_FOLLOWS_ADOPT_PARENT_CHAIN);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    ArkUI_PointF offset = { SIZE_10, SIZE_20 };
    ArkUI_Matrix4 *transform = OH_ArkUI_Matrix4_CreateIdentity();
    {
        napi_value assertTrueErr = TrueFailed(env, (transform != nullptr));
        if (assertTrueErr != nullptr) {
            return assertTrueErr;
        }
    }
    auto retSet = OH_ArkUI_NativeModule_SetAdoptedChildOverlayPositionCompensation(text, &offset, transform);
    {
        napi_value assertEqErr = EqFailed(env, (retSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    ret = OH_ArkUI_NativeModule_RemoveAdoptedChild(column, text);
    {
        napi_value assertEqErr = EqFailed(env, (ret), (ARKUI_ERROR_CODE_NO_ERROR));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    auto retSet2 = OH_ArkUI_NativeModule_SetAdoptedChildOverlayPositionCompensation(text, &offset, transform);
    OH_ArkUI_Matrix4_Dispose(transform);
    {
        napi_value assertEqErr = EqFailed(env, (retSet2), (ARKUI_ERROR_CODE_NODE_IS_NOT_IN_ADOPTED_CHILDREN));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest
