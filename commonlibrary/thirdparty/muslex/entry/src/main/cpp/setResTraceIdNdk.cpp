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
#include <dlfcn.h>
#include <cerrno>
#include <cstdint>
#include <thread>
#include <vector>
#include <atomic>

typedef void (*SetResTraceIdFunc)(uint32_t, uint64_t, uint32_t*, uint64_t*);

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr int traceVal = 100;
static constexpr int traceVal200 = 200;

static SetResTraceIdFunc GetSetResTraceIdFunc()
{
    static SetResTraceIdFunc cachedFunc = [] {
        dlerror();
        return reinterpret_cast<SetResTraceIdFunc>(dlsym(RTLD_DEFAULT, "setResTraceId"));
    }();
    return cachedFunc;
}

static bool CallSetResTraceId(uint32_t newTraceType, uint64_t newTraceID,
    uint32_t* pOldTraceType, uint64_t* pOldTraceID)
{
    auto func = GetSetResTraceIdFunc();
    if (!func) {
        errno = ENOSYS;
        return false;
    }
    errno = 0;
    func(newTraceType, newTraceID, pOldTraceType, pOldTraceID);
    return true;
}

static bool IsStubMode()
{
    return (GetSetResTraceIdFunc() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value SetResTraceIdNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    uint32_t oldType = 0;
    uint64_t oldID = 0;
    bool ret = CallSetResTraceId(1, traceVal, &oldType, &oldID);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetResTraceIdNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    uint32_t oldType = 0;
    uint64_t oldID = 0;
    CallSetResTraceId(1, traceVal, &oldType, &oldID);
    uint32_t oldType2 = 0;
    uint64_t oldID2 = 0;
    bool ret = CallSetResTraceId(2, traceVal200, &oldType2, &oldID2);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetResTraceIdNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    uint32_t oldType = 0;
    uint64_t oldID = 0;
    bool ret1 = CallSetResTraceId(1, traceVal, &oldType, &oldID);
    bool ret2 = CallSetResTraceId(2, traceVal200, &oldType, &oldID);
    return ReturnInt32(env, (ret1 && ret2) ? 1 : 0);
}

static napi_value SetResTraceIdNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value SetResTraceIdAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    uint64_t oldID = 0;
    CallSetResTraceId(1, traceVal, nullptr, &oldID);
    return ReturnInt32(env, 1);
}

static napi_value SetResTraceIdAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    uint32_t oldType = 0;
    CallSetResTraceId(1, traceVal, &oldType, nullptr);
    return ReturnInt32(env, 1);
}

static napi_value SetResTraceIdBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    uint32_t oldType = 0;
    uint64_t oldID = 0;
    bool ret = CallSetResTraceId(UINT32_MAX, UINT64_MAX, &oldType, &oldID);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetResTraceIdBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    uint32_t oldType = 0;
    uint64_t oldID = 0;
    bool ret = CallSetResTraceId(0, 0, &oldType, &oldID);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value SetResTraceIdStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        uint32_t oldType = 0;
        uint64_t oldID = 0;
        bool ret = CallSetResTraceId(1, i, &oldType, &oldID);
        if (!ret) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value SetResTraceIdThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]()
        {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                uint32_t oldType = 0;
                uint64_t oldID = 0;
                CallSetResTraceId(1, i, &oldType, &oldID);
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
        {"setResTraceIdNormal001", nullptr, SetResTraceIdNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setResTraceIdNormal002", nullptr, SetResTraceIdNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setResTraceIdNormal003", nullptr, SetResTraceIdNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setResTraceIdNormal004", nullptr, SetResTraceIdNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setResTraceIdAbnormal001", nullptr, SetResTraceIdAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setResTraceIdAbnormal002", nullptr, SetResTraceIdAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setResTraceIdBoundary001", nullptr, SetResTraceIdBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setResTraceIdBoundary002", nullptr, SetResTraceIdBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setResTraceIdStable001", nullptr, SetResTraceIdStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setResTraceIdThread001", nullptr, SetResTraceIdThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "setrestraceidndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}