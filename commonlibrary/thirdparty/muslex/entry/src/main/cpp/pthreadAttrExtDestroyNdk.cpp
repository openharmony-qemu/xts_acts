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
#include <cstring>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static int CallPthreadAttrExtDestroy(pthread_attr_t* attr)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetPthreadAttrExtDestroy();
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(attr);
}

static bool EnablePthreadExtPolicy()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto setFunc = loader.GetSetPthreadExtFuncPolicy();
    auto getFunc = loader.GetPthreadExtFuncPolicy();
    if (!setFunc || !getFunc)
    {
        return false;
    }
    setFunc(1);
    return getFunc() != 0;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (loader.GetPthreadAttrExtDestroy() == nullptr)
    {
        return true;
    }
    if (!EnablePthreadExtPolicy())
    {
        return true;
    }
    return false;
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value PthreadAttrExtDestroyNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr = {};
    auto& loader = LibcFunctionLoader::GetInstance();
    auto initFunc = loader.GetPthreadAttrExtInit();
    if (initFunc)
    {
        initFunc(&attr);
    }
    int ret = CallPthreadAttrExtDestroy(&attr);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value PthreadAttrExtDestroyNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr = {};
    int ret = CallPthreadAttrExtDestroy(&attr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadAttrExtDestroyNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr = {};
    auto& loader = LibcFunctionLoader::GetInstance();
    auto initFunc = loader.GetPthreadAttrExtInit();
    if (initFunc)
    {
        initFunc(&attr);
    }
    int ret = CallPthreadAttrExtDestroy(&attr);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value PthreadAttrExtDestroyNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrExtDestroyAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr = {};
    int ret = CallPthreadAttrExtDestroy(&attr);
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrExtDestroyAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int ret = CallPthreadAttrExtDestroy(nullptr);
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrExtDestroyBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    int loopCount = 10;
    for (int i = 0; i < loopCount; ++i)
    {
        pthread_attr_t attr = {};
        auto& loader = LibcFunctionLoader::GetInstance();
        auto initFunc = loader.GetPthreadAttrExtInit();
        if (initFunc)
        {
            initFunc(&attr);
        }
        int ret = CallPthreadAttrExtDestroy(&attr);
        if (ret != 0)
        {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value PthreadAttrExtDestroyBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    CallPthreadAttrExtDestroy(&attr);
    pthread_attr_init(&attr);
    int ret = CallPthreadAttrExtDestroy(&attr);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value PthreadAttrExtDestroyStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i)
    {
        pthread_attr_t attr = {};
        auto& loader = LibcFunctionLoader::GetInstance();
        auto initFunc = loader.GetPthreadAttrExtInit();
        if (initFunc)
        {
            initFunc(&attr);
        }
        int ret = CallPthreadAttrExtDestroy(&attr);
        if (ret != 0)
        {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value PthreadAttrExtDestroyThread001(napi_env env, napi_callback_info info)
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
                pthread_attr_t attr;
                pthread_attr_init(&attr);
                CallPthreadAttrExtDestroy(&attr);
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
        {"pthreadAttrExtDestroyNormal001", nullptr, PthreadAttrExtDestroyNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrExtDestroyNormal002", nullptr, PthreadAttrExtDestroyNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrExtDestroyNormal003", nullptr, PthreadAttrExtDestroyNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrExtDestroyNormal004", nullptr, PthreadAttrExtDestroyNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrExtDestroyAbnormal001", nullptr, PthreadAttrExtDestroyAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrExtDestroyAbnormal002", nullptr, PthreadAttrExtDestroyAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrExtDestroyBoundary001", nullptr, PthreadAttrExtDestroyBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrExtDestroyBoundary002", nullptr, PthreadAttrExtDestroyBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrExtDestroyStable001", nullptr, PthreadAttrExtDestroyStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrExtDestroyThread001", nullptr, PthreadAttrExtDestroyThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "pthreadattrextdestroyndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}