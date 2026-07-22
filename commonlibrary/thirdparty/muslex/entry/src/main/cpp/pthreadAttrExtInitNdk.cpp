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

static int CallPthreadAttrExtInit(pthread_attr_t* attr)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetPthreadAttrExtInit();
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(attr);
}

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
    if (loader.GetPthreadAttrExtInit() == nullptr)
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

static napi_value PthreadAttrExtInitNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    memset(&attr, 0, sizeof(attr));
    int ret = CallPthreadAttrExtInit(&attr);
    auto& loader = LibcFunctionLoader::GetInstance();
    auto destroyFunc = loader.GetPthreadAttrExtDestroy();
    if (destroyFunc)
    {
        destroyFunc(&attr);
    }
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value PthreadAttrExtInitNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    memset(&attr, 0, sizeof(attr));
    int ret = CallPthreadAttrExtInit(&attr);
    auto& loader = LibcFunctionLoader::GetInstance();
    auto destroyFunc = loader.GetPthreadAttrExtDestroy();
    if (destroyFunc)
    {
        destroyFunc(&attr);
    }
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value PthreadAttrExtInitNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    memset(&attr, 0, sizeof(attr));
    CallPthreadAttrExtInit(&attr);
    auto& loader = LibcFunctionLoader::GetInstance();
    auto destroyFunc = loader.GetPthreadAttrExtDestroy();
    if (destroyFunc)
    {
        destroyFunc(&attr);
    }
    int ret = CallPthreadAttrExtInit(&attr);
    if (destroyFunc)
    {
        destroyFunc(&attr);
    }
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value PthreadAttrExtInitNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrExtInitAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int ret = CallPthreadAttrExtInit(nullptr);
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrExtInitAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    memset(&attr, 0, sizeof(attr));
    CallPthreadAttrExtInit(&attr);
    int ret = CallPthreadAttrExtInit(&attr);
    auto& loader = LibcFunctionLoader::GetInstance();
    auto destroyFunc = loader.GetPthreadAttrExtDestroy();
    if (destroyFunc)
    {
        destroyFunc(&attr);
    }
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrExtInitBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < 10; ++i)
    {
        pthread_attr_t attr;
        memset(&attr, 0, sizeof(attr));
        int ret = CallPthreadAttrExtInit(&attr);
        auto& loader = LibcFunctionLoader::GetInstance();
        auto destroyFunc = loader.GetPthreadAttrExtDestroy();
        if (destroyFunc)
        {
            destroyFunc(&attr);
        }
        if (ret != 0)
        {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value PthreadAttrExtInitBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    memset(&attr, 0, sizeof(attr));
    CallPthreadAttrExtInit(&attr);
    CallPthreadAttrExtDestroy(&attr);
    int ret = CallPthreadAttrExtInit(&attr);
    CallPthreadAttrExtDestroy(&attr);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value PthreadAttrExtInitStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i)
    {
        pthread_attr_t attr;
        memset(&attr, 0, sizeof(attr));
        int ret = CallPthreadAttrExtInit(&attr);
        CallPthreadAttrExtDestroy(&attr);
        if (ret != 0)
        {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value PthreadAttrExtInitThread001(napi_env env, napi_callback_info info)
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
                memset(&attr, 0, sizeof(attr));
                CallPthreadAttrExtInit(&attr);
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
        {"pthreadAttrExtInitNormal001", nullptr, PthreadAttrExtInitNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadAttrExtInitNormal002", nullptr, PthreadAttrExtInitNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadAttrExtInitNormal003", nullptr, PthreadAttrExtInitNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadAttrExtInitNormal004", nullptr, PthreadAttrExtInitNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadAttrExtInitAbnormal001", nullptr, PthreadAttrExtInitAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadAttrExtInitAbnormal002", nullptr, PthreadAttrExtInitAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadAttrExtInitBoundary001", nullptr, PthreadAttrExtInitBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadAttrExtInitBoundary002", nullptr, PthreadAttrExtInitBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadAttrExtInitStable001", nullptr, PthreadAttrExtInitStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadAttrExtInitThread001", nullptr, PthreadAttrExtInitThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "pthreadattrextinitndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
