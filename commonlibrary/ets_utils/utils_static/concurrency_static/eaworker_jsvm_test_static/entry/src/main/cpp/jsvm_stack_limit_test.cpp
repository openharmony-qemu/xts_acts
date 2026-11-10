/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "ani/ani.h"
#include "exclusive_jsvm_test.h"
#include "jsvm_runtime_init.h"

#include <array>
#include <cstdint>
#include <dlfcn.h>
#include <iostream>
#include <pthread.h>

#include <ark_runtime/jsvm.h>

using GetStackLimitFn = int (*)(void *vm, uintptr_t *stackLimit);
using SetStackLimitFn = int (*)(void *vm, uintptr_t stackLimit);

const int TWO = 2;
const int THREE = 3;
const int FIVE = 5;
const int TEN = 10;
const int FIFTEEN = 15;
constexpr uintptr_t LIMIT_LOW = 0x1000;
constexpr uintptr_t LIMIT_HIGH = 0x7FFFFFFFFFFFULL;
constexpr uintptr_t STACK_SPAN = 256U * 1024U;
constexpr uintptr_t STACK_RESERVE = 16U * 1024U;

static JSVM_VM g_vm = nullptr;
static JSVM_Env g_env = nullptr;
static JSVM_VMScope g_vmScope = nullptr;
static JSVM_EnvScope g_envScope = nullptr;
static bool g_addReady = false;
static GetStackLimitFn g_getLimit = nullptr;
static SetStackLimitFn g_setLimit = nullptr;
static uintptr_t g_savedLimit = 0;

static const char *ADD_JS = R"JS(
function add(a, b) {
    return a + b;
}
)JS";

static bool LoadLimitApis()
{
    if (g_getLimit != nullptr && g_setLimit != nullptr) {
        return true;
    }
    void *handle = dlopen("libjsvm.so", RTLD_NOW);
    if (handle == nullptr) {
        std::cerr << "dlopen libjsvm.so failed: " << dlerror() << std::endl;
        return false;
    }
    g_getLimit = reinterpret_cast<GetStackLimitFn>(dlsym(handle, "JsvmGetStackLimit"));
    g_setLimit = reinterpret_cast<SetStackLimitFn>(dlsym(handle, "JsvmSetStackLimit"));
    if (g_getLimit == nullptr || g_setLimit == nullptr) {
        std::cerr << "dlsym stack limit api failed: " << dlerror() << std::endl;
        return false;
    }
    return true;
}

static bool ClearJsException()
{
    JSVM_Value exception = nullptr;
    OH_JSVM_GetAndClearLastException(g_env, &exception);
    bool isUndefined = true;
    OH_JSVM_IsUndefined(g_env, exception, &isUndefined);
    return !isUndefined;
}

static ani_int DestroyVmCore()
{
    g_addReady = false;
    g_savedLimit = 0;
    if (g_env != nullptr && g_envScope != nullptr) {
        OH_JSVM_CloseEnvScope(g_env, g_envScope);
    }
    if (g_env != nullptr) {
        OH_JSVM_DestroyEnv(g_env);
    }
    if (g_vm != nullptr && g_vmScope != nullptr) {
        OH_JSVM_CloseVMScope(g_vm, g_vmScope);
    }
    if (g_vm != nullptr) {
        OH_JSVM_DestroyVM(g_vm);
    }
    g_env = nullptr;
    g_vm = nullptr;
    g_envScope = nullptr;
    g_vmScope = nullptr;
    return 0;
}

static uintptr_t CurrentCoroutineLimit()
{
    auto stackPointer = reinterpret_cast<uintptr_t>(__builtin_frame_address(0));
    return stackPointer - STACK_SPAN + STACK_RESERVE;
}

static bool EnsureVm()
{
    if (g_vm != nullptr) {
        return true;
    }
    if (!EnsureJsvmRuntimeInit()) {
        return false;
    }
    if (OH_JSVM_CreateVM(nullptr, &g_vm) != JSVM_OK ||
        OH_JSVM_OpenVMScope(g_vm, &g_vmScope) != JSVM_OK ||
        OH_JSVM_CreateEnv(g_vm, 0, nullptr, &g_env) != JSVM_OK ||
        OH_JSVM_OpenEnvScope(g_env, &g_envScope) != JSVM_OK) {
        DestroyVmCore();
        return false;
    }
    return true;
}

