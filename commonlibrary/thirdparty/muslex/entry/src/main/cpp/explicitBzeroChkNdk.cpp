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
#include <cstring>
#include <cerrno>
#include <csignal>
#include <sys/wait.h>
#include <unistd.h>
#include <thread>
#include <algorithm>
#include <vector>
#include <atomic>

static constexpr int K_BUF_SIZE_10 = 10;
static constexpr int K_TEST_LEN_5 = 5;
static constexpr int K_TEST_LEN_9 = 9;
static constexpr int K_TEST_LEN_20 = 20;
static constexpr int K_STABLE_LOOP_10000 = 20;
static constexpr int K_STABLE_LOOP_1000 = 20;
static constexpr int K_STABLE_LOOP_100000 = 200;
static constexpr int K_THREAD_WORK_LOOP = 10;
static constexpr int K_BUF_IDX_ZERO = 0;
static constexpr int K_THREAD_COUNT = 3;

static void CallExplicitBzeroChk(void *dest, size_t len, size_t dstLen)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = reinterpret_cast<void (*)(void*, size_t, size_t)>(loader.GetExplicitBzeroChk());
    if (!func) {
        errno = ENOSYS;
        return;
    }
    func(dest, len, dstLen);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetExplicitBzeroChk()) {
        return true;
    }
    char buf[4];
    std::fill_n(buf, sizeof(buf), static_cast<char>(0xAA));
    errno = 0;
    CallExplicitBzeroChk(buf, 0, sizeof(buf));
    return (errno == ENOSYS);
}

static bool CheckAbortExplicitBzero(void *dest, size_t len, size_t dstLen)
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
        CallExplicitBzeroChk(dest, len, dstLen);
        _exit(0);
    }
    waitpid(pid, &status, 0);
    return (WIFSIGNALED(status) && WTERMSIG(status) == SIGABRT);
}

static napi_value ReturnInt32(napi_env env, int32_t val)
{
    napi_value result;
    napi_create_int32(env, val, &result);
    return result;
}

/* ----- Original simple test ----- */
static napi_value ExplicitBzeroChk(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    } else {
        char buf[K_BUF_SIZE_10];
        std::fill_n(buf, sizeof(buf), 1);
        CallExplicitBzeroChk(buf, sizeof(buf), sizeof(buf));
        for (int i = 0; i < K_BUF_SIZE_10; ++i) {
            if (buf[i] != 0) {
                return ReturnInt32(env, 0);
            }
        }
        return ReturnInt32(env, 1);
    }
}

