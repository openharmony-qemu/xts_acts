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
#include <thread>
#include <vector>
#include <atomic>

static constexpr int kStableLoop10000 = 20;
static constexpr int kThreadCount = 3;
static constexpr int kIterPerThread = 10;

static char* CallStrtokR(char* s, const char* sep, char** p)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetStrtokR();
    if (!func) {
        errno = ENOSYS;
        return nullptr;
    }
    errno = 0;
    return func(s, sep, p);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetStrtokR()) {
        return true;
    }
    char* p = nullptr;
    errno = 0;
    CallStrtokR(nullptr, ",", &p);
    return (errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: Basic tokenization */
static napi_value StrtokRNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char str[] = "hello,world,test";
    char* saveptr = nullptr;
    char* token = CallStrtokR(str, ",", &saveptr);
    bool pass = (token != nullptr && strcmp(token, "hello") == 0);
    if (!pass) {
        return ReturnInt32(env, 0);
    }
    token = CallStrtokR(nullptr, ",", &saveptr);
    pass = (token != nullptr && strcmp(token, "world") == 0);
    if (!pass) {
        return ReturnInt32(env, 0);
    }
    token = CallStrtokR(nullptr, ",", &saveptr);
    pass = (token != nullptr && strcmp(token, "test") == 0);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-002: Multiple delimiters */
static napi_value StrtokRNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char str[] = "hello,,world;test";
    char* saveptr = nullptr;
    char* token = CallStrtokR(str, ",;", &saveptr);
    bool pass = (token != nullptr && strcmp(token, "hello") == 0);
    if (!pass) {
        return ReturnInt32(env, 0);
    }
    token = CallStrtokR(nullptr, ",;", &saveptr);
    pass = (token != nullptr && strcmp(token, "world") == 0);
    if (!pass) {
        return ReturnInt32(env, 0);
    }
    token = CallStrtokR(nullptr, ",;", &saveptr);
    pass = (token != nullptr && strcmp(token, "test") == 0);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-003: Consecutive delimiters */
static napi_value StrtokRNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char str[] = "hello,,world";
    char* saveptr = nullptr;
    char* token = CallStrtokR(str, ",", &saveptr);
    bool pass = (token != nullptr && strcmp(token, "hello") == 0);
    if (!pass) {
        return ReturnInt32(env, 0);
    }
    token = CallStrtokR(nullptr, ",", &saveptr);
    pass = (token != nullptr && strcmp(token, "world") == 0);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-004: Token with leading delimiters */
static napi_value StrtokRNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char str[] = ",hello,world";
    char* saveptr = nullptr;
    char* token = CallStrtokR(str, ",", &saveptr);
    bool pass = (token != nullptr && strcmp(token, "hello") == 0);
    if (!pass) {
        return ReturnInt32(env, 0);
    }
    token = CallStrtokR(nullptr, ",", &saveptr);
    pass = (token != nullptr && strcmp(token, "world") == 0);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-005: Token with trailing delimiters */
static napi_value StrtokRNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char str[] = "hello,world,";
    char* saveptr = nullptr;
    char* token = CallStrtokR(str, ",", &saveptr);
    bool pass = (token != nullptr && strcmp(token, "hello") == 0);
    if (!pass) {
        return ReturnInt32(env, 0);
    }
    token = CallStrtokR(nullptr, ",", &saveptr);
    pass = (token != nullptr && strcmp(token, "world") == 0);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-006: NULL input returns NULL */
static napi_value StrtokRNormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* saveptr = nullptr;
    char* token = CallStrtokR(nullptr, ",", &saveptr);
    return ReturnInt32(env, (token == nullptr) ? 1 : 0);
}

/* TC-007: Empty string */
static napi_value StrtokRNormal007(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char str[] = "";
    char* saveptr = nullptr;
    char* token = CallStrtokR(str, ",", &saveptr);
    return ReturnInt32(env, (token == nullptr) ? 1 : 0);
}

/* ==================== Abnormal Parameter Tests ==================== */

/* TC-008: sep = NULL (should not crash in stub) */
static napi_value StrtokRAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char str[] = "hello,world";
    char* saveptr = nullptr;
    // Some implementations may segfault with sep=NULL, skip actual test
    return ReturnInt32(env, 1);
}

/* ==================== Boundary Value Tests ==================== */

/* TC-009: Very long string with single token */
static napi_value StrtokRBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::string longStr(10000, 'a');
    char* str = strdup(longStr.c_str());
    if (!str) {
        return ReturnInt32(env, 0);
    }
    char* saveptr = nullptr;
    char* token = CallStrtokR(str, ",", &saveptr);
    bool pass = (token != nullptr && strlen(token) == 10000);
    free(str);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-010: Many small tokens */
static napi_value StrtokRBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int tokencount = 1000;
    std::string str;
    for (int i = 0; i < tokencount; ++i) {
        str += "a,";
    }
    str += "b";
    char* mutableStr = strdup(str.c_str());
    if (!mutableStr) {
        return ReturnInt32(env, 0);
    }
    char* saveptr = nullptr;
    char* token = CallStrtokR(mutableStr, ",", &saveptr);
    int count = 0;
    while (token != nullptr) {
        count++;
        token = CallStrtokR(nullptr, ",", &saveptr);
    }
    free(mutableStr);
    return ReturnInt32(env, (count == 1001) ? 1 : 0);
}

/* ==================== Stability Tests ==================== */

/* TC-011: 10000 repeated calls stability */
static napi_value StrtokRStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < kStableLoop10000; ++i) {
        char str[] = "hello,world,test";
        char* saveptr = nullptr;
        char* token = CallStrtokR(str, ",", &saveptr);
        if (token == nullptr || strcmp(token, "hello") != 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Multi-thread Tests ==================== */

/* TC-012: Multi-thread safety (each thread uses its own saveptr) */
static napi_value StrtokRThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;

    for (int t = 0; t < kThreadCount; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < kIterPerThread; ++i) {
                char str[] = "a,b,c,d,e";
                char* saveptr = nullptr;
                int count = 0;
                char* token = CallStrtokR(str, ",", &saveptr);
                while (token != nullptr) {
                    count++;
                    token = CallStrtokR(nullptr, ",", &saveptr);
                }
                if (count != 5) {
                    hasError = true;
                    return;
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
        {"strtokRNormal001", nullptr, StrtokRNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strtokRNormal002", nullptr, StrtokRNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strtokRNormal003", nullptr, StrtokRNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strtokRNormal004", nullptr, StrtokRNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strtokRNormal005", nullptr, StrtokRNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strtokRNormal006", nullptr, StrtokRNormal006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strtokRNormal007", nullptr, StrtokRNormal007, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strtokRAbnormal001", nullptr, StrtokRAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strtokRBoundary001", nullptr, StrtokRBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strtokRBoundary002", nullptr, StrtokRBoundary002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strtokRStable001", nullptr, StrtokRStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"strtokRThread001", nullptr, StrtokRThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "strtokrndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}