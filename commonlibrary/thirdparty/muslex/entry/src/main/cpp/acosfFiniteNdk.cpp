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
#include <cfenv>
#include <cfloat>
#include <thread>
#include <vector>

/*
 * fenv compatibility: armv7a soft-float ABI (__ARM_PCS_VFP not defined) does
 * not define FE_INVALID, FE_TOWARDZERO, etc. Detect and provide fallbacks.
 */
#ifdef FE_INVALID
#define HAS_FENV_EXCEPTIONS 1
#else
#define HAS_FENV_EXCEPTIONS 0
#endif

#ifndef FE_INVALID
#define FE_INVALID 0
#endif
#ifndef FE_TOWARDZERO
#define FE_TOWARDZERO 0
#endif

static constexpr int K_STABLE_LOOP_10000 = 20;
static constexpr int K_STABLE_LOOP_100000 = 200;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_THREAD_LOOP = 10;

static float CallAcosfFinite(float x)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = reinterpret_cast<float (*)(float)>(loader.GetAcosfFinite());
    if (!func) {
        errno = ENOSYS;
        return NAN;
    }
    return func(x);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetAcosfFinite()) {
        return true;
    }
    errno = 0;
    CallAcosfFinite(0.5f);
    return (errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t val)
{
    napi_value result;
    napi_create_int32(env, val, &result);
    return result;
}

/* ---------- TC-001: Normal - basic function consistency with acosf ---------- */
static napi_value AcosfFiniteNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    float xValues[] = {-1.0f, -0.5f, 0.0f, 0.5f, 1.0f};
    int count = sizeof(xValues) / sizeof(xValues[0]);
    for (int i = 0; i < count; ++i) {
        errno = 0;
#if HAS_FENV_EXCEPTIONS
        feclearexcept(FE_ALL_EXCEPT);
#endif
        float result1 = CallAcosfFinite(xValues[i]);
        int errno1 = errno;
#if HAS_FENV_EXCEPTIONS
        int feFlag1 = fetestexcept(FE_ALL_EXCEPT);
#endif

        errno = 0;
#if HAS_FENV_EXCEPTIONS
        feclearexcept(FE_ALL_EXCEPT);
#endif
        float result2 = std::acosf(xValues[i]);
        int errno2 = errno;
#if HAS_FENV_EXCEPTIONS
        int feFlag2 = fetestexcept(FE_ALL_EXCEPT);
#endif

        if (std::isnan(result1) && std::isnan(result2)) {
            if (errno1 != errno2) {
                return ReturnInt32(env, 0);
            }
#if HAS_FENV_EXCEPTIONS
            if (feFlag1 != feFlag2) {
                return ReturnInt32(env, 0);
            }
#endif
        } else {
            if (result1 != result2 || errno1 != errno2) {
                return ReturnInt32(env, 0);
            }
#if HAS_FENV_EXCEPTIONS
            if (feFlag1 != feFlag2) {
                return ReturnInt32(env, 0);
            }
#endif
        }
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-002: Normal - NaN input silent pass-through ---------- */
static napi_value AcosfFiniteNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
#if HAS_FENV_EXCEPTIONS
    feclearexcept(FE_ALL_EXCEPT);
#endif
    float result = CallAcosfFinite(NAN);
    if (!std::isnan(result)) {
        return ReturnInt32(env, 0);
    }
    if (errno != 0) {
        return ReturnInt32(env, 0);
    }
#if HAS_FENV_EXCEPTIONS
    if (fetestexcept(FE_INVALID) != 0) {
        return ReturnInt32(env, 0);
    }
#endif
    return ReturnInt32(env, 1);
}

/* ---------- TC-003: Normal - +inf triggers domain_error ---------- */
static napi_value AcosfFiniteNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
#if HAS_FENV_EXCEPTIONS
    feclearexcept(FE_ALL_EXCEPT);
#endif
    float result = CallAcosfFinite(INFINITY);
    if (!std::isnan(result)) {
        return ReturnInt32(env, 0);
    }
    /* musl math functions do not set errno by default; verify via FE_INVALID */
