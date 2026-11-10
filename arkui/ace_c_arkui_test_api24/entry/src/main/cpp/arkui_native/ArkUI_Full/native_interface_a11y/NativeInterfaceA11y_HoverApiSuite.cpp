/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * 被测接口（起始版本 26.1.0，SDK 头文件暂未导出，经 NativeInterfaceA11y_bridge 以 dlsym 方式解析）：
 *   无障碍hover事件处理回调的注册接口与解注册接口，完整符号名由 bridge 内分段字符串拼接生成。
 * 说明：本套件为无页面用例，宿主节点通过 native node 接口直接创建（CUSTOM / XCOMPONENT /
 * XCOMPONENT_TEXTURE），注册、解注册仅校验接口返回码，hover 回调由读屏触摸触发，不在用例内模拟。
 */

#include "../../../common/common.h"
#include "NativeInterfaceA11y_bridge.h"

namespace ArkUICapiTest {

namespace {

int32_t g_a11yHoverUserDataOne = PARAM_1;
int32_t g_a11yHoverUserDataTwo = PARAM_2;

/* 桥接层回调原型与 SDK 声明的回调 ABI 一致（elementInfo 以 void* 透传），用例内不会被触发。 */
void A11yHoverCallbackOne(void *userData, int32_t x, int32_t y, int32_t requestId, void *elementInfo)
{
    (void)userData;
    (void)x;
    (void)y;
    (void)requestId;
    (void)elementInfo;
}

void A11yHoverCallbackTwo(void *userData, int32_t x, int32_t y, int32_t requestId, void *elementInfo)
{
    (void)userData;
    (void)x;
    (void)y;
    (void)requestId;
    (void)elementInfo;
}

ArkUI_NativeNodeAPI_1 *A11yHoverNodeApi()
{
    ArkUI_NativeNodeAPI_1 *nodeApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeApi);
    return nodeApi;
}

ArkUI_NodeHandle A11yHoverCreateHost(ArkUI_NodeType type)
{
    ArkUI_NativeNodeAPI_1 *nodeApi = A11yHoverNodeApi();
    return nodeApi != nullptr ? nodeApi->createNode(type) : nullptr;
}

void A11yHoverDisposeHost(ArkUI_NodeHandle node)
{
    ArkUI_NativeNodeAPI_1 *nodeApi = A11yHoverNodeApi();
    if ((node != nullptr) && (nodeApi != nullptr)) {
        nodeApi->disposeNode(node);
    }
}

} // namespace

/*
 * 测试接口: 注册无障碍hover事件处理回调。
 * 预期效果: ARKUI_NODE_CUSTOM 宿主节点注册成功，返回 ARKUI_ERROR_CODE_NO_ERROR。
 * 实际测试: 创建 CUSTOM 宿主节点，注册回调与自定义数据，断言成功码一致，再解注册并销毁节点。
 */
static napi_value TestArkUICapi_513(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_CUSTOM);
    if (host == nullptr) {
        return nullptr;
    }

    auto rc = NativeElemTestBridge::RegisterHoverHandler(
        host, &g_a11yHoverUserDataOne, A11yHoverCallbackOne);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rc), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    (void)NativeElemTestBridge::UnregisterHoverHandler(host);
    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 注册无障碍hover事件处理回调，node 为空指针。
 * 预期效果: 返回 ARKUI_ERROR_CODE_PARAM_INVALID。
 * 实际测试: 以空指针宿主节点注册，断言参数校验错误码一致。
 */
static napi_value TestArkUICapi_514(napi_env env, napi_callback_info info)
{
    (void)info;
    auto rc = NativeElemTestBridge::RegisterHoverHandler(
        nullptr, &g_a11yHoverUserDataOne, A11yHoverCallbackOne);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rc), (NativeElemTestBridge::ExpectedHoverParamInvalidCode()));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 注册无障碍hover事件处理回调，回调为空指针。
 * 预期效果: 返回 ARKUI_ERROR_CODE_PARAM_ERROR。
 * 实际测试: 创建 CUSTOM 宿主节点后以空回调注册，断言错误码一致，再销毁节点。
 */