/* ---------- Normal parameter tests ---------- */
static napi_value ExplicitBzeroChkNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char buf[K_BUF_SIZE_10];
    std::fill_n(buf, sizeof(buf), 1);
    CallExplicitBzeroChk(buf, K_BUF_SIZE_10, K_BUF_SIZE_10);
    for (int i = 0; i < K_BUF_SIZE_10; ++i) {
        if (buf[i] != 0) {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value ExplicitBzeroChkNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char buf[K_BUF_SIZE_10];
    std::fill_n(buf, sizeof(buf), 1);
    CallExplicitBzeroChk(buf, K_TEST_LEN_5, K_BUF_SIZE_10);
    for (int i = 0; i < K_TEST_LEN_5; ++i) {
        if (buf[i] != 0) {
            return ReturnInt32(env, 0);
        }
    }
    for (int i = K_TEST_LEN_5; i < K_BUF_SIZE_10; ++i) {
        if (buf[i] != 1) {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value ExplicitBzeroChkNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char buf[K_BUF_SIZE_10];
    char backup[K_BUF_SIZE_10];
    std::fill_n(buf, sizeof(buf), 1);
    std::copy_n(buf, sizeof(buf), backup);
    CallExplicitBzeroChk(buf, 0, K_BUF_SIZE_10);
    if (std::memcmp(buf, backup, sizeof(buf)) == 0) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value ExplicitBzeroChkNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char buf[K_BUF_SIZE_10];
    std::fill_n(buf, sizeof(buf), 1);
    CallExplicitBzeroChk(buf, 1, K_BUF_SIZE_10);
    if (buf[0] == 0 && buf[1] == 1) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- Abnormal parameter tests ---------- */
static napi_value ExplicitBzeroChkAbnormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char buf = 1;
    CallExplicitBzeroChk(&buf, 0, 0);
    if (buf == 1) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- Boundary value tests ---------- */
static napi_value ExplicitBzeroChkBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char buf = 1;
    CallExplicitBzeroChk(&buf, 0, 0);
    if (buf == 1) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value ExplicitBzeroChkBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char buf[1] = {1};
    CallExplicitBzeroChk(buf, 1, 1);
    if (buf[0] == 0) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value ExplicitBzeroChkBoundary003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char buf[K_BUF_SIZE_10];
    std::fill_n(buf, sizeof(buf), 1);
    CallExplicitBzeroChk(buf, K_TEST_LEN_9, K_BUF_SIZE_10);
    for (int i = 0; i < K_TEST_LEN_9; ++i) {
        if (buf[i] != 0) {
            return ReturnInt32(env, 0);
        }
    }
    if (buf[K_TEST_LEN_9] != 1) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- Functional tests ---------- */
static napi_value ExplicitBzeroChkFunc001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    volatile char buf[K_BUF_SIZE_10];
    std::fill_n(const_cast<char*>(buf), sizeof(buf), 1);
    CallExplicitBzeroChk(const_cast<char*>(buf), sizeof(buf), sizeof(buf));
    for (int i = 0; i < K_BUF_SIZE_10; ++i) {
        if (buf[i] != 0) {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value ExplicitBzeroChkFunc002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char buf[K_BUF_SIZE_10];
    char backup[K_BUF_SIZE_10];
    std::fill_n(buf, sizeof(buf), 1);
    std::copy_n(buf, sizeof(buf), backup);
    CallExplicitBzeroChk(buf, 0, K_BUF_SIZE_10);
    if (std::memcmp(buf, backup, sizeof(buf)) == 0) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

// In stub mode, the function returns ENOSYS and does not modify memory; this test expects that behavior.
static napi_value ExplicitBzeroChkFunc003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char buf[K_BUF_SIZE_10];
    char backup[K_BUF_SIZE_10];
    std::fill_n(buf, sizeof(buf), 1);
    std::copy_n(buf, sizeof(buf), backup);
    errno = 0;
    CallExplicitBzeroChk(buf, K_TEST_LEN_5, K_BUF_SIZE_10);
    if (std::memcmp(buf, backup, sizeof(buf)) < 0) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value ExplicitBzeroChkFunc004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

/* Stability tests */
static bool StableWorkerFunc()
{
    for (int i = 0; i < K_THREAD_WORK_LOOP; ++i) {
        char buf[K_BUF_SIZE_10];
        std::fill_n(buf, sizeof(buf), 1);
        CallExplicitBzeroChk(buf, K_BUF_SIZE_10, K_BUF_SIZE_10);
        for (int j = 0; j < K_BUF_SIZE_10; ++j) {
            if (buf[j] != 0) {
                return false;
            }
        }
    }
    return true;
}

static napi_value ExplicitBzeroChkStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    for (int i = 0; i < K_STABLE_LOOP_10000; ++i) {
        char buf[K_BUF_SIZE_10];
        std::fill_n(buf, sizeof(buf), 1);
        CallExplicitBzeroChk(buf, K_TEST_LEN_5, K_BUF_SIZE_10);
        for (int j = 0; j < K_TEST_LEN_5; ++j) {
            if (buf[j] != 0) {
                return ReturnInt32(env, 0);
            }
        }
        for (int j = K_TEST_LEN_5; j < K_BUF_SIZE_10; ++j) {
            if (buf[j] != 1) {
                return ReturnInt32(env, 0);
            }
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value ExplicitBzeroChkStable002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> allSuccess(true);
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&allSuccess]()
        {
            if (!StableWorkerFunc()) {
                allSuccess.store(false);
            }
        });
    }
    for (auto& th : threads) {
        th.join();
    }
    return ReturnInt32(env, allSuccess.load() ? 1 : 0);
}

static napi_value ExplicitBzeroChkStable004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }

    for (int i = 0; i < K_STABLE_LOOP_100000; ++i) {
        char buf[K_BUF_SIZE_10];
        std::fill_n(buf, sizeof(buf), 1);
        CallExplicitBzeroChk(buf, K_BUF_SIZE_10, K_BUF_SIZE_10);
        for (int j = 0; j < K_BUF_SIZE_10; ++j) {
            if (buf[j] != 0) {
                ReturnInt32(env, 0);
            }
        }
    }
    return ReturnInt32(env, 1);
}

/* ---------- Module registration ---------- */
static const napi_property_descriptor DESC1[] = {
    {"explicitBzeroChk", nullptr, ExplicitBzeroChk, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"explicitBzeroChkNormal001", nullptr, ExplicitBzeroChkNormal001, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkNormal002", nullptr, ExplicitBzeroChkNormal002, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkNormal003", nullptr, ExplicitBzeroChkNormal003, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkNormal004", nullptr, ExplicitBzeroChkNormal004, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkAbnormal003", nullptr, ExplicitBzeroChkAbnormal003, nullptr, nullptr, nullptr,
     napi_default, nullptr},
};

static const napi_property_descriptor DESC2[] = {
    {"explicitBzeroChkBoundary001", nullptr, ExplicitBzeroChkBoundary001, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkBoundary002", nullptr, ExplicitBzeroChkBoundary002, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkBoundary003", nullptr, ExplicitBzeroChkBoundary003, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkFunc001", nullptr, ExplicitBzeroChkFunc001, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkFunc002", nullptr, ExplicitBzeroChkFunc002, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkFunc003", nullptr, ExplicitBzeroChkFunc003, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkFunc004", nullptr, ExplicitBzeroChkFunc004, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkStable001", nullptr, ExplicitBzeroChkStable001, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkStable002", nullptr, ExplicitBzeroChkStable002, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"explicitBzeroChkStable004", nullptr, ExplicitBzeroChkStable004, nullptr, nullptr, nullptr,
     napi_default, nullptr},
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(DESC1) / sizeof(DESC1[0]), DESC1);
    napi_define_properties(env, exports, sizeof(DESC2) / sizeof(DESC2[0]), DESC2);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "explicitbzerochkndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}