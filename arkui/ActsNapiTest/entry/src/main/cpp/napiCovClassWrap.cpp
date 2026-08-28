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
static const int32_t NATIVE_DATA_VALUE = 42;

static napi_value Constructor(napi_env env, napi_callback_info info) {
    napi_value thisVar = nullptr;
    napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
    return thisVar;
}

static napi_value DefineClassStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value className = nullptr;
        napi_create_string_utf8(env, "TestClass", NAPI_AUTO_LENGTH, &className);
        napi_value result = nullptr;
        napi_status status = napi_define_class(env, "TestClass", NAPI_AUTO_LENGTH,
            Constructor, nullptr, 0, nullptr, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DefineClassMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_define_class(savedEnv, nullptr, 0, nullptr, nullptr, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DefineClassMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value className = nullptr;
    napi_create_string_utf8(env, "TestClass", NAPI_AUTO_LENGTH, &className);
    napi_value result = nullptr;
    napi_status status = napi_define_class(env, "TestClass", NAPI_AUTO_LENGTH,
        Constructor, nullptr, 0, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DefineClassRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value className = nullptr;
        napi_create_string_utf8(newEnv, "TestClass", NAPI_AUTO_LENGTH, &className);
        napi_value napiRet = nullptr;
        napi_status status = napi_define_class(newEnv, "TestClass", NAPI_AUTO_LENGTH,
            Constructor, nullptr, 0, nullptr, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DefineClassWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_define_class(savedEnv, nullptr, 0, nullptr, nullptr, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value NewInstanceStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value ctor = nullptr;
        napi_define_class(env, "TestClass", NAPI_AUTO_LENGTH, Constructor, nullptr, 0, nullptr, &ctor);
        napi_value result = nullptr;
        napi_status status = napi_new_instance(env, ctor, 0, nullptr, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value NewInstanceMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_new_instance(savedEnv, nullptr, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value NewInstanceMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value ctor = nullptr;
    napi_define_class(env, "TestClass", NAPI_AUTO_LENGTH, Constructor, nullptr, 0, nullptr, &ctor);
    napi_value result = nullptr;
    napi_status status = napi_new_instance(env, ctor, 0, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value NewInstanceRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value ctor = nullptr;
        napi_define_class(newEnv, "TestClass", NAPI_AUTO_LENGTH, Constructor, nullptr, 0, nullptr, &ctor);
        napi_value napiRet = nullptr;
        napi_status status = napi_new_instance(newEnv, ctor, 0, nullptr, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value NewInstanceWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_new_instance(savedEnv, nullptr, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetNewTargetAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_new_target(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetNewTargetStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_status status = napi_get_new_target(env, nullptr, (napi_value*)1);
        int32_t singleRet = status != napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetNewTargetMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_new_target(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetNewTargetMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_get_new_target(env, nullptr, (napi_value*)1);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetNewTargetRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_status status = napi_get_new_target(newEnv, nullptr, (napi_value*)1);
        int32_t ret = status != napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetNewTargetWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_new_target(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value WrapStable(napi_env env, napi_callback_info info)
{
    static int32_t nativeData = NATIVE_DATA_VALUE;
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_status status = napi_wrap(env, obj, &nativeData, nullptr, nullptr, nullptr);
        int32_t singleRet = status != napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value WrapMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_wrap(savedEnv, nullptr, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value WrapMultiCtx(napi_env env, napi_callback_info info)
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
    static int32_t nativeData = NATIVE_DATA_VALUE;
    napi_status status = napi_wrap(env, obj, &nativeData, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value WrapWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_wrap(savedEnv, nullptr, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value UnwrapStable(napi_env env, napi_callback_info info)
{
    static int32_t nativeData = NATIVE_DATA_VALUE;
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_wrap(env, obj, &nativeData, nullptr, nullptr, nullptr);
        void* unwrapped = nullptr;
        napi_status status = napi_unwrap(env, obj, &unwrapped);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value UnwrapMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_unwrap(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value UnwrapMultiCtx(napi_env env, napi_callback_info info)
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
    static int32_t nativeData = NATIVE_DATA_VALUE;
    napi_wrap(env, obj, &nativeData, nullptr, nullptr, nullptr);
    void* unwrapped = nullptr;
    napi_status status = napi_unwrap(env, obj, &unwrapped);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value UnwrapWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_unwrap(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RemoveWrapStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        int32_t nativeData = 42;
        napi_wrap(env, obj, &nativeData, nullptr, nullptr, nullptr);
        void* unwrapped = nullptr;
        napi_status status = napi_remove_wrap(env, obj, &unwrapped);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value RemoveWrapMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_remove_wrap(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RemoveWrapMultiCtx(napi_env env, napi_callback_info info)
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
    int32_t nativeData = 42;
    napi_wrap(env, obj, &nativeData, nullptr, nullptr, nullptr);
    void* unwrapped = nullptr;
    napi_status status = napi_remove_wrap(env, obj, &unwrapped);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value RemoveWrapRuntime(napi_env env, napi_callback_info info)
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
        int32_t nativeData = 42;
        napi_wrap(newEnv, obj, &nativeData, nullptr, nullptr, nullptr);
        void* unwrapped = nullptr;
        napi_status status = napi_remove_wrap(newEnv, obj, &unwrapped);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RemoveWrapWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_remove_wrap(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value WrapEnhanceStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        int32_t nativeData = 42;
        napi_status status = napi_wrap_enhance(env, obj, &nativeData, nullptr, false, nullptr, 4, nullptr);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value WrapEnhanceMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_wrap_enhance(savedEnv, nullptr, nullptr, nullptr, false, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value WrapEnhanceMultiCtx(napi_env env, napi_callback_info info)
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
    int32_t nativeData = 42;
    napi_status status = napi_wrap_enhance(env, obj, &nativeData, nullptr, false, nullptr, 4, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value WrapEnhanceRuntime(napi_env env, napi_callback_info info)
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
        int32_t nativeData = 42;
        napi_status status = napi_wrap_enhance(newEnv, obj, &nativeData, nullptr, false, nullptr, 4, nullptr);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value WrapEnhanceWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_wrap_enhance(savedEnv, nullptr, nullptr, nullptr, false, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("defineClassStable", DefineClassStable),
        DECLARE_NAPI_FUNCTION("defineClassMultiThread", DefineClassMultiThread),
        DECLARE_NAPI_FUNCTION("defineClassMultiCtx", DefineClassMultiCtx),
        DECLARE_NAPI_FUNCTION("defineClassRuntime", DefineClassRuntime),
        DECLARE_NAPI_FUNCTION("defineClassWorker", DefineClassWorker),
        DECLARE_NAPI_FUNCTION("newInstanceStable", NewInstanceStable),
        DECLARE_NAPI_FUNCTION("newInstanceMultiThread", NewInstanceMultiThread),
        DECLARE_NAPI_FUNCTION("newInstanceMultiCtx", NewInstanceMultiCtx),
        DECLARE_NAPI_FUNCTION("newInstanceRuntime", NewInstanceRuntime),
        DECLARE_NAPI_FUNCTION("newInstanceWorker", NewInstanceWorker),
        DECLARE_NAPI_FUNCTION("getNewTargetAbnormal", GetNewTargetAbnormal),
        DECLARE_NAPI_FUNCTION("getNewTargetStable", GetNewTargetStable),
        DECLARE_NAPI_FUNCTION("getNewTargetMultiThread", GetNewTargetMultiThread),
        DECLARE_NAPI_FUNCTION("getNewTargetMultiCtx", GetNewTargetMultiCtx),
        DECLARE_NAPI_FUNCTION("getNewTargetRuntime", GetNewTargetRuntime),
        DECLARE_NAPI_FUNCTION("getNewTargetWorker", GetNewTargetWorker),
        DECLARE_NAPI_FUNCTION("wrapStable", WrapStable),
        DECLARE_NAPI_FUNCTION("wrapMultiThread", WrapMultiThread),
        DECLARE_NAPI_FUNCTION("wrapMultiCtx", WrapMultiCtx),
        DECLARE_NAPI_FUNCTION("wrapWorker", WrapWorker),
        DECLARE_NAPI_FUNCTION("unwrapStable", UnwrapStable),
        DECLARE_NAPI_FUNCTION("unwrapMultiThread", UnwrapMultiThread),
        DECLARE_NAPI_FUNCTION("unwrapMultiCtx", UnwrapMultiCtx),
        DECLARE_NAPI_FUNCTION("unwrapWorker", UnwrapWorker),
        DECLARE_NAPI_FUNCTION("removeWrapStable", RemoveWrapStable),
        DECLARE_NAPI_FUNCTION("removeWrapMultiThread", RemoveWrapMultiThread),
        DECLARE_NAPI_FUNCTION("removeWrapMultiCtx", RemoveWrapMultiCtx),
        DECLARE_NAPI_FUNCTION("removeWrapRuntime", RemoveWrapRuntime),
        DECLARE_NAPI_FUNCTION("removeWrapWorker", RemoveWrapWorker),
        DECLARE_NAPI_FUNCTION("wrapEnhanceStable", WrapEnhanceStable),
        DECLARE_NAPI_FUNCTION("wrapEnhanceMultiThread", WrapEnhanceMultiThread),
        DECLARE_NAPI_FUNCTION("wrapEnhanceMultiCtx", WrapEnhanceMultiCtx),
        DECLARE_NAPI_FUNCTION("wrapEnhanceRuntime", WrapEnhanceRuntime),
        DECLARE_NAPI_FUNCTION("wrapEnhanceWorker", WrapEnhanceWorker),
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
    .nm_modname = "napiCovClassWrap",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}