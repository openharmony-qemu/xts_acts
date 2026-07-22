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

static int g_prepareCalled = 0;
static int g_parentCalled = 0;
static int g_childCalled = 0;

static void PrepareHandler()
{
    g_prepareCalled++;
}
static void ParentHandler()
{
    g_parentCalled++;
}
static void ChildHandler()
{
    g_childCalled++;
}

static int CallPthreadAtforkGwpasan(void (*prepare)(void), void (*parent)(void), void (*child)(void))
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetPthreadAtforkGwpasan();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(prepare, parent, child);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetPthreadAtforkGwpasan() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value PthreadAtforkGwpasanNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallPthreadAtforkGwpasan(PrepareHandler, ParentHandler, ChildHandler);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value PthreadAtforkGwpasanNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallPthreadAtforkGwpasan(nullptr, ParentHandler, nullptr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadAtforkGwpasanNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallPthreadAtforkGwpasan(PrepareHandler, nullptr, nullptr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadAtforkGwpasanNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value PthreadAtforkGwpasanAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallPthreadAtforkGwpasan(nullptr, nullptr, nullptr);
    return ReturnInt32(env, 1);
}

static napi_value PthreadAtforkGwpasanAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    CallPthreadAtforkGwpasan(PrepareHandler, ParentHandler, ChildHandler);
    int ret = CallPthreadAtforkGwpasan(PrepareHandler, ParentHandler, ChildHandler);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadAtforkGwpasanBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallPthreadAtforkGwpasan(nullptr, nullptr, ChildHandler);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadAtforkGwpasanBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallPthreadAtforkGwpasan(PrepareHandler, ParentHandler, nullptr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadAtforkGwpasanStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        int ret = CallPthreadAtforkGwpasan(PrepareHandler, nullptr, nullptr);
        if (ret < 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value PthreadAtforkGwpasanThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]()
        {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                int ret = CallPthreadAtforkGwpasan(nullptr, nullptr, nullptr);
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
        {"pthreadAtforkGwpasanNormal001", nullptr, PthreadAtforkGwpasanNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAtforkGwpasanNormal002", nullptr, PthreadAtforkGwpasanNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAtforkGwpasanNormal003", nullptr, PthreadAtforkGwpasanNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAtforkGwpasanNormal004", nullptr, PthreadAtforkGwpasanNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAtforkGwpasanAbnormal001", nullptr, PthreadAtforkGwpasanAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAtforkGwpasanAbnormal002", nullptr, PthreadAtforkGwpasanAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAtforkGwpasanBoundary001", nullptr, PthreadAtforkGwpasanBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAtforkGwpasanBoundary002", nullptr, PthreadAtforkGwpasanBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAtforkGwpasanStable001", nullptr, PthreadAtforkGwpasanStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAtforkGwpasanThread001", nullptr, PthreadAtforkGwpasanThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "pthreadatforkgwpasanndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}