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
#include "common/native_common.h"
#include <thread>
#include <atomic>
static const int32_t STABLE_LOOP_COUNT = 10;

static napi_value OpenCriticalScopeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_critical_scope critScope = nullptr;
        napi_status status = napi_open_critical_scope(env, &critScope);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (status == napi_ok) { napi_close_critical_scope(env, critScope); }
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value OpenCriticalScopeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_critical_scope critScope = nullptr;
        napi_status status = napi_open_critical_scope(nullptr, &critScope);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value OpenCriticalScopeMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_critical_scope critScope = nullptr;
    napi_status status = napi_open_critical_scope(env, &critScope);
    int32_t ret = status == napi_ok ? 1 : 0;
    if (status == napi_ok) { napi_close_critical_scope(env, critScope); }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value OpenCriticalScopeRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_critical_scope critScope = nullptr;
        napi_status status = napi_open_critical_scope(newEnv, &critScope);
        int32_t ret = status == napi_ok ? 1 : 0;
        if (status == napi_ok) { napi_close_critical_scope(newEnv, critScope); }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value OpenCriticalScopeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_critical_scope critScope = nullptr;
        napi_status status = napi_open_critical_scope(nullptr, &critScope);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseCriticalScopeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_critical_scope critScope = nullptr;
        napi_open_critical_scope(env, &critScope);
        napi_status status = napi_close_critical_scope(env, critScope);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CloseCriticalScopeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_critical_scope critScope = nullptr;
        napi_open_critical_scope(nullptr, &critScope);
        napi_status status = napi_close_critical_scope(nullptr, critScope);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseCriticalScopeMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_critical_scope critScope = nullptr;
    napi_open_critical_scope(env, &critScope);
    napi_status status = napi_close_critical_scope(env, critScope);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CloseCriticalScopeRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_critical_scope critScope = nullptr;
        napi_open_critical_scope(newEnv, &critScope);
        napi_status status = napi_close_critical_scope(newEnv, critScope);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseCriticalScopeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_critical_scope critScope = nullptr;
        napi_open_critical_scope(nullptr, &critScope);
        napi_status status = napi_close_critical_scope(nullptr, critScope);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetBufferStringUtf16InCriticalScopeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value str = nullptr;
        napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &str);
        size_t len = 0;
        const char16_t* buf = nullptr;
        napi_status status = napi_get_buffer_string_utf16_in_critical_scope(env, str, &buf, &len);
        int32_t singleRet = status != napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetBufferStringUtf16InCriticalScopeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_buffer_string_utf16_in_critical_scope(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetBufferStringUtf16InCriticalScopeMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value str = nullptr;
    napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &str);
    size_t len = 0;
    const char16_t* buf = nullptr;
    napi_status status = napi_get_buffer_string_utf16_in_critical_scope(env, str, &buf, &len);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetBufferStringUtf16InCriticalScopeRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value str = nullptr;
        napi_create_string_utf8(newEnv, "hello", NAPI_AUTO_LENGTH, &str);
        size_t len = 0;
        const char16_t* buf = nullptr;
        napi_status status = napi_get_buffer_string_utf16_in_critical_scope(newEnv, str, &buf, &len);
        int32_t ret = status != napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetBufferStringUtf16InCriticalScopeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_buffer_string_utf16_in_critical_scope(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("openCriticalScopeStable", OpenCriticalScopeStable),
        DECLARE_NAPI_FUNCTION("openCriticalScopeMultiThread", OpenCriticalScopeMultiThread),
        DECLARE_NAPI_FUNCTION("openCriticalScopeMultiCtx", OpenCriticalScopeMultiCtx),
        DECLARE_NAPI_FUNCTION("openCriticalScopeRuntime", OpenCriticalScopeRuntime),
        DECLARE_NAPI_FUNCTION("openCriticalScopeWorker", OpenCriticalScopeWorker),
        DECLARE_NAPI_FUNCTION("closeCriticalScopeStable", CloseCriticalScopeStable),
        DECLARE_NAPI_FUNCTION("closeCriticalScopeMultiThread", CloseCriticalScopeMultiThread),
        DECLARE_NAPI_FUNCTION("closeCriticalScopeMultiCtx", CloseCriticalScopeMultiCtx),
        DECLARE_NAPI_FUNCTION("closeCriticalScopeRuntime", CloseCriticalScopeRuntime),
        DECLARE_NAPI_FUNCTION("closeCriticalScopeWorker", CloseCriticalScopeWorker),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16InCriticalScopeStable", GetBufferStringUtf16InCriticalScopeStable),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16InCriticalScopeMultiThread",
            GetBufferStringUtf16InCriticalScopeMultiThread),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16InCriticalScopeMultiCtx",
            GetBufferStringUtf16InCriticalScopeMultiCtx),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16InCriticalScopeRuntime", GetBufferStringUtf16InCriticalScopeRuntime),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16InCriticalScopeWorker", GetBufferStringUtf16InCriticalScopeWorker),
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
    .nm_modname = "napiCovCriticalSection",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}