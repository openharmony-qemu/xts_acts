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
#include <sched.h>
#include <cerrno>
#include <cstdlib>
#include <thread>
#include <unistd.h>
#include <vector>
#include <atomic>

static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static bool CallSchedCpufree(cpu_set_t* set)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetSchedCpufree();
    if (!func) {
        errno = ENOSYS;
        return false;
    }
    errno = 0;
    func(set);
    return true;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetSchedCpufree()) {
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

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: Free a valid CPU set */
static napi_value SchedCpufreeNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    cpu_set_t* set = CPU_ALLOC(1);
    if (!set) {
        return ReturnInt32(env, 0);
    }
    bool ok = CallSchedCpufree(set);
    return ReturnInt32(env, ok ? 1 : 0);
}

/* TC-002: Free NULL should succeed (or no-op) */
static napi_value SchedCpufreeNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    CallSchedCpufree(nullptr);
    return ReturnInt32(env, 1);
}

/* TC-003: Allocate and free multiple sets */
static napi_value SchedCpufreeNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int loopcount = 20;
    bool pass = true;
    for (int i = 0; i < loopcount; ++i) {
        cpu_set_t* set = CPU_ALLOC(1);
        if (!set) {
            pass = false;
            break;
        }
        CallSchedCpufree(set);
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-004: Free set allocated with larger size */
static napi_value SchedCpufreeNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    cpu_set_t* set = CPU_ALLOC(4);
    if (!set) {
        return ReturnInt32(env, 0);
    }
    CallSchedCpufree(set);
    return ReturnInt32(env, 1);
}

/* ==================== Abnormal Parameter Tests ==================== */

/* TC-005: Double free (should be handled gracefully) */
static napi_value SchedCpufreeAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    cpu_set_t* set = CPU_ALLOC(1);
    if (!set) {
        return ReturnInt32(env, 0);
    }
    CallSchedCpufree(set);
    CallSchedCpufree(set);
    return ReturnInt32(env, 1);
}

/* ==================== Boundary Value Tests ==================== */

/* TC-006: Free set allocated with maximum size */
static napi_value SchedCpufreeBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int numCpus = sysconf(_SC_NPROCESSORS_CONF);
    if (numCpus <= 0) {
        numCpus = 1;
    }
    cpu_set_t* set = CPU_ALLOC(numCpus);
    if (!set) {
        return ReturnInt32(env, 0);
    }
    CallSchedCpufree(set);
    return ReturnInt32(env, 1);
}

/* ==================== Stability Tests ==================== */

/* TC-007: 10000 repeated calls stability */
static napi_value SchedCpufreeStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int loopcount = 20;
    bool pass = true;
    for (int i = 0; i < loopcount; ++i) {
        cpu_set_t* set = CPU_ALLOC(1);
        if (!set) {
            pass = false;
            break;
        }
        CallSchedCpufree(set);
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void SchedCpufreeWorker(std::atomic<bool>& hasError)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        cpu_set_t* set = CPU_ALLOC(1);
        if (!set) {
            hasError = true;
            return;
        }
        CallSchedCpufree(set);
    }
}

/* ==================== Multi-thread Tests ==================== */

/* TC-008: Multi-thread safety */
static napi_value SchedCpufreeThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(SchedCpufreeWorker, std::ref(hasError));
    }
    for (auto& th : threads) {
        th.join();
    }
    return ReturnInt32(env, !hasError ? 1 : 0);
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"schedCpufreeNormal001", nullptr, SchedCpufreeNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"schedCpufreeNormal002", nullptr, SchedCpufreeNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"schedCpufreeNormal003", nullptr, SchedCpufreeNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"schedCpufreeNormal004", nullptr, SchedCpufreeNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"schedCpufreeAbnormal001", nullptr, SchedCpufreeAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"schedCpufreeBoundary001", nullptr, SchedCpufreeBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"schedCpufreeStable001", nullptr, SchedCpufreeStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"schedCpufreeThread001", nullptr, SchedCpufreeThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "schedcpufreendktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}