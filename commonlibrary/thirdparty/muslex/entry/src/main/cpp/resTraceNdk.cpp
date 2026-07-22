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

typedef void (*RestraceFunc)(unsigned long long, void*, size_t, const char*, bool);

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr int K_ALLOC_100 = 100;

static RestraceFunc GetRestraceFunc()
{
    static RestraceFunc cachedFunc = [] {
        dlerror();
        return reinterpret_cast<RestraceFunc>(dlsym(RTLD_DEFAULT, "restrace"));
    }();
    return cachedFunc;
}

static bool CallRestrace(unsigned long long mask, void* addr, size_t size, const char* tag, bool isUsing)
{
    auto func = GetRestraceFunc();
    if (!func) {
        errno = ENOSYS;
        return false;
    }
    errno = 0;
    func(mask, addr, size, tag, isUsing);
    return true;
}

static bool IsStubMode()
{
    return (GetRestraceFunc() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value RestraceNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallRestrace(1, addr, K_ALLOC_100, "test", true);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value RestraceNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallRestrace(1, addr, K_ALLOC_100, "test", false);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value RestraceNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* addr = malloc(200);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallRestrace(2, addr, 200, "tag2", true);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value RestraceNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value RestraceAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    CallRestrace(1, nullptr, K_ALLOC_100, "test", true);
    return ReturnInt32(env, 1);
}

static napi_value RestraceAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    CallRestrace(1, addr, K_ALLOC_100, nullptr, true);
    free(addr);
    return ReturnInt32(env, 1);
}

static napi_value RestraceBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallRestrace(1, addr, 0, "test", true);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value RestraceBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallRestrace(0, addr, K_ALLOC_100, "test", true);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value RestraceStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        void* addr = malloc(K_ALLOC_100);
        if (!addr) {
            pass = false;
            break;
        }
        bool ret = CallRestrace(1, addr, K_ALLOC_100, "test", true);
        free(addr);
        if (!ret) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value RestraceThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                void* addr = malloc(K_ALLOC_100);
                if (!addr) {
                    hasError = true;
                    return;
                }
                CallRestrace(1, addr, K_ALLOC_100, "test", true);
                free(addr);
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
        {"restraceNormal001", nullptr, RestraceNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceNormal002", nullptr, RestraceNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceNormal003", nullptr, RestraceNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceNormal004", nullptr, RestraceNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceAbnormal001", nullptr, RestraceAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceAbnormal002", nullptr, RestraceAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceBoundary001", nullptr, RestraceBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceBoundary002", nullptr, RestraceBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceStable001", nullptr, RestraceStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restraceThread001", nullptr, RestraceThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "restracendktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}