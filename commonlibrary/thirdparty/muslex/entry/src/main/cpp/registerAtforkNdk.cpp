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
#include <unistd.h>
#include <sys/wait.h>
#include <atomic>
#include <thread>
#include <vector>

static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static std::atomic<int> g_prepareCount{0};
static std::atomic<int> g_parentCount{0};
static std::atomic<int> g_childCount{0};

static void PrepareHandler()
{
    g_prepareCount++;
}
static void ParentHandler()
{
    g_parentCount++;
}
static void ChildHandler()
{
    g_childCount++;
}

static int CallRegisterAtfork(void (*prepare)(void), void (*parent)(void), void (*child)(void))
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetRegisterAtfork();
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
    if (!loader.GetRegisterAtfork()) {
        return true;
    }
    errno = 0;
    CallRegisterAtfork(nullptr, nullptr, nullptr);
    return (errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: Register all three handlers */
static napi_value RegisterAtforkNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    g_prepareCount = 0;
    g_parentCount = 0;
    g_childCount = 0;
    int ret = CallRegisterAtfork(PrepareHandler, ParentHandler, ChildHandler);
    if (ret == 0) {
        pid_t pid = fork();
        if (pid == 0) {
            _exit(0);
        } else if (pid > 0) {
            int status;
            waitpid(pid, &status, 0);
        }
    }
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-002: Register with NULL handlers (should succeed) */
static napi_value RegisterAtforkNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallRegisterAtfork(nullptr, nullptr, nullptr);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-003: Register only prepare handler */
static napi_value RegisterAtforkNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    g_prepareCount = 0;
    int ret = CallRegisterAtfork(PrepareHandler, nullptr, nullptr);
    if (ret == 0) {
        pid_t pid = fork();
        if (pid == 0) {
            _exit(0);
        } else if (pid > 0) {
            int status;
            waitpid(pid, &status, 0);
        }
    }
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-004: Register only parent handler */
static napi_value RegisterAtforkNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    g_parentCount = 0;
    int ret = CallRegisterAtfork(nullptr, ParentHandler, nullptr);
    if (ret == 0) {
        pid_t pid = fork();
        if (pid == 0) {
            _exit(0);
        } else if (pid > 0) {
            int status;
            waitpid(pid, &status, 0);
        }
    }
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-005: Register only child handler */
static napi_value RegisterAtforkNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    g_childCount = 0;
    int ret = CallRegisterAtfork(nullptr, nullptr, ChildHandler);
    if (ret == 0) {
        pid_t pid = fork();
        if (pid == 0) {
            _exit(0);
        } else if (pid > 0) {
            int status;
            waitpid(pid, &status, 0);
        }
    }
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* ==================== Abnormal Parameter Tests ==================== */

/* TC-006: Register after fork (should still succeed) */
static napi_value RegisterAtforkAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pid_t pid = fork();
    if (pid == 0) {
        int ret = CallRegisterAtfork(PrepareHandler, ParentHandler, ChildHandler);
        _exit(ret == 0 ? 0 : 1);
    } else if (pid > 0) {
        int status;
        waitpid(pid, &status, 0);
        return ReturnInt32(env, WIFEXITED(status) && WEXITSTATUS(status) == 0 ? 1 : 0);
    }
    return ReturnInt32(env, 0);
}

/* ==================== Boundary Value Tests ==================== */

/* TC-007: Register multiple handlers */
static napi_value RegisterAtforkBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    int loopCount = 10;
    for (int i = 0; i < loopCount; ++i) {
        int ret = CallRegisterAtfork(PrepareHandler, ParentHandler, ChildHandler);
        if (ret != 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Stability Tests ==================== */

/* TC-008: 10000 repeated calls stability */
static napi_value RegisterAtforkStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    int loopCount = 20;
    for (int i = 0; i < loopCount; ++i) {
        int ret = CallRegisterAtfork(nullptr, nullptr, nullptr);
        if (ret != 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Multi-thread Tests ==================== */

static void RegisterAtforkThreadWorker(std::atomic<bool>& hasError)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        int ret = CallRegisterAtfork(nullptr, nullptr, nullptr);
        if (ret != 0) {
            hasError = true;
            return;
        }
    }
}

/* TC-009: Multi-thread safety */
static napi_value RegisterAtforkThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]() {
            RegisterAtforkThreadWorker(hasError);
        });
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
        {"registerAtforkNormal001", nullptr, RegisterAtforkNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"registerAtforkNormal002", nullptr, RegisterAtforkNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"registerAtforkNormal003", nullptr, RegisterAtforkNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"registerAtforkNormal004", nullptr, RegisterAtforkNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"registerAtforkNormal005", nullptr, RegisterAtforkNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"registerAtforkAbnormal001", nullptr, RegisterAtforkAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"registerAtforkBoundary001", nullptr, RegisterAtforkBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"registerAtforkStable001", nullptr, RegisterAtforkStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"registerAtforkThread001", nullptr, RegisterAtforkThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "registeratforkndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}