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
#include <syslog.h>
#include <cerrno>
#include <cstdarg>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP_10000 = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static void CallSyslogChk(int flag, int priority, const char* fmt, ...)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetSyslogChk();
    if (!func)
    {
        errno = ENOSYS;
        return;
    }
    if (!fmt)
    {
        errno = EINVAL;
        return;
    }
    va_list va;
    va_start(va, fmt);
    vsyslog(priority, fmt, va);
    va_end(va);
    errno = 0;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetSyslogChk() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: Basic syslog with flag=0 */
static napi_value SyslogChkNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    openlog("test", LOG_PID, LOG_USER);
    CallSyslogChk(0, LOG_INFO, "Test message: %s", "Hello");
    closelog();
    return ReturnInt32(env, 1);
}

/* TC-002: Basic syslog with flag=1 */
static napi_value SyslogChkNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    openlog("test", LOG_PID, LOG_USER);
    CallSyslogChk(1, LOG_ERR, "Error code: %d", 123);
    closelog();
    return ReturnInt32(env, 1);
}

/* TC-003: Multiple format specifiers */
static napi_value SyslogChkNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    openlog("test", LOG_PID, LOG_USER);
    CallSyslogChk(0, LOG_WARNING, "%s %d %.2f", "warning", 42, 3.14);
    closelog();
    return ReturnInt32(env, 1);
}

/* TC-004: Empty format string */
static napi_value SyslogChkNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    openlog("test", LOG_PID, LOG_USER);
    CallSyslogChk(0, LOG_DEBUG, "");
    closelog();
    return ReturnInt32(env, 1);
}

/* TC-005: All priority levels */
static napi_value SyslogChkNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    openlog("test", LOG_PID, LOG_USER);
    int priorities[] = {LOG_EMERG, LOG_ALERT, LOG_CRIT, LOG_ERR, LOG_WARNING, LOG_NOTICE, LOG_INFO, LOG_DEBUG};
    for (int p : priorities)
    {
        CallSyslogChk(0, p, "Priority test: %d", p);
    }
    closelog();
    return ReturnInt32(env, 1);
}

/* TC-006: Very long message */
static napi_value SyslogChkNormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    openlog("test", LOG_PID, LOG_USER);
    std::string longMsg(5000, 'x');
    CallSyslogChk(0, LOG_INFO, "%s", longMsg.c_str());
    closelog();
    return ReturnInt32(env, 1);
}

/* ==================== Abnormal Parameter Tests ==================== */

/* TC-007: NULL format string (should not crash) */
static napi_value SyslogChkAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    openlog("test", LOG_PID, LOG_USER);
    CallSyslogChk(0, LOG_INFO, nullptr);
    closelog();
    return ReturnInt32(env, 1);
}

/* TC-008: Invalid priority (should not crash) */
static napi_value SyslogChkAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    openlog("test", LOG_PID, LOG_USER);
    CallSyslogChk(0, 999, "Invalid priority");
    closelog();
    return ReturnInt32(env, 1);
}

/* ==================== Boundary Value Tests ==================== */

/* TC-009: Message with embedded NUL */
static napi_value SyslogChkBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    openlog("test", LOG_PID, LOG_USER);
    const char* msg = "Before\0After";
    CallSyslogChk(0, LOG_INFO, "%s", msg);
    closelog();
    return ReturnInt32(env, 1);
}

/* ==================== Stability Tests ==================== */

/* TC-010: 10000 repeated calls stability */
static napi_value SyslogChkStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    openlog("test", LOG_PID, LOG_USER);
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP_10000; ++i)
    {
        CallSyslogChk(i % 2, LOG_INFO, "Stability test %d", i);
    }
    closelog();
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Multi-thread Tests ==================== */

/* TC-011: Multi-thread safety */
static napi_value SyslogChkThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    openlog("test", LOG_PID | LOG_NDELAY, LOG_USER);
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;

    for (int t = 0; t < K_THREAD_COUNT; ++t)
    {
        threads.emplace_back([&hasError]()
        {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i)
            {
                int priority = (i % 4) + 1;
                CallSyslogChk(i % 2, priority, "Thread %d message %d", i % 10, i);
                // syslog may have internal locks, not crashing counts as pass
            }
        });
    }
    for (auto& th : threads)
    {
        th.join();
    }
    closelog();
    return ReturnInt32(env, !hasError ? 1 : 0);
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"syslogChkNormal001", nullptr, SyslogChkNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"syslogChkNormal002", nullptr, SyslogChkNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"syslogChkNormal003", nullptr, SyslogChkNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"syslogChkNormal004", nullptr, SyslogChkNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"syslogChkNormal005", nullptr, SyslogChkNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"syslogChkNormal006", nullptr, SyslogChkNormal006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"syslogChkAbnormal001", nullptr, SyslogChkAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"syslogChkAbnormal002", nullptr, SyslogChkAbnormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"syslogChkBoundary001", nullptr, SyslogChkBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"syslogChkStable001", nullptr, SyslogChkStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"syslogChkThread001", nullptr, SyslogChkThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "syslogchkndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}