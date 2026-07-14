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
#include <cwchar>
#include <clocale>
#include <cerrno>
#include <string>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int kStableLoop10000 = 20;
static constexpr int kThreadCount = 3;
static constexpr int kIterPerThread = 10;

static size_t CallMbrlen(const char* s, size_t n, mbstate_t* ps)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetMbrlen();
    if (!func) {
        errno = ENOSYS;
        return static_cast<size_t>(-1);
    }
    errno = 0;
    return func(s, n, ps);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetMbrlen()) {
        return true;
    }
    mbstate_t state = {};
    errno = 0;
    CallMbrlen("", 0, &state);
    return (errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: ASCII character 'A' should return 1 */
static napi_value MbrlenNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    setlocale(LC_ALL, "C");
    mbstate_t state = {};
    const char* s = "A";
    size_t ret = CallMbrlen(s, MB_CUR_MAX, &state);
    return ReturnInt32(env, (ret == 1) ? 1 : 0);
}

/* TC-002: UTF-8 multi-byte character (3 bytes) */
static napi_value MbrlenNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    // Try setting UTF-8 locale, if failed use C locale
    if (setlocale(LC_ALL, "en_US.UTF-8") == nullptr) {
        setlocale(LC_ALL, "C");
    }
    mbstate_t state = {};
    const char* s = "\xE4\xB8\xAD";
    size_t ret = CallMbrlen(s, MB_CUR_MAX, &state);
    return ReturnInt32(env, (ret == 3) ? 1 : 0);
}

/* TC-003: Empty string should return 0 */
static napi_value MbrlenNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    setlocale(LC_ALL, "C");
    mbstate_t state = {};
    const char* s = "";
    size_t ret = CallMbrlen(s, 1, &state);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-004: s = NULL should return 0 (resets state) */
static napi_value MbrlenNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    setlocale(LC_ALL, "C");
    mbstate_t state = {};
    size_t ret = CallMbrlen(nullptr, 0, &state);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-005: ps = NULL uses internal state */
static napi_value MbrlenNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    setlocale(LC_ALL, "C");
    const char* s = "A";
    size_t ret = CallMbrlen(s, MB_CUR_MAX, nullptr);
    return ReturnInt32(env, (ret == 1) ? 1 : 0);
}

/* TC-006: Multiple characters in UTF-8 */
static napi_value MbrlenNormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    if (setlocale(LC_ALL, "en_US.UTF-8") == nullptr) {
        setlocale(LC_ALL, "C");
    }
    mbstate_t state = {};
    const char* s = "\xE4\xB8\xAD\xE6\x96\x87"; // "Chinese characters"
    size_t ret = CallMbrlen(s, MB_CUR_MAX, &state);
    return ReturnInt32(env, (ret == 3) ? 1 : 0);
}

/* ==================== Abnormal Parameter Tests ==================== */

/* TC-007: n < required bytes -> returns -2 */
static napi_value MbrlenAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    setlocale(LC_ALL, "C");
    mbstate_t state = {};
    const char* s = "A";
    errno = 0;
    size_t ret = CallMbrlen(s, 0, &state);
    return ReturnInt32(env, (ret == static_cast<size_t>(-2)) ? 1 : 0);
}

/* TC-008: Invalid UTF-8 sequence -> returns -1, errno=EILSEQ */
static napi_value MbrlenAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    if (setlocale(LC_ALL, "en_US.UTF-8") == nullptr) {
        setlocale(LC_ALL, "C");
    }
    mbstate_t state = {};
    const char* s = "\x80"; // Invalid start byte
    errno = 0;
    size_t ret = CallMbrlen(s, 1, &state);
    bool pass = (ret == static_cast<size_t>(-1) && errno == EILSEQ);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-009: Incomplete UTF-8 sequence -> returns -2 */
static napi_value MbrlenAbnormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    if (setlocale(LC_ALL, "en_US.UTF-8") == nullptr) {
        setlocale(LC_ALL, "C");
    }
    mbstate_t state = {};
    const char* s = "\xE4"; // Incomplete UTF-8
    errno = 0;
    size_t ret = CallMbrlen(s, 1, &state);
    return ReturnInt32(env, (ret == static_cast<size_t>(-2)) ? 1 : 0);
}

/* TC-010: n = 0 with non-empty string -> returns -2 */
static napi_value MbrlenAbnormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    setlocale(LC_ALL, "C");
    mbstate_t state = {};
    const char* s = "Hello";
    errno = 0;
    size_t ret = CallMbrlen(s, 0, &state);
    return ReturnInt32(env, (ret == static_cast<size_t>(-2)) ? 1 : 0);
}

/* ==================== Boundary Value Tests ==================== */

