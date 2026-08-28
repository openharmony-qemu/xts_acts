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

static napi_value TestCallback(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    return result;
}

static napi_value CreateFunctionAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_function(env, nullptr, 0, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateFunctionRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value fnName = nullptr;
    napi_create_string_utf8(env, "testFn", NAPI_AUTO_LENGTH, &fnName);
    napi_value result = nullptr;
    napi_status status = napi_create_function(env, "testFn", NAPI_AUTO_LENGTH, TestCallback, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateFunctionStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value fnName = nullptr;
        napi_create_string_utf8(env, "testFn", NAPI_AUTO_LENGTH, &fnName);
        napi_value result = nullptr;
        napi_status status = napi_create_function(env, "testFn", NAPI_AUTO_LENGTH, TestCallback, nullptr, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateFunctionMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_function(savedEnv, nullptr, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateFunctionMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value fnName = nullptr;
    napi_create_string_utf8(env, "testFn", NAPI_AUTO_LENGTH, &fnName);
    napi_value result = nullptr;
    napi_status status = napi_create_function(env, "testFn", NAPI_AUTO_LENGTH, TestCallback, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateFunctionRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value fnName = nullptr;
        napi_create_string_utf8(newEnv, "testFn", NAPI_AUTO_LENGTH, &fnName);
        napi_value napiRet = nullptr;
        napi_status status = napi_create_function(newEnv, "testFn", NAPI_AUTO_LENGTH, TestCallback, nullptr, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateFunctionWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_function(savedEnv, nullptr, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CallFunctionRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value fn = nullptr;
    napi_create_function(env, "callFn", NAPI_AUTO_LENGTH, TestCallback, nullptr, &fn);
    napi_value global = nullptr;
    napi_get_global(env, &global);
    napi_value result = nullptr;
    napi_status status = napi_call_function(env, global, fn, 0, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CallFunctionStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value fn = nullptr;
        napi_create_function(env, "callFn", NAPI_AUTO_LENGTH, TestCallback, nullptr, &fn);
        napi_value global = nullptr;
        napi_get_global(env, &global);
        napi_value result = nullptr;
        napi_status status = napi_call_function(env, global, fn, 0, nullptr, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CallFunctionMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_call_function(savedEnv, nullptr, nullptr, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CallFunctionMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value fn = nullptr;
    napi_create_function(env, "callFn", NAPI_AUTO_LENGTH, TestCallback, nullptr, &fn);
    napi_value global = nullptr;
    napi_get_global(env, &global);
    napi_value result = nullptr;
    napi_status status = napi_call_function(env, global, fn, 0, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CallFunctionWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_call_function(savedEnv, nullptr, nullptr, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetCbInfoStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_status status = napi_get_cb_info(env, nullptr, nullptr, nullptr, nullptr, nullptr);
        int32_t singleRet = status != napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetCbInfoMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_cb_info(savedEnv, nullptr, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetCbInfoMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_get_cb_info(env, nullptr, nullptr, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetCbInfoRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_status status = napi_get_cb_info(newEnv, nullptr, nullptr, nullptr, nullptr, nullptr);
        int32_t ret = status != napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetCbInfoWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_cb_info(savedEnv, nullptr, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetUvEventLoopStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        struct uv_loop_s* loop = nullptr;
        napi_status status = napi_get_uv_event_loop(env, &loop);
        int32_t singleRet = (status == napi_ok && loop != nullptr) ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetUvEventLoopMultiCtx(napi_env env, napi_callback_info info)
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
    struct uv_loop_s* loop = nullptr;
    napi_status status = napi_get_uv_event_loop(env, &loop);
    int32_t ret = (status == napi_ok && loop != nullptr) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetUvEventLoopWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_uv_event_loop(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetVersionAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_version(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetVersionStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        uint32_t version = 0;
        napi_status status = napi_get_version(env, &version);
        int32_t singleRet = (status == napi_ok && version > 0) ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetVersionMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_version(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetVersionMultiCtx(napi_env env, napi_callback_info info)
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
    uint32_t version = 0;
    napi_status status = napi_get_version(env, &version);
    int32_t ret = (status == napi_ok && version > 0) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetVersionRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        uint32_t version = 0;
        napi_status status = napi_get_version(newEnv, &version);
        int32_t ret = (status == napi_ok && version > 0) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetVersionWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_version(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value NodeApiGetModuleFileNameStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        const char* name = nullptr;
        napi_status status = node_api_get_module_file_name(env, &name);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value NodeApiGetModuleFileNameMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = node_api_get_module_file_name(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value NodeApiGetModuleFileNameMultiCtx(napi_env env, napi_callback_info info)
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
    const char* name = nullptr;
    napi_status status = node_api_get_module_file_name(env, &name);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value NodeApiGetModuleFileNameRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        const char* name = nullptr;
        napi_status status = node_api_get_module_file_name(newEnv, &name);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value NodeApiGetModuleFileNameWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = node_api_get_module_file_name(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value StrictEqualsStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value a = nullptr;
        napi_value b = nullptr;
        napi_create_int32(env, 1, &a);
        napi_create_int32(env, 1, &b);
        bool equals = false;
        napi_status status = napi_strict_equals(env, a, b, &equals);
        int32_t singleRet = (status == napi_ok && equals) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value StrictEqualsMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_strict_equals(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value StrictEqualsMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value a = nullptr;
    napi_value b = nullptr;
    napi_create_int32(env, 1, &a);
    napi_create_int32(env, 1, &b);
    bool equals = false;
    napi_status status = napi_strict_equals(env, a, b, &equals);
    int32_t ret = (status == napi_ok && equals) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value StrictEqualsRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value a = nullptr;
        napi_value b = nullptr;
        napi_create_int32(newEnv, 1, &a);
        napi_create_int32(newEnv, 1, &b);
        bool equals = false;
        napi_status status = napi_strict_equals(newEnv, a, b, &equals);
        int32_t ret = (status == napi_ok && equals) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value StrictEqualsWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_strict_equals(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createFunctionAbnormal", CreateFunctionAbnormal),
        DECLARE_NAPI_FUNCTION("createFunctionRetVal", CreateFunctionRetVal),
        DECLARE_NAPI_FUNCTION("createFunctionStable", CreateFunctionStable),
        DECLARE_NAPI_FUNCTION("createFunctionMultiThread", CreateFunctionMultiThread),
        DECLARE_NAPI_FUNCTION("createFunctionMultiCtx", CreateFunctionMultiCtx),
        DECLARE_NAPI_FUNCTION("createFunctionRuntime", CreateFunctionRuntime),
        DECLARE_NAPI_FUNCTION("createFunctionWorker", CreateFunctionWorker),
        DECLARE_NAPI_FUNCTION("callFunctionRetVal", CallFunctionRetVal),
        DECLARE_NAPI_FUNCTION("callFunctionStable", CallFunctionStable),
        DECLARE_NAPI_FUNCTION("callFunctionMultiThread", CallFunctionMultiThread),
        DECLARE_NAPI_FUNCTION("callFunctionMultiCtx", CallFunctionMultiCtx),
        DECLARE_NAPI_FUNCTION("callFunctionWorker", CallFunctionWorker),
        DECLARE_NAPI_FUNCTION("getCbInfoStable", GetCbInfoStable),
        DECLARE_NAPI_FUNCTION("getCbInfoMultiThread", GetCbInfoMultiThread),
        DECLARE_NAPI_FUNCTION("getCbInfoMultiCtx", GetCbInfoMultiCtx),
        DECLARE_NAPI_FUNCTION("getCbInfoRuntime", GetCbInfoRuntime),
        DECLARE_NAPI_FUNCTION("getCbInfoWorker", GetCbInfoWorker),
        DECLARE_NAPI_FUNCTION("getUvEventLoopStable", GetUvEventLoopStable),
        DECLARE_NAPI_FUNCTION("getUvEventLoopMultiCtx", GetUvEventLoopMultiCtx),
        DECLARE_NAPI_FUNCTION("getUvEventLoopWorker", GetUvEventLoopWorker),
        DECLARE_NAPI_FUNCTION("getVersionAbnormal", GetVersionAbnormal),
        DECLARE_NAPI_FUNCTION("getVersionStable", GetVersionStable),
        DECLARE_NAPI_FUNCTION("getVersionMultiThread", GetVersionMultiThread),
        DECLARE_NAPI_FUNCTION("getVersionMultiCtx", GetVersionMultiCtx),
        DECLARE_NAPI_FUNCTION("getVersionRuntime", GetVersionRuntime),
        DECLARE_NAPI_FUNCTION("getVersionWorker", GetVersionWorker),
        DECLARE_NAPI_FUNCTION("nodeApiGetModuleFileNameStable", NodeApiGetModuleFileNameStable),
        DECLARE_NAPI_FUNCTION("nodeApiGetModuleFileNameMultiThread", NodeApiGetModuleFileNameMultiThread),
        DECLARE_NAPI_FUNCTION("nodeApiGetModuleFileNameMultiCtx", NodeApiGetModuleFileNameMultiCtx),
        DECLARE_NAPI_FUNCTION("nodeApiGetModuleFileNameRuntime", NodeApiGetModuleFileNameRuntime),
        DECLARE_NAPI_FUNCTION("nodeApiGetModuleFileNameWorker", NodeApiGetModuleFileNameWorker),
        DECLARE_NAPI_FUNCTION("strictEqualsStable", StrictEqualsStable),
        DECLARE_NAPI_FUNCTION("strictEqualsMultiThread", StrictEqualsMultiThread),
        DECLARE_NAPI_FUNCTION("strictEqualsMultiCtx", StrictEqualsMultiCtx),
        DECLARE_NAPI_FUNCTION("strictEqualsRuntime", StrictEqualsRuntime),
        DECLARE_NAPI_FUNCTION("strictEqualsWorker", StrictEqualsWorker),
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
    .nm_modname = "napiCovFunction",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}