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
#include <fenv.h>
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

static constexpr int kStableLoop = 20;
static constexpr int kThreadCount = 3;
static constexpr int kIterPerThread = 10;

static int CallFegetexcept()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetFegetexcept();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func();
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

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetFegetexcept() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value FegetexceptNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    feclearexcept(FE_ALL_EXCEPT);
    CallFeenableexcept(FE_DIVBYZERO);
    int ret = CallFegetexcept();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FegetexceptNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    feclearexcept(FE_ALL_EXCEPT);
    CallFedisableexcept(FE_ALL_EXCEPT);
    int ret = CallFegetexcept();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FegetexceptNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    feclearexcept(FE_ALL_EXCEPT);
    CallFeenableexcept(FE_DIVBYZERO | FE_INVALID);
    int ret = CallFegetexcept();
    CallFedisableexcept(FE_DIVBYZERO | FE_INVALID);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FegetexceptNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value FegetexceptAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallFegetexcept();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FegetexceptAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    feclearexcept(FE_ALL_EXCEPT);
    int ret1 = CallFegetexcept();
    int ret2 = CallFegetexcept();
    return ReturnInt32(env, (ret1 >= 0 && ret2 >= 0) ? 1 : 0);
}

static napi_value FegetexceptBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    feclearexcept(FE_ALL_EXCEPT);
    CallFeenableexcept(FE_ALL_EXCEPT);
    int ret = CallFegetexcept();
    CallFedisableexcept(FE_ALL_EXCEPT);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FegetexceptBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    feclearexcept(FE_ALL_EXCEPT);
    CallFeenableexcept(FE_ALL_EXCEPT);
    CallFedisableexcept(FE_ALL_EXCEPT);
    int ret = CallFegetexcept();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value FegetexceptStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < kStableLoop; ++i) {
        feclearexcept(FE_ALL_EXCEPT);
        int ret = CallFegetexcept();
        if (ret < 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value FegetexceptThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < kThreadCount; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < kIterPerThread; ++i) {
                int ret = CallFegetexcept();
                if (ret < 0) {
                    hasError = true;
                    return;
                }
            }
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
        {"fegetexceptNormal001", nullptr, FegetexceptNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetexceptNormal002", nullptr, FegetexceptNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetexceptNormal003", nullptr, FegetexceptNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetexceptNormal004", nullptr, FegetexceptNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetexceptAbnormal001", nullptr, FegetexceptAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetexceptAbnormal002", nullptr, FegetexceptAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetexceptBoundary001", nullptr, FegetexceptBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetexceptBoundary002", nullptr, FegetexceptBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetexceptStable001", nullptr, FegetexceptStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetexceptThread001", nullptr, FegetexceptThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "fegetexceptndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
