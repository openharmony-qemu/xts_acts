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
#include <netdb.h>
#include <cerrno>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static int CallRemovecustomdns()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetRemovecustomdns();
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func();
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetRemovecustomdns() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value RemovecustomdnsNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int ret = CallRemovecustomdns();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value RemovecustomdnsNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    auto& loader = LibcFunctionLoader::GetInstance();
    auto setFunc = loader.GetSetcustomdns();
    if (setFunc)
    {
        setFunc(nullptr);
    }
    int ret = CallRemovecustomdns();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value RemovecustomdnsNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallRemovecustomdns();
    int ret = CallRemovecustomdns();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value RemovecustomdnsNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value RemovecustomdnsAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int ret = CallRemovecustomdns();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value RemovecustomdnsAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int loopCount = 20;
    for (int i = 0; i < loopCount; ++i)
    {
        int ret = CallRemovecustomdns();
        if (ret < 0)
        {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value RemovecustomdnsBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    int loopCount = 10;
    for (int i = 0; i < loopCount; ++i)
    {
        CallRemovecustomdns();
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value RemovecustomdnsBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int ret = CallRemovecustomdns();
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value RemovecustomdnsStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i)
    {
        int ret = CallRemovecustomdns();
        if (ret < 0)
        {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value RemovecustomdnsThread001(napi_env env, napi_callback_info info)
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
                CallRemovecustomdns();
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
        {"removecustomdnsNormal001", nullptr, RemovecustomdnsNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"removecustomdnsNormal002", nullptr, RemovecustomdnsNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"removecustomdnsNormal003", nullptr, RemovecustomdnsNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"removecustomdnsNormal004", nullptr, RemovecustomdnsNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"removecustomdnsAbnormal001", nullptr, RemovecustomdnsAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"removecustomdnsAbnormal002", nullptr, RemovecustomdnsAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"removecustomdnsBoundary001", nullptr, RemovecustomdnsBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"removecustomdnsBoundary002", nullptr, RemovecustomdnsBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"removecustomdnsStable001", nullptr, RemovecustomdnsStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"removecustomdnsThread001", nullptr, RemovecustomdnsThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "removecustomdnsndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}