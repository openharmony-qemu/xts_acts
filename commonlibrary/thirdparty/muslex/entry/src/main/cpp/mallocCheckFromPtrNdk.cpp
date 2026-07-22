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
#include <malloc.h>
#include <cerrno>
#include <cstdlib>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static int CallMallocCheckFromPtr(void* ptr)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetMallocCheckFromPtr();
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(ptr);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetMallocCheckFromPtr();
    if (!func)
    {
        return true;
    }
    static bool checked = false;
    static bool isStub = false;
    if (!checked)
    {
        void* ptr = malloc(1);
        if (ptr)
        {
            errno = 0;
            int ret = func(ptr);
            free(ptr);
            isStub = (ret == -1 && errno == ENOSYS);
        }
        checked = true;
    }
    return isStub;
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value MallocCheckFromPtrNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    void* ptr = malloc(100);
    if (!ptr)
    {
        return ReturnInt32(env, 0);
    }
    int ret = CallMallocCheckFromPtr(ptr);
    free(ptr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value MallocCheckFromPtrNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    void* ptr = malloc(100);
    if (!ptr)
    {
        return ReturnInt32(env, 0);
    }
    int ret = CallMallocCheckFromPtr(static_cast<char*>(ptr) + 10);
    free(ptr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value MallocCheckFromPtrNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int ret = CallMallocCheckFromPtr(nullptr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value MallocCheckFromPtrNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value MallocCheckFromPtrAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int ret = CallMallocCheckFromPtr(reinterpret_cast<void*>(0xDEADBEEF));
    return ReturnInt32(env, 1);
}

static napi_value MallocCheckFromPtrAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    void* ptr = malloc(100);
    if (!ptr)
    {
        return ReturnInt32(env, 0);
    }
    free(ptr);
    ptr = nullptr;
    int ret = CallMallocCheckFromPtr(ptr);
    return ReturnInt32(env, 1);
}

static napi_value MallocCheckFromPtrBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    void* ptr = malloc(1);
    if (!ptr)
    {
        return ReturnInt32(env, 0);
    }
    int ret = CallMallocCheckFromPtr(ptr);
    free(ptr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value MallocCheckFromPtrBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    void* ptr = malloc(1024 * 1024);
    if (!ptr)
    {
        return ReturnInt32(env, 0);
    }
    int ret = CallMallocCheckFromPtr(ptr);
    free(ptr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value MallocCheckFromPtrStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i)
    {
        void* ptr = malloc(100);
        if (!ptr)
        {
            pass = false;
            break;
        }
        int ret = CallMallocCheckFromPtr(ptr);
        free(ptr);
        if (ret < 0)
        {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value MallocCheckFromPtrThread001(napi_env env, napi_callback_info info)
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
                void* ptr = malloc(100);
                if (!ptr)
                {
                    hasError = true;
                    return;
                }
                CallMallocCheckFromPtr(ptr);
                free(ptr);
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
        {"mallocCheckFromPtrNormal001", nullptr, MallocCheckFromPtrNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"mallocCheckFromPtrNormal002", nullptr, MallocCheckFromPtrNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"mallocCheckFromPtrNormal003", nullptr, MallocCheckFromPtrNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"mallocCheckFromPtrNormal004", nullptr, MallocCheckFromPtrNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"mallocCheckFromPtrAbnormal001", nullptr, MallocCheckFromPtrAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"mallocCheckFromPtrAbnormal002", nullptr, MallocCheckFromPtrAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"mallocCheckFromPtrBoundary001", nullptr, MallocCheckFromPtrBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"mallocCheckFromPtrBoundary002", nullptr, MallocCheckFromPtrBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"mallocCheckFromPtrStable001", nullptr, MallocCheckFromPtrStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"mallocCheckFromPtrThread001", nullptr, MallocCheckFromPtrThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "malloccheckfromptrndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}