static bool CompileAdd()
{
    if (g_addReady) {
        return true;
    }
    if (g_env == nullptr) {
        return false;
    }
    JSVM_HandleScope handleScope = nullptr;
    if (OH_JSVM_OpenHandleScope(g_env, &handleScope) != JSVM_OK) {
        return false;
    }
    JSVM_Value source = nullptr;
    JSVM_Script script = nullptr;
    JSVM_Value unused = nullptr;
    bool ok = OH_JSVM_CreateStringUtf8(g_env, ADD_JS, JSVM_AUTO_LENGTH, &source) == JSVM_OK &&
        OH_JSVM_CompileScript(g_env, source, nullptr, 0, true, nullptr, &script) == JSVM_OK &&
        OH_JSVM_RunScript(g_env, script, &unused) == JSVM_OK;
    if (!ok) {
        ClearJsException();
        OH_JSVM_CloseHandleScope(g_env, handleScope);
        return false;
    }
    g_addReady = true;
    OH_JSVM_CloseHandleScope(g_env, handleScope);
    return true;
}

static ani_int CallAdd(int32_t a, int32_t b)
{
    if (g_env == nullptr || !g_addReady) {
        return -1;
    }
    JSVM_HandleScope handleScope = nullptr;
    if (OH_JSVM_OpenHandleScope(g_env, &handleScope) != JSVM_OK) {
        return -1;
    }
    JSVM_Value global = nullptr;
    JSVM_Value addFn = nullptr;
    JSVM_Value args[TWO] = {nullptr, nullptr};
    JSVM_Value result = nullptr;
    bool pending = false;
    if (OH_JSVM_GetGlobal(g_env, &global) != JSVM_OK ||
        OH_JSVM_GetNamedProperty(g_env, global, "add", &addFn) != JSVM_OK ||
        OH_JSVM_CreateInt32(g_env, a, &args[0]) != JSVM_OK ||
        OH_JSVM_CreateInt32(g_env, b, &args[1]) != JSVM_OK ||
        OH_JSVM_CallFunction(g_env, global, addFn, TWO, args, &result) != JSVM_OK) {
        ClearJsException();
        OH_JSVM_CloseHandleScope(g_env, handleScope);
        return -1;
    }
    OH_JSVM_IsExceptionPending(g_env, &pending);
    if (pending || ClearJsException()) {
        OH_JSVM_CloseHandleScope(g_env, handleScope);
        return -1;
    }
    int32_t value = 0;
    JSVM_Status valueStatus = OH_JSVM_GetValueInt32(g_env, result, &value);
    OH_JSVM_CloseHandleScope(g_env, handleScope);
    return valueStatus == JSVM_OK ? static_cast<ani_int>(value) : -1;
}

static bool IsReasonableLimit(uintptr_t limit)
{
    return limit != 0 && limit != static_cast<uintptr_t>(-1) && limit > LIMIT_LOW &&
        limit < LIMIT_HIGH;
}

static bool GetHostThreadStackRange(uintptr_t *low, uintptr_t *high)
{
    pthread_attr_t attr;
    if (pthread_getattr_np(pthread_self(), &attr) != 0) {
        return false;
    }
    void *stackAddr = nullptr;
    size_t stackSize = 0;
    int rc = pthread_attr_getstack(&attr, &stackAddr, &stackSize);
    pthread_attr_destroy(&attr);
    if (rc != 0 || stackAddr == nullptr || stackSize == 0) {
        return false;
    }
    *low = reinterpret_cast<uintptr_t>(stackAddr);
    *high = *low + stackSize;
    return true;
}

static bool IsInHostThreadStack(uintptr_t limit)
{
    uintptr_t low = 0;
    uintptr_t high = 0;
    if (!GetHostThreadStackRange(&low, &high)) {
        return false;
    }
    return limit > low && limit < high;
}

