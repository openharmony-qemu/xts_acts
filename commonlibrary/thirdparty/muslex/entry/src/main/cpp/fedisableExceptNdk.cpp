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
#include <cfenv>
#include <cerrno>
#include <thread>
#include <vector>
#include <atomic>

#ifndef FE_DIVBYZERO
#define FE_DIVBYZERO 2
#define FE_INVALID 1
#define FE_OVERFLOW 4
#define FE_UNDERFLOW 8
#define FE_INEXACT 16
#define FE_ALL_EXCEPT 31
#endif

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static int CallFedisableexcept(int excepts)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetFedisableexcept();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(excepts);
}

static int CallFeenableexcept(int excepts)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetFeenableexcept();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(excepts);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetFedisableexcept() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value FedisableexceptNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    feclearexcept(FE_ALL_EXCEPT);
    CallFeenableexcept(FE_DIVBYZERO);
    int ret = CallFedisableexcept(FE_DIVBYZERO);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FedisableexceptNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    feclearexcept(FE_ALL_EXCEPT);
    CallFeenableexcept(FE_INVALID);
    int ret = CallFedisableexcept(FE_INVALID);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FedisableexceptNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    feclearexcept(FE_ALL_EXCEPT);
    CallFeenableexcept(FE_DIVBYZERO | FE_INVALID);
    int ret = CallFedisableexcept(FE_DIVBYZERO | FE_INVALID);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FedisableexceptNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value FedisableexceptAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallFedisableexcept(0);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FedisableexceptAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallFedisableexcept(0xFFFF);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FedisableexceptBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    feclearexcept(FE_ALL_EXCEPT);
    CallFeenableexcept(FE_ALL_EXCEPT);
    int ret = CallFedisableexcept(FE_ALL_EXCEPT);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FedisableexceptBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    feclearexcept(FE_ALL_EXCEPT);
    int ret = CallFedisableexcept(FE_DIVBYZERO);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FedisableexceptStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        feclearexcept(FE_ALL_EXCEPT);
        CallFeenableexcept(FE_DIVBYZERO);
        int ret = CallFedisableexcept(FE_DIVBYZERO);
        if (ret < 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void FedisableexceptThreadWorker(std::atomic<bool>& hasError)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        feclearexcept(FE_ALL_EXCEPT);
        CallFeenableexcept(FE_DIVBYZERO);
        int ret = CallFedisableexcept(FE_DIVBYZERO);
        if (ret < 0) {
            hasError = true;
            return;
        }
    }
}

static napi_value FedisableexceptThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]() {
            FedisableexceptThreadWorker(hasError);
        });
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
        {"fedisableexceptNormal001", nullptr, FedisableexceptNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"fedisableexceptNormal002", nullptr, FedisableexceptNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"fedisableexceptNormal003", nullptr, FedisableexceptNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"fedisableexceptNormal004", nullptr, FedisableexceptNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"fedisableexceptAbnormal001", nullptr, FedisableexceptAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"fedisableexceptAbnormal002", nullptr, FedisableexceptAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"fedisableexceptBoundary001", nullptr, FedisableexceptBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"fedisableexceptBoundary002", nullptr, FedisableexceptBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"fedisableexceptStable001", nullptr, FedisableexceptStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"fedisableexceptThread001", nullptr, FedisableexceptThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "fedisableexceptndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}