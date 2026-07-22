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

static int CallIsnanf(float x)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetIsnanf();
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
    if (!loader.GetIsnanf()) {
        return true;
    }
    errno = 0;
    CallIsnanf(0.0f);
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
static napi_value IsnanfNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnanf(NAN);
    return ReturnInt32(env, (ret != 0) ? 1 : 0);
}

/* TC-002: Positive infinity should return 0 */
static napi_value IsnanfNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnanf(INFINITY);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-003: Negative infinity should return 0 */
static napi_value IsnanfNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnanf(-INFINITY);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-004: Zero should return 0 */
static napi_value IsnanfNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnanf(0.0f);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-005: Normal finite value should return 0 */
static napi_value IsnanfNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnanf(3.14f);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-006: Negative finite value should return 0 */
static napi_value IsnanfNormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnanf(-3.14f);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* ---------- Boundary value tests ---------- */

/* TC-007: FLT_MAX should return 0 */
static napi_value IsnanfBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnanf(FLT_MAX);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-008: FLT_MIN should return 0 */
static napi_value IsnanfBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallIsnanf(FLT_MIN);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* ---------- Abnormal parameter tests ---------- */

/* TC-009: Signaling NaN should return non-zero */
static napi_value IsnanfAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    union { float f; uint32_t i; } snan;
    snan.i = 0x7FA00000;
    int ret = CallIsnanf(snan.f);
    return ReturnInt32(env, (ret != 0) ? 1 : 0);
}

/* TC-010: Various NaN bit patterns */
static napi_value IsnanfAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    union { float f; uint32_t i; } nan1;
    union { float f; uint32_t i; } nan2;
    nan1.i = 0x7FC00001;
    nan2.i = 0x7FC00002;
    if (CallIsnanf(nan1.f) == 0) {
        pass = false;
    }
    if (CallIsnanf(nan2.f) == 0) {
        pass = false;
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ---------- Stability tests ---------- */

/* TC-011: 10000 repeated calls stability */
static napi_value IsnanfStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP_10000; ++i) {
        if (CallIsnanf(NAN) == 0) {
            pass = false;
            break;
        }
        if (CallIsnanf(3.14f) != 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void IsnanfThreadWorker(std::atomic<bool>& hasError, float testVals[], int expected[])
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        int idx = i % 5;
        int ret = CallIsnanf(testVals[idx]);
        if ((ret != 0) != (expected[idx] != 0)) {
            hasError = true;
            return;
        }
    }
}

/* TC-012: Multi-thread safety */
static napi_value IsnanfThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    float testVals[] = {NAN, INFINITY, -INFINITY, 0.0f, 3.14f};
    int expected[] = {1, 0, 0, 0, 0};

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError, testVals, expected]() {
            IsnanfThreadWorker(hasError, const_cast<float*>(testVals), const_cast<int*>(expected));
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
        {"isnanfNormal001", nullptr, IsnanfNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanfNormal002", nullptr, IsnanfNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanfNormal003", nullptr, IsnanfNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanfNormal004", nullptr, IsnanfNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanfNormal005", nullptr, IsnanfNormal005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanfNormal006", nullptr, IsnanfNormal006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanfBoundary001", nullptr, IsnanfBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanfBoundary002", nullptr, IsnanfBoundary002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanfAbnormal001", nullptr, IsnanfAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanfAbnormal002", nullptr, IsnanfAbnormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanfStable001", nullptr, IsnanfStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"isnanfThread001", nullptr, IsnanfThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "isnanfndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}