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
static const int32_t SENDABLE_ARRAYBUFFER_LENGTH = 16;
static const int32_t SENDABLE_TYPEDARRAY_ELEMENT_COUNT = 4;
static const int32_t SENDABLE_TEST_VALUE = 42;

static napi_value Constructor(napi_env env, napi_callback_info info)
{
    return nullptr;
}

static napi_value IsSendableAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_is_sendable(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value IsSendableRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    bool isSend = false;
    napi_status status = napi_is_sendable(env, obj, &isSend);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value IsSendableStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        bool isSend = false;
        napi_status status = napi_is_sendable(env, obj, &isSend);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value IsSendableMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_sendable(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsSendableMultiCtx(napi_env env, napi_callback_info info)
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
    bool isSend = false;
    napi_status status = napi_is_sendable(env, obj, &isSend);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value IsSendableWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_sendable(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DefineSendableClassAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_define_sendable_class(env, nullptr, 0, nullptr, nullptr, 0, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value DefineSendableClassRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value result = nullptr;
    napi_status status = napi_define_sendable_class(env, "SendableClass", NAPI_AUTO_LENGTH,
        Constructor, nullptr, 0, nullptr, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value DefineSendableClassStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_define_sendable_class(env, "SendableClass", NAPI_AUTO_LENGTH,
            Constructor, nullptr, 0, nullptr, nullptr, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DefineSendableClassMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_define_sendable_class(savedEnv, nullptr, 0, nullptr,
            nullptr, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DefineSendableClassMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value result = nullptr;
    napi_status status = napi_define_sendable_class(env, "SendableClass", NAPI_AUTO_LENGTH,
        Constructor, nullptr, 0, nullptr, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DefineSendableClassWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_define_sendable_class(savedEnv, nullptr, 0, nullptr,
            nullptr, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSendableObjectWithPropertiesAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_sendable_object_with_properties(env, 0, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateSendableObjectWithPropertiesRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, SENDABLE_TEST_VALUE, &val);
    napi_property_descriptor desc[] = {{"key", nullptr, nullptr, nullptr, nullptr, val, napi_default, nullptr}};
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_object_with_properties(env, 1, desc, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateSendableObjectWithPropertiesStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(env, SENDABLE_TEST_VALUE, &val);
        napi_property_descriptor desc[] = {{"key", nullptr, nullptr, nullptr, nullptr, val, napi_default, nullptr}};
        napi_value result = nullptr;
        napi_status status = napi_create_sendable_object_with_properties(env, 1, desc, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateSendableObjectWithPropertiesMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_sendable_object_with_properties(savedEnv, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSendableObjectWithPropertiesMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_int32(env, SENDABLE_TEST_VALUE, &val);
    napi_property_descriptor desc[] = {{"key", nullptr, nullptr, nullptr, nullptr, val, napi_default, nullptr}};
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_object_with_properties(env, 1, desc, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateSendableObjectWithPropertiesWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_sendable_object_with_properties(savedEnv, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSendableArrayAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_sendable_array(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateSendableArrayRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_array(env, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateSendableArrayStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_sendable_array(env, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateSendableArrayMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_sendable_array(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSendableArrayMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_array(env, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateSendableArrayWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_sendable_array(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSendableArrayWithLengthAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_sendable_array_with_length(env, 0, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateSendableArrayWithLengthRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_array_with_length(env, 3, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateSendableArrayWithLengthStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_sendable_array_with_length(env, 3, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateSendableArrayWithLengthMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_sendable_array_with_length(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSendableArrayWithLengthMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_array_with_length(env, 3, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateSendableArrayWithLengthWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_sendable_array_with_length(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSendableArraybufferAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_sendable_arraybuffer(env, 0, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateSendableArraybufferRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    void* data = nullptr;
    napi_value result = nullptr;
        napi_status status = napi_create_sendable_arraybuffer(env, SENDABLE_ARRAYBUFFER_LENGTH, &data, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateSendableArraybufferStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        void* data = nullptr;
        napi_value result = nullptr;
    napi_status status = napi_create_sendable_arraybuffer(env, SENDABLE_ARRAYBUFFER_LENGTH, &data, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateSendableArraybufferMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_sendable_arraybuffer(savedEnv, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSendableArraybufferMultiCtx(napi_env env, napi_callback_info info)
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
        napi_status status = napi_create_sendable_arraybuffer(env, SENDABLE_ARRAYBUFFER_LENGTH, &data, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateSendableArraybufferWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_sendable_arraybuffer(savedEnv, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSendableTypedarrayAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_sendable_typedarray(env, napi_int8_array, 0, nullptr, 0, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateSendableTypedarrayRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    void* data = nullptr;
    napi_value ab = nullptr;
        napi_create_sendable_arraybuffer(env, SENDABLE_ARRAYBUFFER_LENGTH, &data, &ab);
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_typedarray(env, napi_int8_array,
        SENDABLE_TYPEDARRAY_ELEMENT_COUNT, ab, 0, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateSendableTypedarrayStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        void* data = nullptr;
        napi_value ab = nullptr;
    napi_create_sendable_arraybuffer(env, SENDABLE_ARRAYBUFFER_LENGTH, &data, &ab);
        napi_value result = nullptr;
        napi_status status = napi_create_sendable_typedarray(env, napi_int8_array,
            SENDABLE_TYPEDARRAY_ELEMENT_COUNT, ab, 0, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateSendableTypedarrayMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_sendable_typedarray(savedEnv, napi_int8_array, 0, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSendableTypedarrayMultiCtx(napi_env env, napi_callback_info info)
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
        napi_create_sendable_arraybuffer(env, SENDABLE_ARRAYBUFFER_LENGTH, &data, &ab);
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_typedarray(env, napi_int8_array,
        SENDABLE_TYPEDARRAY_ELEMENT_COUNT, ab, 0, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateSendableTypedarrayWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_sendable_typedarray(savedEnv, napi_int8_array, 0, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value WrapSendableAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_wrap_sendable(env, nullptr, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value WrapSendableRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    int32_t nativeData = NATIVE_DATA_VALUE;
    napi_status status = napi_wrap_sendable(env, obj, &nativeData, nullptr, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value WrapSendableStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
        int32_t nativeData = NATIVE_DATA_VALUE;
        napi_status status = napi_wrap_sendable(env, obj, &nativeData, nullptr, nullptr);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value WrapSendableMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_wrap_sendable(savedEnv, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value WrapSendableMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    int32_t nativeData = NATIVE_DATA_VALUE;
    napi_status status = napi_wrap_sendable(env, obj, &nativeData, nullptr, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value WrapSendableWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_wrap_sendable(savedEnv, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value WrapSendableWithSizeAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_wrap_sendable_with_size(env, nullptr, nullptr, nullptr, nullptr, 0);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value WrapSendableWithSizeRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    int32_t nativeData = NATIVE_DATA_VALUE;
    napi_status status = napi_wrap_sendable_with_size(env, obj, &nativeData, nullptr, nullptr, 4);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value WrapSendableWithSizeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
        int32_t nativeData = NATIVE_DATA_VALUE;
        napi_status status = napi_wrap_sendable_with_size(env, obj, &nativeData, nullptr, nullptr, 4);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value WrapSendableWithSizeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_wrap_sendable_with_size(savedEnv, nullptr, nullptr, nullptr, nullptr, 0);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value WrapSendableWithSizeMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    int32_t nativeData = NATIVE_DATA_VALUE;
    napi_status status = napi_wrap_sendable_with_size(env, obj, &nativeData, nullptr, nullptr, 4);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value WrapSendableWithSizeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_wrap_sendable_with_size(savedEnv, nullptr, nullptr, nullptr, nullptr, 0);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value UnwrapSendableAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_unwrap_sendable(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value UnwrapSendableRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    int32_t nativeData = NATIVE_DATA_VALUE;
    napi_wrap_sendable(env, obj, &nativeData, nullptr, nullptr);
    void* unwrapped = nullptr;
    napi_status status = napi_unwrap_sendable(env, obj, &unwrapped);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value UnwrapSendableStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
        int32_t nativeData = NATIVE_DATA_VALUE;
        napi_wrap_sendable(env, obj, &nativeData, nullptr, nullptr);
        void* unwrapped = nullptr;
        napi_status status = napi_unwrap_sendable(env, obj, &unwrapped);
        int32_t singleRet = (status == napi_ok && unwrapped != nullptr) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value UnwrapSendableMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_unwrap_sendable(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value UnwrapSendableMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    int32_t nativeData = NATIVE_DATA_VALUE;
    napi_wrap_sendable(env, obj, &nativeData, nullptr, nullptr);
    void* unwrapped = nullptr;
    napi_status status = napi_unwrap_sendable(env, obj, &unwrapped);
    int32_t ret = (status == napi_ok && unwrapped != nullptr) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value UnwrapSendableWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_unwrap_sendable(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RemoveWrapSendableAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_remove_wrap_sendable(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value RemoveWrapSendableRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    int32_t nativeData = NATIVE_DATA_VALUE;
    napi_wrap_sendable(env, obj, &nativeData, nullptr, nullptr);
    void* unwrapped = nullptr;
    napi_status status = napi_remove_wrap_sendable(env, obj, &unwrapped);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value RemoveWrapSendableStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
        int32_t nativeData = NATIVE_DATA_VALUE;
        napi_wrap_sendable(env, obj, &nativeData, nullptr, nullptr);
        void* unwrapped = nullptr;
        napi_status status = napi_remove_wrap_sendable(env, obj, &unwrapped);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value RemoveWrapSendableMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_remove_wrap_sendable(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RemoveWrapSendableMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    int32_t nativeData = NATIVE_DATA_VALUE;
    napi_wrap_sendable(env, obj, &nativeData, nullptr, nullptr);
    void* unwrapped = nullptr;
    napi_status status = napi_remove_wrap_sendable(env, obj, &unwrapped);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value RemoveWrapSendableWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_remove_wrap_sendable(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateStrongSendableReferenceNormal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    napi_sendable_ref sref = nullptr;
    napi_status status = napi_create_strong_sendable_reference(env, obj, &sref);
    int32_t ret = (status == napi_ok && sref != nullptr) ? 1 : 0;
    if (sref != nullptr) { napi_delete_strong_sendable_reference(env, sref); }
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateStrongSendableReferenceAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_strong_sendable_reference(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateStrongSendableReferenceRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    napi_sendable_ref sref = nullptr;
    napi_status status = napi_create_strong_sendable_reference(env, obj, &sref);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    if (sref != nullptr) { napi_delete_strong_sendable_reference(env, sref); }
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateStrongSendableReferenceStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
        napi_sendable_ref sref = nullptr;
        napi_status status = napi_create_strong_sendable_reference(env, obj, &sref);
        int32_t singleRet = (status == napi_ok && sref != nullptr) ? 1 : 0;
        if (sref != nullptr) { napi_delete_strong_sendable_reference(env, sref); }
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateStrongSendableReferenceMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    napi_sendable_ref sref = nullptr;
    napi_status status = napi_create_strong_sendable_reference(env, obj, &sref);
    int32_t ret = (status == napi_ok && sref != nullptr) ? 1 : 0;
    if (sref != nullptr) { napi_delete_strong_sendable_reference(env, sref); }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateStrongSendableReferenceWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_strong_sendable_reference(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteStrongSendableReferenceNormal(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    napi_sendable_ref sref = nullptr;
    napi_create_strong_sendable_reference(env, obj, &sref);
    napi_status status = napi_delete_strong_sendable_reference(env, sref);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value DeleteStrongSendableReferenceAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_delete_strong_sendable_reference(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value DeleteStrongSendableReferenceRetVal(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    napi_sendable_ref sref = nullptr;
    napi_create_strong_sendable_reference(env, obj, &sref);
    napi_status status = napi_delete_strong_sendable_reference(env, sref);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value DeleteStrongSendableReferenceStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value obj = nullptr;
        napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
        napi_sendable_ref sref = nullptr;
        napi_create_strong_sendable_reference(env, obj, &sref);
        napi_status status = napi_delete_strong_sendable_reference(env, sref);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DeleteStrongSendableReferenceMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    napi_sendable_ref sref = nullptr;
    napi_create_strong_sendable_reference(env, obj, &sref);
    napi_status status = napi_delete_strong_sendable_reference(env, sref);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DeleteStrongSendableReferenceWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_strong_sendable_reference(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetStrongSendableReferenceValueNormal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    napi_sendable_ref sref = nullptr;
    napi_create_strong_sendable_reference(env, obj, &sref);
    napi_value result = nullptr;
    napi_status status = napi_get_strong_sendable_reference_value(env, sref, &result);
    napi_delete_strong_sendable_reference(env, sref);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetStrongSendableReferenceValueAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_strong_sendable_reference_value(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetStrongSendableReferenceValueRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    napi_sendable_ref sref = nullptr;
    napi_create_strong_sendable_reference(env, obj, &sref);
    napi_value result = nullptr;
    napi_status status = napi_get_strong_sendable_reference_value(env, sref, &result);
    napi_delete_strong_sendable_reference(env, sref);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetStrongSendableReferenceValueStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
        napi_sendable_ref sref = nullptr;
        napi_create_strong_sendable_reference(env, obj, &sref);
        napi_value result = nullptr;
        napi_status status = napi_get_strong_sendable_reference_value(env, sref, &result);
        napi_delete_strong_sendable_reference(env, sref);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetStrongSendableReferenceValueMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_sendable_object_with_properties(env, 0, nullptr, &obj);
    napi_sendable_ref sref = nullptr;
    napi_create_strong_sendable_reference(env, obj, &sref);
    napi_value result = nullptr;
    napi_status status = napi_get_strong_sendable_reference_value(env, sref, &result);
    napi_delete_strong_sendable_reference(env, sref);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetStrongSendableReferenceValueWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_strong_sendable_reference_value(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("isSendableAbnormal", IsSendableAbnormal),
        DECLARE_NAPI_FUNCTION("isSendableRetVal", IsSendableRetVal),
        DECLARE_NAPI_FUNCTION("isSendableStable", IsSendableStable),
        DECLARE_NAPI_FUNCTION("isSendableMultiThread", IsSendableMultiThread),
        DECLARE_NAPI_FUNCTION("isSendableMultiCtx", IsSendableMultiCtx),
        DECLARE_NAPI_FUNCTION("isSendableWorker", IsSendableWorker),
        DECLARE_NAPI_FUNCTION("defineSendableClassAbnormal", DefineSendableClassAbnormal),
        DECLARE_NAPI_FUNCTION("defineSendableClassRetVal", DefineSendableClassRetVal),
        DECLARE_NAPI_FUNCTION("defineSendableClassStable", DefineSendableClassStable),
        DECLARE_NAPI_FUNCTION("defineSendableClassMultiThread", DefineSendableClassMultiThread),
        DECLARE_NAPI_FUNCTION("defineSendableClassMultiCtx", DefineSendableClassMultiCtx),
        DECLARE_NAPI_FUNCTION("defineSendableClassWorker", DefineSendableClassWorker),
        DECLARE_NAPI_FUNCTION("createSendableObjectWithPropertiesAbnormal", CreateSendableObjectWithPropertiesAbnormal),
        DECLARE_NAPI_FUNCTION("createSendableObjectWithPropertiesRetVal", CreateSendableObjectWithPropertiesRetVal),
        DECLARE_NAPI_FUNCTION("createSendableObjectWithPropertiesStable", CreateSendableObjectWithPropertiesStable),
        DECLARE_NAPI_FUNCTION("createSendableObjectWithPropertiesMultiThread",
            CreateSendableObjectWithPropertiesMultiThread),
        DECLARE_NAPI_FUNCTION("createSendableObjectWithPropertiesMultiCtx", CreateSendableObjectWithPropertiesMultiCtx),
        DECLARE_NAPI_FUNCTION("createSendableObjectWithPropertiesWorker", CreateSendableObjectWithPropertiesWorker),
        DECLARE_NAPI_FUNCTION("createSendableArrayAbnormal", CreateSendableArrayAbnormal),
        DECLARE_NAPI_FUNCTION("createSendableArrayRetVal", CreateSendableArrayRetVal),
        DECLARE_NAPI_FUNCTION("createSendableArrayStable", CreateSendableArrayStable),
        DECLARE_NAPI_FUNCTION("createSendableArrayMultiThread", CreateSendableArrayMultiThread),
        DECLARE_NAPI_FUNCTION("createSendableArrayMultiCtx", CreateSendableArrayMultiCtx),
        DECLARE_NAPI_FUNCTION("createSendableArrayWorker", CreateSendableArrayWorker),
        DECLARE_NAPI_FUNCTION("createSendableArrayWithLengthAbnormal", CreateSendableArrayWithLengthAbnormal),
        DECLARE_NAPI_FUNCTION("createSendableArrayWithLengthRetVal", CreateSendableArrayWithLengthRetVal),
        DECLARE_NAPI_FUNCTION("createSendableArrayWithLengthStable", CreateSendableArrayWithLengthStable),
        DECLARE_NAPI_FUNCTION("createSendableArrayWithLengthMultiThread", CreateSendableArrayWithLengthMultiThread),
        DECLARE_NAPI_FUNCTION("createSendableArrayWithLengthMultiCtx", CreateSendableArrayWithLengthMultiCtx),
        DECLARE_NAPI_FUNCTION("createSendableArrayWithLengthWorker", CreateSendableArrayWithLengthWorker),
        DECLARE_NAPI_FUNCTION("createSendableArraybufferAbnormal", CreateSendableArraybufferAbnormal),
        DECLARE_NAPI_FUNCTION("createSendableArraybufferRetVal", CreateSendableArraybufferRetVal),
        DECLARE_NAPI_FUNCTION("createSendableArraybufferStable", CreateSendableArraybufferStable),
        DECLARE_NAPI_FUNCTION("createSendableArraybufferMultiThread", CreateSendableArraybufferMultiThread),
        DECLARE_NAPI_FUNCTION("createSendableArraybufferMultiCtx", CreateSendableArraybufferMultiCtx),
        DECLARE_NAPI_FUNCTION("createSendableArraybufferWorker", CreateSendableArraybufferWorker),
        DECLARE_NAPI_FUNCTION("createSendableTypedarrayAbnormal", CreateSendableTypedarrayAbnormal),
        DECLARE_NAPI_FUNCTION("createSendableTypedarrayRetVal", CreateSendableTypedarrayRetVal),
        DECLARE_NAPI_FUNCTION("createSendableTypedarrayStable", CreateSendableTypedarrayStable),
        DECLARE_NAPI_FUNCTION("createSendableTypedarrayMultiThread", CreateSendableTypedarrayMultiThread),
        DECLARE_NAPI_FUNCTION("createSendableTypedarrayMultiCtx", CreateSendableTypedarrayMultiCtx),
        DECLARE_NAPI_FUNCTION("createSendableTypedarrayWorker", CreateSendableTypedarrayWorker),
        DECLARE_NAPI_FUNCTION("wrapSendableAbnormal", WrapSendableAbnormal),
        DECLARE_NAPI_FUNCTION("wrapSendableRetVal", WrapSendableRetVal),
        DECLARE_NAPI_FUNCTION("wrapSendableStable", WrapSendableStable),
        DECLARE_NAPI_FUNCTION("wrapSendableMultiThread", WrapSendableMultiThread),
        DECLARE_NAPI_FUNCTION("wrapSendableMultiCtx", WrapSendableMultiCtx),
        DECLARE_NAPI_FUNCTION("wrapSendableWorker", WrapSendableWorker),
        DECLARE_NAPI_FUNCTION("wrapSendableWithSizeAbnormal", WrapSendableWithSizeAbnormal),
        DECLARE_NAPI_FUNCTION("wrapSendableWithSizeRetVal", WrapSendableWithSizeRetVal),
        DECLARE_NAPI_FUNCTION("wrapSendableWithSizeStable", WrapSendableWithSizeStable),
        DECLARE_NAPI_FUNCTION("wrapSendableWithSizeMultiThread", WrapSendableWithSizeMultiThread),
        DECLARE_NAPI_FUNCTION("wrapSendableWithSizeMultiCtx", WrapSendableWithSizeMultiCtx),
        DECLARE_NAPI_FUNCTION("wrapSendableWithSizeWorker", WrapSendableWithSizeWorker),
        DECLARE_NAPI_FUNCTION("unwrapSendableAbnormal", UnwrapSendableAbnormal),
        DECLARE_NAPI_FUNCTION("unwrapSendableRetVal", UnwrapSendableRetVal),
        DECLARE_NAPI_FUNCTION("unwrapSendableStable", UnwrapSendableStable),
        DECLARE_NAPI_FUNCTION("unwrapSendableMultiThread", UnwrapSendableMultiThread),
        DECLARE_NAPI_FUNCTION("unwrapSendableMultiCtx", UnwrapSendableMultiCtx),
        DECLARE_NAPI_FUNCTION("unwrapSendableWorker", UnwrapSendableWorker),
        DECLARE_NAPI_FUNCTION("removeWrapSendableAbnormal", RemoveWrapSendableAbnormal),
        DECLARE_NAPI_FUNCTION("removeWrapSendableRetVal", RemoveWrapSendableRetVal),
        DECLARE_NAPI_FUNCTION("removeWrapSendableStable", RemoveWrapSendableStable),
        DECLARE_NAPI_FUNCTION("removeWrapSendableMultiThread", RemoveWrapSendableMultiThread),
        DECLARE_NAPI_FUNCTION("removeWrapSendableMultiCtx", RemoveWrapSendableMultiCtx),
        DECLARE_NAPI_FUNCTION("removeWrapSendableWorker", RemoveWrapSendableWorker),
        DECLARE_NAPI_FUNCTION("createStrongSendableReferenceNormal", CreateStrongSendableReferenceNormal),
        DECLARE_NAPI_FUNCTION("createStrongSendableReferenceAbnormal", CreateStrongSendableReferenceAbnormal),
        DECLARE_NAPI_FUNCTION("createStrongSendableReferenceRetVal", CreateStrongSendableReferenceRetVal),
        DECLARE_NAPI_FUNCTION("createStrongSendableReferenceStable", CreateStrongSendableReferenceStable),
        DECLARE_NAPI_FUNCTION("createStrongSendableReferenceMultiCtx", CreateStrongSendableReferenceMultiCtx),
        DECLARE_NAPI_FUNCTION("createStrongSendableReferenceWorker", CreateStrongSendableReferenceWorker),
        DECLARE_NAPI_FUNCTION("deleteStrongSendableReferenceNormal", DeleteStrongSendableReferenceNormal),
        DECLARE_NAPI_FUNCTION("deleteStrongSendableReferenceAbnormal", DeleteStrongSendableReferenceAbnormal),
        DECLARE_NAPI_FUNCTION("deleteStrongSendableReferenceRetVal", DeleteStrongSendableReferenceRetVal),
        DECLARE_NAPI_FUNCTION("deleteStrongSendableReferenceStable", DeleteStrongSendableReferenceStable),
        DECLARE_NAPI_FUNCTION("deleteStrongSendableReferenceMultiCtx", DeleteStrongSendableReferenceMultiCtx),
        DECLARE_NAPI_FUNCTION("deleteStrongSendableReferenceWorker", DeleteStrongSendableReferenceWorker),
        DECLARE_NAPI_FUNCTION("getStrongSendableReferenceValueNormal", GetStrongSendableReferenceValueNormal),
        DECLARE_NAPI_FUNCTION("getStrongSendableReferenceValueAbnormal", GetStrongSendableReferenceValueAbnormal),
        DECLARE_NAPI_FUNCTION("getStrongSendableReferenceValueRetVal", GetStrongSendableReferenceValueRetVal),
        DECLARE_NAPI_FUNCTION("getStrongSendableReferenceValueStable", GetStrongSendableReferenceValueStable),
        DECLARE_NAPI_FUNCTION("getStrongSendableReferenceValueMultiCtx", GetStrongSendableReferenceValueMultiCtx),
        DECLARE_NAPI_FUNCTION("getStrongSendableReferenceValueWorker", GetStrongSendableReferenceValueWorker),
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
    .nm_modname = "napiCovSendable",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}