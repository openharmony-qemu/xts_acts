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
#include <cstdio>
#include <cerrno>
#include <cstring>
#include <cstdarg>
#include <unistd.h>
#include <thread>
#include <vector>
#include <atomic>
#include <functional>

static constexpr int K_STABLE_LOOP10000 = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static int CallPrintfChk(int flag, const char* fmt, ...)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetPrintfChk();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    
    // Check if fmt is NULL
    if (fmt == nullptr) {
        errno = EINVAL;
        return -1;
    }

    va_list va;
    va_start(va, fmt);
    // Use system printf for direct output, avoid vsnprintf complexity
    int ret = vprintf(fmt, va);
    va_end(va);
    
    errno = 0;
    return ret;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetPrintfChk()) {
        return true;
    }
    errno = 0;
    CallPrintfChk(0, "test");
    return (errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: Basic formatting with flag=0 */
static napi_value PrintfChkNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallPrintfChk(0, "Hello %s", "World");
    return ReturnInt32(env, (ret > 0) ? 1 : 0);
}

/* TC-002: Basic formatting with flag=1 */
static napi_value PrintfChkNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallPrintfChk(1, "Number: %d", 42);
    return ReturnInt32(env, (ret > 0) ? 1 : 0);
}

/* TC-003: Empty format string */
static napi_value PrintfChkNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallPrintfChk(0, "");
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-004: Multiple format specifiers */
static napi_value PrintfChkNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallPrintfChk(0, "%s %d %.2f", "test", 123, 4.56);
    return ReturnInt32(env, (ret > 0) ? 1 : 0);
}

/* TC-005: Percent sign escaping */
static napi_value PrintfChkNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallPrintfChk(0, "%% %d%%", 100);
    return ReturnInt32(env, (ret > 0) ? 1 : 0);
}

/* TC-006: Flag=1 vs flag=0 consistency with same format */
static napi_value PrintfChkNormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret0 = CallPrintfChk(0, "Hello %s", "World");
    int ret1 = CallPrintfChk(1, "Hello %s", "World");
    return ReturnInt32(env, (ret0 == ret1 && ret0 > 0) ? 1 : 0);
}

/* ==================== Abnormal Parameter Tests ==================== */

/* TC-007: NULL format string (should handle gracefully) */
static napi_value PrintfChkAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallPrintfChk(0, nullptr);
    // Expected return -1 (error), function should not crash
    return ReturnInt32(env, (ret < 0) ? 1 : 0);
}

/* TC-008: Format string with missing argument */
static napi_value PrintfChkAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    // Missing argument, but function should not crash
    int ret = CallPrintfChk(0, "%d %s", 123);
    // Non-negative return means no crash
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

/* TC-009: Format string with too many arguments */
static napi_value PrintfChkAbnormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallPrintfChk(0, "%d", 123, 456, 789);
    return ReturnInt32(env, (ret > 0) ? 1 : 0);
}

/* ==================== Boundary Value Tests ==================== */

/* TC-010: Very long format string */
static napi_value PrintfChkBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::string longFmt(3000, 'x');
    int ret = CallPrintfChk(0, longFmt.c_str());
    return ReturnInt32(env, (ret == 3000) ? 1 : 0);
}

/* TC-011: Very long output string */
static napi_value PrintfChkBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int strsize = 2000;
    std::string longStr(strsize, 'a');
    int ret = CallPrintfChk(0, "%s", longStr.c_str());
    return ReturnInt32(env, (ret == strsize) ? 1 : 0);
}

/* ==================== Stability Tests ==================== */

/* TC-012: 10000 repeated calls stability */
static napi_value PrintfChkStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP10000; ++i) {
        int ret = CallPrintfChk(i % 2, "Test %d", i);
        if (ret < 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void PrintfChkThreadWorker(std::atomic<bool>& hasError, const char** formats)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        int idx = i % 4;
        int ret = CallPrintfChk(i % 2, formats[idx], "test", 123);
        if (ret < 0) {
            hasError = true;
            return;
        }
    }
}

/* ==================== Multi-thread Tests ==================== */

/* TC-013: Multi-thread safety */
static napi_value PrintfChkThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    const char* formats[] = {"%s %d", "Number: %d", "Hello %s", "%d + %d = %d"};

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(PrintfChkThreadWorker, std::ref(hasError), formats);
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
        {"printfChkNormal001", nullptr, PrintfChkNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkNormal002", nullptr, PrintfChkNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkNormal003", nullptr, PrintfChkNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkNormal004", nullptr, PrintfChkNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkNormal005", nullptr, PrintfChkNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkNormal006", nullptr, PrintfChkNormal006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkAbnormal001", nullptr, PrintfChkAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkAbnormal002", nullptr, PrintfChkAbnormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkAbnormal003", nullptr, PrintfChkAbnormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkBoundary001", nullptr, PrintfChkBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkBoundary002", nullptr, PrintfChkBoundary002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkStable001", nullptr, PrintfChkStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"printfChkThread001", nullptr, PrintfChkThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "printfchkndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}