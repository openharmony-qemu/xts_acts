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

typedef int (*CustomDnsResolverFunc)(const char*, const char*, const struct addrinfo*, struct addrinfo**);

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static int CallSetcustomdns(CustomDnsResolverFunc hookfunc)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetSetcustomdns();
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(hookfunc);
}

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

static int CallGetaddrinfoCustom(const char* host, const char* serv, const struct addrinfo* hint, struct addrinfo** res)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetGetaddrinfoCustom();
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(host, serv, hint, res);
}

static int DummyResolver(const char* host, const char* serv, const struct addrinfo* hint, struct addrinfo** res)
{
    return EAI_NONAME;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetSetcustomdns() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value SetcustomdnsNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallSetcustomdns(DummyResolver);
    CallRemovecustomdns();
    return ReturnInt32(env, 1);
}

static napi_value SetcustomdnsNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallSetcustomdns(DummyResolver);
    struct addrinfo hints;
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    struct addrinfo* res = nullptr;
    int ret = CallGetaddrinfoCustom("localhost", "80", &hints, &res);
    if (res)
    {
        freeaddrinfo(res);
    }
    CallRemovecustomdns();
    return ReturnInt32(env, 1);
}

static napi_value SetcustomdnsNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallSetcustomdns(DummyResolver);
    int ret = CallRemovecustomdns();
    return ReturnInt32(env, 1);
}

static napi_value SetcustomdnsNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value SetcustomdnsAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int ret = CallSetcustomdns(nullptr);
    CallRemovecustomdns();
    return ReturnInt32(env, 1);
}

static napi_value SetcustomdnsAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallSetcustomdns(DummyResolver);
    CallSetcustomdns(DummyResolver);
    CallRemovecustomdns();
    return ReturnInt32(env, 1);
}

static napi_value SetcustomdnsBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallSetcustomdns(nullptr);
    CallRemovecustomdns();
    return ReturnInt32(env, 1);
}

static napi_value SetcustomdnsBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    CallSetcustomdns(DummyResolver);
    CallRemovecustomdns();
    CallSetcustomdns(DummyResolver);
    CallRemovecustomdns();
    return ReturnInt32(env, 1);
}

static napi_value SetcustomdnsStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    for (int i = 0; i < K_STABLE_LOOP; ++i)
    {
        CallSetcustomdns(DummyResolver);
        CallRemovecustomdns();
    }
    return ReturnInt32(env, 1);
}

static napi_value SetcustomdnsThread001(napi_env env, napi_callback_info info)
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
                CallSetcustomdns(DummyResolver);
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
        {"setcustomdnsNormal001", nullptr, SetcustomdnsNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setcustomdnsNormal002", nullptr, SetcustomdnsNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setcustomdnsNormal003", nullptr, SetcustomdnsNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setcustomdnsNormal004", nullptr, SetcustomdnsNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setcustomdnsAbnormal001", nullptr, SetcustomdnsAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setcustomdnsAbnormal002", nullptr, SetcustomdnsAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setcustomdnsBoundary001", nullptr, SetcustomdnsBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setcustomdnsBoundary002", nullptr, SetcustomdnsBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setcustomdnsStable001", nullptr, SetcustomdnsStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setcustomdnsThread001", nullptr, SetcustomdnsThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "setcustomdnsndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
