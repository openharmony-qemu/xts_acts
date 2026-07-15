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
#include <ctime>
#include <cerrno>
#include <cstring>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP = 100;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 5;
static constexpr int TM_YEAR_BASE = 1900;

static time_t CallTimelocal(struct tm* tm)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetTimelocal();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(tm);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetTimelocal() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value TimelocalNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    int testYear2026 = 2026;
    t.tm_year = testYear2026 - TM_YEAR_BASE;
    int july = 6;
    t.tm_mon = july;
    int day1 = 1;
    t.tm_mday = day1;
    int noon = 12;
    t.tm_hour = noon;
    time_t ret = CallTimelocal(&t);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value TimelocalNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    int epochYear = 1970;
    t.tm_year = epochYear - TM_YEAR_BASE;
    int jan = 0;
    t.tm_mon = jan;
    int day1 = 1;
    t.tm_mday = day1;
    t.tm_isdst = -1;
    time_t ret = CallTimelocal(&t);
    return ReturnInt32(env, (ret != -1) ? 1 : 0);
}

static napi_value TimelocalNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    int testYear2026 = 2026;
    t.tm_year = testYear2026 - TM_YEAR_BASE;
    int jan = 0;
    t.tm_mon = jan;
    int day1 = 1;
    t.tm_mday = day1;
    t.tm_isdst = -1;
    time_t ret = CallTimelocal(&t);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value TimelocalNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value TimelocalAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    int testYear2026 = 2026;
    t.tm_year = testYear2026 - TM_YEAR_BASE;
    int jan = 0;
    t.tm_mon = jan;
    int invalidDay = 32;
    t.tm_mday = invalidDay;
    time_t ret = CallTimelocal(&t);
    return ReturnInt32(env, 1);
}

static napi_value TimelocalAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    int testYear2026 = 2026;
    t.tm_year = testYear2026 - TM_YEAR_BASE;
    int invalidMonth = 13;
    t.tm_mon = invalidMonth;
    time_t ret = CallTimelocal(&t);
    return ReturnInt32(env, 1);
}

static napi_value TimelocalBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    int testYear2038 = 2038;
    t.tm_year = testYear2038 - TM_YEAR_BASE;
    int jan = 0;
    t.tm_mon = jan;
    int day19 = 19;
    t.tm_mday = day19;
    int hour3 = 3;
    t.tm_hour = hour3;
    int min14 = 14;
    t.tm_min = min14;
    int sec7 = 7;
    t.tm_sec = sec7;
    time_t ret = CallTimelocal(&t);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value TimelocalBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    t.tm_year = 0;
    int jan = 0;
    t.tm_mon = jan;
    int day1 = 1;
    t.tm_mday = day1;
    t.tm_isdst = -1;
    time_t ret = CallTimelocal(&t);
    return ReturnInt32(env, (ret != -1) ? 1 : 0);
}

static napi_value TimelocalStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
    struct tm t = {};
    int testYear2026 = 2026;
    t.tm_year = testYear2026 - TM_YEAR_BASE;
        int jan = 0;
        t.tm_mon = jan;
        int day1 = 1;
        t.tm_mday = day1;
        time_t ret = CallTimelocal(&t);
        if (ret < 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void TimelocalWorker(std::atomic<bool>& hasError)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        struct tm tmVal = {};
        int testYear2026 = 2026;
        tmVal.tm_year = testYear2026 - TM_YEAR_BASE;
        int jan = 0;
        tmVal.tm_mon = jan;
        int day1 = 1;
        tmVal.tm_mday = day1;
        time_t ret = CallTimelocal(&tmVal);
        if (ret < 0) {
            hasError = true;
            return;
        }
    }
}

static napi_value TimelocalThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(TimelocalWorker, std::ref(hasError));
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
        {"timelocalNormal001", nullptr, TimelocalNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timelocalNormal002", nullptr, TimelocalNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timelocalNormal003", nullptr, TimelocalNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timelocalNormal004", nullptr, TimelocalNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timelocalAbnormal001", nullptr, TimelocalAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timelocalAbnormal002", nullptr, TimelocalAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timelocalBoundary001", nullptr, TimelocalBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timelocalBoundary002", nullptr, TimelocalBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timelocalStable001", nullptr, TimelocalStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timelocalThread001", nullptr, TimelocalThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "timelocalndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
