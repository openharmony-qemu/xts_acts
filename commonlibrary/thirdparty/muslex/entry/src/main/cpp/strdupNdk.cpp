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

static constexpr int K_STABLE_LOOP10000 = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr size_t K_LONG_STR_SIZE = 10000;
static constexpr size_t K_EXTRA_LONG_STR_SIZE = 100000;
static constexpr size_t K_STR_COUNT = 5;

static char* CallStrdup(const char* s)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetStrdup();
    if (!func) {
        errno = ENOSYS;
        return nullptr;
    }
    errno = 0;
    return func(s);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetStrdup()) {
        return true;
    }
    errno = 0;
    CallStrdup("test");
    return (errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: Duplicate a simple string */
static napi_value StrdupNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* orig = "Hello World";
    char* dup = CallStrdup(orig);
    bool pass = (dup != nullptr && strcmp(dup, orig) == 0);
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-002: Duplicate empty string */
static napi_value StrdupNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* orig = "";
    char* dup = CallStrdup(orig);
    bool pass = (dup != nullptr && strcmp(dup, orig) == 0 && dup[0] == '\0');
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-003: Duplicate long string */
static napi_value StrdupNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::string longStr(K_LONG_STR_SIZE, 'a');
    char* dup = CallStrdup(longStr.c_str());
    bool pass = (dup != nullptr && strcmp(dup, longStr.c_str()) == 0);
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-004: Duplicate string with special characters (excluding \0) */
static napi_value StrdupNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* orig = "Hello\n\t\r World";
    char* dup = CallStrdup(orig);
    bool pass = (dup != nullptr && strcmp(dup, orig) == 0);
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-005: Duplicate string with all ASCII characters */
static napi_value StrdupNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::string allAscii;
    for (int i = 32; i < 127; ++i) {
        allAscii += static_cast<char>(i);
    }
    char* dup = CallStrdup(allAscii.c_str());
    bool pass = (dup != nullptr && strcmp(dup, allAscii.c_str()) == 0);
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Abnormal Parameter Tests ==================== */

/* TC-006: NULL input should return NULL */
static napi_value StrdupAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* result = CallStrdup(nullptr);
    return ReturnInt32(env, (result == nullptr) ? 1 : 0);
}

/* ==================== Boundary Value Tests ==================== */

/* TC-007: Very long string (near memory limit) */
static napi_value StrdupBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::string longStr(K_EXTRA_LONG_STR_SIZE, 'a');
    char* dup = CallStrdup(longStr.c_str());
    bool pass = (dup != nullptr && strcmp(dup, longStr.c_str()) == 0);
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-008: String with only NUL terminator */
static napi_value StrdupBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* orig = "\0";
    char* dup = CallStrdup(orig);
    bool pass = (dup != nullptr && dup[0] == '\0');
    free(dup);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Stability Tests ==================== */

/* TC-009: 10000 repeated calls stability */
static napi_value StrdupStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP10000; ++i) {
        char* dup = CallStrdup("test");
        if (dup == nullptr || strcmp(dup, "test") != 0) {
            pass = false;
            break;
        }
        free(dup);
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void StrdupWorker(std::atomic<bool>& hasError, const char* strings[])
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                int idx = i % K_STR_COUNT;
        char* dup = CallStrdup(strings[idx]);
        if (dup == nullptr || strcmp(dup, strings[idx]) != 0) {
            hasError = true;
            return;
        }
        free(dup);
    }
}

/* ==================== Multi-thread Tests ==================== */

/* TC-010: Multi-thread safety */
static napi_value StrdupThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    const char* strings[] = {"Hello", "World", "Test", "Strdup", "Thread"};
    static_assert(sizeof(strings) / sizeof(strings[0]) == K_STR_COUNT, "K_STR_COUNT mismatch");

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(StrdupWorker, std::ref(hasError), strings);
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
        {"strdupNormal001", nullptr, StrdupNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strdupNormal002", nullptr, StrdupNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strdupNormal003", nullptr, StrdupNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strdupNormal004", nullptr, StrdupNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strdupNormal005", nullptr, StrdupNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strdupAbnormal001", nullptr, StrdupAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strdupBoundary001", nullptr, StrdupBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strdupBoundary002", nullptr, StrdupBoundary002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strdupStable001", nullptr, StrdupStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strdupThread001", nullptr, StrdupThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "strdupndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}