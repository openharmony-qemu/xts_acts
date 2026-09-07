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
static const int32_t SECOND_NAMED_PROP_VALUE = 2;
static const int32_t FAST_OBJ_TEST_VALUE = 42;

static void* DetachCallback(napi_env env, void* nativeObject, void* hint)
{
    (void)env;
    (void)nativeObject;
    (void)hint;
    return nullptr;
}
static napi_value AttachCallback(napi_env env, void* nativeObject, void* hint)
{
    (void)env;
    (void)nativeObject;
    (void)hint;
    return nullptr;
}

static napi_value CreateObjectWithPropertiesStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(env, FAST_OBJ_TEST_VALUE, &val);
        napi_property_descriptor desc[] = {{"key", nullptr, nullptr, nullptr, nullptr, val, napi_default, nullptr}};
        napi_value result = nullptr;
        napi_status status = napi_create_object_with_properties(env, &result, 1, desc);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateObjectWithPropertiesMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_object_with_properties(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateObjectWithPropertiesMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, FAST_OBJ_TEST_VALUE, &val);
    napi_property_descriptor desc[] = {{"key", nullptr, nullptr, nullptr, nullptr, val, napi_default, nullptr}};
    napi_value result = nullptr;
    napi_status status = napi_create_object_with_properties(env, &result, 1, desc);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateObjectWithPropertiesRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(newEnv, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(newEnv, FAST_OBJ_TEST_VALUE, &val);
        napi_property_descriptor desc[] = {{"key", nullptr, nullptr, nullptr, nullptr, val, napi_default, nullptr}};
        napi_value napiRet = nullptr;
        napi_status status = napi_create_object_with_properties(newEnv, &napiRet, 1, desc);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateObjectWithPropertiesWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_object_with_properties(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateObjectWithNamedPropertiesRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value val1 = nullptr;
    napi_value val2 = nullptr;
    napi_create_int32(env, 1, &val1);
    napi_create_int32(env, SECOND_NAMED_PROP_VALUE, &val2);
    const char* keys[] = {"a", "b"};
    napi_value values[] = {val1, val2};
    napi_value result = nullptr;
    napi_status status = napi_create_object_with_named_properties(env, &result, 2, keys, values);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateObjectWithNamedPropertiesStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value val1 = nullptr;
        napi_value val2 = nullptr;
        napi_create_int32(env, 1, &val1);
        napi_create_int32(env, SECOND_NAMED_PROP_VALUE, &val2);
        const char* keys[] = {"a", "b"};
        napi_value values[] = {val1, val2};
        napi_value result = nullptr;
        napi_status status = napi_create_object_with_named_properties(env, &result, 2, keys, values);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateObjectWithNamedPropertiesMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_object_with_named_properties(savedEnv, nullptr, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateObjectWithNamedPropertiesMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value val1 = nullptr;
    napi_value val2 = nullptr;
    napi_create_int32(env, 1, &val1);
    napi_create_int32(env, SECOND_NAMED_PROP_VALUE, &val2);
    const char* keys[] = {"a", "b"};
    napi_value values[] = {val1, val2};
    napi_value result = nullptr;
    napi_status status = napi_create_object_with_named_properties(env, &result, 2, keys, values);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateObjectWithNamedPropertiesRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value val1 = nullptr;
        napi_value val2 = nullptr;
        napi_create_int32(newEnv, 1, &val1);
        napi_create_int32(newEnv, SECOND_NAMED_PROP_VALUE, &val2);
        const char* keys[] = {"a", "b"};
        napi_value values[] = {val1, val2};
        napi_value napiRet = nullptr;
        napi_status status = napi_create_object_with_named_properties(newEnv, &napiRet, 2, keys, values);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateObjectWithNamedPropertiesWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_object_with_named_properties(savedEnv, nullptr, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CoerceToNativeBindingObjectAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_coerce_to_native_binding_object(env, nullptr, nullptr, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CoerceToNativeBindingObjectRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_status status = napi_coerce_to_native_binding_object(env, obj, DetachCallback,
        AttachCallback, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CoerceToNativeBindingObjectStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_status status = napi_coerce_to_native_binding_object(env, obj, DetachCallback,
        AttachCallback, nullptr, nullptr);
        int32_t singleRet = status != napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CoerceToNativeBindingObjectMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_coerce_to_native_binding_object(savedEnv, nullptr, nullptr,
            nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CoerceToNativeBindingObjectMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_coerce_to_native_binding_object(env, obj, DetachCallback,
        AttachCallback, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CoerceToNativeBindingObjectRuntime(napi_env env, napi_callback_info info)
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
        napi_status status = napi_coerce_to_native_binding_object(newEnv, obj, DetachCallback,
            AttachCallback, nullptr, nullptr);
        int32_t ret = status != napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CoerceToNativeBindingObjectWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_coerce_to_native_binding_object(savedEnv, nullptr, nullptr,
            nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createObjectWithPropertiesStable", CreateObjectWithPropertiesStable),
        DECLARE_NAPI_FUNCTION("createObjectWithPropertiesMultiThread", CreateObjectWithPropertiesMultiThread),
        DECLARE_NAPI_FUNCTION("createObjectWithPropertiesMultiCtx", CreateObjectWithPropertiesMultiCtx),
        DECLARE_NAPI_FUNCTION("createObjectWithPropertiesRuntime", CreateObjectWithPropertiesRuntime),
        DECLARE_NAPI_FUNCTION("createObjectWithPropertiesWorker", CreateObjectWithPropertiesWorker),
        DECLARE_NAPI_FUNCTION("createObjectWithNamedPropertiesRetVal", CreateObjectWithNamedPropertiesRetVal),
        DECLARE_NAPI_FUNCTION("createObjectWithNamedPropertiesStable", CreateObjectWithNamedPropertiesStable),
        DECLARE_NAPI_FUNCTION("createObjectWithNamedPropertiesMultiThread", CreateObjectWithNamedPropertiesMultiThread),
        DECLARE_NAPI_FUNCTION("createObjectWithNamedPropertiesMultiCtx", CreateObjectWithNamedPropertiesMultiCtx),
        DECLARE_NAPI_FUNCTION("createObjectWithNamedPropertiesRuntime", CreateObjectWithNamedPropertiesRuntime),
        DECLARE_NAPI_FUNCTION("createObjectWithNamedPropertiesWorker", CreateObjectWithNamedPropertiesWorker),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectAbnormal", CoerceToNativeBindingObjectAbnormal),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectRetVal", CoerceToNativeBindingObjectRetVal),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectStable", CoerceToNativeBindingObjectStable),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectMultiThread", CoerceToNativeBindingObjectMultiThread),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectMultiCtx", CoerceToNativeBindingObjectMultiCtx),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectRuntime", CoerceToNativeBindingObjectRuntime),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectWorker", CoerceToNativeBindingObjectWorker),
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
    .nm_modname = "napiCovFastObj",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}