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

#include "napi/native_api.h"
#include "libcFunctionLoader.h"
#include <pthread.h>
#include <cerrno>
#include <thread>
#include <vector>
#include <atomic>
#include <functional>

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static int CallPthreadExtFuncPolicy()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetPthreadExtFuncPolicy();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func();
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetPthreadExtFuncPolicy() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value PthreadExtFuncPolicyNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallPthreadExtFuncPolicy();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadExtFuncPolicyNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    auto& loader = LibcFunctionLoader::GetInstance();
    auto setFunc = loader.GetSetPthreadExtFuncPolicy();
    if (setFunc) {
        setFunc(0);
    }
    int ret = CallPthreadExtFuncPolicy();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadExtFuncPolicyNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret1 = CallPthreadExtFuncPolicy();
    int ret2 = CallPthreadExtFuncPolicy();
    return ReturnInt32(env, (ret1 >= 0 && ret2 >= 0) ? 1 : 0);
}

static napi_value PthreadExtFuncPolicyNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value PthreadExtFuncPolicyAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallPthreadExtFuncPolicy();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadExtFuncPolicyAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int loopcount = 20;
    for (int i = 0; i < loopcount; ++i) {
        int ret = CallPthreadExtFuncPolicy();
        if (ret < 0) {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value PthreadExtFuncPolicyBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallPthreadExtFuncPolicy();
    return ReturnInt32(env, (ret >= 0 && ret <= 1) ? 1 : 0);
}

static napi_value PthreadExtFuncPolicyBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    auto& loader = LibcFunctionLoader::GetInstance();
    auto setFunc = loader.GetSetPthreadExtFuncPolicy();
    if (setFunc) {
        setFunc(1);
    }
    int ret = CallPthreadExtFuncPolicy();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadExtFuncPolicyStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        int ret = CallPthreadExtFuncPolicy();
        if (ret < 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void ExtFuncPolicyWorker(std::atomic<bool>& hasError)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        int ret = CallPthreadExtFuncPolicy();
        if (ret < 0) {
            hasError = true;
            return;
        }
    }
}

static napi_value PthreadExtFuncPolicyThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(ExtFuncPolicyWorker, std::ref(hasError));
    }
    for (auto& th : threads) {
        th.join();
    }
    return ReturnInt32(env, !hasError ? 1 : 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"pthreadExtFuncPolicyNormal001", nullptr, PthreadExtFuncPolicyNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadExtFuncPolicyNormal002", nullptr, PthreadExtFuncPolicyNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadExtFuncPolicyNormal003", nullptr, PthreadExtFuncPolicyNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadExtFuncPolicyNormal004", nullptr, PthreadExtFuncPolicyNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadExtFuncPolicyAbnormal001", nullptr, PthreadExtFuncPolicyAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadExtFuncPolicyAbnormal002", nullptr, PthreadExtFuncPolicyAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadExtFuncPolicyBoundary001", nullptr, PthreadExtFuncPolicyBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadExtFuncPolicyBoundary002", nullptr, PthreadExtFuncPolicyBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadExtFuncPolicyStable001", nullptr, PthreadExtFuncPolicyStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadExtFuncPolicyThread001", nullptr, PthreadExtFuncPolicyThread001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "pthreadextfuncpolicyndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}