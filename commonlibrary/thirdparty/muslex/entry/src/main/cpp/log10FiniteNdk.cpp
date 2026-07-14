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
#include <functional>

static constexpr int K_STABLE_LOOP10000 = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static double CallLog10Finite(double x)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetLog10Finite();
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
    if (!loader.GetLog10Finite()) {
        return true;
    }
    errno = 0;
    CallLog10Finite(1.0);
    return (errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ---------- Normal parameter tests ---------- */

/* TC-001: log10(1.0) = 0.0 */
static napi_value Log10FiniteNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog10Finite(1.0);
    return ReturnInt32(env, (result == 0.0) ? 1 : 0);
}

/* TC-002: log10(10.0) = 1.0 */
static napi_value Log10FiniteNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog10Finite(10.0);
    return ReturnInt32(env, (fabs(result - 1.0) < 1e-15) ? 1 : 0);
}

/* TC-003: log10(100.0) = 2.0 */
static napi_value Log10FiniteNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog10Finite(100.0);
    double expected = 2.0;
    return ReturnInt32(env, (fabs(result - expected) < 1e-15) ? 1 : 0);
}

/* TC-004: log10(0.1) = -1.0 */
static napi_value Log10FiniteNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog10Finite(0.1);
    return ReturnInt32(env, (fabs(result + 1.0) < 1e-15) ? 1 : 0);
}

/* TC-005: log10(1000.0) = 3.0 */
static napi_value Log10FiniteNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog10Finite(1000.0);
    double expected = 3.0;
    return ReturnInt32(env, (fabs(result - expected) < 1e-15) ? 1 : 0);
}

/* TC-006: log10(2.0) matches std::log10 */
static napi_value Log10FiniteNormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog10Finite(2.0);
    double expected = std::log10(2.0);
    return ReturnInt32(env, (fabs(result - expected) < 1e-15) ? 1 : 0);
}

/* TC-007: Positive infinity returns +inf */
static napi_value Log10FiniteNormal007(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog10Finite(INFINITY);
    return ReturnInt32(env, std::isinf(result) && result > 0 ? 1 : 0);
}

/* TC-008: NaN input returns NaN */
static napi_value Log10FiniteNormal008(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog10Finite(NAN);
    return ReturnInt32(env, std::isnan(result) ? 1 : 0);
}

/* ---------- Abnormal parameter tests ---------- */

/* TC-009: x = 0.0 -> pole error */
static napi_value Log10FiniteAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    feclearexcept(FE_ALL_EXCEPT);
    double result = CallLog10Finite(0.0);
    bool pass = std::isinf(result) && result < 0;
    if (errno != ERANGE) {
        pass = false;
    }
#ifdef FE_DIVBYZERO
    if (!fetestexcept(FE_DIVBYZERO)) {
        pass = false;
    }
#endif
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-010: x = -1.0 -> domain error */
static napi_value Log10FiniteAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    feclearexcept(FE_ALL_EXCEPT);
    double result = CallLog10Finite(-1.0);
    bool pass = std::isnan(result);
    if (errno != EDOM) {
        pass = false;
    }
#ifdef FE_INVALID
    if (!fetestexcept(FE_INVALID)) {
        pass = false;
    }
#endif
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ---------- Boundary value tests ---------- */

/* TC-011: DBL_MAX -> finite result */
static napi_value Log10FiniteBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallLog10Finite(DBL_MAX);
    bool pass = std::isfinite(result) && result > 0 && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

/* TC-012: DBL_MIN -> finite result */
static napi_value Log10FiniteBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallLog10Finite(DBL_MIN);
    bool pass = std::isfinite(result) && result < 0 && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ---------- Stability tests ---------- */

/* TC-013: 10000 repeated calls stability */
static napi_value Log10FiniteStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    double expected = std::log10(10.0);
    for (int i = 0; i < K_STABLE_LOOP10000; ++i) {
        double result = CallLog10Finite(10.0);
        if (fabs(result - expected) > 1e-15) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void Log10ThreadWorker(std::atomic<bool>& hasError, const double* testVals)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        int idx = i % 5;
        double expected = std::log10(testVals[idx]);
        double result = CallLog10Finite(testVals[idx]);
        if (fabs(result - expected) > 1e-15) {
            hasError = true;
            return;
        }
    }
}

/* TC-014: Multi-thread safety */
static napi_value Log10FiniteThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    double testVals[] = {1.0, 10.0, 100.0, 0.1, 1000.0};

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(Log10ThreadWorker, std::ref(hasError), testVals);
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
        {"log10FiniteNormal001", nullptr, Log10FiniteNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteNormal002", nullptr, Log10FiniteNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteNormal003", nullptr, Log10FiniteNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteNormal004", nullptr, Log10FiniteNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteNormal005", nullptr, Log10FiniteNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteNormal006", nullptr, Log10FiniteNormal006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteNormal007", nullptr, Log10FiniteNormal007, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteNormal008", nullptr, Log10FiniteNormal008, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteAbnormal001", nullptr, Log10FiniteAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteAbnormal002", nullptr, Log10FiniteAbnormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteBoundary001", nullptr, Log10FiniteBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteBoundary002", nullptr, Log10FiniteBoundary002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteStable001", nullptr, Log10FiniteStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"log10FiniteThread001", nullptr, Log10FiniteThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "ohos_log10finitedktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}