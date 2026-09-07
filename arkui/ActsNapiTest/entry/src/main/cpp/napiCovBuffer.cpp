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

static const int32_t EXT_BUFFER_SIZE = 8;
static const int32_t BUFFER_SIZE = 16;
static const int32_t STABLE_LOOP_COUNT = 10;

static napi_value CreateBufferStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        void* data = nullptr;
        napi_value result = nullptr;
        napi_status status = napi_create_buffer(env, BUFFER_SIZE, &data, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateBufferMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_buffer(savedEnv, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBufferMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_create_buffer(env, BUFFER_SIZE, &data, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateBufferRuntime(napi_env env, napi_callback_info info)
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
        napi_status status = napi_create_buffer(newEnv, BUFFER_SIZE, &data, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBufferWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_buffer(savedEnv, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBufferCopyRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    const char* src = "hello";
    void* data = nullptr;
    napi_value result = nullptr;
    napi_status status = napi_create_buffer_copy(env, 5, src, &data, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateBufferCopyStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        const char* src = "hello";
        void* data = nullptr;
        napi_value result = nullptr;
        napi_status status = napi_create_buffer_copy(env, 5, src, &data, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateBufferCopyMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_buffer_copy(savedEnv, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBufferCopyMultiCtx(napi_env env, napi_callback_info info)
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
    const char* src = "hello";
    void* data = nullptr;
    napi_value result = nullptr;
    napi_status status = napi_create_buffer_copy(env, 5, src, &data, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateBufferCopyRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        const char* src = "hello";
        void* data = nullptr;
        napi_value napiRet = nullptr;
        napi_status status = napi_create_buffer_copy(newEnv, 5, src, &data, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBufferCopyWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_buffer_copy(savedEnv, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalBufferStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        static char extData[] = "external";
        napi_value result = nullptr;
        napi_status status = napi_create_external_buffer(env, 8, extData, nullptr, nullptr, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateExternalBufferMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_external_buffer(savedEnv, 0, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalBufferMultiCtx(napi_env env, napi_callback_info info)
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
    static char extData[] = "external";
    napi_value result = nullptr;
    napi_status status = napi_create_external_buffer(env, 8, extData, nullptr, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateExternalBufferRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        static char extData[] = "external";
        napi_value napiRet = nullptr;
        napi_status status = napi_create_external_buffer(newEnv, 8, extData, nullptr, nullptr, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalBufferWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_external_buffer(savedEnv, 0, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetBufferInfoAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_buffer_info(env, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetBufferInfoStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        void* data = nullptr;
        napi_value buf = nullptr;
        napi_create_buffer(env, BUFFER_SIZE, &data, &buf);
        size_t len = 0;
        void* bufData = nullptr;
        napi_status status = napi_get_buffer_info(env, buf, &bufData, &len);
        int32_t singleRet = (status == napi_ok && len == 16) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetBufferInfoMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_buffer_info(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetBufferInfoMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value buf = nullptr;
    napi_create_buffer(env, BUFFER_SIZE, &data, &buf);
    size_t len = 0;
    void* bufData = nullptr;
    napi_status status = napi_get_buffer_info(env, buf, &bufData, &len);
    int32_t ret = (status == napi_ok && len == 16) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetBufferInfoRuntime(napi_env env, napi_callback_info info)
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
        napi_value buf = nullptr;
        napi_create_buffer(newEnv, BUFFER_SIZE, &data, &buf);
        size_t len = 0;
        void* bufData = nullptr;
        napi_status status = napi_get_buffer_info(newEnv, buf, &bufData, &len);
        int32_t ret = (status == napi_ok && len == 16) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetBufferInfoWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_buffer_info(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsBufferStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        void* data = nullptr;
        napi_value buf = nullptr;
        napi_create_buffer(env, BUFFER_SIZE, &data, &buf);
        bool isBuf = false;
        napi_status status = napi_is_buffer(env, buf, &isBuf);
        int32_t singleRet = (status == napi_ok && isBuf) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value IsBufferMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_buffer(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsBufferMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value buf = nullptr;
    napi_create_buffer(env, BUFFER_SIZE, &data, &buf);
    bool isBuf = false;
    napi_status status = napi_is_buffer(env, buf, &isBuf);
    int32_t ret = (status == napi_ok && isBuf) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value IsBufferRuntime(napi_env env, napi_callback_info info)
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
        napi_value buf = nullptr;
        napi_create_buffer(newEnv, BUFFER_SIZE, &data, &buf);
        bool isBuf = false;
        napi_status status = napi_is_buffer(newEnv, buf, &isBuf);
        int32_t ret = (status == napi_ok && isBuf) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsBufferWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_buffer(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalArraybufferStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        static char extAB[] = "arraybuf";
        napi_value result = nullptr;
        napi_status status = napi_create_external_arraybuffer(env, extAB, EXT_BUFFER_SIZE, nullptr, nullptr, &result);
        int32_t singleRet = status != napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateExternalArraybufferMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_external_arraybuffer(savedEnv, nullptr, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalArraybufferMultiCtx(napi_env env, napi_callback_info info)
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
    static char extAB[] = "arraybuf";
    napi_value result = nullptr;
    napi_status status = napi_create_external_arraybuffer(env, extAB, EXT_BUFFER_SIZE, nullptr, nullptr, &result);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateExternalArraybufferRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        static char extAB[] = "arraybuf";
        napi_value napiRet = nullptr;
        napi_status status = napi_create_external_arraybuffer(newEnv, extAB, EXT_BUFFER_SIZE,
            nullptr, nullptr, &napiRet);
        int32_t ret = status != napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalArraybufferWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_external_arraybuffer(savedEnv, nullptr, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createBufferStable", CreateBufferStable),
        DECLARE_NAPI_FUNCTION("createBufferMultiThread", CreateBufferMultiThread),
        DECLARE_NAPI_FUNCTION("createBufferMultiCtx", CreateBufferMultiCtx),
        DECLARE_NAPI_FUNCTION("createBufferRuntime", CreateBufferRuntime),
        DECLARE_NAPI_FUNCTION("createBufferWorker", CreateBufferWorker),
        DECLARE_NAPI_FUNCTION("createBufferCopyRetVal", CreateBufferCopyRetVal),
        DECLARE_NAPI_FUNCTION("createBufferCopyStable", CreateBufferCopyStable),
        DECLARE_NAPI_FUNCTION("createBufferCopyMultiThread", CreateBufferCopyMultiThread),
        DECLARE_NAPI_FUNCTION("createBufferCopyMultiCtx", CreateBufferCopyMultiCtx),
        DECLARE_NAPI_FUNCTION("createBufferCopyRuntime", CreateBufferCopyRuntime),
        DECLARE_NAPI_FUNCTION("createBufferCopyWorker", CreateBufferCopyWorker),
        DECLARE_NAPI_FUNCTION("createExternalBufferStable", CreateExternalBufferStable),
        DECLARE_NAPI_FUNCTION("createExternalBufferMultiThread", CreateExternalBufferMultiThread),
        DECLARE_NAPI_FUNCTION("createExternalBufferMultiCtx", CreateExternalBufferMultiCtx),
        DECLARE_NAPI_FUNCTION("createExternalBufferRuntime", CreateExternalBufferRuntime),
        DECLARE_NAPI_FUNCTION("createExternalBufferWorker", CreateExternalBufferWorker),
        DECLARE_NAPI_FUNCTION("getBufferInfoAbnormal", GetBufferInfoAbnormal),
        DECLARE_NAPI_FUNCTION("getBufferInfoStable", GetBufferInfoStable),
        DECLARE_NAPI_FUNCTION("getBufferInfoMultiThread", GetBufferInfoMultiThread),
        DECLARE_NAPI_FUNCTION("getBufferInfoMultiCtx", GetBufferInfoMultiCtx),
        DECLARE_NAPI_FUNCTION("getBufferInfoRuntime", GetBufferInfoRuntime),
        DECLARE_NAPI_FUNCTION("getBufferInfoWorker", GetBufferInfoWorker),
        DECLARE_NAPI_FUNCTION("isBufferStable", IsBufferStable),
        DECLARE_NAPI_FUNCTION("isBufferMultiThread", IsBufferMultiThread),
        DECLARE_NAPI_FUNCTION("isBufferMultiCtx", IsBufferMultiCtx),
        DECLARE_NAPI_FUNCTION("isBufferRuntime", IsBufferRuntime),
        DECLARE_NAPI_FUNCTION("isBufferWorker", IsBufferWorker),
        DECLARE_NAPI_FUNCTION("createExternalArraybufferStable", CreateExternalArraybufferStable),
        DECLARE_NAPI_FUNCTION("createExternalArraybufferMultiThread", CreateExternalArraybufferMultiThread),
        DECLARE_NAPI_FUNCTION("createExternalArraybufferMultiCtx", CreateExternalArraybufferMultiCtx),
        DECLARE_NAPI_FUNCTION("createExternalArraybufferRuntime", CreateExternalArraybufferRuntime),
        DECLARE_NAPI_FUNCTION("createExternalArraybufferWorker", CreateExternalArraybufferWorker),
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
    .nm_modname = "napiCovBuffer",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}