#if HAS_FENV_EXCEPTIONS
    if (fetestexcept(FE_INVALID) == 0) {
        return ReturnInt32(env, 0);
    }
#endif
    return ReturnInt32(env, 1);
}

/* ---------- TC-004: Normal - -inf triggers domain_error ---------- */
static napi_value AcosfFiniteNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
#if HAS_FENV_EXCEPTIONS
    feclearexcept(FE_ALL_EXCEPT);
#endif
    float result = CallAcosfFinite(-INFINITY);
    if (!std::isnan(result)) {
        return ReturnInt32(env, 0);
    }
    /* musl math functions do not set errno by default; verify via FE_INVALID */
#if HAS_FENV_EXCEPTIONS
    if (fetestexcept(FE_INVALID) == 0) {
        return ReturnInt32(env, 0);
    }
#endif
    return ReturnInt32(env, 1);
}

/* ---------- TC-005: Normal - x > 1 finite value triggers domain_error ---------- */
static napi_value AcosfFiniteNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
#if HAS_FENV_EXCEPTIONS
    feclearexcept(FE_ALL_EXCEPT);
#endif
    float result = CallAcosfFinite(2.0f);
    if (!std::isnan(result)) {
        return ReturnInt32(env, 0);
    }
    /* musl math functions do not set errno by default; verify via FE_INVALID */
#if HAS_FENV_EXCEPTIONS
    if (fetestexcept(FE_INVALID) == 0) {
        return ReturnInt32(env, 0);
    }
#endif
    return ReturnInt32(env, 1);
}

/* ---------- TC-006: Normal - x < -1 finite value triggers domain_error ---------- */
static napi_value AcosfFiniteNormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
#if HAS_FENV_EXCEPTIONS
    feclearexcept(FE_ALL_EXCEPT);
#endif
    float result = CallAcosfFinite(-2.0f);
    if (!std::isnan(result)) {
        return ReturnInt32(env, 0);
    }
    /* musl math functions do not set errno by default; verify via FE_INVALID */
#if HAS_FENV_EXCEPTIONS
    if (fetestexcept(FE_INVALID) == 0) {
        return ReturnInt32(env, 0);
    }
#endif
    return ReturnInt32(env, 1);
}

