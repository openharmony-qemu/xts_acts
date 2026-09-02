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

static napi_value AsyncInitRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value asyncName = nullptr;
    napi_create_string_utf8(env, "asyncInit", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_context ctx = nullptr;
    napi_status status = napi_async_init(env, nullptr, asyncName, &ctx);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    if (ctx != nullptr) { napi_async_destroy(env, ctx); }
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value AsyncInitStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value asyncName = nullptr;
        napi_create_string_utf8(env, "asyncInit", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_context ctx = nullptr;
        napi_status status = napi_async_init(env, nullptr, asyncName, &ctx);
        int32_t singleRet = (status == napi_ok && ctx != nullptr) ? 1 : 0;
        if (ctx != nullptr) { napi_async_destroy(env, ctx); }
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value AsyncInitMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_async_init(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AsyncInitRuntime(napi_env env, napi_callback_info info)
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
        napi_create_string_utf8(newEnv, "asyncInit", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_context ctx = nullptr;
        napi_status status = napi_async_init(newEnv, nullptr, asyncName, &ctx);
        int32_t ret = (status == napi_ok && ctx != nullptr) ? 1 : 0;
        if (ctx != nullptr) { napi_async_destroy(newEnv, ctx); }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AsyncInitWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_async_init(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AsyncDestroyRetVal(napi_env env, napi_callback_info info)
{
    napi_value asyncName = nullptr;
    napi_create_string_utf8(env, "asyncDestroy", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_context ctx = nullptr;
    napi_async_init(env, nullptr, asyncName, &ctx);
    napi_status status = napi_async_destroy(env, ctx);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value AsyncDestroyStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value asyncName = nullptr;
        napi_create_string_utf8(env, "asyncDestroy", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_context ctx = nullptr;
        napi_async_init(env, nullptr, asyncName, &ctx);
        napi_status status = napi_async_destroy(env, ctx);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value AsyncDestroyMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_async_destroy(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AsyncDestroyRuntime(napi_env env, napi_callback_info info)
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
        napi_create_string_utf8(newEnv, "asyncDestroy", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_context ctx = nullptr;
        napi_async_init(newEnv, nullptr, asyncName, &ctx);
        napi_status status = napi_async_destroy(newEnv, ctx);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AsyncDestroyWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_async_destroy(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value MakeCallbackStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value asyncName = nullptr;
        napi_create_string_utf8(env, "makeCb", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_context ctx = nullptr;
        napi_async_init(env, nullptr, asyncName, &ctx);
        napi_value cb = nullptr;
        napi_value result = nullptr;
        napi_value global = nullptr;
        napi_get_global(env, &global);
        napi_status status = napi_make_callback(env, ctx, global, cb, 0, nullptr, &result);
        napi_async_destroy(env, ctx);
        int32_t singleRet = status != napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value MakeCallbackMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_make_callback(savedEnv, nullptr, nullptr, nullptr, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value MakeCallbackRuntime(napi_env env, napi_callback_info info)
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
        napi_create_string_utf8(newEnv, "makeCb", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_context ctx = nullptr;
        napi_async_init(newEnv, nullptr, asyncName, &ctx);
        napi_value cb = nullptr;
        napi_value napiRet = nullptr;
        napi_value global = nullptr;
        napi_get_global(newEnv, &global);
        napi_status status = napi_make_callback(newEnv, ctx, global, cb, 0, nullptr, &napiRet);
        napi_async_destroy(newEnv, ctx);
        int32_t ret = status != napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value MakeCallbackWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_make_callback(savedEnv, nullptr, nullptr, nullptr, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value OpenCallbackScopeRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value asyncName = nullptr;
    napi_create_string_utf8(env, "openCb", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_context ctx = nullptr;
    napi_async_init(env, nullptr, asyncName, &ctx);
    napi_callback_scope cbScope = nullptr;
    napi_status status = napi_open_callback_scope(env, nullptr, ctx, &cbScope);
    int32_t ret = status == napi_ok ? 1 : 0;
    if (status == napi_ok) { napi_close_callback_scope(env, cbScope); }
    napi_async_destroy(env, ctx);
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value OpenCallbackScopeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value asyncName = nullptr;
        napi_create_string_utf8(env, "openCb", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_context ctx = nullptr;
        napi_async_init(env, nullptr, asyncName, &ctx);
        napi_callback_scope cbScope = nullptr;
        napi_status status = napi_open_callback_scope(env, nullptr, ctx, &cbScope);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (status == napi_ok) { napi_close_callback_scope(env, cbScope); }
        napi_async_destroy(env, ctx);
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value OpenCallbackScopeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_open_callback_scope(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value OpenCallbackScopeMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_string_utf8(env, "openCb", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_context ctx = nullptr;
    napi_async_init(env, nullptr, asyncName, &ctx);
    napi_callback_scope cbScope = nullptr;
    napi_status status = napi_open_callback_scope(env, nullptr, ctx, &cbScope);
    int32_t ret = status == napi_ok ? 1 : 0;
    if (status == napi_ok) { napi_close_callback_scope(env, cbScope); }
    napi_async_destroy(env, ctx);
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value OpenCallbackScopeRuntime(napi_env env, napi_callback_info info)
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
        napi_create_string_utf8(newEnv, "openCb", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_context ctx = nullptr;
        napi_async_init(newEnv, nullptr, asyncName, &ctx);
        napi_callback_scope cbScope = nullptr;
        napi_status status = napi_open_callback_scope(newEnv, nullptr, ctx, &cbScope);
        int32_t ret = status == napi_ok ? 1 : 0;
        if (status == napi_ok) { napi_close_callback_scope(newEnv, cbScope); }
        napi_async_destroy(newEnv, ctx);
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value OpenCallbackScopeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_open_callback_scope(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseCallbackScopeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value asyncName = nullptr;
        napi_create_string_utf8(env, "closeCb", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_context ctx = nullptr;
        napi_async_init(env, nullptr, asyncName, &ctx);
        napi_callback_scope cbScope = nullptr;
        napi_open_callback_scope(env, nullptr, ctx, &cbScope);
        napi_status status = napi_close_callback_scope(env, cbScope);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_async_destroy(env, ctx);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CloseCallbackScopeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_close_callback_scope(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseCallbackScopeMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_string_utf8(env, "closeCb", NAPI_AUTO_LENGTH, &asyncName);
    napi_async_context ctx = nullptr;
    napi_async_init(env, nullptr, asyncName, &ctx);
    napi_callback_scope cbScope = nullptr;
    napi_open_callback_scope(env, nullptr, ctx, &cbScope);
    napi_status status = napi_close_callback_scope(env, cbScope);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_async_destroy(env, ctx);
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CloseCallbackScopeRuntime(napi_env env, napi_callback_info info)
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
        napi_create_string_utf8(newEnv, "closeCb", NAPI_AUTO_LENGTH, &asyncName);
        napi_async_context ctx = nullptr;
        napi_async_init(newEnv, nullptr, asyncName, &ctx);
        napi_callback_scope cbScope = nullptr;
        napi_open_callback_scope(newEnv, nullptr, ctx, &cbScope);
        napi_status status = napi_close_callback_scope(newEnv, cbScope);
        int32_t ret = status == napi_ok ? 1 : 0;
        napi_async_destroy(newEnv, ctx);
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CloseCallbackScopeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_close_callback_scope(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("asyncInitRetVal", AsyncInitRetVal),
        DECLARE_NAPI_FUNCTION("asyncInitStable", AsyncInitStable),
        DECLARE_NAPI_FUNCTION("asyncInitMultiThread", AsyncInitMultiThread),
        DECLARE_NAPI_FUNCTION("asyncInitRuntime", AsyncInitRuntime),
        DECLARE_NAPI_FUNCTION("asyncInitWorker", AsyncInitWorker),
        DECLARE_NAPI_FUNCTION("asyncDestroyRetVal", AsyncDestroyRetVal),
        DECLARE_NAPI_FUNCTION("asyncDestroyStable", AsyncDestroyStable),
        DECLARE_NAPI_FUNCTION("asyncDestroyMultiThread", AsyncDestroyMultiThread),
        DECLARE_NAPI_FUNCTION("asyncDestroyRuntime", AsyncDestroyRuntime),
        DECLARE_NAPI_FUNCTION("asyncDestroyWorker", AsyncDestroyWorker),
        DECLARE_NAPI_FUNCTION("makeCallbackStable", MakeCallbackStable),
        DECLARE_NAPI_FUNCTION("makeCallbackMultiThread", MakeCallbackMultiThread),
        DECLARE_NAPI_FUNCTION("makeCallbackRuntime", MakeCallbackRuntime),
        DECLARE_NAPI_FUNCTION("makeCallbackWorker", MakeCallbackWorker),
        DECLARE_NAPI_FUNCTION("openCallbackScopeRetVal", OpenCallbackScopeRetVal),
        DECLARE_NAPI_FUNCTION("openCallbackScopeStable", OpenCallbackScopeStable),
        DECLARE_NAPI_FUNCTION("openCallbackScopeMultiThread", OpenCallbackScopeMultiThread),
        DECLARE_NAPI_FUNCTION("openCallbackScopeMultiCtx", OpenCallbackScopeMultiCtx),
        DECLARE_NAPI_FUNCTION("openCallbackScopeRuntime", OpenCallbackScopeRuntime),
        DECLARE_NAPI_FUNCTION("openCallbackScopeWorker", OpenCallbackScopeWorker),
        DECLARE_NAPI_FUNCTION("closeCallbackScopeStable", CloseCallbackScopeStable),
        DECLARE_NAPI_FUNCTION("closeCallbackScopeMultiThread", CloseCallbackScopeMultiThread),
        DECLARE_NAPI_FUNCTION("closeCallbackScopeMultiCtx", CloseCallbackScopeMultiCtx),
        DECLARE_NAPI_FUNCTION("closeCallbackScopeRuntime", CloseCallbackScopeRuntime),
        DECLARE_NAPI_FUNCTION("closeCallbackScopeWorker", CloseCallbackScopeWorker),
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
    .nm_modname = "napiCovCustomAsync",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}