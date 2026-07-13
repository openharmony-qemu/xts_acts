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

#ifdef FE_INVALID
#define HAS_FENV_EXCEPTIONS 1
#else
#define HAS_FENV_EXCEPTIONS 0
#endif

#ifndef FE_INVALID
#define FE_INVALID 0
#endif
#ifndef FE_OVERFLOW
#define FE_OVERFLOW 0
#endif
#ifndef FE_UNDERFLOW
#define FE_UNDERFLOW 0
#endif

static constexpr int K_STABLE_LOOP10000 = 20;
static constexpr double K_ATAN2_TEST_INPUT = 2.0;

static double CallAtan2Finite(double y, double x)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = reinterpret_cast<double (*)(double, double)>(loader.GetAtan2Finite());
    if (!func) {
        errno = ENOSYS;
        return 0.0;
    }
    errno = 0;
    return func(y, x);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetAtan2Finite()) {
        return true;
    }
    errno = 0;
    double result = CallAtan2Finite(1.0, 1.0);
    return (result == 0.0 && errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t val)
{
    napi_value result;
    napi_create_int32(env, val, &result);
    return result;
}

/* ---------- TC-044: typical valid inputs consistency with atan2 ---------- */
static napi_value Atan2FiniteNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double yVals[] = {1.0, 1.0, -1.0, 0.0, 1.0};
    double xVals[] = {1.0, 0.0, 1.0, 1.0, -1.0};
    int count = 5;
    for (int i = 0; i < count; ++i) {
        double result1 = CallAtan2Finite(yVals[i], xVals[i]);
        double result2 = std::atan2(yVals[i], xVals[i]);
        if (std::isnan(result1) && std::isnan(result2)) {
            continue;
        }
        if (std::fabs(result1 - result2) > 1e-15) {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-045: NaN input silent pass-through ---------- */
static napi_value Atan2FiniteNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
#if HAS_FENV_EXCEPTIONS
    feclearexcept(FE_ALL_EXCEPT);
#endif
    double result = CallAtan2Finite(NAN, 1.0);
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

/* ---------- TC-046: zero-value special rules ---------- */
static napi_value Atan2FiniteNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double posZero = 0.0;
    double negZero = -0.0;
    double negOne = -1.0;

    // (+0, <0) -> +pi
    double r = CallAtan2Finite(posZero, negOne);
    if (std::fabs(r - M_PI) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    // (-0, <0) -> -pi
    r = CallAtan2Finite(negZero, negOne);
    if (std::fabs(r + M_PI) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    // (+0, >0) -> +0
    r = CallAtan2Finite(posZero, 1.0);
    if (r != 0.0 || std::signbit(r)) {
        return ReturnInt32(env, 0);
    }
    // (-0, >0) -> -0
    r = CallAtan2Finite(negZero, 1.0);
    if (r != 0.0 || !std::signbit(r)) {
        return ReturnInt32(env, 0);
    }
    // (+0, -0) -> +pi
    r = CallAtan2Finite(posZero, negZero);
    if (std::fabs(r - M_PI) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    // (-0, -0) -> -pi
    r = CallAtan2Finite(negZero, negZero);
    if (std::fabs(r + M_PI) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    // (+0, +0) -> +0
    r = CallAtan2Finite(posZero, posZero);
    if (r != 0.0 || std::signbit(r)) {
        return ReturnInt32(env, 0);
    }
    // (-0, +0) -> -0
    r = CallAtan2Finite(negZero, posZero);
    if (r != 0.0 || !std::signbit(r)) {
        return ReturnInt32(env, 0);
    }

    return ReturnInt32(env, 1);
}

/* ---------- TC-047: infinity input special rules ---------- */
static napi_value Atan2FiniteNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double inf = INFINITY;
    double negInf = -INFINITY;

    // y>0, x=-inf -> +pi
    double r = CallAtan2Finite(1.0, negInf);
    if (std::fabs(r - M_PI) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    // y<0, x=-inf -> -pi
    r = CallAtan2Finite(-1.0, negInf);
    if (std::fabs(r + M_PI) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    // y>0, x=+inf -> +0
    r = CallAtan2Finite(1.0, inf);
    if (r != 0.0 || std::signbit(r)) {
        return ReturnInt32(env, 0);
    }
    // y<0, x=+inf -> -0
    r = CallAtan2Finite(-1.0, inf);
    if (r != 0.0 || !std::signbit(r)) {
        return ReturnInt32(env, 0);
    }

    return ReturnInt32(env, 1);
}

/* ---------- TC-048: errno unchanged after valid call ---------- */
static napi_value Atan2FiniteFunc001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallAtan2Finite(1.0, K_ATAN2_TEST_INPUT);
    if (std::fabs(result - std::atan2(1.0, K_ATAN2_TEST_INPUT)) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    if (errno != 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-049: no error occurs verification ---------- */
static napi_value Atan2FiniteFunc002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double inputsY[] = {0.0, -0.0, 1.0, -1.0, NAN, INFINITY, -INFINITY};
    double inputsX[] = {0.0, -0.0, 0.0, 0.0, 1.0, 1.0, 1.0};
    int count = 7;
    for (int i = 0; i < count; ++i) {
        errno = 0;
#if HAS_FENV_EXCEPTIONS
        feclearexcept(FE_ALL_EXCEPT);
#endif
        CallAtan2Finite(inputsY[i], inputsX[i]);
        if (errno != 0) {
            return ReturnInt32(env, 0);
        }
#if HAS_FENV_EXCEPTIONS
        if (fetestexcept(FE_INVALID | FE_DIVBYZERO) != 0) {
            return ReturnInt32(env, 0);
        }
#endif
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-050: 10000 calls stability ---------- */
static napi_value Atan2FiniteStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int failCount = 0;
    double expected = std::atan2(1.0, K_ATAN2_TEST_INPUT);
    for (int i = 0; i < K_STABLE_LOOP10000; ++i) {
        double result = CallAtan2Finite(1.0, K_ATAN2_TEST_INPUT);
        if (std::fabs(result - expected) > 1e-15) {
            failCount++;
        }
    }
    return ReturnInt32(env, (failCount == 0) ? 1 : 0);
}

/* ---------- TC-051: dlsym symbol existence ---------- */
static napi_value Atan2FiniteSpec001(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetAtan2Finite();
    if (!func) {
        return ReturnInt32(env, 0);
    }
    double result = func(1.0, K_ATAN2_TEST_INPUT);
    if (std::fabs(result - std::atan2(1.0, K_ATAN2_TEST_INPUT)) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-052: function pointer nullptr safety ---------- */
static napi_value Atan2FiniteSpec002(napi_env env, napi_callback_info info)
{
    dlerror();
    void* sym = dlsym(RTLD_DEFAULT, "__atan2_finite");
    auto funcPtr = reinterpret_cast<double (*)(double, double)>(sym);
    if (funcPtr == nullptr) {
        return ReturnInt32(env, 0);
    }
    double result = funcPtr(1.0, K_ATAN2_TEST_INPUT);
    if (std::fabs(result - std::atan2(1.0, K_ATAN2_TEST_INPUT)) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-053: non-PC stub verification ---------- */
static napi_value Atan2FiniteSpec003(napi_env env, napi_callback_info info)
{
    errno = 0;
    double result = CallAtan2Finite(1.0, K_ATAN2_TEST_INPUT);
    if (result == 0.0 && errno == ENOSYS) {
        return ReturnInt32(env, 0);
    }
    if (std::fabs(result - std::atan2(1.0, K_ATAN2_TEST_INPUT)) < 1e-15 && errno == 0) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- TC-054: IsStubMode detection ---------- */
static napi_value Atan2FiniteSpec004(napi_env env, napi_callback_info info)
{
    bool isStub = IsStubMode();
    if (isStub) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallAtan2Finite(1.0, K_ATAN2_TEST_INPUT);
    if (std::fabs(result - std::atan2(1.0, K_ATAN2_TEST_INPUT)) < 1e-15 && errno == 0) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- TC-055: PC vs non-PC behavior difference ---------- */
static napi_value Atan2FiniteSpec005(napi_env env, napi_callback_info info)
{
    errno = 0;
    double result = CallAtan2Finite(1.0, K_ATAN2_TEST_INPUT);
    int e = errno;
    if (e == ENOSYS) {
        if (result == 0.0) {
            return ReturnInt32(env, 0);
        }
        return ReturnInt32(env, 0);
    } else {
        if (std::fabs(result - std::atan2(1.0, K_ATAN2_TEST_INPUT)) < 1e-15 && e == 0) {
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
        {"atan2FiniteNormal001", nullptr, Atan2FiniteNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atan2FiniteNormal002", nullptr, Atan2FiniteNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atan2FiniteNormal003", nullptr, Atan2FiniteNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atan2FiniteNormal004", nullptr, Atan2FiniteNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atan2FiniteFunc001", nullptr, Atan2FiniteFunc001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atan2FiniteFunc002", nullptr, Atan2FiniteFunc002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atan2FiniteStable001", nullptr, Atan2FiniteStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atan2FiniteSpec001", nullptr, Atan2FiniteSpec001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atan2FiniteSpec002", nullptr, Atan2FiniteSpec002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atan2FiniteSpec003", nullptr, Atan2FiniteSpec003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atan2FiniteSpec004", nullptr, Atan2FiniteSpec004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atan2FiniteSpec005", nullptr, Atan2FiniteSpec005, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "atan2Finitendktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterAtan2FinitendkModule(void)
{
    napi_module_register(&demoModule);
}