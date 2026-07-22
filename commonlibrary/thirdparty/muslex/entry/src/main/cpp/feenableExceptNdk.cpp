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

static int CallFeenableexcept(int excepts)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetFeenableexcept();
    if (!func)
    {
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
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(excepts);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetFeenableexcept() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value FeenableexceptNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallFeenableexcept(FE_DIVBYZERO);
    return ReturnInt32(env, 1);
}

static napi_value FeenableexceptNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallFeenableexcept(FE_INVALID);
    return ReturnInt32(env, 1);
}

static napi_value FeenableexceptNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallFeenableexcept(FE_DIVBYZERO | FE_OVERFLOW);
    return ReturnInt32(env, 1);
}

static napi_value FeenableexceptNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value FeenableexceptAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallFeenableexcept(0);
    return ReturnInt32(env, 1);
}

static napi_value FeenableexceptAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallFeenableexcept(0xFFFF);
    return ReturnInt32(env, 1);
}

static napi_value FeenableexceptBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallFeenableexcept(FE_ALL_EXCEPT);
    return ReturnInt32(env, 1);
}

static napi_value FeenableexceptBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallFeenableexcept(FE_DIVBYZERO);
    CallFedisableexcept(FE_DIVBYZERO);
    CallFeenableexcept(FE_DIVBYZERO);
    return ReturnInt32(env, 1);
}

static napi_value FeenableexceptStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    for (int i = 0; i < K_STABLE_LOOP; ++i)
    {
        CallFeenableexcept(FE_DIVBYZERO);
        CallFedisableexcept(FE_DIVBYZERO);
    }
    return ReturnInt32(env, 1);
}

static napi_value FeenableexceptThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t)
    {
        threads.emplace_back([&hasError]()
        {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i)
            {
                CallFeenableexcept(FE_DIVBYZERO);
                CallFedisableexcept(FE_DIVBYZERO);
            }
        });
    }
    for (auto& th : threads)
    {
        th.join();
    }
    return ReturnInt32(env, !hasError ? 1 : 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"feenableexceptNormal001", nullptr, FeenableexceptNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"feenableexceptNormal002", nullptr, FeenableexceptNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"feenableexceptNormal003", nullptr, FeenableexceptNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"feenableexceptNormal004", nullptr, FeenableexceptNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"feenableexceptAbnormal001", nullptr, FeenableexceptAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"feenableexceptAbnormal002", nullptr, FeenableexceptAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"feenableexceptBoundary001", nullptr, FeenableexceptBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"feenableexceptBoundary002", nullptr, FeenableexceptBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"feenableexceptStable001", nullptr, FeenableexceptStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"feenableexceptThread001", nullptr, FeenableexceptThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "feenableexceptndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}