static napi_value TestArkUICapi_515(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_CUSTOM);
    if (host == nullptr) {
        return nullptr;
    }

    auto rc = NativeElemTestBridge::RegisterHoverHandler(host, &g_a11yHoverUserDataOne, nullptr);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rc), (NativeElemTestBridge::ExpectedHoverParamErrorCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 注册无障碍hover事件处理回调，宿主节点类型不支持。
 * 预期效果: 返回 ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED。
 * 实际测试: 创建 ARKUI_NODE_COLUMN 节点后注册，断言类型不支持错误码一致，再销毁节点。
 */
static napi_value TestArkUICapi_516(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_COLUMN);
    if (host == nullptr) {
        return nullptr;
    }

    auto rc = NativeElemTestBridge::RegisterHoverHandler(
        host, &g_a11yHoverUserDataOne, A11yHoverCallbackOne);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rc), (NativeElemTestBridge::ExpectedHoverTypeNotSupportedCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 注册无障碍hover事件处理回调，同一节点重复注册。
 * 预期效果: 重复注册覆盖原回调与自定义数据，两次均返回 ARKUI_ERROR_CODE_NO_ERROR。
 * 实际测试: 同一 CUSTOM 宿主节点先后注册两组不同回调与数据，断言两次返回成功码一致。
 */
static napi_value TestArkUICapi_517(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_CUSTOM);
    if (host == nullptr) {
        return nullptr;
    }

    auto rcFirst = NativeElemTestBridge::RegisterHoverHandler(
        host, &g_a11yHoverUserDataOne, A11yHoverCallbackOne);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rcFirst), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    auto rcSecond = NativeElemTestBridge::RegisterHoverHandler(
        host, &g_a11yHoverUserDataTwo, A11yHoverCallbackTwo);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rcSecond), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            (void)NativeElemTestBridge::UnregisterHoverHandler(host);
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    (void)NativeElemTestBridge::UnregisterHoverHandler(host);
    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 注册无障碍hover事件处理回调，宿主节点为 ARKUI_NODE_XCOMPONENT。
 * 预期效果: 注册成功，返回 ARKUI_ERROR_CODE_NO_ERROR。
 * 实际测试: 创建 XCOMPONENT 宿主节点并注册，断言成功码一致，再解注册并销毁节点。
 */
static napi_value TestArkUICapi_518(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_XCOMPONENT);
    if (host == nullptr) {
        return nullptr;
    }

    auto rc = NativeElemTestBridge::RegisterHoverHandler(
        host, &g_a11yHoverUserDataOne, A11yHoverCallbackOne);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rc), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    (void)NativeElemTestBridge::UnregisterHoverHandler(host);
    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 注册无障碍hover事件处理回调，宿主节点为 ARKUI_NODE_XCOMPONENT_TEXTURE。
 * 预期效果: 注册成功，返回 ARKUI_ERROR_CODE_NO_ERROR。
 * 实际测试: 创建 XCOMPONENT_TEXTURE 宿主节点并注册，断言成功码一致，再解注册并销毁节点。
 */
static napi_value TestArkUICapi_519(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_XCOMPONENT_TEXTURE);
    if (host == nullptr) {
        return nullptr;
    }

    auto rc = NativeElemTestBridge::RegisterHoverHandler(
        host, &g_a11yHoverUserDataOne, A11yHoverCallbackOne);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rc), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    (void)NativeElemTestBridge::UnregisterHoverHandler(host);
    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 解注册无障碍hover事件处理回调。
 * 预期效果: 已注册回调的宿主节点解注册成功，返回 ARKUI_ERROR_CODE_NO_ERROR。
 * 实际测试: 创建 CUSTOM 宿主节点注册回调，解注册并断言成功码一致，再销毁节点。
 */
static napi_value TestArkUICapi_520(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_CUSTOM);
    if (host == nullptr) {
        return nullptr;
    }

    auto rcRegister = NativeElemTestBridge::RegisterHoverHandler(
        host, &g_a11yHoverUserDataOne, A11yHoverCallbackOne);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rcRegister), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    auto rc = NativeElemTestBridge::UnregisterHoverHandler(host);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rc), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 解注册无障碍hover事件处理回调，宿主节点未注册回调。
 * 预期效果: 支持类型节点未注册回调时解注册仍返回 ARKUI_ERROR_CODE_NO_ERROR。
 * 实际测试: 创建 CUSTOM 宿主节点后直接解注册，断言成功码一致，再销毁节点。
 */
