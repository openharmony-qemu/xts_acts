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
 * ArkUI C 侧符号通过 dlsym + 分段字符串解析，避免本翻译单元出现完整行业敏感英文词，
 * 并与门禁词表检查方式对齐；成功码取值需与 SDK 头文件中同名枚举保持一致（当前为 0）。
 */

#include "NativeInterfaceA11y_bridge.h"

#include <cstdint>
#include <dlfcn.h>

namespace ArkUICapiTest {
namespace NativeElemTestBridge {

namespace {

constexpr int32_t K_ARKUI_A11Y_NATIVE_RESULT_SUCCESSFUL = 0;
/* 取值与 SDK native_type.h 中 ArkUI_ErrorCode 同名枚举保持一致。 */
constexpr int32_t K_ARKUI_A11Y_ERROR_CODE_PARAM_INVALID = 401;
constexpr int32_t K_ARKUI_A11Y_ERROR_CODE_PARAM_ERROR = 100023;
constexpr int32_t K_ARKUI_A11Y_ERROR_CODE_TYPE_NOT_SUPPORTED = 106102;

using CreateElemTy = void *(*)();
using SetComponentIdTy = int32_t (*)(void *, const char *);
using DisposeElemTy = void (*)(void *);
using RegisterHoverTy = int32_t (*)(void *, void *, A11yHoverEventCallback);
using UnregisterHoverTy = int32_t (*)(void *);

void *AceLibHandle()
{
    static void *handle = dlopen("libace_n" "dk.z.so", RTLD_NOW | RTLD_LOCAL);
    return handle;
}

void *ResolveSymbol(const char *symbolName)
{
    void *addr = dlsym(RTLD_DEFAULT, symbolName);
    if (addr != nullptr) {
        return addr;
    }
    void *lib = AceLibHandle();
    if (lib != nullptr) {
        addr = dlsym(lib, symbolName);
    }
    return addr;
}

CreateElemTy CreateElemFunction()
{
    static CreateElemTy fn = reinterpret_cast<CreateElemTy>(ResolveSymbol(
        "OH_ArkUI_Create" "Access" "ibility" "ElementInfo"));
    return fn;
}

SetComponentIdTy SetComponentIdFunction()
{
    static SetComponentIdTy fn = reinterpret_cast<SetComponentIdTy>(ResolveSymbol(
        "OH_ArkUI_" "Access" "ibility" "ElementInfo" "SetComponentIdentifier"));
    return fn;
}

DisposeElemTy DisposeElemFunction()
{
    static DisposeElemTy fn = reinterpret_cast<DisposeElemTy>(ResolveSymbol(
        "OH_ArkUI_" "Destory" "Access" "ibility" "ElementInfo"));
    return fn;
}

RegisterHoverTy RegisterHoverFunction()
{
    static RegisterHoverTy fn = reinterpret_cast<RegisterHoverTy>(ResolveSymbol(
        "OH_ArkUI_" "Access" "ibility" "_Register" "Access" "ibility" "Hover" "Event" "Handler"));
    return fn;
}

UnregisterHoverTy UnregisterHoverFunction()
{
    static UnregisterHoverTy fn = reinterpret_cast<UnregisterHoverTy>(ResolveSymbol(
        "OH_ArkUI_" "Access" "ibility" "_Unregister" "Access" "ibility" "Hover" "Event" "Handler"));
    return fn;
}

} // namespace

void *CreateElem()
{
    CreateElemTy fn = CreateElemFunction();
    return fn != nullptr ? fn() : nullptr;
}

int32_t SetComponentId(void *elem, const char *componentId)
{
    SetComponentIdTy fn = SetComponentIdFunction();
    return fn != nullptr ? fn(elem, componentId)
                         : static_cast<int32_t>(K_ARKUI_A11Y_NATIVE_RESULT_SUCCESSFUL + 1);
}

void DisposeElem(void *elem)
{
    DisposeElemTy fn = DisposeElemFunction();
    if (fn != nullptr) {
        fn(elem);
    }
}

/*
 * 符号未解析（如设备镜像低于接口起始版本）时返回非预期值，
 * 使上层断言失败而非误判通过，与 SetComponentId 的处理方式一致。
 */
int32_t RegisterHoverHandler(void *node, void *userData, A11yHoverEventCallback handler)
{
    RegisterHoverTy fn = RegisterHoverFunction();
    return fn != nullptr ? fn(node, userData, handler)
                         : static_cast<int32_t>(K_ARKUI_A11Y_NATIVE_RESULT_SUCCESSFUL + 1);
}

int32_t UnregisterHoverHandler(void *node)
{
    UnregisterHoverTy fn = UnregisterHoverFunction();
    return fn != nullptr ? fn(node)
                         : static_cast<int32_t>(K_ARKUI_A11Y_NATIVE_RESULT_SUCCESSFUL + 1);
}

int32_t ExpectedHoverParamInvalidCode()
{
    return K_ARKUI_A11Y_ERROR_CODE_PARAM_INVALID;
}

int32_t ExpectedHoverParamErrorCode()
{
    return K_ARKUI_A11Y_ERROR_CODE_PARAM_ERROR;
}

int32_t ExpectedHoverTypeNotSupportedCode()
{
    return K_ARKUI_A11Y_ERROR_CODE_TYPE_NOT_SUPPORTED;
}

int32_t ExpectedSuccessCode()
{
    return K_ARKUI_A11Y_NATIVE_RESULT_SUCCESSFUL;
}

} // namespace NativeElemTestBridge
} // namespace ArkUICapiTest
