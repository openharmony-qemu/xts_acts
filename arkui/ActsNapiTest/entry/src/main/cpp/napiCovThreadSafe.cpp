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

static void CallJsCb(napi_env env, napi_value js_cb, void* context, void* data)
{
    (void)env;
    (void)js_cb;
    (void)context;
    (void)data;
}
static void AsyncExecute(napi_env env, void* data)
{
    (void)env;
    (void)data;
}
static void AsyncComplete(napi_env env, napi_status status, void* data)
{
    (void)env;
    (void)status;
    (void)data;
}

static napi_value CreateThreadsafeFunctionAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, nullptr, 0, 0, nullptr, nullptr, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateThreadsafeFunctionRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfn", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    if (tsfn != nullptr) { napi_release_threadsafe_function(tsfn, napi_tsfn_release); }
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateThreadsafeFunctionStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value name = nullptr;
        napi_create_string_utf8(env, "tsfn", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        int32_t singleRet = (status == napi_ok && tsfn != nullptr) ? 1 : 0;
        if (tsfn != nullptr) { napi_release_threadsafe_function(tsfn, napi_tsfn_release); }
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateThreadsafeFunctionMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfn", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    int32_t ret = (status == napi_ok && tsfn != nullptr) ? 1 : 0;
    if (tsfn != nullptr) { napi_release_threadsafe_function(tsfn, napi_tsfn_release); }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateThreadsafeFunctionRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value name = nullptr;
        napi_create_string_utf8(newEnv, "tsfn", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_status status = napi_create_threadsafe_function(newEnv, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        int32_t ret = (status == napi_ok && tsfn != nullptr) ? 1 : 0;
        if (tsfn != nullptr) { napi_release_threadsafe_function(tsfn, napi_tsfn_release); }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateThreadsafeFunctionWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_threadsafe_function(savedEnv, nullptr, nullptr, nullptr, 0, 0, nullptr, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetThreadsafeFunctionContextAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_threadsafe_function_context(nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetThreadsafeFunctionContextRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnCtx", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    void* ctx = nullptr;
    napi_status status = napi_get_threadsafe_function_context(tsfn, &ctx);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetThreadsafeFunctionContextStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value name = nullptr;
        napi_create_string_utf8(env, "tsfnCtx", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        void* ctx = nullptr;
        napi_status status = napi_get_threadsafe_function_context(tsfn, &ctx);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetThreadsafeFunctionContextMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnCtx", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    void* ctx = nullptr;
    napi_status status = napi_get_threadsafe_function_context(tsfn, &ctx);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetThreadsafeFunctionContextRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value name = nullptr;
        napi_create_string_utf8(newEnv, "tsfnCtx", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(newEnv, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        void* ctx = nullptr;
        napi_status status = napi_get_threadsafe_function_context(tsfn, &ctx);
        int32_t ret = status == napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetThreadsafeFunctionContextWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_threadsafe_function_context(nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CallThreadsafeFunctionAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_call_threadsafe_function(nullptr, nullptr, napi_tsfn_nonblocking);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CallThreadsafeFunctionRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnCall", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_acquire_threadsafe_function(tsfn);
    napi_status status = napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_nonblocking);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CallThreadsafeFunctionStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value name = nullptr;
        napi_create_string_utf8(env, "tsfnCall", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_acquire_threadsafe_function(tsfn);
        napi_status status = napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_nonblocking);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CallThreadsafeFunctionMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnCall", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_acquire_threadsafe_function(tsfn);
    napi_status status = napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_nonblocking);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CallThreadsafeFunctionRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value name = nullptr;
        napi_create_string_utf8(newEnv, "tsfnCall", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(newEnv, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_acquire_threadsafe_function(tsfn);
        napi_status status = napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_nonblocking);
        int32_t ret = status == napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CallThreadsafeFunctionWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_call_threadsafe_function(nullptr, nullptr, napi_tsfn_nonblocking);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AcquireThreadsafeFunctionAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_acquire_threadsafe_function(nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value AcquireThreadsafeFunctionRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnAcq", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_status status = napi_acquire_threadsafe_function(tsfn);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value AcquireThreadsafeFunctionStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value name = nullptr;
        napi_create_string_utf8(env, "tsfnAcq", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_status status = napi_acquire_threadsafe_function(tsfn);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value AcquireThreadsafeFunctionMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnAcq", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_status status = napi_acquire_threadsafe_function(tsfn);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value AcquireThreadsafeFunctionRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value name = nullptr;
        napi_create_string_utf8(newEnv, "tsfnAcq", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(newEnv, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_status status = napi_acquire_threadsafe_function(tsfn);
        int32_t ret = status == napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AcquireThreadsafeFunctionWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_acquire_threadsafe_function(nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ReleaseThreadsafeFunctionAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_release_threadsafe_function(nullptr, napi_tsfn_release);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value ReleaseThreadsafeFunctionRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnRel", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_status status = napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value ReleaseThreadsafeFunctionStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value name = nullptr;
        napi_create_string_utf8(env, "tsfnRel", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_status status = napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value ReleaseThreadsafeFunctionMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnRel", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_status status = napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value ReleaseThreadsafeFunctionRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value name = nullptr;
        napi_create_string_utf8(newEnv, "tsfnRel", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(newEnv, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_status status = napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ReleaseThreadsafeFunctionWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_release_threadsafe_function(nullptr, napi_tsfn_release);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RefThreadsafeFunctionAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_ref_threadsafe_function(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value RefThreadsafeFunctionRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnRef", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_status status = napi_ref_threadsafe_function(env, tsfn);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value RefThreadsafeFunctionStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value name = nullptr;
        napi_create_string_utf8(env, "tsfnRef", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_status status = napi_ref_threadsafe_function(env, tsfn);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value RefThreadsafeFunctionMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnRef", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_status status = napi_ref_threadsafe_function(env, tsfn);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value RefThreadsafeFunctionRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value name = nullptr;
        napi_create_string_utf8(newEnv, "tsfnRef", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(newEnv, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_status status = napi_ref_threadsafe_function(newEnv, tsfn);
        int32_t ret = status == napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RefThreadsafeFunctionWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_ref_threadsafe_function(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value UnrefThreadsafeFunctionAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_unref_threadsafe_function(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value UnrefThreadsafeFunctionRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnUnref", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_ref_threadsafe_function(env, tsfn);
    napi_status status = napi_unref_threadsafe_function(env, tsfn);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value UnrefThreadsafeFunctionStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value name = nullptr;
        napi_create_string_utf8(env, "tsfnUnref", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_ref_threadsafe_function(env, tsfn);
        napi_status status = napi_unref_threadsafe_function(env, tsfn);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value UnrefThreadsafeFunctionMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnUnref", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_ref_threadsafe_function(env, tsfn);
    napi_status status = napi_unref_threadsafe_function(env, tsfn);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value UnrefThreadsafeFunctionRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value name = nullptr;
        napi_create_string_utf8(newEnv, "tsfnUnref", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(newEnv, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_ref_threadsafe_function(newEnv, tsfn);
        napi_status status = napi_unref_threadsafe_function(newEnv, tsfn);
        int32_t ret = status == napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value UnrefThreadsafeFunctionWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_unref_threadsafe_function(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value QueueAsyncWorkWithQosStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value asyncName = nullptr;
        napi_create_string_utf8(env, "qosAsync", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_work work = nullptr;
        napi_create_async_work(env, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);
        napi_status status = napi_queue_async_work_with_qos(env, work, napi_qos_user_initiated);
        int32_t singleRet = status == napi_ok ? 1 : 0;
    }
    return Ret(env, pass);
}

static napi_value QueueAsyncWorkWithQosMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_queue_async_work_with_qos(savedEnv, nullptr, napi_qos_default);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value QueueAsyncWorkWithQosMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value asyncName = nullptr;
    napi_create_string_utf8(env, "qosAsync", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_work work = nullptr;
    napi_create_async_work(env, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);
    napi_status status = napi_queue_async_work_with_qos(env, work, napi_qos_user_initiated);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value QueueAsyncWorkWithQosRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value asyncName = nullptr;
        napi_create_string_utf8(newEnv, "qosAsync", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_work work = nullptr;
        napi_create_async_work(newEnv, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);
        napi_status status = napi_queue_async_work_with_qos(newEnv, work, napi_qos_user_initiated);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value QueueAsyncWorkWithQosWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_queue_async_work_with_qos(savedEnv, nullptr, napi_qos_default);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CallThreadsafeFunctionWithPriorityAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_call_threadsafe_function_with_priority(nullptr, nullptr, napi_priority_high, false);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CallThreadsafeFunctionWithPriorityRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnPri", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_acquire_threadsafe_function(tsfn);
    napi_status status = napi_call_threadsafe_function_with_priority(tsfn, nullptr, napi_priority_high, false);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CallThreadsafeFunctionWithPriorityStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value name = nullptr;
        napi_create_string_utf8(env, "tsfnPri", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_acquire_threadsafe_function(tsfn);
        napi_status status = napi_call_threadsafe_function_with_priority(tsfn, nullptr, napi_priority_high, false);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CallThreadsafeFunctionWithPriorityMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value name = nullptr;
    napi_create_string_utf8(env, "tsfnPri", NAPI_AUTO_LENGTH, &name);
    napi_threadsafe_function tsfn = nullptr;
    napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
    napi_acquire_threadsafe_function(tsfn);
    napi_status status = napi_call_threadsafe_function_with_priority(tsfn, nullptr, napi_priority_high, false);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CallThreadsafeFunctionWithPriorityRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value name = nullptr;
        napi_create_string_utf8(newEnv, "tsfnPri", NAPI_AUTO_LENGTH, &name);
        napi_threadsafe_function tsfn = nullptr;
        napi_create_threadsafe_function(newEnv, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr, CallJsCb, &tsfn);
        napi_acquire_threadsafe_function(tsfn);
        napi_status status = napi_call_threadsafe_function_with_priority(tsfn, nullptr, napi_priority_high, false);
        int32_t ret = status != napi_ok ? 1 : 0;
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CallThreadsafeFunctionWithPriorityWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_call_threadsafe_function_with_priority(nullptr, nullptr, napi_priority_high, false);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createThreadsafeFunctionAbnormal", CreateThreadsafeFunctionAbnormal),
        DECLARE_NAPI_FUNCTION("createThreadsafeFunctionRetVal", CreateThreadsafeFunctionRetVal),
        DECLARE_NAPI_FUNCTION("createThreadsafeFunctionStable", CreateThreadsafeFunctionStable),
        DECLARE_NAPI_FUNCTION("createThreadsafeFunctionMultiCtx", CreateThreadsafeFunctionMultiCtx),
        DECLARE_NAPI_FUNCTION("createThreadsafeFunctionRuntime", CreateThreadsafeFunctionRuntime),
        DECLARE_NAPI_FUNCTION("createThreadsafeFunctionWorker", CreateThreadsafeFunctionWorker),
        DECLARE_NAPI_FUNCTION("getThreadsafeFunctionContextAbnormal", GetThreadsafeFunctionContextAbnormal),
        DECLARE_NAPI_FUNCTION("getThreadsafeFunctionContextRetVal", GetThreadsafeFunctionContextRetVal),
        DECLARE_NAPI_FUNCTION("getThreadsafeFunctionContextStable", GetThreadsafeFunctionContextStable),
        DECLARE_NAPI_FUNCTION("getThreadsafeFunctionContextMultiCtx", GetThreadsafeFunctionContextMultiCtx),
        DECLARE_NAPI_FUNCTION("getThreadsafeFunctionContextRuntime", GetThreadsafeFunctionContextRuntime),
        DECLARE_NAPI_FUNCTION("getThreadsafeFunctionContextWorker", GetThreadsafeFunctionContextWorker),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionAbnormal", CallThreadsafeFunctionAbnormal),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionRetVal", CallThreadsafeFunctionRetVal),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionStable", CallThreadsafeFunctionStable),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionMultiCtx", CallThreadsafeFunctionMultiCtx),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionRuntime", CallThreadsafeFunctionRuntime),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionWorker", CallThreadsafeFunctionWorker),
        DECLARE_NAPI_FUNCTION("acquireThreadsafeFunctionAbnormal", AcquireThreadsafeFunctionAbnormal),
        DECLARE_NAPI_FUNCTION("acquireThreadsafeFunctionRetVal", AcquireThreadsafeFunctionRetVal),
        DECLARE_NAPI_FUNCTION("acquireThreadsafeFunctionStable", AcquireThreadsafeFunctionStable),
        DECLARE_NAPI_FUNCTION("acquireThreadsafeFunctionMultiCtx", AcquireThreadsafeFunctionMultiCtx),
        DECLARE_NAPI_FUNCTION("acquireThreadsafeFunctionRuntime", AcquireThreadsafeFunctionRuntime),
        DECLARE_NAPI_FUNCTION("acquireThreadsafeFunctionWorker", AcquireThreadsafeFunctionWorker),
        DECLARE_NAPI_FUNCTION("releaseThreadsafeFunctionAbnormal", ReleaseThreadsafeFunctionAbnormal),
        DECLARE_NAPI_FUNCTION("releaseThreadsafeFunctionRetVal", ReleaseThreadsafeFunctionRetVal),
        DECLARE_NAPI_FUNCTION("releaseThreadsafeFunctionStable", ReleaseThreadsafeFunctionStable),
        DECLARE_NAPI_FUNCTION("releaseThreadsafeFunctionMultiCtx", ReleaseThreadsafeFunctionMultiCtx),
        DECLARE_NAPI_FUNCTION("releaseThreadsafeFunctionRuntime", ReleaseThreadsafeFunctionRuntime),
        DECLARE_NAPI_FUNCTION("releaseThreadsafeFunctionWorker", ReleaseThreadsafeFunctionWorker),
        DECLARE_NAPI_FUNCTION("refThreadsafeFunctionAbnormal", RefThreadsafeFunctionAbnormal),
        DECLARE_NAPI_FUNCTION("refThreadsafeFunctionRetVal", RefThreadsafeFunctionRetVal),
        DECLARE_NAPI_FUNCTION("refThreadsafeFunctionStable", RefThreadsafeFunctionStable),
        DECLARE_NAPI_FUNCTION("refThreadsafeFunctionMultiCtx", RefThreadsafeFunctionMultiCtx),
        DECLARE_NAPI_FUNCTION("refThreadsafeFunctionRuntime", RefThreadsafeFunctionRuntime),
        DECLARE_NAPI_FUNCTION("refThreadsafeFunctionWorker", RefThreadsafeFunctionWorker),
        DECLARE_NAPI_FUNCTION("unrefThreadsafeFunctionAbnormal", UnrefThreadsafeFunctionAbnormal),
        DECLARE_NAPI_FUNCTION("unrefThreadsafeFunctionRetVal", UnrefThreadsafeFunctionRetVal),
        DECLARE_NAPI_FUNCTION("unrefThreadsafeFunctionStable", UnrefThreadsafeFunctionStable),
        DECLARE_NAPI_FUNCTION("unrefThreadsafeFunctionMultiCtx", UnrefThreadsafeFunctionMultiCtx),
        DECLARE_NAPI_FUNCTION("unrefThreadsafeFunctionRuntime", UnrefThreadsafeFunctionRuntime),
        DECLARE_NAPI_FUNCTION("unrefThreadsafeFunctionWorker", UnrefThreadsafeFunctionWorker),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkWithQosStable", QueueAsyncWorkWithQosStable),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkWithQosMultiThread", QueueAsyncWorkWithQosMultiThread),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkWithQosMultiCtx", QueueAsyncWorkWithQosMultiCtx),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkWithQosRuntime", QueueAsyncWorkWithQosRuntime),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkWithQosWorker", QueueAsyncWorkWithQosWorker),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionWithPriorityAbnormal", CallThreadsafeFunctionWithPriorityAbnormal),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionWithPriorityRetVal", CallThreadsafeFunctionWithPriorityRetVal),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionWithPriorityStable", CallThreadsafeFunctionWithPriorityStable),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionWithPriorityMultiCtx", CallThreadsafeFunctionWithPriorityMultiCtx),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionWithPriorityRuntime", CallThreadsafeFunctionWithPriorityRuntime),
        DECLARE_NAPI_FUNCTION("callThreadsafeFunctionWithPriorityWorker", CallThreadsafeFunctionWithPriorityWorker),
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
    .nm_modname = "napiCovThreadSafe",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}