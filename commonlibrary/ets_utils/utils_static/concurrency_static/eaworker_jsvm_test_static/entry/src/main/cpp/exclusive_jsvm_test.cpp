/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include "exclusive_jsvm_test.h"

#include "jsvm_runtime_init.h"

#include <array>
#include <cstdint>
#include <iostream>
#include <pthread.h>

#include <ark_runtime/jsvm.h>

namespace {
constexpr ani_int STACK_QUERY_FAILED = -2;
constexpr ani_int JSVM_INIT_FAILED = -2;
constexpr ani_int JSVM_CREATE_FAILED = -3;
constexpr ani_int HANDLE_SCOPE_OPEN_FAILED = -2;
constexpr ani_int SCRIPT_EXECUTION_FAILED = -3;
constexpr ani_int RESULT_CONVERSION_FAILED = -4;
constexpr ani_int JS_EXCEPTION = -5;
constexpr ani_int HANDLE_SCOPE_CLOSE_FAILED = -6;
const int TWO = 2;
const int THREE = 3;

// Each EAWorker pthread owns its engine; fibers on that pthread share it.
thread_local JSVM_VM g_vm = nullptr;
thread_local JSVM_VMScope g_vmScope = nullptr;
thread_local JSVM_Env g_env = nullptr;
thread_local JSVM_EnvScope g_envScope = nullptr;

ani_int StackPosition([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    pthread_attr_t attr{};
    if (pthread_getattr_np(pthread_self(), &attr) != 0) {
        return STACK_QUERY_FAILED;
    }
    void *base = nullptr;
    size_t size = 0;
    int status = pthread_attr_getstack(&attr, &base, &size);
    pthread_attr_destroy(&attr);
    if (status != 0) {
        return STACK_QUERY_FAILED;
    }
    uint8_t marker = 0;
    auto sp = reinterpret_cast<uintptr_t>(&marker);
    auto low = reinterpret_cast<uintptr_t>(base);
    return sp >= low && sp < low + size ? 0 : 1;
}

// Also handles partially initialized engines. Return 0 only if cleanup succeeds.
ani_int Destroy([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    bool ok = true;
    if (g_envScope != nullptr) {
        ok = (OH_JSVM_CloseEnvScope(g_env, g_envScope) == JSVM_OK) && ok;
    }
    if (g_env != nullptr) {
        ok = (OH_JSVM_DestroyEnv(g_env) == JSVM_OK) && ok;
    }
    if (g_vmScope != nullptr) {
        ok = (OH_JSVM_CloseVMScope(g_vm, g_vmScope) == JSVM_OK) && ok;
    }
    if (g_vm != nullptr) {
        ok = (OH_JSVM_DestroyVM(g_vm) == JSVM_OK) && ok;
    }
    g_envScope = nullptr;
    g_env = nullptr;
    g_vmScope = nullptr;
    g_vm = nullptr;
    return ok ? 0 : -1;
}

ani_int Create([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    if (g_vm != nullptr || StackPosition(nullptr, nullptr) != 0) {
        return -1;
    }
    if (!EnsureJsvmRuntimeInit()) {
        return JSVM_INIT_FAILED;
    }
    JSVM_CreateVMOptions options{};
    if (OH_JSVM_CreateVM(&options, &g_vm) != JSVM_OK ||
        OH_JSVM_OpenVMScope(g_vm, &g_vmScope) != JSVM_OK ||
        OH_JSVM_CreateEnv(g_vm, 0, nullptr, &g_env) != JSVM_OK ||
        OH_JSVM_OpenEnvScope(g_env, &g_envScope) != JSVM_OK) {
        Destroy(nullptr, nullptr);
        return JSVM_CREATE_FAILED;
    }
    return 0;
}

ani_int Run([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    if (g_env == nullptr) {
        return -1;
    }
    constexpr char scriptSource[] =
        "(function(){function recurse(n){if(n===0)return 42;"
        "return recurse(n-1);}return recurse(256);})()";
    JSVM_HandleScope scope = nullptr;
    if (OH_JSVM_OpenHandleScope(g_env, &scope) != JSVM_OK) {
        return HANDLE_SCOPE_OPEN_FAILED;
    }
    JSVM_Value source = nullptr;
    JSVM_Script script = nullptr;
    JSVM_Value result = nullptr;
    int32_t value = SCRIPT_EXECUTION_FAILED;
    if (OH_JSVM_CreateStringUtf8(g_env, scriptSource, sizeof(scriptSource) - 1, &source) == JSVM_OK &&
        OH_JSVM_CompileScript(g_env, source, nullptr, 0, true, nullptr, &script) == JSVM_OK &&
        OH_JSVM_RunScript(g_env, script, &result) == JSVM_OK) {
        if (OH_JSVM_GetValueInt32(g_env, result, &value) != JSVM_OK) {
            value = RESULT_CONVERSION_FAILED;
        }
    }
    // Clear managed JS exceptions before releasing their handle scope.
    bool pending = false;
    if (OH_JSVM_IsExceptionPending(g_env, &pending) == JSVM_OK && pending) {
        JSVM_Value exception = nullptr;
        OH_JSVM_GetAndClearLastException(g_env, &exception);
        value = JS_EXCEPTION;
    }
    if (OH_JSVM_CloseHandleScope(g_env, scope) != JSVM_OK) {
        return HANDLE_SCOPE_CLOSE_FAILED;
    }
    return value;
}
} // namespace

ani_status BindExclusiveJsvmNative(ani_vm *vm)
{
    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        return static_cast<ani_status>(1);
    }
    ani_class cls{};
    const char *className =
        "entry.src.main.src.test.EAWorkerExclusiveScopeJsvm.test.ExclusiveJsvmNative";
    if (env->FindClass(className, &cls) != ANI_OK) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return static_cast<ani_status>(TWO);
    }
    std::array methods = {
        ani_native_function{"jsvmCreate", ":i", reinterpret_cast<void *>(Create)},
        ani_native_function{"jsvmRun", ":i", reinterpret_cast<void *>(Run)},
        ani_native_function{"jsvmStackPosition", ":i", reinterpret_cast<void *>(StackPosition)},
        ani_native_function{"jsvmDestroy", ":i", reinterpret_cast<void *>(Destroy)},
    };
    if (env->Class_BindNativeMethods(cls, methods.data(), methods.size()) != ANI_OK) {
        return static_cast<ani_status>(THREE);
    }
    return ANI_OK;
}
