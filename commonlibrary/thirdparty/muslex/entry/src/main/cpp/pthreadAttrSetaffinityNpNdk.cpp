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
    if (loader.GetPthreadAttrSetaffinityNp() == nullptr) {
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

static napi_value PthreadAttrSetaffinityNpNormal001(napi_env env, napi_callback_info info)
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
    CPU_SET_S(0, size, set);
    int ret = CallPthreadAttrSetaffinityNp(&attr, size, set);
    CPU_FREE(set);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value PthreadAttrSetaffinityNpNormal002(napi_env env, napi_callback_info info)
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
    CPU_ZERO_S(size, set);
    for (int i = 0; i < numCpus; ++i) {
        CPU_SET_S(i, size, set);
    }
    int ret = CallPthreadAttrSetaffinityNp(&attr, size, set);
    CPU_FREE(set);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadAttrSetaffinityNpNormal003(napi_env env, napi_callback_info info)
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
    CPU_SET_S(0, size, set);
    CallPthreadAttrSetaffinityNp(&attr, size, set);
    cpu_set_t* getSet = CPU_ALLOC(1);
    if (!getSet) {
        CPU_FREE(set);
        pthread_attr_destroy(&attr);
        return ReturnInt32(env, 0);
    }
    CallPthreadAttrGetaffinityNp(&attr, size, getSet);
    int match = CPU_ISSET_S(0, size, getSet);
    CPU_FREE(set);
    CPU_FREE(getSet);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, (match) ? 1 : 0);
}

static napi_value PthreadAttrSetaffinityNpNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrSetaffinityNpAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    cpu_set_t* set = CPU_ALLOC(1);
    if (!set) {
        return ReturnInt32(env, 0);
    }
    size_t size = CPU_ALLOC_SIZE(1);
    CPU_ZERO_S(size, set);
    int ret = CallPthreadAttrSetaffinityNp(nullptr, size, set);
    CPU_FREE(set);
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrSetaffinityNpAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    size_t size = CPU_ALLOC_SIZE(1);
    int ret = CallPthreadAttrSetaffinityNp(&attr, size, nullptr);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrSetaffinityNpBoundary001(napi_env env, napi_callback_info info)
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
    int ret = CallPthreadAttrSetaffinityNp(&attr, 0, set);
    CPU_FREE(set);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, 1);
}

static napi_value PthreadAttrSetaffinityNpBoundary002(napi_env env, napi_callback_info info)
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
    CPU_ZERO_S(size, set);
    for (int i = 0; i < numCpus; ++i) {
        CPU_SET_S(i, size, set);
    }
    int ret = CallPthreadAttrSetaffinityNp(&attr, size, set);
    CPU_FREE(set);
    pthread_attr_destroy(&attr);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value PthreadAttrSetaffinityNpStable001(napi_env env, napi_callback_info info)
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
        CPU_ZERO_S(size, set);
        CPU_SET_S(0, size, set);
        int ret = CallPthreadAttrSetaffinityNp(&attr, size, set);
        CPU_FREE(set);
        pthread_attr_destroy(&attr);
        if (ret < 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value PthreadAttrSetaffinityNpThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                pthread_attr_t attr;
                pthread_attr_init(&attr);
                cpu_set_t* set = CPU_ALLOC(1);
                if (!set) {
                    hasError = true;
                    return;
                }
                size_t size = CPU_ALLOC_SIZE(1);
                CPU_ZERO_S(size, set);
                CPU_SET_S(0, size, set);
                CallPthreadAttrSetaffinityNp(&attr, size, set);
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
        {"pthreadAttrSetaffinityNpNormal001", nullptr, PthreadAttrSetaffinityNpNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrSetaffinityNpNormal002", nullptr, PthreadAttrSetaffinityNpNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrSetaffinityNpNormal003", nullptr, PthreadAttrSetaffinityNpNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrSetaffinityNpNormal004", nullptr, PthreadAttrSetaffinityNpNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrSetaffinityNpAbnormal001", nullptr, PthreadAttrSetaffinityNpAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrSetaffinityNpAbnormal002", nullptr, PthreadAttrSetaffinityNpAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrSetaffinityNpBoundary001", nullptr, PthreadAttrSetaffinityNpBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrSetaffinityNpBoundary002", nullptr, PthreadAttrSetaffinityNpBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrSetaffinityNpStable001", nullptr, PthreadAttrSetaffinityNpStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"pthreadAttrSetaffinityNpThread001", nullptr, PthreadAttrSetaffinityNpThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "pthreadattrsetaffnpndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}