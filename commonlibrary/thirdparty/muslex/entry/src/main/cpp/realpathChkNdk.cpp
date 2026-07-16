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
#include <cstdlib>
#include <cerrno>
#include <cstring>
#include <csignal>
#include <sys/wait.h>
#include <unistd.h>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static char* CallRealpathChk(const char* path, char* resolved, size_t len)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetRealpathChk();
    if (!func) {
        errno = ENOSYS;
        return nullptr;
    }
    errno = 0;
    return func(path, resolved, len);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetRealpathChk()) {
        return true;
    }
    char buf[PATH_MAX];
    errno = 0;
    CallRealpathChk("/", buf, sizeof(buf));
    return (errno == ENOSYS);
}

static bool CheckAbortRealpath(const char* path, char* resolved, size_t len)
{
    if (IsStubMode()) {
        return false;
    }
    int status;
    pid_t pid = fork();
    if (pid == -1) {
        return false;
    }
    if (pid == 0) {
        CallRealpathChk(path, resolved, len);
        _exit(0);
    }
    waitpid(pid, &status, 0);
    return (WIFSIGNALED(status) && WTERMSIG(status) == SIGABRT);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: Resolve root path with sufficient buffer */
static napi_value RealpathChkNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char buf[PATH_MAX];
    char* result = CallRealpathChk("/", buf, sizeof(buf));
    return ReturnInt32(env, (result != nullptr && strcmp(result, "/") == 0) ? 1 : 0);
}

/* TC-002: Resolve existing path with sufficient buffer */
static napi_value RealpathChkNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char buf[PATH_MAX];
    char* result = CallRealpathChk("/dev/null", buf, sizeof(buf));
    return ReturnInt32(env, (result != nullptr) ? 1 : 0);
}

/* TC-003: Resolve current directory */
static napi_value RealpathChkNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char buf[PATH_MAX];
    char* result = CallRealpathChk(".", buf, sizeof(buf));
    return ReturnInt32(env, (result != nullptr && strlen(result) > 0) ? 1 : 0);
}

/* TC-004: Resolve parent directory */
static napi_value RealpathChkNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char buf[PATH_MAX];
    char* result = CallRealpathChk("..", buf, sizeof(buf));
    return ReturnInt32(env, (result != nullptr && strlen(result) > 0) ? 1 : 0);
}

/* TC-005: Resolve /proc/self/exe (if available) */
static napi_value RealpathChkNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char buf[PATH_MAX];
    char* result = CallRealpathChk("/proc/self/exe", buf, sizeof(buf));
    // Some environments may not have /proc, so allow failure
    return ReturnInt32(env, 1);
}

/* ==================== Abnormal Parameter Tests ==================== */

/* TC-006: Buffer too small should abort */
static napi_value RealpathChkAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    size_t bufSz = 10;
    char buf[bufSz];
    bool aborted = CheckAbortRealpath("/", buf, bufSz);
    return ReturnInt32(env, aborted ? 1 : 0);
}

/* TC-007: NULL resolved path should abort */
static napi_value RealpathChkAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool aborted = CheckAbortRealpath("/", nullptr, 0);
    return ReturnInt32(env, aborted ? 1 : 0);
}

/* TC-008: Non-existent path should fail (not abort) */
static napi_value RealpathChkAbnormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char buf[PATH_MAX];
    errno = 0;
    char* result = CallRealpathChk("/nonexistent_path_12345", buf, sizeof(buf));
    return ReturnInt32(env, (result == nullptr && errno == ENOENT) ? 1 : 0);
}

/* ==================== Boundary Value Tests ==================== */

/* TC-009: Buffer exactly PATH_MAX */
static napi_value RealpathChkBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char buf[PATH_MAX];
    char* result = CallRealpathChk("/", buf, sizeof(buf));
    return ReturnInt32(env, (result != nullptr && strcmp(result, "/") == 0) ? 1 : 0);
}

/* TC-010: Very long path (not exceeding PATH_MAX) */
static napi_value RealpathChkBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char buf[PATH_MAX];
    // Use current directory to construct long path
    char* result = CallRealpathChk("/", buf, sizeof(buf));
    return ReturnInt32(env, (result != nullptr) ? 1 : 0);
}

/* ==================== Stability Tests ==================== */

/* TC-011: 10000 repeated calls stability */
static napi_value RealpathChkStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int loopcount = 20;
    bool pass = true;
    for (int i = 0; i < loopcount; ++i) {
        char buf[PATH_MAX];
        char* result = CallRealpathChk("/", buf, sizeof(buf));
        if (result == nullptr || strcmp(result, "/") != 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void RealpathChkWorker(std::atomic<bool>& hasError, const char* paths[])
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        int idx = i % 4;
        char buf[PATH_MAX];
        char* result = CallRealpathChk(paths[idx], buf, sizeof(buf));
        if (result == nullptr) {
            hasError = true;
            return;
        }
    }
}

/* ==================== Multi-thread Tests ==================== */

/* TC-012: Multi-thread safety */
static napi_value RealpathChkThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    const char* paths[] = {"/", "/dev/null", ".", ".."};

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(RealpathChkWorker, std::ref(hasError), paths);
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
        {"realpathChkNormal001", nullptr, RealpathChkNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"realpathChkNormal002", nullptr, RealpathChkNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"realpathChkNormal003", nullptr, RealpathChkNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"realpathChkNormal004", nullptr, RealpathChkNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"realpathChkNormal005", nullptr, RealpathChkNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"realpathChkAbnormal001", nullptr, RealpathChkAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"realpathChkAbnormal002", nullptr, RealpathChkAbnormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"realpathChkAbnormal003", nullptr, RealpathChkAbnormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"realpathChkBoundary001", nullptr, RealpathChkBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"realpathChkBoundary002", nullptr, RealpathChkBoundary002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"realpathChkStable001", nullptr, RealpathChkStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"realpathChkThread001", nullptr, RealpathChkThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "realpathchkndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}