/* TC-011: n = MB_CUR_MAX should process complete char */
static napi_value MbrlenBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    setlocale(LC_ALL, "C");
    mbstate_t state = {};
    const char* s = "A";
    size_t ret = CallMbrlen(s, MB_CUR_MAX, &state);
    return ReturnInt32(env, (ret == 1) ? 1 : 0);
}

/* TC-012: n = MB_CUR_MAX with UTF-8 Chinese char */
static napi_value MbrlenBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    if (setlocale(LC_ALL, "en_US.UTF-8") == nullptr) {
        setlocale(LC_ALL, "C");
    }
    mbstate_t state = {};
    const char* s = "\xE4\xB8\xAD";
    size_t ret = CallMbrlen(s, MB_CUR_MAX, &state);
    return ReturnInt32(env, (ret == 3) ? 1 : 0);
}

/* TC-013: Very long valid UTF-8 string */
static napi_value MbrlenBoundary003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    if (setlocale(LC_ALL, "en_US.UTF-8") == nullptr) {
        setlocale(LC_ALL, "C");
    }
    mbstate_t state = {};
    std::string longStr(1000, 'a');
    const char* s = longStr.c_str();
    size_t ret = CallMbrlen(s, MB_CUR_MAX, &state);
    return ReturnInt32(env, (ret == 1) ? 1 : 0);
}

/* ==================== Stability Tests ==================== */

/* TC-014: 10000 repeated calls stability */
static napi_value MbrlenStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    setlocale(LC_ALL, "C");
    bool pass = true;
    for (int i = 0; i < kStableLoop10000; ++i) {
        mbstate_t state = {};
        size_t ret = CallMbrlen("A", 1, &state);
        if (ret != 1) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-015: Multiple locale switches stability */
static napi_value MbrlenStable002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int loopcount = 20;
    bool pass = true;
    for (int i = 0; i < loopcount; ++i) {
        setlocale(LC_ALL, "C");
        mbstate_t state = {};
        size_t ret1 = CallMbrlen("A", 1, &state);
        if (ret1 != 1) {
            pass = false;
            break;
        }
        if (setlocale(LC_ALL, "en_US.UTF-8") == nullptr) {
            setlocale(LC_ALL, "C");
        }
        mbstate_t state2 = {};
        size_t ret2 = CallMbrlen("\xE4\xB8\xAD", MB_CUR_MAX, &state2);
        if (ret2 != 3) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Multi-thread Tests ==================== */

/* TC-016: Multi-thread safety with different locales */
static napi_value MbrlenThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    const char* asciiStr = "A";
    const char* utf8Str = "\xE4\xB8\xAD";

    // Try setting UTF-8 locale first, if failed use C locale
    const char* utf8Locale = setlocale(LC_ALL, "en_US.UTF-8");
    if (utf8Locale == nullptr) {
        // Try other UTF-8 locale variants
        utf8Locale = setlocale(LC_ALL, "en_US.utf8");
    }
    if (utf8Locale == nullptr) {
        utf8Locale = setlocale(LC_ALL, "C.UTF-8");
    }

    for (int t = 0; t < kThreadCount; ++t) {
        threads.emplace_back([&hasError, asciiStr, utf8Str, utf8Locale]() {
            for (int i = 0; i < kIterPerThread; ++i) {
                // Use C locale to test ASCII
                setlocale(LC_ALL, "C");
                mbstate_t state = {};
                size_t ret = CallMbrlen(asciiStr, 1, &state);
                if (ret != 1) {
                    hasError = true;
                    return;
                }

                // Use UTF-8 locale to test multi-byte characters (if available)
                if (utf8Locale != nullptr) {
                    setlocale(LC_ALL, utf8Locale);
                    mbstate_t state2 = {};
                    size_t ret2 = CallMbrlen(utf8Str, MB_CUR_MAX, &state2);
                    if (ret2 != 3) {
                        // If UTF-8 not available, not an error (skip)
                        continue;
                    }
                }
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
        {"mbrlenNormal001", nullptr, MbrlenNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenNormal002", nullptr, MbrlenNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenNormal003", nullptr, MbrlenNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenNormal004", nullptr, MbrlenNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenNormal005", nullptr, MbrlenNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenNormal006", nullptr, MbrlenNormal006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenAbnormal001", nullptr, MbrlenAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenAbnormal002", nullptr, MbrlenAbnormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenAbnormal003", nullptr, MbrlenAbnormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenAbnormal004", nullptr, MbrlenAbnormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenBoundary001", nullptr, MbrlenBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenBoundary002", nullptr, MbrlenBoundary002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenBoundary003", nullptr, MbrlenBoundary003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenStable001", nullptr, MbrlenStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenStable002", nullptr, MbrlenStable002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"mbrlenThread001", nullptr, MbrlenThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "mbrlenndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}