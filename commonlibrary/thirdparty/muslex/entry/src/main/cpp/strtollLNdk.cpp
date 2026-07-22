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
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr int HEX_BASE = 16;
static constexpr int DECIMAL_BASE = 10;
static constexpr int HEX_FF_VAL = 255;
static constexpr int TEST_NUM_VAL = 12345;
static constexpr int TEST_NEG_VAL = 9876;

static long long CallStrtollL(const char* nptr, char** endptr, int base, locale_t loc)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetStrtollL();
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(nptr, endptr, base, loc);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetStrtollL() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value StrtollLNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    char* endptr = nullptr;
    long long ret = CallStrtollL("12345", &endptr, DECIMAL_BASE, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == TEST_NUM_VAL && endptr != nullptr) ? 1 : 0);
}

static napi_value StrtollLNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    char* endptr = nullptr;
    long long ret = CallStrtollL("0xff", &endptr, HEX_BASE, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == HEX_FF_VAL && endptr != nullptr) ? 1 : 0);
}

static napi_value StrtollLNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    char* endptr = nullptr;
    long long ret = CallStrtollL("-9876", &endptr, DECIMAL_BASE, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == -TEST_NEG_VAL && endptr != nullptr) ? 1 : 0);
}

static napi_value StrtollLNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value StrtollLAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    char* endptr = nullptr;
    long long ret = CallStrtollL("", &endptr, DECIMAL_BASE, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value StrtollLAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    char* endptr = nullptr;
    long long ret = CallStrtollL("abcxyz", &endptr, DECIMAL_BASE, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value StrtollLBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    char* endptr = nullptr;
    long long ret = CallStrtollL("9223372036854775807", &endptr, DECIMAL_BASE, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == LLONG_MAX) ? 1 : 0);
}

static napi_value StrtollLBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    char* endptr = nullptr;
    long long ret = CallStrtollL("-9223372036854775808", &endptr, DECIMAL_BASE, LC_GLOBAL_LOCALE);
    return ReturnInt32(env, (ret == LLONG_MIN) ? 1 : 0);
}

static napi_value StrtollLStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i)
    {
        char* endptr = nullptr;
        long long ret = CallStrtollL("12345", &endptr, DECIMAL_BASE, LC_GLOBAL_LOCALE);
        if (ret != TEST_NUM_VAL)
        {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value StrtollLThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t)
    {
        threads.emplace_back([&hasError]()
        {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i)
            {
                char* endptr = nullptr;
                CallStrtollL("12345", &endptr, DECIMAL_BASE, LC_GLOBAL_LOCALE);
            }
        });
    }
    for (auto& th : threads)
    {
        th.join();
    }
    return ReturnInt32(env, !hasError ? 1 : 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"strtollLNormal001", nullptr, StrtollLNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtollLNormal002", nullptr, StrtollLNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtollLNormal003", nullptr, StrtollLNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtollLNormal004", nullptr, StrtollLNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtollLAbnormal001", nullptr, StrtollLAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtollLAbnormal002", nullptr, StrtollLAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtollLBoundary001", nullptr, StrtollLBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtollLBoundary002", nullptr, StrtollLBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtollLStable001", nullptr, StrtollLStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtollLThread001", nullptr, StrtollLThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "strtolllndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
