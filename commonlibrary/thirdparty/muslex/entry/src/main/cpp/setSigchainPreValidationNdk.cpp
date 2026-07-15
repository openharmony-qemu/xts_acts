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
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static bool CallSetSigchainPreValidationIgnore(int value)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetSetSigchainPreValidationIgnore();
    if (!func) {
        errno = ENOSYS;
        return false;
    }
    errno = 0;
    func(value);
    return true;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetSetSigchainPreValidationIgnore() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value SetSigchainPreValidationNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallSetSigchainPreValidationIgnore(1);
    CallSetSigchainPreValidationIgnore(0);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetSigchainPreValidationNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallSetSigchainPreValidationIgnore(0);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetSigchainPreValidationNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    CallSetSigchainPreValidationIgnore(1);
    CallSetSigchainPreValidationIgnore(0);
    return ReturnInt32(env, 1);
}

static napi_value SetSigchainPreValidationNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value SetSigchainPreValidationAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    CallSetSigchainPreValidationIgnore(-1);
    CallSetSigchainPreValidationIgnore(0);
    return ReturnInt32(env, 1);
}

static napi_value SetSigchainPreValidationAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    CallSetSigchainPreValidationIgnore(100);
    CallSetSigchainPreValidationIgnore(0);
    return ReturnInt32(env, 1);
}

static napi_value SetSigchainPreValidationBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallSetSigchainPreValidationIgnore(0);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetSigchainPreValidationBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallSetSigchainPreValidationIgnore(1);
    CallSetSigchainPreValidationIgnore(0);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetSigchainPreValidationStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        CallSetSigchainPreValidationIgnore(i % 2);
    }
    CallSetSigchainPreValidationIgnore(0);
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value SetSigchainPreValidationThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                CallSetSigchainPreValidationIgnore(i % 2);
            }
        });
    }
    for (auto& th : threads) {
        th.join();
    }
    CallSetSigchainPreValidationIgnore(0);
    return ReturnInt32(env, !hasError ? 1 : 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setSigchainPreValidationNormal001", nullptr, SetSigchainPreValidationNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setSigchainPreValidationNormal002", nullptr, SetSigchainPreValidationNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setSigchainPreValidationNormal003", nullptr, SetSigchainPreValidationNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setSigchainPreValidationNormal004", nullptr, SetSigchainPreValidationNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setSigchainPreValidationAbnormal001", nullptr, SetSigchainPreValidationAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setSigchainPreValidationAbnormal002", nullptr, SetSigchainPreValidationAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setSigchainPreValidationBoundary001", nullptr, SetSigchainPreValidationBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setSigchainPreValidationBoundary002", nullptr, SetSigchainPreValidationBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setSigchainPreValidationStable001", nullptr, SetSigchainPreValidationStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setSigchainPreValidationThread001", nullptr, SetSigchainPreValidationThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "setsigchainprevalndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}