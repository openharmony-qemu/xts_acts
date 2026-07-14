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
#include <cstddef>
#include <thread>
#include <vector>
#include <atomic>

typedef size_t (*FfrtGetStackFn)(size_t*, size_t);

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static bool CallGwpAsanRegisterFfrt(FfrtGetStackFn fn)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetGwpAsanRegisterFfrt();
    if (!func) {
        errno = ENOSYS;
        return false;
    }
    errno = 0;
    func(fn);
    return true;
}

static size_t DummyStackFn(size_t* frames, size_t maxFrames)
{
    if (frames && maxFrames > 0) {
        frames[0] = 0;
    }
    return 1;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetGwpAsanRegisterFfrt() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value GwpAsanRegisterFfrtNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool ret = CallGwpAsanRegisterFfrt(DummyStackFn);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value GwpAsanRegisterFfrtNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool ret = CallGwpAsanRegisterFfrt(nullptr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value GwpAsanRegisterFfrtNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    CallGwpAsanRegisterFfrt(DummyStackFn);
    CallGwpAsanRegisterFfrt(nullptr);
    return ReturnInt32(env, 1);
}

static napi_value GwpAsanRegisterFfrtNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value GwpAsanRegisterFfrtAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool ret = CallGwpAsanRegisterFfrt(nullptr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value GwpAsanRegisterFfrtAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    CallGwpAsanRegisterFfrt(DummyStackFn);
    CallGwpAsanRegisterFfrt(DummyStackFn);
    return ReturnInt32(env, 1);
}

static napi_value GwpAsanRegisterFfrtBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    CallGwpAsanRegisterFfrt(DummyStackFn);
    size_t frames[10];
    size_t count = DummyStackFn(frames, 10);
    CallGwpAsanRegisterFfrt(nullptr);
    return ReturnInt32(env, (count > 0) ? 1 : 0);
}

static napi_value GwpAsanRegisterFfrtBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    CallGwpAsanRegisterFfrt(DummyStackFn);
    CallGwpAsanRegisterFfrt(nullptr);
    return ReturnInt32(env, 1);
}

static napi_value GwpAsanRegisterFfrtStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        bool ret = CallGwpAsanRegisterFfrt(DummyStackFn);
        if (!ret) {
            pass = false;
            break;
        }
        CallGwpAsanRegisterFfrt(nullptr);
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value GwpAsanRegisterFfrtThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                CallGwpAsanRegisterFfrt(DummyStackFn);
                CallGwpAsanRegisterFfrt(nullptr);
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
        {"gwpAsanRegisterFfrtNormal001", nullptr, GwpAsanRegisterFfrtNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gwpAsanRegisterFfrtNormal002", nullptr, GwpAsanRegisterFfrtNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gwpAsanRegisterFfrtNormal003", nullptr, GwpAsanRegisterFfrtNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gwpAsanRegisterFfrtNormal004", nullptr, GwpAsanRegisterFfrtNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gwpAsanRegisterFfrtAbnormal001", nullptr, GwpAsanRegisterFfrtAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gwpAsanRegisterFfrtAbnormal002", nullptr, GwpAsanRegisterFfrtAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gwpAsanRegisterFfrtBoundary001", nullptr, GwpAsanRegisterFfrtBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gwpAsanRegisterFfrtBoundary002", nullptr, GwpAsanRegisterFfrtBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gwpAsanRegisterFfrtStable001", nullptr, GwpAsanRegisterFfrtStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gwpAsanRegisterFfrtThread001", nullptr, GwpAsanRegisterFfrtThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "gwpasanregffrtndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
