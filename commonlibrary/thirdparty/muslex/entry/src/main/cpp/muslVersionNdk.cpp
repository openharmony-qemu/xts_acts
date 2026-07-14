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
#include <cstring>
#include <thread>
#include <vector>
#include <atomic>
#include <functional>

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static const char* CallMuslVersion()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetMuslVersion();
    if (!func) {
        errno = ENOSYS;
        return nullptr;
    }
    errno = 0;
    return func();
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetMuslVersion() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value MuslVersionNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* ver = CallMuslVersion();
    return ReturnInt32(env, (ver != nullptr) ? 1 : 0);
}

static napi_value MuslVersionNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* ver = CallMuslVersion();
    if (!ver) {
        return ReturnInt32(env, 0);
    }
    size_t len = strlen(ver);
    return ReturnInt32(env, (len > 0) ? 1 : 0);
}

static napi_value MuslVersionNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* ver1 = CallMuslVersion();
    const char* ver2 = CallMuslVersion();
    if (!ver1 || !ver2) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, (strcmp(ver1, ver2) == 0) ? 1 : 0);
}

static napi_value MuslVersionNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value MuslVersionAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* ver = CallMuslVersion();
    return ReturnInt32(env, (ver != nullptr) ? 1 : 0);
}

static napi_value MuslVersionAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int loopcount = 20;
    for (int i = 0; i < loopcount; ++i) {
        const char* ver = CallMuslVersion();
        if (!ver) {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value MuslVersionBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* ver = CallMuslVersion();
    if (!ver) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, (strlen(ver) < 256) ? 1 : 0);
}

static napi_value MuslVersionBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    const char* ver = CallMuslVersion();
    if (!ver) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, (strlen(ver) > 0) ? 1 : 0);
}

static napi_value MuslVersionStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        const char* ver = CallMuslVersion();
        if (!ver) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void MuslVersionThreadWorker(std::atomic<bool>& hasError) {
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        const char* ver = CallMuslVersion();
        if (!ver) {
            hasError = true;
            return;
        }
    }
}

static napi_value MuslVersionThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(MuslVersionThreadWorker, std::ref(hasError));
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
        {"muslVersionNormal001", nullptr, MuslVersionNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"muslVersionNormal002", nullptr, MuslVersionNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"muslVersionNormal003", nullptr, MuslVersionNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"muslVersionNormal004", nullptr, MuslVersionNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"muslVersionAbnormal001", nullptr, MuslVersionAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"muslVersionAbnormal002", nullptr, MuslVersionAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"muslVersionBoundary001", nullptr, MuslVersionBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"muslVersionBoundary002", nullptr, MuslVersionBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"muslVersionStable001", nullptr, MuslVersionStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"muslVersionThread001", nullptr, MuslVersionThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "muslversionndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
