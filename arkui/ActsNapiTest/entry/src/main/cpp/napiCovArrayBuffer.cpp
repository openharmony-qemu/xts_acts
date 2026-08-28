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

static napi_value CreateArraybufferRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    void* data = nullptr;
    napi_value result = nullptr;
    napi_status status = napi_create_arraybuffer(env, 16, &data, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateArraybufferMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_arraybuffer(savedEnv, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateArraybufferMultiCtx(napi_env env, napi_callback_info info)
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
    void* data = nullptr;
    napi_value result = nullptr;
    napi_status status = napi_create_arraybuffer(env, 16, &data, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateArraybufferRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        void* data = nullptr;
        napi_value napiRet = nullptr;
        napi_status status = napi_create_arraybuffer(newEnv, 16, &data, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateArraybufferWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_arraybuffer(savedEnv, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetArraybufferInfoRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    void* data = nullptr;
    napi_value ab = nullptr;
    napi_create_arraybuffer(env, 16, &data, &ab);
    size_t len = 0;
    void* abData = nullptr;
    napi_status status = napi_get_arraybuffer_info(env, ab, &abData, &len);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetArraybufferInfoStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        void* data = nullptr;
        napi_value ab = nullptr;
        napi_create_arraybuffer(env, 16, &data, &ab);
        size_t len = 0;
        void* abData = nullptr;
        napi_status status = napi_get_arraybuffer_info(env, ab, &abData, &len);
        int32_t singleRet = (status == napi_ok && len == 16) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetArraybufferInfoMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_arraybuffer_info(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetArraybufferInfoMultiCtx(napi_env env, napi_callback_info info)
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
    void* data = nullptr;
    napi_value ab = nullptr;
    napi_create_arraybuffer(env, 16, &data, &ab);
    size_t len = 0;
    void* abData = nullptr;
    napi_status status = napi_get_arraybuffer_info(env, ab, &abData, &len);
    int32_t ret = (status == napi_ok && len == 16) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetArraybufferInfoRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        void* data = nullptr;
        napi_value ab = nullptr;
        napi_create_arraybuffer(newEnv, 16, &data, &ab);
        size_t len = 0;
        void* abData = nullptr;
        napi_status status = napi_get_arraybuffer_info(newEnv, ab, &abData, &len);
        int32_t ret = (status == napi_ok && len == 16) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetArraybufferInfoWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_arraybuffer_info(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsArraybufferAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_is_arraybuffer(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value IsArraybufferRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    void* data = nullptr;
    napi_value ab = nullptr;
    napi_create_arraybuffer(env, 16, &data, &ab);
    bool isAB = false;
    napi_status status = napi_is_arraybuffer(env, ab, &isAB);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value IsArraybufferStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        void* data = nullptr;
        napi_value ab = nullptr;
        napi_create_arraybuffer(env, 16, &data, &ab);
        bool isAB = false;
        napi_status status = napi_is_arraybuffer(env, ab, &isAB);
        int32_t singleRet = (status == napi_ok && isAB) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value IsArraybufferMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_arraybuffer(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsArraybufferMultiCtx(napi_env env, napi_callback_info info)
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
    void* data = nullptr;
    napi_value ab = nullptr;
    napi_create_arraybuffer(env, 16, &data, &ab);
    bool isAB = false;
    napi_status status = napi_is_arraybuffer(env, ab, &isAB);
    int32_t ret = (status == napi_ok && isAB) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value IsArraybufferRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        void* data = nullptr;
        napi_value ab = nullptr;
        napi_create_arraybuffer(newEnv, 16, &data, &ab);
        bool isAB = false;
        napi_status status = napi_is_arraybuffer(newEnv, ab, &isAB);
        int32_t ret = (status == napi_ok && isAB) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsArraybufferWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_arraybuffer(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DetachArraybufferStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        void* data = nullptr;
        napi_value ab = nullptr;
        napi_create_arraybuffer(env, 16, &data, &ab);
        napi_status status = napi_detach_arraybuffer(env, ab);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DetachArraybufferMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_detach_arraybuffer(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DetachArraybufferMultiCtx(napi_env env, napi_callback_info info)
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
    void* data = nullptr;
    napi_value ab = nullptr;
    napi_create_arraybuffer(env, 16, &data, &ab);
    napi_status status = napi_detach_arraybuffer(env, ab);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DetachArraybufferRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        void* data = nullptr;
        napi_value ab = nullptr;
        napi_create_arraybuffer(newEnv, 16, &data, &ab);
        napi_status status = napi_detach_arraybuffer(newEnv, ab);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DetachArraybufferWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_detach_arraybuffer(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsDetachedArraybufferStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        void* data = nullptr;
        napi_value ab = nullptr;
        napi_create_arraybuffer(env, 16, &data, &ab);
        napi_detach_arraybuffer(env, ab);
        bool isDetached = false;
        napi_status status = napi_is_detached_arraybuffer(env, ab, &isDetached);
        int32_t singleRet = (status == napi_ok && isDetached) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value IsDetachedArraybufferMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_detached_arraybuffer(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsDetachedArraybufferMultiCtx(napi_env env, napi_callback_info info)
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
    void* data = nullptr;
    napi_value ab = nullptr;
    napi_create_arraybuffer(env, 16, &data, &ab);
    napi_detach_arraybuffer(env, ab);
    bool isDetached = false;
    napi_status status = napi_is_detached_arraybuffer(env, ab, &isDetached);
    int32_t ret = (status == napi_ok && isDetached) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value IsDetachedArraybufferRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        void* data = nullptr;
        napi_value ab = nullptr;
        napi_create_arraybuffer(newEnv, 16, &data, &ab);
        napi_detach_arraybuffer(newEnv, ab);
        bool isDetached = false;
        napi_status status = napi_is_detached_arraybuffer(newEnv, ab, &isDetached);
        int32_t ret = (status == napi_ok && isDetached) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsDetachedArraybufferWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_detached_arraybuffer(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createArraybufferRetVal", CreateArraybufferRetVal),
        DECLARE_NAPI_FUNCTION("createArraybufferMultiThread", CreateArraybufferMultiThread),
        DECLARE_NAPI_FUNCTION("createArraybufferMultiCtx", CreateArraybufferMultiCtx),
        DECLARE_NAPI_FUNCTION("createArraybufferRuntime", CreateArraybufferRuntime),
        DECLARE_NAPI_FUNCTION("createArraybufferWorker", CreateArraybufferWorker),
        DECLARE_NAPI_FUNCTION("getArraybufferInfoRetVal", GetArraybufferInfoRetVal),
        DECLARE_NAPI_FUNCTION("getArraybufferInfoStable", GetArraybufferInfoStable),
        DECLARE_NAPI_FUNCTION("getArraybufferInfoMultiThread", GetArraybufferInfoMultiThread),
        DECLARE_NAPI_FUNCTION("getArraybufferInfoMultiCtx", GetArraybufferInfoMultiCtx),
        DECLARE_NAPI_FUNCTION("getArraybufferInfoRuntime", GetArraybufferInfoRuntime),
        DECLARE_NAPI_FUNCTION("getArraybufferInfoWorker", GetArraybufferInfoWorker),
        DECLARE_NAPI_FUNCTION("isArraybufferAbnormal", IsArraybufferAbnormal),
        DECLARE_NAPI_FUNCTION("isArraybufferRetVal", IsArraybufferRetVal),
        DECLARE_NAPI_FUNCTION("isArraybufferStable", IsArraybufferStable),
        DECLARE_NAPI_FUNCTION("isArraybufferMultiThread", IsArraybufferMultiThread),
        DECLARE_NAPI_FUNCTION("isArraybufferMultiCtx", IsArraybufferMultiCtx),
        DECLARE_NAPI_FUNCTION("isArraybufferRuntime", IsArraybufferRuntime),
        DECLARE_NAPI_FUNCTION("isArraybufferWorker", IsArraybufferWorker),
        DECLARE_NAPI_FUNCTION("detachArraybufferStable", DetachArraybufferStable),
        DECLARE_NAPI_FUNCTION("detachArraybufferMultiThread", DetachArraybufferMultiThread),
        DECLARE_NAPI_FUNCTION("detachArraybufferMultiCtx", DetachArraybufferMultiCtx),
        DECLARE_NAPI_FUNCTION("detachArraybufferRuntime", DetachArraybufferRuntime),
        DECLARE_NAPI_FUNCTION("detachArraybufferWorker", DetachArraybufferWorker),
        DECLARE_NAPI_FUNCTION("isDetachedArraybufferStable", IsDetachedArraybufferStable),
        DECLARE_NAPI_FUNCTION("isDetachedArraybufferMultiThread", IsDetachedArraybufferMultiThread),
        DECLARE_NAPI_FUNCTION("isDetachedArraybufferMultiCtx", IsDetachedArraybufferMultiCtx),
        DECLARE_NAPI_FUNCTION("isDetachedArraybufferRuntime", IsDetachedArraybufferRuntime),
        DECLARE_NAPI_FUNCTION("isDetachedArraybufferWorker", IsDetachedArraybufferWorker),
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
    .nm_modname = "napiCovArrayBuffer",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}