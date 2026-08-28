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
static const int32_t SERIALIZE_TEST_VALUE = 42;

static napi_value SerializeRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value val = nullptr;
    napi_create_int32(env, SERIALIZE_TEST_VALUE, &val);
    napi_set_named_property(env, obj, "x", val);
    napi_value transferList = nullptr;
    napi_create_array(env, &transferList);
    napi_value cloneList = nullptr;
    napi_create_array(env, &cloneList);
    void* result = nullptr;
    napi_status status = napi_serialize(env, obj, transferList, cloneList, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    if (result != nullptr) { napi_delete_serialization_data(env, result); }
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value SerializeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value val = nullptr;
        napi_create_int32(env, SERIALIZE_TEST_VALUE, &val);
        napi_set_named_property(env, obj, "x", val);
        napi_value transferList = nullptr;
        napi_create_array(env, &transferList);
        napi_value cloneList = nullptr;
        napi_create_array(env, &cloneList);
        void* result = nullptr;
        napi_status status = napi_serialize(env, obj, transferList, cloneList, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        if (result != nullptr) { napi_delete_serialization_data(env, result); }
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value SerializeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_serialize(savedEnv, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SerializeMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value val = nullptr;
    napi_create_int32(env, SERIALIZE_TEST_VALUE, &val);
    napi_set_named_property(env, obj, "x", val);
    napi_value transferList = nullptr;
    napi_create_array(env, &transferList);
    napi_value cloneList = nullptr;
    napi_create_array(env, &cloneList);
    void* result = nullptr;
    napi_status status = napi_serialize(env, obj, transferList, cloneList, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    if (result != nullptr) { napi_delete_serialization_data(env, result); }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value SerializeRuntime(napi_env env, napi_callback_info info)
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
        napi_value val = nullptr;
        napi_create_int32(newEnv, SERIALIZE_TEST_VALUE, &val);
        napi_set_named_property(newEnv, obj, "x", val);
        napi_value transferList = nullptr;
        napi_create_array(newEnv, &transferList);
        napi_value cloneList = nullptr;
        napi_create_array(newEnv, &cloneList);
        void* data = nullptr;
        napi_status status = napi_serialize(newEnv, obj, transferList, cloneList, &data);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        if (data != nullptr) { napi_delete_serialization_data(newEnv, data); }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SerializeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_serialize(savedEnv, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeserializeAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_deserialize(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value DeserializeRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value val = nullptr;
    napi_create_int32(env, SERIALIZE_TEST_VALUE, &val);
    napi_set_named_property(env, obj, "x", val);
    napi_value transferList = nullptr;
    napi_create_array(env, &transferList);
    napi_value cloneList = nullptr;
    napi_create_array(env, &cloneList);
    void* data = nullptr;
    napi_serialize(env, obj, transferList, cloneList, &data);
    napi_value result = nullptr;
    napi_status status = napi_deserialize(env, data, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    if (data != nullptr) { napi_delete_serialization_data(env, data); }
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value DeserializeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value val = nullptr;
        napi_create_int32(env, SERIALIZE_TEST_VALUE, &val);
        napi_set_named_property(env, obj, "x", val);
        napi_value transferList = nullptr;
        napi_create_array(env, &transferList);
        napi_value cloneList = nullptr;
        napi_create_array(env, &cloneList);
        void* data = nullptr;
        napi_serialize(env, obj, transferList, cloneList, &data);
        napi_value result = nullptr;
        napi_status status = napi_deserialize(env, data, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        if (data != nullptr) { napi_delete_serialization_data(env, data); }
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DeserializeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_deserialize(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeserializeMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value val = nullptr;
    napi_create_int32(env, SERIALIZE_TEST_VALUE, &val);
    napi_set_named_property(env, obj, "x", val);
    napi_value transferList = nullptr;
    napi_create_array(env, &transferList);
    napi_value cloneList = nullptr;
    napi_create_array(env, &cloneList);
    void* data = nullptr;
    napi_serialize(env, obj, transferList, cloneList, &data);
    napi_value result = nullptr;
    napi_status status = napi_deserialize(env, data, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    if (data != nullptr) { napi_delete_serialization_data(env, data); }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DeserializeRuntime(napi_env env, napi_callback_info info)
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
        napi_value val = nullptr;
        napi_create_int32(newEnv, SERIALIZE_TEST_VALUE, &val);
        napi_set_named_property(newEnv, obj, "x", val);
        napi_value transferList = nullptr;
        napi_create_array(newEnv, &transferList);
        napi_value cloneList = nullptr;
        napi_create_array(newEnv, &cloneList);
        void* data = nullptr;
        napi_serialize(newEnv, obj, transferList, cloneList, &data);
        napi_value napiRet = nullptr;
        napi_status status = napi_deserialize(newEnv, data, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        if (data != nullptr) { napi_delete_serialization_data(newEnv, data); }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeserializeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_deserialize(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteSerializationDataAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_delete_serialization_data(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value DeleteSerializationDataRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value transferList = nullptr;
    napi_create_array(env, &transferList);
    napi_value cloneList = nullptr;
    napi_create_array(env, &cloneList);
    void* data = nullptr;
    napi_serialize(env, obj, transferList, cloneList, &data);
    napi_status status = napi_delete_serialization_data(env, data);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value DeleteSerializationDataStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value transferList = nullptr;
        napi_create_array(env, &transferList);
        napi_value cloneList = nullptr;
        napi_create_array(env, &cloneList);
        void* data = nullptr;
        napi_serialize(env, obj, transferList, cloneList, &data);
        napi_status status = napi_delete_serialization_data(env, data);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DeleteSerializationDataMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_serialization_data(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteSerializationDataMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value transferList = nullptr;
    napi_create_array(env, &transferList);
    napi_value cloneList = nullptr;
    napi_create_array(env, &cloneList);
    void* data = nullptr;
    napi_serialize(env, obj, transferList, cloneList, &data);
    napi_status status = napi_delete_serialization_data(env, data);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DeleteSerializationDataRuntime(napi_env env, napi_callback_info info)
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
        napi_value transferList = nullptr;
        napi_create_array(newEnv, &transferList);
        napi_value cloneList = nullptr;
        napi_create_array(newEnv, &cloneList);
        void* data = nullptr;
        napi_serialize(newEnv, obj, transferList, cloneList, &data);
        napi_status status = napi_delete_serialization_data(newEnv, data);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteSerializationDataWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_serialization_data(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("serializeRetVal", SerializeRetVal),
        DECLARE_NAPI_FUNCTION("serializeStable", SerializeStable),
        DECLARE_NAPI_FUNCTION("serializeMultiThread", SerializeMultiThread),
        DECLARE_NAPI_FUNCTION("serializeMultiCtx", SerializeMultiCtx),
        DECLARE_NAPI_FUNCTION("serializeRuntime", SerializeRuntime),
        DECLARE_NAPI_FUNCTION("serializeWorker", SerializeWorker),
        DECLARE_NAPI_FUNCTION("deserializeAbnormal", DeserializeAbnormal),
        DECLARE_NAPI_FUNCTION("deserializeRetVal", DeserializeRetVal),
        DECLARE_NAPI_FUNCTION("deserializeStable", DeserializeStable),
        DECLARE_NAPI_FUNCTION("deserializeMultiThread", DeserializeMultiThread),
        DECLARE_NAPI_FUNCTION("deserializeMultiCtx", DeserializeMultiCtx),
        DECLARE_NAPI_FUNCTION("deserializeRuntime", DeserializeRuntime),
        DECLARE_NAPI_FUNCTION("deserializeWorker", DeserializeWorker),
        DECLARE_NAPI_FUNCTION("deleteSerializationDataAbnormal", DeleteSerializationDataAbnormal),
        DECLARE_NAPI_FUNCTION("deleteSerializationDataRetVal", DeleteSerializationDataRetVal),
        DECLARE_NAPI_FUNCTION("deleteSerializationDataStable", DeleteSerializationDataStable),
        DECLARE_NAPI_FUNCTION("deleteSerializationDataMultiThread", DeleteSerializationDataMultiThread),
        DECLARE_NAPI_FUNCTION("deleteSerializationDataMultiCtx", DeleteSerializationDataMultiCtx),
        DECLARE_NAPI_FUNCTION("deleteSerializationDataRuntime", DeleteSerializationDataRuntime),
        DECLARE_NAPI_FUNCTION("deleteSerializationDataWorker", DeleteSerializationDataWorker),
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
    .nm_modname = "napiCovSerialization",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