static ani_int CreateAndCompile([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    if (!LoadLimitApis() || !EnsureVm() || !CompileAdd()) {
        DestroyVmCore();
        return -1;
    }
    if (g_getLimit(g_vm, &g_savedLimit) != 0 || !IsReasonableLimit(g_savedLimit)) {
        DestroyVmCore();
        return -1;
    }
    return 0;
}

// Test-thread coroutines must Set the current-stack lower bound before Compile.
static ani_int CreateSetThenCompile([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    DestroyVmCore();
    if (!LoadLimitApis() || !EnsureVm()) {
        DestroyVmCore();
        return -1;
    }
    if (g_getLimit(g_vm, &g_savedLimit) != 0 || !IsReasonableLimit(g_savedLimit)) {
        DestroyVmCore();
        return -1;
    }
    if (g_setLimit(g_vm, CurrentCoroutineLimit()) != 0) {
        DestroyVmCore();
        return -1;
    }
    if (!CompileAdd()) {
        DestroyVmCore();
        return -1;
    }
    if (g_setLimit(g_vm, g_savedLimit) != 0) {
        DestroyVmCore();
        return -1;
    }
    return 0;
}

static ani_int SetLimitAndRunAdd([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    if (g_vm == nullptr || g_setLimit == nullptr || !g_addReady) {
        return -1;
    }
    if (g_setLimit(g_vm, CurrentCoroutineLimit()) != 0) {
        return -1;
    }
    ani_int value = CallAdd(1, TWO);
    std::cout << "main add " << value << std::endl;
    return value;
}

static ani_int RunAdd(ani_env *aniEnv, ani_object object, ani_int a, ani_int b)
{
    (void)aniEnv;
    (void)object;
    return CallAdd(static_cast<int32_t>(a), static_cast<int32_t>(b));
}

static ani_int RoundTrip([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    if (g_vm == nullptr || g_getLimit == nullptr || g_setLimit == nullptr || g_savedLimit == 0) {
        return -1;
    }
    if (g_setLimit(g_vm, CurrentCoroutineLimit()) != 0 || CallAdd(FIVE, TEN) != FIFTEEN) {
        return -1;
    }
    if (g_setLimit(g_vm, g_savedLimit) != 0) {
        return -1;
    }
    uintptr_t restored = 0;
    if (g_getLimit(g_vm, &restored) != 0 || restored != g_savedLimit) {
        return -1;
    }
    return 0;
}

static ani_int LoopSetRestore(ani_env *aniEnv, ani_object object, ani_int index)
{
    (void)aniEnv;
    (void)object;
    if (index < 0 || g_vm == nullptr || g_setLimit == nullptr || g_savedLimit == 0) {
        return -1;
    }
    if (g_setLimit(g_vm, CurrentCoroutineLimit()) != 0) {
        return -1;
    }
    if (CallAdd(static_cast<int32_t>(index), static_cast<int32_t>(index)) !=
        static_cast<ani_int>(TWO * index)) {
        return -1;
    }
    if (g_setLimit(g_vm, g_savedLimit) != 0) {
        return -1;
    }
    uintptr_t restored = 0;
    if (g_getLimit(g_vm, &restored) != 0 || restored != g_savedLimit) {
        return -1;
    }
    return 0;
}

static ani_int GetLimitValid([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    if (!LoadLimitApis() || g_vm == nullptr) {
        return -1;
    }
    uintptr_t limit = 0;
    if (g_getLimit(g_vm, &limit) != 0) {
        return -1;
    }
    if (limit == 0 || limit == static_cast<uintptr_t>(-1)) {
        return -1;
    }
    if (!IsInHostThreadStack(limit)) {
        return -1;
    }
    return 0;
}

static ani_int GetLimitTimesEqual(ani_env *aniEnv, ani_object object, ani_int times)
{
    (void)aniEnv;
    (void)object;
    if (times <= 1 || !LoadLimitApis() || g_vm == nullptr) {
        return -1;
    }
    uintptr_t first = 0;
    if (g_getLimit(g_vm, &first) != 0 || first == 0) {
        return -1;
    }
    for (ani_int i = 1; i < times; ++i) {
        uintptr_t cur = 0;
        if (g_getLimit(g_vm, &cur) != 0 || cur != first) {
            return -1;
        }
    }
    return 0;
}

static ani_int GetThenCompileGetEqual([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    DestroyVmCore();
    if (!LoadLimitApis() || !EnsureVm()) {
        return -1;
    }
    uintptr_t before = 0;
    if (g_getLimit(g_vm, &before) != 0 || !IsReasonableLimit(before)) {
        DestroyVmCore();
        return -1;
    }
    if (!CompileAdd()) {
        DestroyVmCore();
        return -1;
    }
    uintptr_t after = 0;
    if (g_getLimit(g_vm, &after) != 0 || after != before) {
        DestroyVmCore();
        return -1;
    }
    g_savedLimit = after;
    return 0;
}

static ani_int SetNullVm([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    if (!LoadLimitApis()) {
        return -1;
    }
    return g_setLimit(nullptr, LIMIT_LOW);
}

static ani_int SetZeroLimit([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    if (!LoadLimitApis() || g_vm == nullptr) {
        return -1;
    }
    return g_setLimit(g_vm, 0);
}

static ani_int GetNullVm([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    if (!LoadLimitApis()) {
        return -1;
    }
    uintptr_t limit = 0;
    return g_getLimit(nullptr, &limit);
}

static ani_int SameStackSetRunRestore([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    if (CreateAndCompile(aniEnv, object) != 0) {
        return -1;
    }
    if (g_setLimit(g_vm, g_savedLimit) != 0) {
        DestroyVmCore();
        return -1;
    }
    ani_int value = CallAdd(1, TWO);
    std::cout << "main add " << value << std::endl;
    if (g_setLimit(g_vm, g_savedLimit) != 0) {
        DestroyVmCore();
        return -1;
    }
    DestroyVmCore();
    return value;
}

static ani_int SameStackRunNoSet([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    DestroyVmCore();
    if (!EnsureVm() || !CompileAdd()) {
        DestroyVmCore();
        return -1;
    }
    ani_int value = CallAdd(1, TWO);
    std::cout << "main add " << value << std::endl;
    DestroyVmCore();
    return value;
}

static ani_int DestroyVm([[maybe_unused]] ani_env *aniEnv,
    [[maybe_unused]] ani_object object)
{
    return DestroyVmCore();
}

static ani_status BindJsvmStackLimitNative(ani_vm *vm)
{
    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        return static_cast<ani_status>(1);
    }
    ani_class cls{};
    const char *className =
        "entry.src.main.src.test.ActsEAWorkerJsvm.test.JsvmStackLimitNative";
    if (env->FindClass(className, &cls) != ANI_OK) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return static_cast<ani_status>(TWO);
    }
    std::array methods = {
        ani_native_function{"createAndCompile", ":i",
            reinterpret_cast<void *>(CreateAndCompile)},
        ani_native_function{"createSetThenCompile", ":i",
            reinterpret_cast<void *>(CreateSetThenCompile)},
        ani_native_function{"setLimitAndRunAdd", ":i",
            reinterpret_cast<void *>(SetLimitAndRunAdd)},
        ani_native_function{"runAdd", "ii:i", reinterpret_cast<void *>(RunAdd)},
        ani_native_function{"roundTrip", ":i",
            reinterpret_cast<void *>(RoundTrip)},
        ani_native_function{"loopSetRestore", "i:i",
            reinterpret_cast<void *>(LoopSetRestore)},
        ani_native_function{"getLimitValid", ":i",
            reinterpret_cast<void *>(GetLimitValid)},
        ani_native_function{"getLimitTimesEqual", "i:i",
            reinterpret_cast<void *>(GetLimitTimesEqual)},
        ani_native_function{"getThenCompileGetEqual", ":i",
            reinterpret_cast<void *>(GetThenCompileGetEqual)},
        ani_native_function{"setNullVm", ":i",
            reinterpret_cast<void *>(SetNullVm)},
        ani_native_function{"setZeroLimit", ":i",
            reinterpret_cast<void *>(SetZeroLimit)},
        ani_native_function{"getNullVm", ":i",
            reinterpret_cast<void *>(GetNullVm)},
        ani_native_function{"sameStackSetRunRestore", ":i",
            reinterpret_cast<void *>(SameStackSetRunRestore)},
        ani_native_function{"sameStackRunNoSet", ":i",
            reinterpret_cast<void *>(SameStackRunNoSet)},
        ani_native_function{"destroyVm", ":i",
            reinterpret_cast<void *>(DestroyVm)},
    };
    if (env->Class_BindNativeMethods(cls, methods.data(), methods.size()) != ANI_OK) {
        return static_cast<ani_status>(THREE);
    }
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    *result = ANI_VERSION_1;
    ani_status status = BindJsvmStackLimitNative(vm);
    if (status != ANI_OK) {
        return status;
    }
    return BindExclusiveJsvmNative(vm);
}
