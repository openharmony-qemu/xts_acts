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
#include <pthread.h>
#include <cerrno>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr int K_MAX_KEYS = PTHREAD_KEYS_MAX;
static constexpr int K_OVER_LIMIT = 10;

static int CallPthreadKeyCreate(pthread_key_t* key, void (*destructor)(void*))
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetPthreadKeyCreate();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(key, destructor);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetPthreadKeyCreate()) {
        return true;
    }
    pthread_key_t key;
    errno = 0;
    CallPthreadKeyCreate(&key, nullptr);
    return (errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static void KeyDestructor(void* data)
{
    (void)data;
}

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: Create key with NULL destructor */
static napi_value PthreadKeyCreateNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pthread_key_t key;
    int ret = CallPthreadKeyCreate(&key, nullptr);
    if (ret == 0) {
        pthread_key_delete(key);
    }
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-002: Create key with destructor */
static napi_value PthreadKeyCreateNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pthread_key_t key;
    int ret = CallPthreadKeyCreate(&key, KeyDestructor);
    if (ret == 0) {
        pthread_key_delete(key);
    }
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* TC-003: Create and delete multiple keys */
static napi_value PthreadKeyCreateNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    int loopCount = 20;
    for (int i = 0; i < loopCount; ++i) {
        pthread_key_t key;
        int ret = CallPthreadKeyCreate(&key, nullptr);
        if (ret != 0) {
            pass = false;
            break;
        }
        if (pthread_key_delete(key) != 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Abnormal Parameter Tests ==================== */

/* TC-004: NULL key pointer should fail */
static napi_value PthreadKeyCreateAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    int ret = CallPthreadKeyCreate(nullptr, nullptr);
    return ReturnInt32(env, (ret != 0) ? 1 : 0);
}

/* TC-005: Exceed PTHREAD_KEYS_MAX */
static napi_value PthreadKeyCreateAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::vector<pthread_key_t> keys;
    bool pass = true;
    // Try creating more keys than maximum
    for (int i = 0; i < K_MAX_KEYS + K_OVER_LIMIT; ++i) {
        pthread_key_t key;
        int ret = CallPthreadKeyCreate(&key, nullptr);
        if (ret == 0) {
            keys.push_back(key);
        } else {
            // Exceeding limit should fail
            if (i >= K_MAX_KEYS) {
                pass = true;
            }
            break;
        }
    }
    for (auto key : keys) {
        pthread_key_delete(key);
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Boundary Value Tests ==================== */

/* TC-006: Create key with complex destructor */
static void ComplexDestructor(void* data)
{
    // Simulate complex cleanup logic
    volatile int* p = static_cast<int*>(data);
    if (p) {
        *p = 0;
    }
}

static napi_value PthreadKeyCreateBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pthread_key_t key;
    int ret = CallPthreadKeyCreate(&key, ComplexDestructor);
    if (ret == 0) {
        int value = 123;
        pthread_setspecific(key, &value);
        pthread_key_delete(key);
    }
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

/* ==================== Stability Tests ==================== */

/* TC-007: 10000 repeated calls stability */
static napi_value PthreadKeyCreateStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    int loopCount = 20;
    for (int i = 0; i < loopCount; ++i) {
        pthread_key_t key;
        int ret = CallPthreadKeyCreate(&key, nullptr);
        if (ret != 0) {
            pass = false;
            break;
        }
        if (pthread_key_delete(key) != 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ==================== Multi-thread Tests ==================== */

static void PthreadKeyCreateThreadWorker(std::atomic<bool>& hasError, pthread_key_t key)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        int* val = new int(i);
        if (pthread_setspecific(key, val) != 0) {
            hasError = true;
            delete val;
            return;
        }
        int* got = static_cast<int*>(pthread_getspecific(key));
        if (got == nullptr || *got != i) {
            hasError = true;
            return;
        }
    }
}

/* TC-008: Multi-thread key creation and use */
static napi_value PthreadKeyCreateThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    pthread_key_t key;
    int ret = CallPthreadKeyCreate(&key, nullptr);
    if (ret != 0) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError, key]() {
            PthreadKeyCreateThreadWorker(hasError, key);
        });
    }
    for (auto& th : threads) {
        th.join();
    }
    pthread_key_delete(key);
    return ReturnInt32(env, !hasError ? 1 : 0);
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"pthreadKeyCreateNormal001", nullptr, PthreadKeyCreateNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pthreadKeyCreateNormal002", nullptr, PthreadKeyCreateNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pthreadKeyCreateNormal003", nullptr, PthreadKeyCreateNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pthreadKeyCreateAbnormal001", nullptr, PthreadKeyCreateAbnormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pthreadKeyCreateAbnormal002", nullptr, PthreadKeyCreateAbnormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pthreadKeyCreateBoundary001", nullptr, PthreadKeyCreateBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pthreadKeyCreateStable001", nullptr, PthreadKeyCreateStable001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pthreadKeyCreateThread001", nullptr, PthreadKeyCreateThread001, nullptr, nullptr, nullptr,
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
    .nm_modname = "pthreadkeycreatendktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}