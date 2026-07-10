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

static constexpr unsigned int K_LOG_APP = 0;
static constexpr unsigned int K_LOG_CORE = 3;
static constexpr int K_LOG_DEBUG = 3;
static constexpr int K_LOG_INFO = 4;
static constexpr int K_LOG_WARN = 5;
static constexpr int K_LOG_ERROR = 6;
static constexpr int K_LOG_FATAL = 7;
static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static bool CallHilogBaseIsLoggable(unsigned int domain, const char* tag, int level)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetHilogBaseIsLoggable();
    if (!func) {
        errno = ENOSYS;
        return false;
    }
    errno = 0;
    return func(domain, tag, level);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetHilogBaseIsLoggable() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value HilogBaseIsLoggableNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallHilogBaseIsLoggable(0xD000900, "TEST_TAG", K_LOG_INFO);
    return ReturnInt32(env, 1);
}

static napi_value HilogBaseIsLoggableNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallHilogBaseIsLoggable(0xD000900, "TEST_TAG", K_LOG_DEBUG);
    return ReturnInt32(env, 1);
}

static napi_value HilogBaseIsLoggableNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallHilogBaseIsLoggable(0xD000900, "TEST_TAG", K_LOG_ERROR);
    return ReturnInt32(env, 1);
}

static napi_value HilogBaseIsLoggableNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value HilogBaseIsLoggableAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallHilogBaseIsLoggable(0, "TEST_TAG", -1);
    return ReturnInt32(env, 1);
}

static napi_value HilogBaseIsLoggableAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallHilogBaseIsLoggable(0xD000900, nullptr, K_LOG_INFO);
    return ReturnInt32(env, 1);
}

static napi_value HilogBaseIsLoggableBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallHilogBaseIsLoggable(0xD000900, "TEST_TAG", K_LOG_FATAL);
    return ReturnInt32(env, 1);
}

static napi_value HilogBaseIsLoggableBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallHilogBaseIsLoggable(0, "TEST_TAG", K_LOG_INFO);
    return ReturnInt32(env, 1);
}

static napi_value HilogBaseIsLoggableStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        CallHilogBaseIsLoggable(0xD000900, "TEST_TAG", K_LOG_INFO);
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value HilogBaseIsLoggableThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                CallHilogBaseIsLoggable(0xD000900, "TEST_TAG", K_LOG_INFO);
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
        {"hilogBaseIsLoggableNormal001", nullptr, HilogBaseIsLoggableNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"hilogBaseIsLoggableNormal002", nullptr, HilogBaseIsLoggableNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"hilogBaseIsLoggableNormal003", nullptr, HilogBaseIsLoggableNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"hilogBaseIsLoggableNormal004", nullptr, HilogBaseIsLoggableNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"hilogBaseIsLoggableAbnormal001", nullptr, HilogBaseIsLoggableAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"hilogBaseIsLoggableAbnormal002", nullptr, HilogBaseIsLoggableAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"hilogBaseIsLoggableBoundary001", nullptr, HilogBaseIsLoggableBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"hilogBaseIsLoggableBoundary002", nullptr, HilogBaseIsLoggableBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"hilogBaseIsLoggableStable001", nullptr, HilogBaseIsLoggableStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"hilogBaseIsLoggableThread001", nullptr, HilogBaseIsLoggableThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "hilogbaseislogglendktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