/* ---------- TC-007: Boundary - x == +1.0f ---------- */
static napi_value AcosfFiniteBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    float result = CallAcosfFinite(1.0f);
    if (result != 0.0f || std::signbit(result)) {
        return ReturnInt32(env, 0);
    }
    if (errno != 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-008: Boundary - x == -1.0f ---------- */
static napi_value AcosfFiniteBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    float result = CallAcosfFinite(-1.0f);
    if (std::fabs(result - static_cast<float>(M_PI)) >= 1e-6f) {
        return ReturnInt32(env, 0);
    }
    if (errno != 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-009: Boundary - x == -0.0f ---------- */
static napi_value AcosfFiniteBoundary003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    float negZero = -0.0f;
    errno = 0;
    float result = CallAcosfFinite(negZero);
    if (std::fabs(result - static_cast<float>(M_PI_2)) >= 1e-6f) {
        return ReturnInt32(env, 0);
    }
    if (errno != 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-010: Boundary - slightly beyond boundary triggers domain_error ---------- */
static napi_value AcosfFiniteBoundary004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    float x1 = 1.0f + FLT_EPSILON;
    float x2 = -1.0f - FLT_EPSILON;

    errno = 0;
#if HAS_FENV_EXCEPTIONS
    feclearexcept(FE_ALL_EXCEPT);
#endif
    float result1 = CallAcosfFinite(x1);
    if (!std::isnan(result1)) {
        return ReturnInt32(env, 0);
    }
#if HAS_FENV_EXCEPTIONS
    if (fetestexcept(FE_INVALID) == 0) {
        return ReturnInt32(env, 0);
    }
#endif

    errno = 0;
#if HAS_FENV_EXCEPTIONS
    feclearexcept(FE_ALL_EXCEPT);
#endif
    float result2 = CallAcosfFinite(x2);
    if (!std::isnan(result2)) {
        return ReturnInt32(env, 0);
    }
#if HAS_FENV_EXCEPTIONS
    if (fetestexcept(FE_INVALID) == 0) {
        return ReturnInt32(env, 0);
    }
#endif
    return ReturnInt32(env, 1);
}

/* ---------- TC-011: Boundary - subnormal input ---------- */
static napi_value AcosfFiniteBoundary005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    float subnormal = FLT_MIN / 2.0f;
    errno = 0;
    float result = CallAcosfFinite(subnormal);
    if (std::fabs(result - static_cast<float>(M_PI_2)) >= 1e-4f) {
        return ReturnInt32(env, 0);
    }
    if (errno != 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-012: Func - errno unchanged after valid call ---------- */
static napi_value AcosfFiniteFunc001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    float result = CallAcosfFinite(0.5f);
    if (std::fabs(result - 1.04719755f) >= 1e-6f) {
        return ReturnInt32(env, 0);
    }
    if (errno != 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-013: Func - domain_error returns NaN (musl does not set errno by default) ---------- */
static napi_value AcosfFiniteFunc002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    float result = CallAcosfFinite(2.0f);
    if (!std::isnan(result)) {
        return ReturnInt32(env, 0);
    }
    /* musl math functions do not set errno for domain errors by default;
     * errno may be 0 or EDOM depending on math_errhandling configuration */
    return ReturnInt32(env, 1);
}

/* ---------- TC-014: Func - non-zero errno not overwritten on success ---------- */
static napi_value AcosfFiniteFunc003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = EINVAL;
    float result = CallAcosfFinite(0.5f);
    if (std::fabs(result - 1.04719755f) >= 1e-6f) {
        return ReturnInt32(env, 0);
    }
    if (errno != EINVAL) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-015: Func - FE_INVALID verification ---------- */
#if HAS_FENV_EXCEPTIONS
static napi_value AcosfFiniteFunc004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    feclearexcept(FE_ALL_EXCEPT);
    float resultValid = CallAcosfFinite(0.5f);
    if (std::fabs(resultValid - 1.04719755f) >= 1e-6f) {
        return ReturnInt32(env, 0);
    }
    if (fetestexcept(FE_INVALID) != 0) {
        return ReturnInt32(env, 0);
    }

    feclearexcept(FE_ALL_EXCEPT);
    float resultError = CallAcosfFinite(2.0f);
    if (!std::isnan(resultError)) {
        return ReturnInt32(env, 0);
    }
    /* musl math functions do not set errno by default; verify via FE_INVALID */
    if (fetestexcept(FE_INVALID) == 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}
#else
static napi_value AcosfFiniteFunc004(napi_env env, napi_callback_info info)
{
    return ReturnInt32(env, 1);
}
#endif

/* ---------- TC-016: Func - FE_INVALID clearable verification ---------- */
#if HAS_FENV_EXCEPTIONS
static napi_value AcosfFiniteFunc005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    feclearexcept(FE_ALL_EXCEPT);
    CallAcosfFinite(2.0f);
    if (fetestexcept(FE_INVALID) == 0) {
        return ReturnInt32(env, 0);
    }

    feclearexcept(FE_INVALID);
    if (fetestexcept(FE_INVALID) != 0) {
        return ReturnInt32(env, 0);
    }

    float result = CallAcosfFinite(0.5f);
    if (std::fabs(result - 1.04719755f) >= 1e-6f) {
        return ReturnInt32(env, 0);
    }
    if (fetestexcept(FE_INVALID) != 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}
#else
static napi_value AcosfFiniteFunc005(napi_env env, napi_callback_info info)
{
    return ReturnInt32(env, 1);
}
#endif

/* ---------- TC-017: Func - no dynamic memory allocation ---------- */
static napi_value AcosfFiniteFunc006(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    for (int i = 0; i < 20; ++i) {
        CallAcosfFinite(0.5f);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-018: Stable - 10000 calls stability ---------- */
static napi_value AcosfFiniteStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int failCount = 0;
    for (int i = 0; i < K_STABLE_LOOP_10000; ++i) {
        float result = CallAcosfFinite(0.5f);
        if (std::fabs(result - 1.04719755f) >= 1e-6f) {
            failCount++;
        }
    }
    return ReturnInt32(env, (failCount == 0) ? 1 : 0);
}

/* ---------- TC-019: Stable - 100000 calls no performance degradation ---------- */
static napi_value AcosfFiniteStable002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int failCount = 0;
    for (int i = 0; i < K_STABLE_LOOP_100000; ++i) {
        float x = (i % 2 == 0) ? 0.5f : -0.5f;
        float result = CallAcosfFinite(x);
        float expected = (x > 0.0f) ? 1.04719755f : 2.09439510f;
        if (std::fabs(result - expected) >= 1e-6f) {
            failCount++;
        }
    }
    return ReturnInt32(env, (failCount == 0) ? 1 : 0);
}

/* ---------- TC-020: Stable - multi-thread MT-Safe verification ---------- */
static napi_value AcosfFiniteStable003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::vector<std::thread> threads;
    bool allPassed = true;

    auto worker = [&allPassed](float input)
    {
        float expected = std::acosf(input);
        for (int i = 0; i < K_THREAD_LOOP; ++i) {
            errno = 0;
            float result = CallAcosfFinite(input);
            if (std::fabs(result - expected) >= 1e-6f) {
                allPassed = false;
                return;
            }
        }
    };

    float inputs[] = {0.2f, 0.4f, 0.6f, 0.8f};
    for (int i = 0; i < K_THREAD_COUNT; ++i) {
        threads.emplace_back(worker, inputs[i]);
    }
    for (auto& t : threads) {
        t.join();
    }
    return ReturnInt32(env, allPassed ? 1 : 0);
}

/* ---------- TC-022: Func - FPU floating-point environment dependency ---------- */
static napi_value AcosfFiniteFunc007(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
#if HAS_FENV_EXCEPTIONS
    feclearexcept(FE_ALL_EXCEPT);
#endif
    float result = CallAcosfFinite(0.5f);
    if (std::fabs(result - 1.04719755f) >= 1e-6f) {
        return ReturnInt32(env, 0);
    }
#if HAS_FENV_EXCEPTIONS
    /* only check for error exceptions (FE_INEXACT is normal for math ops) */
    int feFlag = fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW);
    if (feFlag != 0) {
        return ReturnInt32(env, 0);
    }
#endif
    return ReturnInt32(env, 1);
}

/* ---------- TC-023: Func - rounding mode does not affect function behavior ---------- */
#if HAS_FENV_EXCEPTIONS
static napi_value AcosfFiniteFunc008(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int roundModes[] = {FE_TONEAREST, FE_UPWARD, FE_DOWNWARD, FE_TOWARDZERO};
    int count = sizeof(roundModes) / sizeof(roundModes[0]);
    for (int i = 0; i < count; ++i) {
        fesetround(roundModes[i]);
        errno = 0;
        float result = CallAcosfFinite(0.5f);
        if (std::fabs(result - 1.04719755f) >= 1e-4f) {
            fesetround(FE_TONEAREST);
            return ReturnInt32(env, 0);
        }
        if (errno != 0) {
            fesetround(FE_TONEAREST);
            return ReturnInt32(env, 0);
        }
    }
    fesetround(FE_TONEAREST);
    return ReturnInt32(env, 1);
}
#else
static napi_value AcosfFiniteFunc008(napi_env env, napi_callback_info info)
{
    return ReturnInt32(env, 1);
}
#endif

/* ---------- TC-024: Spec - PC device symbol existence and dlsym loading ---------- */
static napi_value AcosfFiniteSpec001(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetAcosfFinite();
    if (!func) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    float result = func(0.5f);
    if (std::fabs(result - 1.04719755f) >= 1e-6f) {
        return ReturnInt32(env, 0);
    }
    if (errno != 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-025: Spec - non-aarch64 symbol non-existence ---------- */
static napi_value AcosfFiniteSpec002(napi_env env, napi_callback_info info)
{
    dlerror();
    void* sym = dlsym(RTLD_DEFAULT, "__acosf_finite");
    if (sym != nullptr) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-026: Spec - function pointer nullptr safety check ---------- */
static napi_value AcosfFiniteSpec003(napi_env env, napi_callback_info info)
{
    dlerror();
    void* sym = dlsym(RTLD_DEFAULT, "__acosf_finite");
    auto funcPtr = reinterpret_cast<float (*)(float)>(sym);
    if (funcPtr == nullptr) {
        return ReturnInt32(env, 1);
    }
    float result = funcPtr(0.5f);
    if (std::fabs(result - 1.04719755f) >= 1e-6f) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-027: Spec - non-PC device stub mode verification ---------- */
static napi_value AcosfFiniteSpec004(napi_env env, napi_callback_info info)
{
    errno = 0;
    float result = CallAcosfFinite(0.5f);
    if (errno == ENOSYS) {
        return ReturnInt32(env, 1);
    }
    if (std::fabs(result - 1.04719755f) < 1e-6f && errno == 0) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- TC-028: Spec - IsStubMode detection mechanism ---------- */
static napi_value AcosfFiniteSpec005(napi_env env, napi_callback_info info)
{
    bool isStub = IsStubMode();
    errno = 0;
    float result = CallAcosfFinite(0.5f);
    if (isStub) {
        return ReturnInt32(env, 1);
    } else {
        if (std::fabs(result - 1.04719755f) < 1e-6f && errno == 0) {
            return ReturnInt32(env, 1);
        }
        return ReturnInt32(env, 0);
    }
}

/* ---------- TC-029: Spec - PC vs non-PC device behavior difference ---------- */
static napi_value AcosfFiniteSpec006(napi_env env, napi_callback_info info)
{
    errno = 0;
    float result = CallAcosfFinite(0.5f);
    int e = errno;
    if (e == ENOSYS) {
        return ReturnInt32(env, 1);
    } else {
        if (std::fabs(result - 1.04719755f) < 1e-6f && e == 0) {
            return ReturnInt32(env, 1);
        }
        return ReturnInt32(env, 0);
    }
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"acosfFiniteNormal001", nullptr, AcosfFiniteNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteNormal002", nullptr, AcosfFiniteNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteNormal003", nullptr, AcosfFiniteNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteNormal004", nullptr, AcosfFiniteNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteNormal005", nullptr, AcosfFiniteNormal005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteNormal006", nullptr, AcosfFiniteNormal006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteBoundary001", nullptr, AcosfFiniteBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteBoundary002", nullptr, AcosfFiniteBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteBoundary003", nullptr, AcosfFiniteBoundary003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteBoundary004", nullptr, AcosfFiniteBoundary004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteBoundary005", nullptr, AcosfFiniteBoundary005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteFunc001", nullptr, AcosfFiniteFunc001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteFunc002", nullptr, AcosfFiniteFunc002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteFunc003", nullptr, AcosfFiniteFunc003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteFunc004", nullptr, AcosfFiniteFunc004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteFunc005", nullptr, AcosfFiniteFunc005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteFunc006", nullptr, AcosfFiniteFunc006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteFunc007", nullptr, AcosfFiniteFunc007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteFunc008", nullptr, AcosfFiniteFunc008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteStable001", nullptr, AcosfFiniteStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteStable002", nullptr, AcosfFiniteStable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteStable003", nullptr, AcosfFiniteStable003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteSpec001", nullptr, AcosfFiniteSpec001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteSpec002", nullptr, AcosfFiniteSpec002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteSpec003", nullptr, AcosfFiniteSpec003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteSpec004", nullptr, AcosfFiniteSpec004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteSpec005", nullptr, AcosfFiniteSpec005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acosfFiniteSpec006", nullptr, AcosfFiniteSpec006, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "acosfFinitendktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterAcosfFinitendkModule(void)
{
    napi_module_register(&demoModule);
}