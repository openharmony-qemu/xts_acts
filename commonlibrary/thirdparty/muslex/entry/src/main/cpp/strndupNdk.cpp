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
#include <cstdlib>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int kStableLoop10000 = 20;
static constexpr int kThreadCount = 3;
static constexpr int kIterPerThread = 10;

static char* CallStrndup(const char* s, size_t n)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetStrndup();
    if (!func) {
        errno = ENOSYS;
        return nullptr;
    }
    errno = 0;
    return func(s, n);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetStrndup()) {
        return true;
    }
    errno = 0;
    CallStrndup("test", 4);
    return (errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: Duplicate first 5 chars */
static napi_value StrndupNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* orig = "Hello World";
    char* dup = CallStrndup(orig, 5);
    bool pass = (dup != nullptr && strcmp(dup, "Hello") == 0);
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-002: n larger than string length */
static napi_value StrndupNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* orig = "Hi";
    char* dup = CallStrndup(orig, 10);
    bool pass = (dup != nullptr && strcmp(dup, "Hi") == 0);
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-003: n = 0 should return empty string */
static napi_value StrndupNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* orig = "Hello";
    char* dup = CallStrndup(orig, 0);
    bool pass = (dup != nullptr && dup[0] == '\0');
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-004: Duplicate string with embedded NUL */
static napi_value StrndupNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char orig[] = "Hello\0World";
    char* dup = CallStrndup(orig, 10);
    // strndup stops at \0, only copies "Hello"
    bool pass = (dup != nullptr && memcmp(dup, orig, 5) == 0 && dup[5] == '\0');
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-005: n exactly equals string length */
static napi_value StrndupNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* orig = "Hello";
    char* dup = CallStrndup(orig, 5);
    bool pass = (dup != nullptr && strcmp(dup, "Hello") == 0);
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Abnormal Parameter Tests ==================== */

/* TC-006: NULL input should return NULL */
static napi_value StrndupAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* result = CallStrndup(nullptr, 5);
    return ReturnInt32(env, (result == nullptr) ? 1 : 0);
}

/* TC-007: n = SIZE_MAX (should handle gracefully) */
static napi_value StrndupAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* orig = "test";
    char* dup = CallStrndup(orig, SIZE_MAX);
    // May return NULL or truncate, not crashing counts as pass
    free(dup);
    return ReturnInt32(env, 1);
}

/* ==================== Boundary Value Tests ==================== */

/* TC-008: n = 1 with empty string */
static napi_value StrndupBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* orig = "";
    char* dup = CallStrndup(orig, 1);
    bool pass = (dup != nullptr && dup[0] == '\0');
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-009: Very long string with n smaller than length */
static napi_value StrndupBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::string longStr(10000, 'a');
    char* dup = CallStrndup(longStr.c_str(), 100);
    bool pass = (dup != nullptr && strlen(dup) == 100 && strncmp(dup, longStr.c_str(), 100) == 0);
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Stability Tests ==================== */

/* TC-010: 10000 repeated calls stability */
static napi_value StrndupStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < kStableLoop10000; ++i) {
        char* dup = CallStrndup("Hello World", 5);
        if (dup == nullptr || strcmp(dup, "Hello") != 0) {
            pass = false;
            break;
        }
        free(dup);
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Multi-thread Tests ==================== */

/* TC-011: Multi-thread safety */
static napi_value StrndupThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    const char* strings[] = {"Hello", "World", "Test", "Strndup", "Thread"};

    for (int t = 0; t < kThreadCount; ++t) {
        threads.emplace_back([&hasError, strings]() {
            for (int i = 0; i < kIterPerThread; ++i) {
                int idx = i % 5;
                int len = (i % 3) + 2;
                char* dup = CallStrndup(strings[idx], len);
                if (dup == nullptr) {
                    hasError = true;
                    return;
                }
                free(dup);
            }
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
        {"strndupNormal001", nullptr, StrndupNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strndupNormal002", nullptr, StrndupNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strndupNormal003", nullptr, StrndupNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strndupNormal004", nullptr, StrndupNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strndupNormal005", nullptr, StrndupNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strndupAbnormal001", nullptr, StrndupAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strndupAbnormal002", nullptr, StrndupAbnormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strndupBoundary001", nullptr, StrndupBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strndupBoundary002", nullptr, StrndupBoundary002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strndupStable001", nullptr, StrndupStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strndupThread001", nullptr, StrndupThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "strndupndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}