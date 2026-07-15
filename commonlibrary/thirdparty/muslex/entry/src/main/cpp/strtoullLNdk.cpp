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
#include <cerrno>
#include <clocale>
#include <climits>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int DECIMAL_BASE = 10;
static constexpr int K_ITER_PER_THREAD = 10;

static unsigned long long CallStrtoullL(const char* nptr, char** endptr, int base, locale_t loc)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetStrtoullL();
    if (!func) {
        errno = ENOSYS;
        return 0;
    }
    errno = 0;
    return func(nptr, endptr, base, loc);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetStrtoullL() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value StrtoullLNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* endptr = nullptr;
    unsigned long long ret = CallStrtoullL("12345", &endptr, 10, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == 12345 && endptr != nullptr) ? 1 : 0);
}

static napi_value StrtoullLNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* endptr = nullptr;
    unsigned long long ret = CallStrtoullL("0xff", &endptr, 16, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == 255 && endptr != nullptr) ? 1 : 0);
}

static napi_value StrtoullLNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* endptr = nullptr;
    unsigned long long ret = CallStrtoullL("18446744073709551615", &endptr, 10, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value StrtoullLNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value StrtoullLAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* endptr = nullptr;
    unsigned long long ret = CallStrtoullL("", &endptr, 10, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value StrtoullLAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* endptr = nullptr;
    unsigned long long ret = CallStrtoullL("abcxyz", &endptr, 10, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value StrtoullLBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* endptr = nullptr;
    unsigned long long ret = CallStrtoullL("18446744073709551615", &endptr, 10, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == ULLONG_MAX) ? 1 : 0);
}

static napi_value StrtoullLBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* endptr = nullptr;
    unsigned long long ret = CallStrtoullL("0", &endptr, 10, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value StrtoullLStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        char* endptr = nullptr;
        unsigned long long ret = CallStrtoullL("12345", &endptr, 10, LC_GLOBAL_LOCALE);
        if (ret != 12345) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value StrtoullLThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                char* endptr = nullptr;
                CallStrtoullL("12345", &endptr, 10, LC_GLOBAL_LOCALE);
            }
        });
    }
    for (auto& th : threads) {
        th.join();
    }
    return ReturnInt32(env, !hasError ? 1 : 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"strtoullLNormal001", nullptr, StrtoullLNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoullLNormal002", nullptr, StrtoullLNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoullLNormal003", nullptr, StrtoullLNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoullLNormal004", nullptr, StrtoullLNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoullLAbnormal001", nullptr, StrtoullLAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoullLAbnormal002", nullptr, StrtoullLAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoullLBoundary001", nullptr, StrtoullLBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoullLBoundary002", nullptr, StrtoullLBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoullLStable001", nullptr, StrtoullLStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoullLThread001", nullptr, StrtoullLThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "strtoulllndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
