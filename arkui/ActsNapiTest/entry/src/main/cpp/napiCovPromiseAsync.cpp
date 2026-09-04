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
static const int32_t PROMISE_ASYNC_TEST_INT_VALUE = 42;

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

static napi_value CreatePromiseStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        napi_status status = napi_create_promise(env, &deferred, &promise);
        int32_t singleRet = (status == napi_ok && deferred != nullptr && promise != nullptr) ? 1 : 0;
        if (deferred != nullptr) { napi_resolve_deferred(env, deferred, promise); }
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreatePromiseMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_promise(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreatePromiseMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    int32_t ret = (status == napi_ok && deferred != nullptr && promise != nullptr) ? 1 : 0;
    if (deferred != nullptr) { napi_resolve_deferred(env, deferred, promise); }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreatePromiseRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        napi_status status = napi_create_promise(newEnv, &deferred, &promise);
        int32_t ret = (status == napi_ok && deferred != nullptr && promise != nullptr) ? 1 : 0;
        if (deferred != nullptr) { napi_resolve_deferred(newEnv, deferred, promise); }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreatePromiseWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_promise(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ResolveDeferredStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        napi_create_promise(env, &deferred, &promise);
        napi_value val = nullptr;
        napi_create_int32(env, PROMISE_ASYNC_TEST_INT_VALUE, &val);
        napi_status status = napi_resolve_deferred(env, deferred, val);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value ResolveDeferredMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_resolve_deferred(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ResolveDeferredMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);
    napi_value val = nullptr;
    napi_create_int32(env, PROMISE_ASYNC_TEST_INT_VALUE, &val);
    napi_status status = napi_resolve_deferred(env, deferred, val);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value ResolveDeferredRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        napi_create_promise(newEnv, &deferred, &promise);
        napi_value val = nullptr;
        napi_create_int32(newEnv, PROMISE_ASYNC_TEST_INT_VALUE, &val);
        napi_status status = napi_resolve_deferred(newEnv, deferred, val);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ResolveDeferredWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_resolve_deferred(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RejectDeferredRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "reject", NAPI_AUTO_LENGTH, &msg);
    napi_value err = nullptr;
    napi_create_error(env, nullptr, msg, &err);
    napi_status status = napi_reject_deferred(env, deferred, err);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value RejectDeferredStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        napi_create_promise(env, &deferred, &promise);
        napi_value msg = nullptr;
        napi_create_string_utf8(env, "reject", NAPI_AUTO_LENGTH, &msg);
        napi_value err = nullptr;
        napi_create_error(env, nullptr, msg, &err);
        napi_status status = napi_reject_deferred(env, deferred, err);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value RejectDeferredMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_reject_deferred(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RejectDeferredMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "reject", NAPI_AUTO_LENGTH, &msg);
    napi_value err = nullptr;
    napi_create_error(env, nullptr, msg, &err);
    napi_status status = napi_reject_deferred(env, deferred, err);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value RejectDeferredRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        napi_create_promise(newEnv, &deferred, &promise);
        napi_value msg = nullptr;
        napi_create_string_utf8(newEnv, "reject", NAPI_AUTO_LENGTH, &msg);
        napi_value err = nullptr;
        napi_create_error(newEnv, nullptr, msg, &err);
        napi_status status = napi_reject_deferred(newEnv, deferred, err);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RejectDeferredWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_reject_deferred(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsPromiseStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        napi_create_promise(env, &deferred, &promise);
        bool isPromise = false;
        napi_status status = napi_is_promise(env, promise, &isPromise);
        int32_t singleRet = (status == napi_ok && isPromise) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value IsPromiseMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_promise(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsPromiseMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);
    bool isPromise = false;
    napi_status status = napi_is_promise(env, promise, &isPromise);
    int32_t ret = (status == napi_ok && isPromise) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value IsPromiseRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        napi_create_promise(newEnv, &deferred, &promise);
        bool isPromise = false;
        napi_status status = napi_is_promise(newEnv, promise, &isPromise);
        int32_t ret = (status == napi_ok && isPromise) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsPromiseWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_promise(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateAsyncWorkAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_async_work(env, nullptr, nullptr, AsyncExecute, AsyncComplete, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateAsyncWorkRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value asyncName = nullptr;
    napi_create_string_utf8(env, "testAsync", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_work work = nullptr;
    napi_status status = napi_create_async_work(env, nullptr, asyncName, AsyncExecute,
        AsyncComplete, nullptr, &work);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    if (work != nullptr) { napi_delete_async_work(env, work); }
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateAsyncWorkStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value asyncName = nullptr;
        napi_create_string_utf8(env, "testAsync", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_work work = nullptr;
        napi_status status = napi_create_async_work(env, nullptr, asyncName, AsyncExecute,
        AsyncComplete, nullptr, &work);
        int32_t singleRet = (status == napi_ok && work != nullptr) ? 1 : 0;
        if (work != nullptr) { napi_delete_async_work(env, work); }
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateAsyncWorkMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_async_work(savedEnv, nullptr, nullptr, AsyncExecute,
            AsyncComplete, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateAsyncWorkMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_string_utf8(env, "testAsync", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_work work = nullptr;
    napi_status status = napi_create_async_work(env, nullptr, asyncName, AsyncExecute,
        AsyncComplete, nullptr, &work);
    int32_t ret = (status == napi_ok && work != nullptr) ? 1 : 0;
    if (work != nullptr) { napi_delete_async_work(env, work); }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateAsyncWorkRuntime(napi_env env, napi_callback_info info)
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
        napi_create_string_utf8(newEnv, "testAsync", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_work work = nullptr;
        napi_status status = napi_create_async_work(newEnv, nullptr, asyncName, AsyncExecute,
            AsyncComplete, nullptr, &work);
        int32_t ret = (status == napi_ok && work != nullptr) ? 1 : 0;
        if (work != nullptr) { napi_delete_async_work(newEnv, work); }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateAsyncWorkWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_async_work(savedEnv, nullptr, nullptr, AsyncExecute,
            AsyncComplete, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteAsyncWorkRetVal(napi_env env, napi_callback_info info)
{
    napi_value asyncName = nullptr;
    napi_create_string_utf8(env, "delAsync", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_work work = nullptr;
    napi_create_async_work(env, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);
    napi_status status = napi_delete_async_work(env, work);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value DeleteAsyncWorkStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value asyncName = nullptr;
        napi_create_string_utf8(env, "delAsync", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_work work = nullptr;
        napi_create_async_work(env, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);
        napi_status status = napi_delete_async_work(env, work);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DeleteAsyncWorkMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_async_work(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteAsyncWorkMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_string_utf8(env, "delAsync", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_work work = nullptr;
    napi_create_async_work(env, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);
    napi_status status = napi_delete_async_work(env, work);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DeleteAsyncWorkRuntime(napi_env env, napi_callback_info info)
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
        napi_create_string_utf8(newEnv, "delAsync", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_work work = nullptr;
        napi_create_async_work(newEnv, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);
        napi_status status = napi_delete_async_work(newEnv, work);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteAsyncWorkWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_async_work(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value QueueAsyncWorkRetVal(napi_env env, napi_callback_info info)
{
    napi_value asyncName = nullptr;
    napi_create_string_utf8(env, "queueAsync", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_work work = nullptr;
    napi_create_async_work(env, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);
    napi_status status = napi_queue_async_work(env, work);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value QueueAsyncWorkStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value asyncName = nullptr;
        napi_create_string_utf8(env, "queueAsync", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_work work = nullptr;
        napi_create_async_work(env, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);
        napi_status status = napi_queue_async_work(env, work);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value QueueAsyncWorkMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_queue_async_work(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value QueueAsyncWorkMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_string_utf8(env, "queueAsync", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_work work = nullptr;
    napi_create_async_work(env, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);
    napi_status status = napi_queue_async_work(env, work);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value QueueAsyncWorkRuntime(napi_env env, napi_callback_info info)
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
        napi_create_string_utf8(newEnv, "queueAsync", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_work work = nullptr;
        napi_create_async_work(newEnv, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);
        napi_status status = napi_queue_async_work(newEnv, work);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value QueueAsyncWorkWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_queue_async_work(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createPromiseStable", CreatePromiseStable),
        DECLARE_NAPI_FUNCTION("createPromiseMultiThread", CreatePromiseMultiThread),
        DECLARE_NAPI_FUNCTION("createPromiseMultiCtx", CreatePromiseMultiCtx),
        DECLARE_NAPI_FUNCTION("createPromiseRuntime", CreatePromiseRuntime),
        DECLARE_NAPI_FUNCTION("createPromiseWorker", CreatePromiseWorker),
        DECLARE_NAPI_FUNCTION("resolveDeferredStable", ResolveDeferredStable),
        DECLARE_NAPI_FUNCTION("resolveDeferredMultiThread", ResolveDeferredMultiThread),
        DECLARE_NAPI_FUNCTION("resolveDeferredMultiCtx", ResolveDeferredMultiCtx),
        DECLARE_NAPI_FUNCTION("resolveDeferredRuntime", ResolveDeferredRuntime),
        DECLARE_NAPI_FUNCTION("resolveDeferredWorker", ResolveDeferredWorker),
        DECLARE_NAPI_FUNCTION("rejectDeferredRetVal", RejectDeferredRetVal),
        DECLARE_NAPI_FUNCTION("rejectDeferredStable", RejectDeferredStable),
        DECLARE_NAPI_FUNCTION("rejectDeferredMultiThread", RejectDeferredMultiThread),
        DECLARE_NAPI_FUNCTION("rejectDeferredMultiCtx", RejectDeferredMultiCtx),
        DECLARE_NAPI_FUNCTION("rejectDeferredRuntime", RejectDeferredRuntime),
        DECLARE_NAPI_FUNCTION("rejectDeferredWorker", RejectDeferredWorker),
        DECLARE_NAPI_FUNCTION("isPromiseStable", IsPromiseStable),
        DECLARE_NAPI_FUNCTION("isPromiseMultiThread", IsPromiseMultiThread),
        DECLARE_NAPI_FUNCTION("isPromiseMultiCtx", IsPromiseMultiCtx),
        DECLARE_NAPI_FUNCTION("isPromiseRuntime", IsPromiseRuntime),
        DECLARE_NAPI_FUNCTION("isPromiseWorker", IsPromiseWorker),
        DECLARE_NAPI_FUNCTION("createAsyncWorkAbnormal", CreateAsyncWorkAbnormal),
        DECLARE_NAPI_FUNCTION("createAsyncWorkRetVal", CreateAsyncWorkRetVal),
        DECLARE_NAPI_FUNCTION("createAsyncWorkStable", CreateAsyncWorkStable),
        DECLARE_NAPI_FUNCTION("createAsyncWorkMultiThread", CreateAsyncWorkMultiThread),
        DECLARE_NAPI_FUNCTION("createAsyncWorkMultiCtx", CreateAsyncWorkMultiCtx),
        DECLARE_NAPI_FUNCTION("createAsyncWorkRuntime", CreateAsyncWorkRuntime),
        DECLARE_NAPI_FUNCTION("createAsyncWorkWorker", CreateAsyncWorkWorker),
        DECLARE_NAPI_FUNCTION("deleteAsyncWorkRetVal", DeleteAsyncWorkRetVal),
        DECLARE_NAPI_FUNCTION("deleteAsyncWorkStable", DeleteAsyncWorkStable),
        DECLARE_NAPI_FUNCTION("deleteAsyncWorkMultiThread", DeleteAsyncWorkMultiThread),
        DECLARE_NAPI_FUNCTION("deleteAsyncWorkMultiCtx", DeleteAsyncWorkMultiCtx),
        DECLARE_NAPI_FUNCTION("deleteAsyncWorkRuntime", DeleteAsyncWorkRuntime),
        DECLARE_NAPI_FUNCTION("deleteAsyncWorkWorker", DeleteAsyncWorkWorker),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkRetVal", QueueAsyncWorkRetVal),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkStable", QueueAsyncWorkStable),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkMultiThread", QueueAsyncWorkMultiThread),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkMultiCtx", QueueAsyncWorkMultiCtx),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkRuntime", QueueAsyncWorkRuntime),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkWorker", QueueAsyncWorkWorker),
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
    .nm_modname = "napiCovPromiseAsync",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}