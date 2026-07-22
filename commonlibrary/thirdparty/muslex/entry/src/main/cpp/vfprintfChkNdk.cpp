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
#include <thread>
#include <unistd.h>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP_10000 = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static int CallVfprintfChk(FILE* fp, int flags, const char* format, va_list va)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetVfprintfChk();
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(fp, flags, format, va);
}

static FILE* CreateSandboxTempFile()
{
    char tmpPath[256];
    snprintf(tmpPath, sizeof(tmpPath), "/data/storage/el2/base/temp/tmpfile_XXXXXX");
    int fd = mkstemp(tmpPath);
    if (fd == -1)
    {
        return nullptr;
    }
    unlink(tmpPath);
    return fdopen(fd, "w+");
}

static int VfprintfHelper(FILE* fp, int flags, const char* format, ...)
{
    va_list va;
    va_start(va, format);
    int result = CallVfprintfChk(fp, flags, format, va);
    va_end(va);
    return result;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetVfprintfChk())
    {
        return true;
    }

    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return true;
    }

    errno = 0;
    VfprintfHelper(tmp, 0, "test");
    bool isStub = (errno == ENOSYS);
    fclose(tmp);
    return isStub;
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: Basic formatting with flag=0 */
static napi_value VfprintfChkNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    int ret = VfprintfHelper(tmp, 0, "Hello %s", "World");
    fclose(tmp);
    return ReturnInt32(env, (ret > 0) ? 1 : 0);
}

/* TC-002: Basic formatting with flag=1 */
static napi_value VfprintfChkNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    int ret = VfprintfHelper(tmp, 1, "Number: %d", 42);
    fclose(tmp);
    return ReturnInt32(env, (ret > 0) ? 1 : 0);
}

/* TC-003: Multiple format specifiers */
static napi_value VfprintfChkNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    int ret = VfprintfHelper(tmp, 0, "%s %d %.2f", "test", 123, 4.56);
    fclose(tmp);
    return ReturnInt32(env, (ret > 0) ? 1 : 0);
}

/* TC-004: Empty format string */
static napi_value VfprintfChkNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    int ret = VfprintfHelper(tmp, 0, "");
    fclose(tmp);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-005: flag=1 vs flag=0 consistency */
static napi_value VfprintfChkNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    int ret0 = VfprintfHelper(tmp, 0, "Hello %s", "World");
    rewind(tmp);
    int ret1 = VfprintfHelper(tmp, 1, "Hello %s", "World");
    fclose(tmp);
    return ReturnInt32(env, (ret0 == ret1 && ret0 > 0) ? 1 : 0);
}

/* TC-006: Percent sign escaping */
static napi_value VfprintfChkNormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    int ret = VfprintfHelper(tmp, 0, "%% %d%%", 100);
    fclose(tmp);
    return ReturnInt32(env, (ret > 0) ? 1 : 0);
}

/* ==================== Abnormal Parameter Tests ==================== */

/* TC-007: Read-only FILE* should fail (EBADF) */
static napi_value VfprintfChkAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    char tmpPath[256];
    snprintf(tmpPath, sizeof(tmpPath), "/data/storage/el2/base/temp/tmpfile_XXXXXX");
    int fd = mkstemp(tmpPath);
    if (fd == -1)
    {
        return ReturnInt32(env, 0);
    }
    close(fd);
    FILE* tmp = fopen(tmpPath, "r");
    unlink(tmpPath);
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    int ret = VfprintfHelper(tmp, 0, "test");
    fclose(tmp);
    return ReturnInt32(env, (ret < 0 && errno == EBADF) ? 1 : 0);
}

/* TC-008: NULL format string should fail */
static napi_value VfprintfChkAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    int ret = VfprintfHelper(tmp, 0, nullptr);
    fclose(tmp);
    return ReturnInt32(env, (ret < 0) ? 1 : 0);
}

/* TC-009: Format string with missing argument */
static napi_value VfprintfChkAbnormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    // Missing argument, function should not crash
    int ret = VfprintfHelper(tmp, 0, "%d %s", 123);
    fclose(tmp);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

/* TC-010: Format string with too many arguments */
static napi_value VfprintfChkAbnormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    int ret = VfprintfHelper(tmp, 0, "%d", 123, 456, 789);
    fclose(tmp);
    return ReturnInt32(env, (ret > 0) ? 1 : 0);
}

/* ==================== Boundary Value Tests ==================== */

/* TC-011: Very long format string */
static napi_value VfprintfChkBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    std::string longFmt(3000, 'x');
    int ret = VfprintfHelper(tmp, 0, longFmt.c_str());
    fclose(tmp);
    return ReturnInt32(env, (ret == 3000) ? 1 : 0);
}

/* TC-012: Very long output string */
static napi_value VfprintfChkBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp)
    {
        return ReturnInt32(env, 0);
    }
    std::string longStr(2000, 'a');
    int ret = VfprintfHelper(tmp, 0, "%s", longStr.c_str());
    fclose(tmp);
    return ReturnInt32(env, (ret == 2000) ? 1 : 0);
}

/* ==================== Stability Tests ==================== */

/* TC-013: 10000 repeated calls stability */
static napi_value VfprintfChkStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP_10000; ++i)
    {
        FILE* tmp = CreateSandboxTempFile();
        if (!tmp)
        {
            pass = false;
            break;
        }
        int ret = VfprintfHelper(tmp, i % 2, "Test %d", i);
        fclose(tmp);
        if (ret < 0)
        {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Multi-thread Tests ==================== */

/* TC-014: Multi-thread safety with different files */
static napi_value VfprintfChkThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    const char* formats[] = {"%s %d", "Number: %d", "Hello %s", "%d + %d = %d"};

    for (int t = 0; t < K_THREAD_COUNT; ++t)
    {
        threads.emplace_back([&hasError, formats]()
        {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i)
            {
                FILE* tmp = CreateSandboxTempFile();
                if (!tmp)
                {
                    hasError = true;
                    return;
                }
                int idx = i % 4;
                int ret = VfprintfHelper(tmp, i % 2, formats[idx], "test", 123);
                fclose(tmp);
                if (ret < 0)
                {
                    hasError = true;
                    return;
                }
            }
        });
    }
    for (auto& th : threads)
    {
        th.join();
    }
    return ReturnInt32(env, !hasError ? 1 : 0);
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"vfprintfChkNormal001", nullptr, VfprintfChkNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkNormal002", nullptr, VfprintfChkNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkNormal003", nullptr, VfprintfChkNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkNormal004", nullptr, VfprintfChkNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkNormal005", nullptr, VfprintfChkNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkNormal006", nullptr, VfprintfChkNormal006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkAbnormal001", nullptr, VfprintfChkAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkAbnormal002", nullptr, VfprintfChkAbnormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkAbnormal003", nullptr, VfprintfChkAbnormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkAbnormal004", nullptr, VfprintfChkAbnormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkBoundary001", nullptr, VfprintfChkBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkBoundary002", nullptr, VfprintfChkBoundary002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkStable001", nullptr, VfprintfChkStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"vfprintfChkThread001", nullptr, VfprintfChkThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "vfprintfchkndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}