static napi_value TestArkUICapi_521(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_CUSTOM);
    if (host == nullptr) {
        return nullptr;
    }

    auto rc = NativeElemTestBridge::UnregisterHoverHandler(host);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rc), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 解注册无障碍hover事件处理回调，node 为空指针。
 * 预期效果: 返回 ARKUI_ERROR_CODE_PARAM_INVALID。
 * 实际测试: 以空指针宿主节点解注册，断言参数校验错误码一致。
 */
static napi_value TestArkUICapi_522(napi_env env, napi_callback_info info)
{
    (void)info;
    auto rc = NativeElemTestBridge::UnregisterHoverHandler(nullptr);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rc), (NativeElemTestBridge::ExpectedHoverParamInvalidCode()));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 解注册无障碍hover事件处理回调，宿主节点类型不支持。
 * 预期效果: 返回 ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED。
 * 实际测试: 创建 ARKUI_NODE_COLUMN 节点后解注册，断言类型不支持错误码一致，再销毁节点。
 */
static napi_value TestArkUICapi_523(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_COLUMN);
    if (host == nullptr) {
        return nullptr;
    }

    auto rc = NativeElemTestBridge::UnregisterHoverHandler(host);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rc), (NativeElemTestBridge::ExpectedHoverTypeNotSupportedCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 解注册无障碍hover事件处理回调，同一节点重复解注册。
 * 预期效果: 重复解注册为幂等操作，两次均返回 ARKUI_ERROR_CODE_NO_ERROR。
 * 实际测试: 注册后连续两次解注册，断言两次返回成功码一致，再销毁节点。
 */
static napi_value TestArkUICapi_524(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_CUSTOM);
    if (host == nullptr) {
        return nullptr;
    }

    auto rcRegister = NativeElemTestBridge::RegisterHoverHandler(
        host, &g_a11yHoverUserDataOne, A11yHoverCallbackOne);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rcRegister), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    auto rcFirst = NativeElemTestBridge::UnregisterHoverHandler(host);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rcFirst), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    auto rcSecond = NativeElemTestBridge::UnregisterHoverHandler(host);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rcSecond), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 注册与解注册无障碍hover事件处理回调的完整生命周期。
 * 预期效果: 解注册后可对同一节点重新注册，三步均返回 ARKUI_ERROR_CODE_NO_ERROR。
 * 实际测试: 注册、解注册、再次注册同一 CUSTOM 宿主节点，断言各步成功码一致。
 */
static napi_value TestArkUICapi_525(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_CUSTOM);
    if (host == nullptr) {
        return nullptr;
    }

    auto rcRegisterFirst = NativeElemTestBridge::RegisterHoverHandler(
        host, &g_a11yHoverUserDataOne, A11yHoverCallbackOne);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rcRegisterFirst), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    auto rcUnregister = NativeElemTestBridge::UnregisterHoverHandler(host);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rcUnregister), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    auto rcRegisterSecond = NativeElemTestBridge::RegisterHoverHandler(
        host, &g_a11yHoverUserDataTwo, A11yHoverCallbackTwo);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rcRegisterSecond), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    (void)NativeElemTestBridge::UnregisterHoverHandler(host);
    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: 注册无障碍hover事件处理回调，自定义数据为空指针。
 * 预期效果: userData 无非空约束，注册成功，返回 ARKUI_ERROR_CODE_NO_ERROR。
 * 实际测试: 以空指针自定义数据注册 CUSTOM 宿主节点，断言成功码一致，再解注册并销毁节点。
 */
static napi_value TestArkUICapi_526(napi_env env, napi_callback_info info)
{
    (void)info;
    ArkUI_NodeHandle host = A11yHoverCreateHost(ARKUI_NODE_CUSTOM);
    if (host == nullptr) {
        return nullptr;
    }

    auto rc = NativeElemTestBridge::RegisterHoverHandler(host, nullptr, A11yHoverCallbackOne);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (rc), (NativeElemTestBridge::ExpectedSuccessCode()));
        if (napiAssertErr != nullptr) {
            A11yHoverDisposeHost(host);
            return napiAssertErr;
        }
    }

    (void)NativeElemTestBridge::UnregisterHoverHandler(host);
    A11yHoverDisposeHost(host);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest
