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
#include <cstdlib>
#include <thread>
#include <vector>
#include <atomic>

typedef void (*RestraceExtFunc)(unsigned long long, void*, size_t, const char*, bool, bool);

struct RestraceExtParams {
    unsigned long long mask;
    void* addr;
    size_t size;
    const char* tag;
    bool isUsing;
    bool isWeakRef;
};

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr size_t K_ALLOC_100 = 100;
static constexpr size_t K_ALLOC_200 = 200;

static RestraceExtFunc GetRestraceExtFunc()
{
    static RestraceExtFunc cachedFunc = [] {
        dlerror();
        return reinterpret_cast<RestraceExtFunc>(dlsym(RTLD_DEFAULT, "restraceExt"));
    }();
    return cachedFunc;
}

static bool CallRestraceExt(const RestraceExtParams& params)
{
    auto func = GetRestraceExtFunc();
    if (!func) {
        errno = ENOSYS;
        return false;
    }
    errno = 0;
    func(params.mask, params.addr, params.size, params.tag, params.isUsing, params.isWeakRef);
    return true;
}

static bool IsStubMode()
{
    return (GetRestraceExtFunc() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value RestraceExtNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    RestraceExtParams params = {1, addr, K_ALLOC_100, "test", true, false};
    bool ret = CallRestraceExt(params);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value RestraceExtNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    RestraceExtParams params = {1, addr, K_ALLOC_100, "test", true, true};
    bool ret = CallRestraceExt(params);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value RestraceExtNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(K_ALLOC_200);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    RestraceExtParams params = {2, addr, K_ALLOC_200, "tag2", false, false};
    bool ret = CallRestraceExt(params);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value RestraceExtNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value RestraceExtAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    RestraceExtParams params = {1, nullptr, K_ALLOC_100, "test", true, false};
    CallRestraceExt(params);
    return ReturnInt32(env, 1);
}

static napi_value RestraceExtAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    RestraceExtParams params = {1, addr, K_ALLOC_100, nullptr, true, false};
    CallRestraceExt(params);
    free(addr);
    return ReturnInt32(env, 1);
}

static napi_value RestraceExtBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    RestraceExtParams params = {1, addr, 0, "test", true, false};
    bool ret = CallRestraceExt(params);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value RestraceExtBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    RestraceExtParams params = {1, addr, K_ALLOC_100, "test", false, false};
    bool ret = CallRestraceExt(params);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value RestraceExtStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        void* addr = malloc(K_ALLOC_100);
        if (!addr) {
            pass = false;
            break;
        }
        RestraceExtParams params = {1, addr, K_ALLOC_100, "test", true, false};
        bool ret = CallRestraceExt(params);
        free(addr);
        if (!ret) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void RestraceExtWorker(std::atomic<bool>& hasError)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        void* addr = malloc(K_ALLOC_100);
        if (!addr) {
            hasError = true;
            return;
        }
        RestraceExtParams params = {1, addr, K_ALLOC_100, "test", true, false};
        CallRestraceExt(params);
        free(addr);
    }
}

static napi_value RestraceExtThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(RestraceExtWorker, std::ref(hasError));
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
        {"restraceExtNormal001", nullptr, RestraceExtNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceExtNormal002", nullptr, RestraceExtNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceExtNormal003", nullptr, RestraceExtNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceExtNormal004", nullptr, RestraceExtNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceExtAbnormal001", nullptr, RestraceExtAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceExtAbnormal002", nullptr, RestraceExtAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceExtBoundary001", nullptr, RestraceExtBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceExtBoundary002", nullptr, RestraceExtBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceExtStable001", nullptr, RestraceExtStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceExtThread001", nullptr, RestraceExtThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "restraceextndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
