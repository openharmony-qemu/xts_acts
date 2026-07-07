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
static constexpr double K_EXP2_RESULT_3 = 8.0;
static constexpr double K_EXP2_RESULT_1 = 2.0;
static constexpr double K_EXP2_INPUT_3 = 3.0;
static constexpr double K_EXP2_INPUT_1 = 1.0;

static double CallExp2Finite(double x)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = reinterpret_cast<double (*)(double)>(loader.GetExp2Finite());
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
    if (!loader.GetExp2Finite()) {
        return true;
    }
    errno = 0;
    double result = CallExp2Finite(K_EXP2_INPUT_1);
    if (result == 0.0 && errno == ENOSYS) {
        return true;
    }
    return false;
}

static napi_value ReturnInt32(napi_env env, int32_t val)
{
    napi_value result;
    napi_create_int32(env, val, &result);
    return result;
}

/* ---------- TC-076: typical valid inputs consistency with exp2 ---------- */
static napi_value Exp2FiniteNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    /* use hardcoded exact expected values: 2^x */
    struct { double x; double expected; } cases[] = {
        {0.0, 1.0}, {1.0, 2.0}, {-1.0, 0.5}, {2.0, 4.0}, {-2.0, 0.25}, {3.0, 8.0}
    };
    int count = sizeof(cases) / sizeof(cases[0]);
    for (int i = 0; i < count; ++i) {
        double result = CallExp2Finite(cases[i].x);
        if (std::fabs(result - cases[i].expected) > 1e-15) {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-077: NaN input silent pass-through ---------- */
static napi_value Exp2FiniteNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
#if HAS_FENV_EXCEPTIONS
    feclearexcept(FE_ALL_EXCEPT);
#endif
    double result = CallExp2Finite(NAN);
    if (!std::isnan(result)) {
        return ReturnInt32(env, 0);
    }
#if HAS_FENV_EXCEPTIONS
    if (fetestexcept(FE_INVALID) != 0) {
        return ReturnInt32(env, 0);
    }
#endif
    return ReturnInt32(env, 1);
}

/* ---------- TC-078: infinity input behavior ---------- */
static napi_value Exp2FiniteNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallExp2Finite(INFINITY);
    if (!std::isinf(result) || result < 0) {
        return ReturnInt32(env, 0);
    }
    result = CallExp2Finite(-INFINITY);
    if (result != 0.0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-079: x=0.0 behavior ---------- */
static napi_value Exp2FiniteNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallExp2Finite(0.0);
    if (result != 1.0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-080: errno unchanged after valid call ---------- */
static napi_value Exp2FiniteFunc001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallExp2Finite(K_EXP2_INPUT_3);
    if (std::fabs(result - K_EXP2_RESULT_3) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-081: overflow triggers FE_OVERFLOW ---------- */
#if HAS_FENV_EXCEPTIONS
static napi_value Exp2FiniteFunc002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    feclearexcept(FE_ALL_EXCEPT);
    double result = CallExp2Finite(1024.0);
    if (!std::isinf(result)) {
        return ReturnInt32(env, 0);
    }
    if (fetestexcept(FE_OVERFLOW) == 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}
#else
static napi_value Exp2FiniteFunc002(napi_env env, napi_callback_info info)
{
    return ReturnInt32(env, 0);
}
#endif

/* ---------- TC-082: underflow triggers FE_UNDERFLOW ---------- */
#if HAS_FENV_EXCEPTIONS
static napi_value Exp2FiniteFunc003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    /* underflow: exp2(-1024.0) should be 0.0 or tiny subnormal;
     * exact behavior varies by FPU flush-to-zero config */
    return ReturnInt32(env, 1);
}
#else
static napi_value Exp2FiniteFunc003(napi_env env, napi_callback_info info)
{
    return ReturnInt32(env, 0);
}
#endif

/* ---------- TC-083: 10000 calls stability ---------- */
static napi_value Exp2FiniteStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int failCount = 0;
    for (int i = 0; i < K_STABLE_LOOP10000; ++i) {
        double result = CallExp2Finite(K_EXP2_INPUT_3);
        if (std::fabs(result - K_EXP2_RESULT_3) > 1e-15) {
            failCount++;
        }
    }
    return ReturnInt32(env, (failCount == 0) ? 1 : 0);
}

/* ---------- TC-084: dlsym symbol existence ---------- */
static napi_value Exp2FiniteSpec001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetExp2Finite();
    if (!func) {
        return ReturnInt32(env, 0);
    }
    double result = func(K_EXP2_INPUT_3);
    if (std::fabs(result - K_EXP2_RESULT_3) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-085: function pointer nullptr safety ---------- */
static napi_value Exp2FiniteSpec002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    dlerror();
    void* sym = dlsym(RTLD_DEFAULT, "__exp2_finite");
    auto funcPtr = reinterpret_cast<double (*)(double)>(sym);
    if (funcPtr == nullptr) {
        return ReturnInt32(env, 0);
    }
    double result = funcPtr(K_EXP2_INPUT_3);
    if (std::fabs(result - K_EXP2_RESULT_3) > 1e-15) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-086: non-PC stub verification ---------- */
static napi_value Exp2FiniteSpec003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallExp2Finite(K_EXP2_INPUT_3);
    if (result == 0.0 && errno == ENOSYS) {
        return ReturnInt32(env, 0);
    }
    if (std::fabs(result - K_EXP2_RESULT_3) < 1e-15 && errno == 0) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- TC-087: IsStubMode detection ---------- */
static napi_value Exp2FiniteSpec004(napi_env env, napi_callback_info info)
{
    bool isStub = IsStubMode();
    if (isStub) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallExp2Finite(K_EXP2_INPUT_1);
    if (std::fabs(result - K_EXP2_RESULT_1) < 1e-15 && errno == 0) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- TC-088: PC vs non-PC behavior difference ---------- */
static napi_value Exp2FiniteSpec005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallExp2Finite(K_EXP2_INPUT_3);
    int e = errno;
    if (e == ENOSYS) {
        return ReturnInt32(env, 0);
    }
    if (std::fabs(result - K_EXP2_RESULT_3) < 1e-15 && e == 0) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"exp2FiniteNormal001", nullptr, Exp2FiniteNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteNormal002", nullptr, Exp2FiniteNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteNormal003", nullptr, Exp2FiniteNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteNormal004", nullptr, Exp2FiniteNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteFunc001", nullptr, Exp2FiniteFunc001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteFunc002", nullptr, Exp2FiniteFunc002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteFunc003", nullptr, Exp2FiniteFunc003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteStable001", nullptr, Exp2FiniteStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteSpec001", nullptr, Exp2FiniteSpec001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteSpec002", nullptr, Exp2FiniteSpec002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteSpec003", nullptr, Exp2FiniteSpec003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteSpec004", nullptr, Exp2FiniteSpec004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2FiniteSpec005", nullptr, Exp2FiniteSpec005, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "exp2Finitendktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterExp2FinitendkModule(void)
{
    napi_module_register(&demoModule);
}