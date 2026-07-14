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

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr int TM_YEAR_BASE = 1900;

static time_t CallMktimeNoenv(struct tm* tm)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetMktimeNoenv();
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
    return (loader.GetMktimeNoenv() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value MktimeNoenvNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    int testYear = 2026;
    t.tm_year = testYear - TM_YEAR_BASE;
    int july = 6;
    t.tm_mon = july;
    int day1 = 1;
    t.tm_mday = day1;
    int noon = 12;
    t.tm_hour = noon;
    time_t ret = CallMktimeNoenv(&t);
    return ReturnInt32(env, (ret != -1 || errno != EOVERFLOW) ? 1 : 0);
}

static napi_value MktimeNoenvNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    int epochYear = 1970;
    t.tm_year = epochYear - TM_YEAR_BASE;
    t.tm_mon = 0;
    t.tm_mday = 1;
    time_t ret = CallMktimeNoenv(&t);
    return ReturnInt32(env, (ret != -1 || errno != EOVERFLOW) ? 1 : 0);
}

static napi_value MktimeNoenvNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    int testYear = 2050;
    t.tm_year = testYear - TM_YEAR_BASE;
    int december = 11;
    t.tm_mon = december;
    int lastday = 31;
    t.tm_mday = lastday;
    time_t ret = CallMktimeNoenv(&t);
    return ReturnInt32(env, (ret != -1 || errno != EOVERFLOW) ? 1 : 0);
}

static napi_value MktimeNoenvNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value MktimeNoenvAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    int testYear = 2026;
    t.tm_year = testYear - TM_YEAR_BASE;
    t.tm_mon = 0;
    int invaliddom = 32;
    t.tm_mday = invaliddom;
    time_t ret = CallMktimeNoenv(&t);
    return ReturnInt32(env, 1);
}

static napi_value MktimeNoenvAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    t.tm_year = -1;
    t.tm_mon = -1;
    t.tm_mday = -1;
    time_t ret = CallMktimeNoenv(&t);
    return ReturnInt32(env, 1);
}

static napi_value MktimeNoenvBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    int testYear = 2038;
    t.tm_year = testYear - TM_YEAR_BASE;
    t.tm_mon = 0;
    int boundaryDay = 19;
    t.tm_mday = boundaryDay;
    int boundaryHour = 3;
    t.tm_hour = boundaryHour;
    int boundaryMin = 14;
    t.tm_min = boundaryMin;
    int testsec = 7;
    t.tm_sec = testsec;
    time_t ret = CallMktimeNoenv(&t);
    return ReturnInt32(env, (ret != -1 || errno != EOVERFLOW) ? 1 : 0);
}

static napi_value MktimeNoenvBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct tm t = {};
    t.tm_year = 0;
    t.tm_mon = 0;
    t.tm_mday = 1;
    time_t ret = CallMktimeNoenv(&t);
    return ReturnInt32(env, (ret != -1 || errno != EOVERFLOW) ? 1 : 0);
}

static napi_value MktimeNoenvStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        struct tm t = {};
        int testYear = 2026;
    t.tm_year = testYear - TM_YEAR_BASE;
        t.tm_mon = 0;
        t.tm_mday = 1;
        time_t ret = CallMktimeNoenv(&t);
        if (ret == -1 && errno == EOVERFLOW) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value MktimeNoenvThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                struct tm tmVal = {};
                int testYear = 2026;
    tmVal.tm_year = testYear - TM_YEAR_BASE;
                tmVal.tm_mon = 0;
                tmVal.tm_mday = 1;
                time_t ret = CallMktimeNoenv(&tmVal);
                if (ret == -1 && errno == EOVERFLOW) {
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

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"mktimeNoenvNormal001", nullptr, MktimeNoenvNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mktimeNoenvNormal002", nullptr, MktimeNoenvNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mktimeNoenvNormal003", nullptr, MktimeNoenvNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mktimeNoenvNormal004", nullptr, MktimeNoenvNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mktimeNoenvAbnormal001", nullptr, MktimeNoenvAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mktimeNoenvAbnormal002", nullptr, MktimeNoenvAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mktimeNoenvBoundary001", nullptr, MktimeNoenvBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mktimeNoenvBoundary002", nullptr, MktimeNoenvBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mktimeNoenvStable001", nullptr, MktimeNoenvStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mktimeNoenvThread001", nullptr, MktimeNoenvThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "mktimenoenvndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
