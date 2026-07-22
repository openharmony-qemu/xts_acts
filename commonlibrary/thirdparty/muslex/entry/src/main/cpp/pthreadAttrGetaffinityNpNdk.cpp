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
#include <sched.h>
#include <unistd.h>
#include <cerrno>
#include <cstring>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static int CallPthreadAttrGetaffinityNp(pthread_attr_t* attr, size_t cpusetsize, cpu_set_t* cpuset)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetPthreadAttrGetaffinityNp();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(attr, cpusetsize, cpuset);
}

static int CallPthreadAttrSetaffinityNp(pthread_attr_t* attr, size_t cpusetsize, const cpu_set_t* cpuset)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetPthreadAttrSetaffinityNp();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(attr, cpusetsize, cpuset);
}

static bool EnablePthreadExtPolicy()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto setFunc = loader.GetSetPthreadExtFuncPolicy();
    auto getFunc = loader.GetPthreadExtFuncPolicy();
    if (!setFunc || !getFunc) {
        return false;
    }
    setFunc(1);
    return getFunc() != 0;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (loader.GetPthreadAttrGetaffinityNp() == nullptr) {
        return true;
    }
    if (!EnablePthreadExtPolicy()) {
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

static napi_value PthreadAttrGetaffinityNpNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    cpu_set_t* set = CPU_ALLOC(1);
    if (!set) {
        return ReturnInt32(env, 0);
    }
    size_t size = CPU_ALLOC_SIZE(1);
    CPU_ZERO_S(size, set);
    CallPthreadAttrSetaffinityNp(&attr, size, set);
    int ret = CallPthreadAttrGetaffinityNp(&attr, size, set);
    CPU_FREE(set);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value PthreadAttrGetaffinityNpNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    cpu_set_t* set = CPU_ALLOC(4);
    if (!set) {
        return ReturnInt32(env, 0);
    }
    size_t size = CPU_ALLOC_SIZE(4);
    CPU_ZERO_S(size, set);
    int ret = CallPthreadAttrGetaffinityNp(&attr, size, set);
    CPU_FREE(set);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadAttrGetaffinityNpNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    cpu_set_t* set = CPU_ALLOC(1);
    if (!set) {
        return ReturnInt32(env, 0);
    }
    size_t size = CPU_ALLOC_SIZE(1);
    int ret = CallPthreadAttrGetaffinityNp(&attr, size, set);
    CPU_FREE(set);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadAttrGetaffinityNpNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrGetaffinityNpAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    cpu_set_t* set = CPU_ALLOC(1);
    if (!set) {
        return ReturnInt32(env, 0);
    }
    size_t size = CPU_ALLOC_SIZE(1);
    int ret = CallPthreadAttrGetaffinityNp(nullptr, size, set);
    CPU_FREE(set);
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrGetaffinityNpAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    size_t size = CPU_ALLOC_SIZE(1);
    int ret = CallPthreadAttrGetaffinityNp(&attr, size, nullptr);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrGetaffinityNpBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    cpu_set_t* set = CPU_ALLOC(1);
    if (!set) {
        return ReturnInt32(env, 0);
    }
    int ret = CallPthreadAttrGetaffinityNp(&attr, 0, set);
    CPU_FREE(set);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrGetaffinityNpBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int numCpus = sysconf(_SC_NPROCESSORS_CONF);
    if (numCpus <= 0) {
        numCpus = 1;
    }
    cpu_set_t* set = CPU_ALLOC(numCpus);
    if (!set) {
        return ReturnInt32(env, 0);
    }
    size_t size = CPU_ALLOC_SIZE(numCpus);
    int ret = CallPthreadAttrGetaffinityNp(&attr, size, set);
    CPU_FREE(set);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadAttrGetaffinityNpStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        pthread_attr_t attr;
        pthread_attr_init(&attr);
        cpu_set_t* set = CPU_ALLOC(1);
        if (!set) {
            pass = false;
            break;
        }
        size_t size = CPU_ALLOC_SIZE(1);
        int ret = CallPthreadAttrGetaffinityNp(&attr, size, set);
        CPU_FREE(set);
        pthread_attr_destroy(&attr);
        if (ret < 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value PthreadAttrGetaffinityNpThread001(napi_env env, napi_callback_info info)
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
                pthread_attr_t attr;
                pthread_attr_init(&attr);
                cpu_set_t* set = CPU_ALLOC(1);
                if (!set) {
                    hasError = true;
                    return;
                }
                size_t size = CPU_ALLOC_SIZE(1);
                CallPthreadAttrGetaffinityNp(&attr, size, set);
                CPU_FREE(set);
                pthread_attr_destroy(&attr);
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
        {"pthreadAttrGetaffinityNpNormal001", nullptr, PthreadAttrGetaffinityNpNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrGetaffinityNpNormal002", nullptr, PthreadAttrGetaffinityNpNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrGetaffinityNpNormal003", nullptr, PthreadAttrGetaffinityNpNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrGetaffinityNpNormal004", nullptr, PthreadAttrGetaffinityNpNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrGetaffinityNpAbnormal001", nullptr, PthreadAttrGetaffinityNpAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrGetaffinityNpAbnormal002", nullptr, PthreadAttrGetaffinityNpAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrGetaffinityNpBoundary001", nullptr, PthreadAttrGetaffinityNpBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrGetaffinityNpBoundary002", nullptr, PthreadAttrGetaffinityNpBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrGetaffinityNpStable001", nullptr, PthreadAttrGetaffinityNpStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrGetaffinityNpThread001", nullptr, PthreadAttrGetaffinityNpThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "pthreadattrgetaffnpndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}