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

typedef bool (*GetResTraceIdFunc)(uint32_t*, uint64_t*);

static constexpr int kStableLoop = 20;
static constexpr int kThreadCount = 3;
static constexpr int kIterPerThread = 10;

static GetResTraceIdFunc GetGetResTraceIdFunc()
{
    static GetResTraceIdFunc cachedFunc = [] {
        dlerror();
        return reinterpret_cast<GetResTraceIdFunc>(dlsym(RTLD_DEFAULT, "getResTraceId"));
    }();
    return cachedFunc;
}

static bool CallGetResTraceId(uint32_t* pTraceType, uint64_t* pTraceID)
{
    auto func = GetGetResTraceIdFunc();
    if (!func) {
        errno = ENOSYS;
        return false;
    }
    errno = 0;
    return func(pTraceType, pTraceID);
}

static bool IsStubMode()
{
    return (GetGetResTraceIdFunc() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value GetResTraceIdNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    uint32_t traceType = 0;
    uint64_t traceID = 0;
    CallGetResTraceId(&traceType, &traceID);
    return ReturnInt32(env, 1);
}

static napi_value GetResTraceIdNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    uint32_t traceType = 0;
    uint64_t traceID = 0;
    CallGetResTraceId(&traceType, &traceID);
    return ReturnInt32(env, 1);
}

static napi_value GetResTraceIdNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    uint32_t t1 = 0;
    uint32_t t2 = 0;
    uint64_t id1 = 0;
    uint64_t id2 = 0;
    CallGetResTraceId(&t1, &id1);
    CallGetResTraceId(&t2, &id2);
    return ReturnInt32(env, 1);
}

static napi_value GetResTraceIdNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value GetResTraceIdAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallGetResTraceId(nullptr, nullptr);
    return ReturnInt32(env, 1);
}

static napi_value GetResTraceIdAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    uint64_t traceID = 0;
    bool ret = CallGetResTraceId(nullptr, &traceID);
    return ReturnInt32(env, 1);
}

static napi_value GetResTraceIdBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    uint32_t traceType = 0;
    uint64_t traceID = 0;
    CallGetResTraceId(&traceType, &traceID);
    return ReturnInt32(env, 1);
}

static napi_value GetResTraceIdBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    uint32_t traceType = 0;
    uint64_t traceID = 0;
    CallGetResTraceId(&traceType, &traceID);
    return ReturnInt32(env, 1);
}

static napi_value GetResTraceIdStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < kStableLoop; ++i) {
        uint32_t traceType = 0;
        uint64_t traceID = 0;
        CallGetResTraceId(&traceType, &traceID);
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value GetResTraceIdThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < kThreadCount; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < kIterPerThread; ++i) {
                uint32_t traceType = 0;
                uint64_t traceID = 0;
                CallGetResTraceId(&traceType, &traceID);
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
        {"getResTraceIdNormal001", nullptr, GetResTraceIdNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResTraceIdNormal002", nullptr, GetResTraceIdNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResTraceIdNormal003", nullptr, GetResTraceIdNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResTraceIdNormal004", nullptr, GetResTraceIdNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResTraceIdAbnormal001", nullptr, GetResTraceIdAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResTraceIdAbnormal002", nullptr, GetResTraceIdAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResTraceIdBoundary001", nullptr, GetResTraceIdBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResTraceIdBoundary002", nullptr, GetResTraceIdBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResTraceIdStable001", nullptr, GetResTraceIdStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResTraceIdThread001", nullptr, GetResTraceIdThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "getrestraceidndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
