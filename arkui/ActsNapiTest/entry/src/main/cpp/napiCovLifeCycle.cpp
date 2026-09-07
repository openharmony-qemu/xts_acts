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
static const uint32_t INITIAL_REFERENCE_COUNT = 2;

static napi_value OpenHandleScopeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope scope = nullptr;
        napi_status status = napi_open_handle_scope(env, &scope);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (status == napi_ok) { napi_close_handle_scope(env, scope); }
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value OpenHandleScopeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_open_handle_scope(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value OpenHandleScopeMultiCtx(napi_env env, napi_callback_info info)
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
    napi_handle_scope scope = nullptr;
    napi_status status = napi_open_handle_scope(env, &scope);
    int32_t ret = status == napi_ok ? 1 : 0;
    if (status == napi_ok) { napi_close_handle_scope(env, scope); }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value OpenHandleScopeRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_handle_scope hScope = nullptr;
        napi_status status = napi_open_handle_scope(newEnv, &hScope);
        int32_t ret = status == napi_ok ? 1 : 0;
        if (status == napi_ok) { napi_close_handle_scope(newEnv, hScope); }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value OpenHandleScopeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_open_handle_scope(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseHandleScopeRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_status status = napi_close_handle_scope(env, scope);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CloseHandleScopeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope scope = nullptr;
        napi_open_handle_scope(env, &scope);
        napi_status status = napi_close_handle_scope(env, scope);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CloseHandleScopeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_close_handle_scope(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseHandleScopeMultiCtx(napi_env env, napi_callback_info info)
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
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_status status = napi_close_handle_scope(env, scope);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CloseHandleScopeRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_handle_scope hScope = nullptr;
        napi_status status = napi_open_handle_scope(newEnv, &hScope);
        if (status != napi_ok) {
            result.store(0);
            napi_destroy_ark_runtime(&newEnv);
            return;
        }
        napi_status cStatus = napi_close_handle_scope(newEnv, hScope);
        int32_t ret = cStatus == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseHandleScopeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_close_handle_scope(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value OpenEscapableHandleScopeRetVal(napi_env env, napi_callback_info info)
{
    napi_escapable_handle_scope scope = nullptr;
    napi_status status = napi_open_escapable_handle_scope(env, &scope);
    int32_t ret = status == napi_ok ? 1 : 0;
    if (status == napi_ok) { napi_close_escapable_handle_scope(env, scope); }
    return Ret(env, ret);
}

static napi_value OpenEscapableHandleScopeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_escapable_handle_scope scope = nullptr;
        napi_status status = napi_open_escapable_handle_scope(env, &scope);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (status == napi_ok) { napi_close_escapable_handle_scope(env, scope); }
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value OpenEscapableHandleScopeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_open_escapable_handle_scope(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value OpenEscapableHandleScopeMultiCtx(napi_env env, napi_callback_info info)
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
    napi_escapable_handle_scope scope = nullptr;
    napi_status status = napi_open_escapable_handle_scope(env, &scope);
    int32_t ret = status == napi_ok ? 1 : 0;
    if (status == napi_ok) { napi_close_escapable_handle_scope(env, scope); }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value OpenEscapableHandleScopeRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_escapable_handle_scope scope = nullptr;
        napi_status status = napi_open_escapable_handle_scope(newEnv, &scope);
        int32_t ret = status == napi_ok ? 1 : 0;
        if (status == napi_ok) { napi_close_escapable_handle_scope(newEnv, scope); }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value OpenEscapableHandleScopeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_open_escapable_handle_scope(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseEscapableHandleScopeAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_close_escapable_handle_scope(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CloseEscapableHandleScopeRetVal(napi_env env, napi_callback_info info)
{
    napi_escapable_handle_scope scope = nullptr;
    napi_open_escapable_handle_scope(env, &scope);
    napi_status status = napi_close_escapable_handle_scope(env, scope);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CloseEscapableHandleScopeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_escapable_handle_scope scope = nullptr;
        napi_open_escapable_handle_scope(env, &scope);
        napi_status status = napi_close_escapable_handle_scope(env, scope);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CloseEscapableHandleScopeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_close_escapable_handle_scope(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseEscapableHandleScopeMultiCtx(napi_env env, napi_callback_info info)
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
    napi_escapable_handle_scope scope = nullptr;
    napi_open_escapable_handle_scope(env, &scope);
    napi_status status = napi_close_escapable_handle_scope(env, scope);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CloseEscapableHandleScopeRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_escapable_handle_scope scope = nullptr;
        napi_open_escapable_handle_scope(newEnv, &scope);
        napi_status status = napi_close_escapable_handle_scope(newEnv, scope);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseEscapableHandleScopeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_close_escapable_handle_scope(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value EscapeHandleRetVal(napi_env env, napi_callback_info info)
{
    napi_escapable_handle_scope scope = nullptr;
    napi_open_escapable_handle_scope(env, &scope);
    napi_value val = nullptr;
    napi_get_undefined(env, &val);
    napi_value escape = nullptr;
    napi_status status = napi_escape_handle(env, scope, val, &escape);
    napi_close_escapable_handle_scope(env, scope);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value EscapeHandleStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_escapable_handle_scope scope = nullptr;
        napi_open_escapable_handle_scope(env, &scope);
        napi_value val = nullptr;
        napi_get_undefined(env, &val);
        napi_value escape = nullptr;
        napi_status status = napi_escape_handle(env, scope, val, &escape);
        napi_close_escapable_handle_scope(env, scope);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value EscapeHandleMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_escape_handle(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value EscapeHandleMultiCtx(napi_env env, napi_callback_info info)
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
    napi_escapable_handle_scope scope = nullptr;
    napi_open_escapable_handle_scope(env, &scope);
    napi_value val = nullptr;
    napi_get_undefined(env, &val);
    napi_value escape = nullptr;
    napi_status status = napi_escape_handle(env, scope, val, &escape);
    napi_close_escapable_handle_scope(env, scope);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value EscapeHandleRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_escapable_handle_scope scope = nullptr;
        napi_open_escapable_handle_scope(newEnv, &scope);
        napi_value val = nullptr;
        napi_get_undefined(newEnv, &val);
        napi_value escape = nullptr;
        napi_status status = napi_escape_handle(newEnv, scope, val, &escape);
        napi_close_escapable_handle_scope(newEnv, scope);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value EscapeHandleWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_escape_handle(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateReferenceStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_ref ref = nullptr;
        napi_status status = napi_create_reference(env, obj, 1, &ref);
        int32_t singleRet = (status == napi_ok && ref != nullptr) ? 1 : 0;
        if (ref != nullptr) { napi_delete_reference(env, ref); }
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateReferenceMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_reference(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateReferenceMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_ref ref = nullptr;
    napi_status status = napi_create_reference(env, obj, 1, &ref);
    int32_t ret = (status == napi_ok && ref != nullptr) ? 1 : 0;
    if (ref != nullptr) { napi_delete_reference(env, ref); }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateReferenceRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        napi_ref ref = nullptr;
        napi_status status = napi_create_reference(newEnv, obj, 1, &ref);
        int32_t ret = (status == napi_ok && ref != nullptr) ? 1 : 0;
        if (ref != nullptr) { napi_delete_reference(newEnv, ref); }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateReferenceWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_reference(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteReferenceRetVal(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_ref ref = nullptr;
    napi_create_reference(env, obj, 1, &ref);
    napi_status status = napi_delete_reference(env, ref);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value DeleteReferenceStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_ref ref = nullptr;
        napi_create_reference(env, obj, 1, &ref);
        napi_status status = napi_delete_reference(env, ref);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DeleteReferenceMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_reference(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteReferenceMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_ref ref = nullptr;
    napi_create_reference(env, obj, 1, &ref);
    napi_status status = napi_delete_reference(env, ref);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DeleteReferenceRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        napi_ref ref = nullptr;
        napi_create_reference(newEnv, obj, 1, &ref);
        napi_status status = napi_delete_reference(newEnv, ref);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteReferenceWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_reference(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ReferenceRefAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_reference_ref(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value ReferenceRefRetVal(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_ref ref = nullptr;
    napi_create_reference(env, obj, 0, &ref);
    uint32_t count = 0;
    napi_status status = napi_reference_ref(env, ref, &count);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_delete_reference(env, ref);
    return Ret(env, ret);
}

static napi_value ReferenceRefStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_ref ref = nullptr;
        napi_create_reference(env, obj, 0, &ref);
        uint32_t count = 0;
        napi_status status = napi_reference_ref(env, ref, &count);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_delete_reference(env, ref);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value ReferenceRefMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_reference_ref(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ReferenceRefMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_ref ref = nullptr;
    napi_create_reference(env, obj, 0, &ref);
    uint32_t count = 0;
    napi_status status = napi_reference_ref(env, ref, &count);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_delete_reference(env, ref);
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value ReferenceRefRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        napi_ref ref = nullptr;
        napi_create_reference(newEnv, obj, 0, &ref);
        uint32_t count = 0;
        napi_status status = napi_reference_ref(newEnv, ref, &count);
        int32_t ret = status == napi_ok ? 1 : 0;
        napi_delete_reference(newEnv, ref);
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ReferenceRefWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_reference_ref(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ReferenceUnrefAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_reference_unref(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value ReferenceUnrefRetVal(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_ref ref = nullptr;
    napi_create_reference(env, obj, 1, &ref);
    uint32_t count = 0;
    napi_status status = napi_reference_unref(env, ref, &count);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_delete_reference(env, ref);
    return Ret(env, ret);
}

static napi_value ReferenceUnrefStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_ref ref = nullptr;
        napi_create_reference(env, obj, 1, &ref);
        uint32_t count = 0;
        napi_status status = napi_reference_unref(env, ref, &count);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_delete_reference(env, ref);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value ReferenceUnrefMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_reference_unref(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ReferenceUnrefMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_ref ref = nullptr;
    napi_create_reference(env, obj, 1, &ref);
    uint32_t count = 0;
    napi_status status = napi_reference_unref(env, ref, &count);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_delete_reference(env, ref);
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value ReferenceUnrefRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        napi_ref ref = nullptr;
        napi_create_reference(newEnv, obj, INITIAL_REFERENCE_COUNT, &ref);
        uint32_t count = 0;
        napi_status status = napi_reference_unref(newEnv, ref, &count);
        int32_t ret = status == napi_ok ? 1 : 0;
        napi_delete_reference(newEnv, ref);
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ReferenceUnrefWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_reference_unref(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetReferenceValueRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_ref ref = nullptr;
    napi_create_reference(env, obj, 1, &ref);
    napi_value result = nullptr;
    napi_status status = napi_get_reference_value(env, ref, &result);
    napi_delete_reference(env, ref);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetReferenceValueStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_ref ref = nullptr;
        napi_create_reference(env, obj, 1, &ref);
        napi_value result = nullptr;
        napi_status status = napi_get_reference_value(env, ref, &result);
        napi_delete_reference(env, ref);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetReferenceValueMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_reference_value(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetReferenceValueMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_ref ref = nullptr;
    napi_create_reference(env, obj, 1, &ref);
    napi_value result = nullptr;
    napi_status status = napi_get_reference_value(env, ref, &result);
    napi_delete_reference(env, ref);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetReferenceValueRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        napi_ref ref = nullptr;
        napi_create_reference(newEnv, obj, 1, &ref);
        napi_value napiRet = nullptr;
        napi_status status = napi_get_reference_value(newEnv, ref, &napiRet);
        napi_delete_reference(newEnv, ref);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetReferenceValueWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_reference_value(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AddFinalizerMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_add_finalizer(savedEnv, nullptr, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AddFinalizerMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_status status = napi_add_finalizer(env, obj, nullptr,
        [](napi_env e, void* d, void* h) {
            (void)e;
            (void)d;
            (void)h;
        }, nullptr, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value AddFinalizerRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        napi_status status = napi_add_finalizer(newEnv, obj, nullptr,
            [](napi_env e, void* d, void* h) {
                (void)e;
                (void)d;
                (void)h;
            }, nullptr, nullptr);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AddFinalizerWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_add_finalizer(savedEnv, nullptr, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_property_descriptor initDescriptors[] = {
    DECLARE_NAPI_FUNCTION("openHandleScopeStable", OpenHandleScopeStable),
    DECLARE_NAPI_FUNCTION("openHandleScopeMultiThread", OpenHandleScopeMultiThread),
    DECLARE_NAPI_FUNCTION("openHandleScopeMultiCtx", OpenHandleScopeMultiCtx),
    DECLARE_NAPI_FUNCTION("openHandleScopeRuntime", OpenHandleScopeRuntime),
    DECLARE_NAPI_FUNCTION("openHandleScopeWorker", OpenHandleScopeWorker),
    DECLARE_NAPI_FUNCTION("closeHandleScopeRetVal", CloseHandleScopeRetVal),
    DECLARE_NAPI_FUNCTION("closeHandleScopeStable", CloseHandleScopeStable),
    DECLARE_NAPI_FUNCTION("closeHandleScopeMultiThread", CloseHandleScopeMultiThread),
    DECLARE_NAPI_FUNCTION("closeHandleScopeMultiCtx", CloseHandleScopeMultiCtx),
    DECLARE_NAPI_FUNCTION("closeHandleScopeRuntime", CloseHandleScopeRuntime),
    DECLARE_NAPI_FUNCTION("closeHandleScopeWorker", CloseHandleScopeWorker),
    DECLARE_NAPI_FUNCTION("openEscapableHandleScopeRetVal", OpenEscapableHandleScopeRetVal),
    DECLARE_NAPI_FUNCTION("openEscapableHandleScopeStable", OpenEscapableHandleScopeStable),
    DECLARE_NAPI_FUNCTION("openEscapableHandleScopeMultiThread", OpenEscapableHandleScopeMultiThread),
    DECLARE_NAPI_FUNCTION("openEscapableHandleScopeMultiCtx", OpenEscapableHandleScopeMultiCtx),
    DECLARE_NAPI_FUNCTION("openEscapableHandleScopeRuntime", OpenEscapableHandleScopeRuntime),
    DECLARE_NAPI_FUNCTION("openEscapableHandleScopeWorker", OpenEscapableHandleScopeWorker),
    DECLARE_NAPI_FUNCTION("closeEscapableHandleScopeAbnormal", CloseEscapableHandleScopeAbnormal),
    DECLARE_NAPI_FUNCTION("closeEscapableHandleScopeRetVal", CloseEscapableHandleScopeRetVal),
    DECLARE_NAPI_FUNCTION("closeEscapableHandleScopeStable", CloseEscapableHandleScopeStable),
    DECLARE_NAPI_FUNCTION("closeEscapableHandleScopeMultiThread", CloseEscapableHandleScopeMultiThread),
    DECLARE_NAPI_FUNCTION("closeEscapableHandleScopeMultiCtx", CloseEscapableHandleScopeMultiCtx),
    DECLARE_NAPI_FUNCTION("closeEscapableHandleScopeRuntime", CloseEscapableHandleScopeRuntime),
    DECLARE_NAPI_FUNCTION("closeEscapableHandleScopeWorker", CloseEscapableHandleScopeWorker),
    DECLARE_NAPI_FUNCTION("escapeHandleRetVal", EscapeHandleRetVal),
    DECLARE_NAPI_FUNCTION("escapeHandleStable", EscapeHandleStable),
    DECLARE_NAPI_FUNCTION("escapeHandleMultiThread", EscapeHandleMultiThread),
    DECLARE_NAPI_FUNCTION("escapeHandleMultiCtx", EscapeHandleMultiCtx),
    DECLARE_NAPI_FUNCTION("escapeHandleRuntime", EscapeHandleRuntime),
    DECLARE_NAPI_FUNCTION("escapeHandleWorker", EscapeHandleWorker),
    DECLARE_NAPI_FUNCTION("createReferenceStable", CreateReferenceStable),
    DECLARE_NAPI_FUNCTION("createReferenceMultiThread", CreateReferenceMultiThread),
    DECLARE_NAPI_FUNCTION("createReferenceMultiCtx", CreateReferenceMultiCtx),
    DECLARE_NAPI_FUNCTION("createReferenceRuntime", CreateReferenceRuntime),
    DECLARE_NAPI_FUNCTION("createReferenceWorker", CreateReferenceWorker),
    DECLARE_NAPI_FUNCTION("deleteReferenceRetVal", DeleteReferenceRetVal),
    DECLARE_NAPI_FUNCTION("deleteReferenceStable", DeleteReferenceStable),
    DECLARE_NAPI_FUNCTION("deleteReferenceMultiThread", DeleteReferenceMultiThread),
    DECLARE_NAPI_FUNCTION("deleteReferenceMultiCtx", DeleteReferenceMultiCtx),
    DECLARE_NAPI_FUNCTION("deleteReferenceRuntime", DeleteReferenceRuntime),
    DECLARE_NAPI_FUNCTION("deleteReferenceWorker", DeleteReferenceWorker),
    DECLARE_NAPI_FUNCTION("referenceRefAbnormal", ReferenceRefAbnormal),
    DECLARE_NAPI_FUNCTION("referenceRefRetVal", ReferenceRefRetVal),
    DECLARE_NAPI_FUNCTION("referenceRefStable", ReferenceRefStable),
    DECLARE_NAPI_FUNCTION("referenceRefMultiThread", ReferenceRefMultiThread),
    DECLARE_NAPI_FUNCTION("referenceRefMultiCtx", ReferenceRefMultiCtx),
    DECLARE_NAPI_FUNCTION("referenceRefRuntime", ReferenceRefRuntime),
    DECLARE_NAPI_FUNCTION("referenceRefWorker", ReferenceRefWorker),
    DECLARE_NAPI_FUNCTION("referenceUnrefAbnormal", ReferenceUnrefAbnormal),
    DECLARE_NAPI_FUNCTION("referenceUnrefRetVal", ReferenceUnrefRetVal),
    DECLARE_NAPI_FUNCTION("referenceUnrefStable", ReferenceUnrefStable),
    DECLARE_NAPI_FUNCTION("referenceUnrefMultiThread", ReferenceUnrefMultiThread),
    DECLARE_NAPI_FUNCTION("referenceUnrefMultiCtx", ReferenceUnrefMultiCtx),
    DECLARE_NAPI_FUNCTION("referenceUnrefRuntime", ReferenceUnrefRuntime),
    DECLARE_NAPI_FUNCTION("referenceUnrefWorker", ReferenceUnrefWorker),
    DECLARE_NAPI_FUNCTION("getReferenceValueRetVal", GetReferenceValueRetVal),
    DECLARE_NAPI_FUNCTION("getReferenceValueStable", GetReferenceValueStable),
    DECLARE_NAPI_FUNCTION("getReferenceValueMultiThread", GetReferenceValueMultiThread),
    DECLARE_NAPI_FUNCTION("getReferenceValueMultiCtx", GetReferenceValueMultiCtx),
    DECLARE_NAPI_FUNCTION("getReferenceValueRuntime", GetReferenceValueRuntime),
    DECLARE_NAPI_FUNCTION("getReferenceValueWorker", GetReferenceValueWorker),
    DECLARE_NAPI_FUNCTION("addFinalizerMultiThread", AddFinalizerMultiThread),
    DECLARE_NAPI_FUNCTION("addFinalizerMultiCtx", AddFinalizerMultiCtx),
    DECLARE_NAPI_FUNCTION("addFinalizerRuntime", AddFinalizerRuntime),
    DECLARE_NAPI_FUNCTION("addFinalizerWorker", AddFinalizerWorker),
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(initDescriptors) / sizeof(initDescriptors[0]), initDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "napiCovLifeCycle",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
