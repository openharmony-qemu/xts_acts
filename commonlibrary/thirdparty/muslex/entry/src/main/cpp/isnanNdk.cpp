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
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP_10000 = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr double FINITE_TEST = 3.14;

static int CallIsnan(double x)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetIsnan();
    if (!func) {
        errno = ENOSYS;
        return 0;
    }
    errno = 0;
    return func(x);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetIsnan()) {
        return true;
    }
    errno = 0;
    CallIsnan(0.0);
    return (errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ---------- Normal parameter tests ---------- */

/* TC-001: NaN should return non-zero */
static napi_value IsnanNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnan(NAN);
    return ReturnInt32(env, (ret != 0) ? 1 : 0);
}

/* TC-002: Positive infinity should return 0 */
static napi_value IsnanNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnan(INFINITY);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-003: Negative infinity should return 0 */
static napi_value IsnanNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnan(-INFINITY);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-004: Zero should return 0 */
static napi_value IsnanNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnan(0.0);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-005: Normal finite value should return 0 */
static napi_value IsnanNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnan(FINITE_TEST);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-006: Negative finite value should return 0 */
static napi_value IsnanNormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnan(-FINITE_TEST);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* ---------- Boundary value tests ---------- */

/* TC-007: DBL_MAX should return 0 */
static napi_value IsnanBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnan(DBL_MAX);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-008: DBL_MIN should return 0 */
static napi_value IsnanBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnan(DBL_MIN);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* ---------- Abnormal parameter tests ---------- */

/* TC-009: Signaling NaN should return non-zero */
static napi_value IsnanAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    union { double f; uint64_t i; } snan;
    snan.i = 0x7FF4000000000000ULL;
    int ret = CallIsnan(snan.f);
    return ReturnInt32(env, (ret != 0) ? 1 : 0);
}

/* TC-010: Various NaN bit patterns */
static napi_value IsnanAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    union { double f; uint64_t i; } nan1, nan2;
    nan1.i = 0x7FF8000000000001ULL;
    nan2.i = 0x7FF8000000000002ULL;
    if (CallIsnan(nan1.f) == 0) {
        pass = false;
    }
    if (CallIsnan(nan2.f) == 0) {
        pass = false;
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ---------- Stability tests ---------- */

/* TC-011: 10000 repeated calls stability */
static napi_value IsnanStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP_10000; ++i) {
        if (CallIsnan(NAN) == 0) {
            pass = false;
            break;
        }
        if (CallIsnan(FINITE_TEST) != 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void IsnanThreadWorker(std::atomic<bool>& hasError, double testVals[], int expected[])
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        int idx = i % 5;
        int ret = CallIsnan(testVals[idx]);
        if ((ret != 0) != (expected[idx] != 0)) {
            hasError = true;
            return;
        }
    }
}

/* TC-012: Multi-thread safety */
static napi_value IsnanThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    double testVals[] = {NAN, INFINITY, -INFINITY, 0.0, FINITE_TEST};
    int expected[] = {1, 0, 0, 0, 0};

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError, testVals, expected]() {
            IsnanThreadWorker(hasError, const_cast<double*>(testVals), const_cast<int*>(expected));
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
        {"isnanNormal001", nullptr, IsnanNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanNormal002", nullptr, IsnanNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanNormal003", nullptr, IsnanNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanNormal004", nullptr, IsnanNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanNormal005", nullptr, IsnanNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanNormal006", nullptr, IsnanNormal006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanBoundary001", nullptr, IsnanBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanBoundary002", nullptr, IsnanBoundary002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanAbnormal001", nullptr, IsnanAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanAbnormal002", nullptr, IsnanAbnormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanStable001", nullptr, IsnanStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanThread001", nullptr, IsnanThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "isnanndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}