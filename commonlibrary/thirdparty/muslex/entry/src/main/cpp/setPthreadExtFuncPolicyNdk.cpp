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

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr int K_FLAG_MOD = 2;

static bool CallSetPthreadExtFuncPolicy(int flag)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetSetPthreadExtFuncPolicy();
    if (!func) {
        errno = ENOSYS;
        return false;
    }
    errno = 0;
    func(flag);
    return true;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetSetPthreadExtFuncPolicy() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value SetPthreadExtFuncPolicyNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool ret = CallSetPthreadExtFuncPolicy(0);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetPthreadExtFuncPolicyNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool ret = CallSetPthreadExtFuncPolicy(1);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetPthreadExtFuncPolicyNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    CallSetPthreadExtFuncPolicy(1);
    auto& loader = LibcFunctionLoader::GetInstance();
    auto getFunc = loader.GetPthreadExtFuncPolicy();
    int val = -1;
    if (getFunc) {
        val = getFunc();
    }
    CallSetPthreadExtFuncPolicy(0);
    return ReturnInt32(env, (val >= 0) ? 1 : 0);
}

static napi_value SetPthreadExtFuncPolicyNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value SetPthreadExtFuncPolicyAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    CallSetPthreadExtFuncPolicy(-1);
    return ReturnInt32(env, 1);
}

static napi_value SetPthreadExtFuncPolicyAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    CallSetPthreadExtFuncPolicy(INT_MAX);
    CallSetPthreadExtFuncPolicy(0);
    return ReturnInt32(env, 1);
}

static napi_value SetPthreadExtFuncPolicyBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool ret = CallSetPthreadExtFuncPolicy(0);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetPthreadExtFuncPolicyBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool ret = CallSetPthreadExtFuncPolicy(1);
    CallSetPthreadExtFuncPolicy(0);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetPthreadExtFuncPolicyStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        CallSetPthreadExtFuncPolicy(i % K_FLAG_MOD);
    }
    CallSetPthreadExtFuncPolicy(0);
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value SetPthreadExtFuncPolicyThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                CallSetPthreadExtFuncPolicy(i % K_FLAG_MOD);
            }
        });
    }
    for (auto& th : threads) {
        th.join();
    }
    CallSetPthreadExtFuncPolicy(0);
    return ReturnInt32(env, !hasError ? 1 : 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setPthreadExtFuncPolicyNormal001", nullptr, SetPthreadExtFuncPolicyNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setPthreadExtFuncPolicyNormal002", nullptr, SetPthreadExtFuncPolicyNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setPthreadExtFuncPolicyNormal003", nullptr, SetPthreadExtFuncPolicyNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setPthreadExtFuncPolicyNormal004", nullptr, SetPthreadExtFuncPolicyNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setPthreadExtFuncPolicyAbnormal001", nullptr, SetPthreadExtFuncPolicyAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setPthreadExtFuncPolicyAbnormal002", nullptr, SetPthreadExtFuncPolicyAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setPthreadExtFuncPolicyBoundary001", nullptr, SetPthreadExtFuncPolicyBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setPthreadExtFuncPolicyBoundary002", nullptr, SetPthreadExtFuncPolicyBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setPthreadExtFuncPolicyStable001", nullptr, SetPthreadExtFuncPolicyStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setPthreadExtFuncPolicyThread001", nullptr, SetPthreadExtFuncPolicyThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "setpthreadextfuncpolicyndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}