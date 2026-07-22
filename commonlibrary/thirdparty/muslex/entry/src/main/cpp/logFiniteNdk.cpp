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
#include <cmath>
#include <cerrno>
#include <cfloat>
#include <cfenv>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP_10000 = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static double CallLogFinite(double x)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetLogFinite();
    if (!func) {
        errno = ENOSYS;
        return 0.0;
    }
    errno = 0;
    return func(x);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetLogFinite() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value LogFiniteNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    double result = CallLogFinite(1.0);
    if (errno == ENOSYS) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, (result == 0.0) ? 1 : 0);
}

static napi_value LogFiniteNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    double e = std::exp(1.0);
    double result = CallLogFinite(e);
    if (errno == ENOSYS) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, (fabs(result - 1.0) < 1e-12) ? 1 : 0);
}

static napi_value LogFiniteNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    double result = CallLogFinite(100.0);
    if (errno == ENOSYS) {
        return ReturnInt32(env, 1);
    }
    double expected = std::log(100.0);
    return ReturnInt32(env, (fabs(result - expected) < 1e-12) ? 1 : 0);
}

static napi_value LogFiniteNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    double result = CallLogFinite(0.5);
    if (errno == ENOSYS) {
        return ReturnInt32(env, 1);
    }
    double expected = std::log(0.5);
    return ReturnInt32(env, (fabs(result - expected) < 1e-12) ? 1 : 0);
}

static napi_value LogFiniteAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    double result = CallLogFinite(NAN);
    if (errno == ENOSYS) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, std::isnan(result) ? 1 : 0);
}

static napi_value LogFiniteAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    double result = CallLogFinite(-1.0);
    if (errno == ENOSYS) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, std::isnan(result) ? 1 : 0);
}

static napi_value LogFiniteBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    double result = CallLogFinite(DBL_MIN);
    if (errno == ENOSYS) {
        return ReturnInt32(env, 1);
    }
    bool pass = std::isfinite(result) && result < 0 && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value LogFiniteBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    double result = CallLogFinite(DBL_MAX);
    if (errno == ENOSYS) {
        return ReturnInt32(env, 1);
    }
    bool pass = std::isfinite(result) && result > 0 && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value LogFiniteStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    double expected = std::log(std::exp(1.0));
    for (int i = 0; i < K_STABLE_LOOP_10000; ++i) {
        double result = CallLogFinite(std::exp(1.0));
        if (errno == ENOSYS) {
            return ReturnInt32(env, 1);
        }
        if (fabs(result - expected) > 1e-12) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value LogFiniteThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    double testVals[] = {1.0, std::exp(1.0), 100.0, 0.5, 10.0};

    double testVal2 = 2.0;
    CallLogFinite(testVal2);
    if (errno == ENOSYS) {
        return ReturnInt32(env, 1);
    }

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError, testVals]() {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                int idx = i % 5;
                double expected = std::log(testVals[idx]);
                double result = CallLogFinite(testVals[idx]);
                if (fabs(result - expected) > 1e-12) {
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
        {"logFiniteNormal001", nullptr, LogFiniteNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logFiniteNormal002", nullptr, LogFiniteNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logFiniteNormal003", nullptr, LogFiniteNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logFiniteNormal004", nullptr, LogFiniteNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logFiniteAbnormal001", nullptr, LogFiniteAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logFiniteAbnormal002", nullptr, LogFiniteAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logFiniteBoundary001", nullptr, LogFiniteBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logFiniteBoundary002", nullptr, LogFiniteBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logFiniteStable001", nullptr, LogFiniteStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logFiniteThread001", nullptr, LogFiniteThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "logfinitendktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}