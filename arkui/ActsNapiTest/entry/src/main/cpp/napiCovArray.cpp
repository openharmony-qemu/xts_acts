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

static napi_value CreateArrayRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value result = nullptr;
    napi_status status = napi_create_array(env, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateArrayStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_array(env, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateArrayMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_array(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateArrayMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_create_array(env, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateArrayRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value napiRet = nullptr;
        napi_status status = napi_create_array(newEnv, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateArrayWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_array(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateArrayWithLengthMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_array_with_length(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateArrayWithLengthMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_create_array_with_length(env, 3, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateArrayWithLengthRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value napiRet = nullptr;
        napi_status status = napi_create_array_with_length(newEnv, 3, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateArrayWithLengthWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_array_with_length(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetArrayLengthRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value arr = nullptr;
    napi_create_array_with_length(env, 3, &arr);
    uint32_t len = 0;
    napi_status status = napi_get_array_length(env, arr, &len);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetArrayLengthStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value arr = nullptr;
        napi_create_array_with_length(env, 3, &arr);
        uint32_t len = 0;
        napi_status status = napi_get_array_length(env, arr, &len);
        int32_t singleRet = (status == napi_ok && len == 3) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetArrayLengthMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_array_length(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetArrayLengthMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value arr = nullptr;
    napi_create_array_with_length(env, 3, &arr);
    uint32_t len = 0;
    napi_status status = napi_get_array_length(env, arr, &len);
    int32_t ret = (status == napi_ok && len == 3) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetArrayLengthRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value arr = nullptr;
        napi_create_array_with_length(newEnv, 3, &arr);
        uint32_t len = 0;
        napi_status status = napi_get_array_length(newEnv, arr, &len);
        int32_t ret = (status == napi_ok && len == 3) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetArrayLengthWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_array_length(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsArrayRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value arr = nullptr;
    napi_create_array(env, &arr);
    bool isArray = false;
    napi_status status = napi_is_array(env, arr, &isArray);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value IsArrayStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value arr = nullptr;
        napi_create_array(env, &arr);
        bool isArray = false;
        napi_status status = napi_is_array(env, arr, &isArray);
        int32_t singleRet = (status == napi_ok && isArray) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value IsArrayMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_array(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsArrayMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value arr = nullptr;
    napi_create_array(env, &arr);
    bool isArray = false;
    napi_status status = napi_is_array(env, arr, &isArray);
    int32_t ret = (status == napi_ok && isArray) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value IsArrayRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value arr = nullptr;
        napi_create_array(newEnv, &arr);
        bool isArray = false;
        napi_status status = napi_is_array(newEnv, arr, &isArray);
        int32_t ret = (status == napi_ok && isArray) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsArrayWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_array(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetElementStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value arr = nullptr;
        napi_create_array(env, &arr);
        napi_value num = nullptr;
        napi_create_int32(env, 42, &num);
        napi_status status = napi_set_element(env, arr, 0, num);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value SetElementMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_set_element(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetElementMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value arr = nullptr;
    napi_create_array(env, &arr);
    napi_value num = nullptr;
    napi_create_int32(env, 42, &num);
    napi_status status = napi_set_element(env, arr, 0, num);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value SetElementRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value arr = nullptr;
        napi_create_array(newEnv, &arr);
        napi_value num = nullptr;
        napi_create_int32(newEnv, 42, &num);
        napi_status status = napi_set_element(newEnv, arr, 0, num);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetElementWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_set_element(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetElementStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value arr = nullptr;
        napi_create_array(env, &arr);
        napi_value num = nullptr;
        napi_create_int32(env, 42, &num);
        napi_set_element(env, arr, 0, num);
        napi_value result = nullptr;
        napi_status status = napi_get_element(env, arr, 0, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetElementMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_element(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetElementMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value arr = nullptr;
    napi_create_array(env, &arr);
    napi_value num = nullptr;
    napi_create_int32(env, 42, &num);
    napi_set_element(env, arr, 0, num);
    napi_value result = nullptr;
    napi_status status = napi_get_element(env, arr, 0, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetElementRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value arr = nullptr;
        napi_create_array(newEnv, &arr);
        napi_value num = nullptr;
        napi_create_int32(newEnv, 42, &num);
        napi_set_element(newEnv, arr, 0, num);
        napi_value napiRet = nullptr;
        napi_status status = napi_get_element(newEnv, arr, 0, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetElementWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_element(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasElementStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value arr = nullptr;
        napi_create_array(env, &arr);
        napi_value num = nullptr;
        napi_create_int32(env, 1, &num);
        napi_set_element(env, arr, 0, num);
        bool has = false;
        napi_status status = napi_has_element(env, arr, 0, &has);
        int32_t singleRet = (status == napi_ok && has) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value HasElementMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_has_element(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasElementMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value arr = nullptr;
    napi_create_array(env, &arr);
    napi_value num = nullptr;
    napi_create_int32(env, 1, &num);
    napi_set_element(env, arr, 0, num);
    bool has = false;
    napi_status status = napi_has_element(env, arr, 0, &has);
    int32_t ret = (status == napi_ok && has) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value HasElementRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value arr = nullptr;
        napi_create_array(newEnv, &arr);
        napi_value num = nullptr;
        napi_create_int32(newEnv, 1, &num);
        napi_set_element(newEnv, arr, 0, num);
        bool has = false;
        napi_status status = napi_has_element(newEnv, arr, 0, &has);
        int32_t ret = (status == napi_ok && has) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasElementWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_has_element(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteElementStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value arr = nullptr;
        napi_create_array(env, &arr);
        napi_value num = nullptr;
        napi_create_int32(env, 1, &num);
        napi_set_element(env, arr, 0, num);
        bool delResult = false;
        napi_status status = napi_delete_element(env, arr, 0, &delResult);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DeleteElementMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_element(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteElementMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value arr = nullptr;
    napi_create_array(env, &arr);
    napi_value num = nullptr;
    napi_create_int32(env, 1, &num);
    napi_set_element(env, arr, 0, num);
    bool delResult = false;
    napi_status status = napi_delete_element(env, arr, 0, &delResult);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DeleteElementRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value arr = nullptr;
        napi_create_array(newEnv, &arr);
        napi_value num = nullptr;
        napi_create_int32(newEnv, 1, &num);
        napi_set_element(newEnv, arr, 0, num);
        bool delResult = false;
        napi_status status = napi_delete_element(newEnv, arr, 0, &delResult);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteElementWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_element(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateTypedarrayStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value ab = nullptr;
        void* abData = nullptr;
        napi_create_arraybuffer(env, 16, &abData, &ab);
        napi_value result = nullptr;
        napi_status status = napi_create_typedarray(env, napi_int8_array, 4, ab, 0, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateTypedarrayMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_typedarray(savedEnv, napi_int8_array, 0, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateTypedarrayMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value ab = nullptr;
    void* abData = nullptr;
    napi_create_arraybuffer(env, 16, &abData, &ab);
    napi_value result = nullptr;
    napi_status status = napi_create_typedarray(env, napi_int8_array, 4, ab, 0, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateTypedarrayRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value ab = nullptr;
        void* abData = nullptr;
        napi_create_arraybuffer(newEnv, 16, &abData, &ab);
        napi_value napiRet = nullptr;
        napi_status status = napi_create_typedarray(newEnv, napi_int8_array, 4, ab, 0, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateTypedarrayWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_typedarray(savedEnv, napi_int8_array, 0, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsTypedarrayStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value ab = nullptr;
        void* abData = nullptr;
        napi_create_arraybuffer(env, 16, &abData, &ab);
        napi_value ta = nullptr;
        napi_create_typedarray(env, napi_int8_array, 4, ab, 0, &ta);
        bool isTA = false;
        napi_status status = napi_is_typedarray(env, ta, &isTA);
        int32_t singleRet = (status == napi_ok && isTA) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value IsTypedarrayMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_typedarray(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsTypedarrayMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value ab = nullptr;
    void* abData = nullptr;
    napi_create_arraybuffer(env, 16, &abData, &ab);
    napi_value ta = nullptr;
    napi_create_typedarray(env, napi_int8_array, 4, ab, 0, &ta);
    bool isTA = false;
    napi_status status = napi_is_typedarray(env, ta, &isTA);
    int32_t ret = (status == napi_ok && isTA) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value IsTypedarrayWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_typedarray(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetTypedarrayInfoStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value ab = nullptr;
        void* abData = nullptr;
        napi_create_arraybuffer(env, 16, &abData, &ab);
        napi_value ta = nullptr;
        napi_create_typedarray(env, napi_int8_array, 4, ab, 0, &ta);
        napi_typedarray_type type = napi_int8_array;
        size_t len = 0;
        void* data = nullptr;
        napi_value buf = nullptr;
        napi_status status = napi_get_typedarray_info(env, ta, &type, &len, &data, &buf, nullptr);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetTypedarrayInfoMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_typedarray_info(savedEnv, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetTypedarrayInfoMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value ab = nullptr;
    void* abData = nullptr;
    napi_create_arraybuffer(env, 16, &abData, &ab);
    napi_value ta = nullptr;
    napi_create_typedarray(env, napi_int8_array, 4, ab, 0, &ta);
    napi_typedarray_type type = napi_int8_array;
    size_t len = 0;
    void* data = nullptr;
    napi_value buf = nullptr;
    napi_status status = napi_get_typedarray_info(env, ta, &type, &len, &data, &buf, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetTypedarrayInfoWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_typedarray_info(savedEnv, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateDataviewStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value ab = nullptr;
        void* abData = nullptr;
        napi_create_arraybuffer(env, 16, &abData, &ab);
        napi_value result = nullptr;
        napi_status status = napi_create_dataview(env, 8, ab, 0, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateDataviewMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_dataview(savedEnv, 0, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateDataviewMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value ab = nullptr;
    void* abData = nullptr;
    napi_create_arraybuffer(env, 16, &abData, &ab);
    napi_value result = nullptr;
    napi_status status = napi_create_dataview(env, 8, ab, 0, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateDataviewRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value ab = nullptr;
        void* abData = nullptr;
        napi_create_arraybuffer(newEnv, 16, &abData, &ab);
        napi_value napiRet = nullptr;
        napi_status status = napi_create_dataview(newEnv, 8, ab, 0, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateDataviewWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_dataview(savedEnv, 0, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsDataviewStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value ab = nullptr;
        void* abData = nullptr;
        napi_create_arraybuffer(env, 16, &abData, &ab);
        napi_value dv = nullptr;
        napi_create_dataview(env, 8, ab, 0, &dv);
        bool isDV = false;
        napi_status status = napi_is_dataview(env, dv, &isDV);
        int32_t singleRet = (status == napi_ok && isDV) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value IsDataviewMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_dataview(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsDataviewMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value ab = nullptr;
    void* abData = nullptr;
    napi_create_arraybuffer(env, 16, &abData, &ab);
    napi_value dv = nullptr;
    napi_create_dataview(env, 8, ab, 0, &dv);
    bool isDV = false;
    napi_status status = napi_is_dataview(env, dv, &isDV);
    int32_t ret = (status == napi_ok && isDV) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value IsDataviewRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value ab = nullptr;
        void* abData = nullptr;
        napi_create_arraybuffer(newEnv, 16, &abData, &ab);
        napi_value dv = nullptr;
        napi_create_dataview(newEnv, 8, ab, 0, &dv);
        bool isDV = false;
        napi_status status = napi_is_dataview(newEnv, dv, &isDV);
        int32_t ret = (status == napi_ok && isDV) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsDataviewWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_dataview(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetDataviewInfoStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value ab = nullptr;
        void* abData = nullptr;
        napi_create_arraybuffer(env, 16, &abData, &ab);
        napi_value dv = nullptr;
        napi_create_dataview(env, 8, ab, 0, &dv);
        size_t len = 0;
        void* data = nullptr;
        napi_value buf = nullptr;
        napi_status status = napi_get_dataview_info(env, dv, &len, &data, &buf, nullptr);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetDataviewInfoMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_dataview_info(savedEnv, nullptr, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetDataviewInfoMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value ab = nullptr;
    void* abData = nullptr;
    napi_create_arraybuffer(env, 16, &abData, &ab);
    napi_value dv = nullptr;
    napi_create_dataview(env, 8, ab, 0, &dv);
    size_t len = 0;
    void* data = nullptr;
    napi_value buf = nullptr;
    napi_status status = napi_get_dataview_info(env, dv, &len, &data, &buf, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetDataviewInfoRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value ab = nullptr;
        void* abData = nullptr;
        napi_create_arraybuffer(newEnv, 16, &abData, &ab);
        napi_value dv = nullptr;
        napi_create_dataview(newEnv, 8, ab, 0, &dv);
        size_t len = 0;
        void* data = nullptr;
        napi_value buf = nullptr;
        napi_status status = napi_get_dataview_info(newEnv, dv, &len, &data, &buf, nullptr);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetDataviewInfoWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_dataview_info(savedEnv, nullptr, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createArrayRetVal", CreateArrayRetVal),
        DECLARE_NAPI_FUNCTION("createArrayStable", CreateArrayStable),
        DECLARE_NAPI_FUNCTION("createArrayMultiThread", CreateArrayMultiThread),
        DECLARE_NAPI_FUNCTION("createArrayMultiCtx", CreateArrayMultiCtx),
        DECLARE_NAPI_FUNCTION("createArrayRuntime", CreateArrayRuntime),
        DECLARE_NAPI_FUNCTION("createArrayWorker", CreateArrayWorker),
        DECLARE_NAPI_FUNCTION("createArrayWithLengthMultiThread", CreateArrayWithLengthMultiThread),
        DECLARE_NAPI_FUNCTION("createArrayWithLengthMultiCtx", CreateArrayWithLengthMultiCtx),
        DECLARE_NAPI_FUNCTION("createArrayWithLengthRuntime", CreateArrayWithLengthRuntime),
        DECLARE_NAPI_FUNCTION("createArrayWithLengthWorker", CreateArrayWithLengthWorker),
        DECLARE_NAPI_FUNCTION("getArrayLengthRetVal", GetArrayLengthRetVal),
        DECLARE_NAPI_FUNCTION("getArrayLengthStable", GetArrayLengthStable),
        DECLARE_NAPI_FUNCTION("getArrayLengthMultiThread", GetArrayLengthMultiThread),
        DECLARE_NAPI_FUNCTION("getArrayLengthMultiCtx", GetArrayLengthMultiCtx),
        DECLARE_NAPI_FUNCTION("getArrayLengthRuntime", GetArrayLengthRuntime),
        DECLARE_NAPI_FUNCTION("getArrayLengthWorker", GetArrayLengthWorker),
        DECLARE_NAPI_FUNCTION("isArrayRetVal", IsArrayRetVal),
        DECLARE_NAPI_FUNCTION("isArrayStable", IsArrayStable),
        DECLARE_NAPI_FUNCTION("isArrayMultiThread", IsArrayMultiThread),
        DECLARE_NAPI_FUNCTION("isArrayMultiCtx", IsArrayMultiCtx),
        DECLARE_NAPI_FUNCTION("isArrayRuntime", IsArrayRuntime),
        DECLARE_NAPI_FUNCTION("isArrayWorker", IsArrayWorker),
        DECLARE_NAPI_FUNCTION("setElementStable", SetElementStable),
        DECLARE_NAPI_FUNCTION("setElementMultiThread", SetElementMultiThread),
        DECLARE_NAPI_FUNCTION("setElementMultiCtx", SetElementMultiCtx),
        DECLARE_NAPI_FUNCTION("setElementRuntime", SetElementRuntime),
        DECLARE_NAPI_FUNCTION("setElementWorker", SetElementWorker),
        DECLARE_NAPI_FUNCTION("getElementStable", GetElementStable),
        DECLARE_NAPI_FUNCTION("getElementMultiThread", GetElementMultiThread),
        DECLARE_NAPI_FUNCTION("getElementMultiCtx", GetElementMultiCtx),
        DECLARE_NAPI_FUNCTION("getElementRuntime", GetElementRuntime),
        DECLARE_NAPI_FUNCTION("getElementWorker", GetElementWorker),
        DECLARE_NAPI_FUNCTION("hasElementStable", HasElementStable),
        DECLARE_NAPI_FUNCTION("hasElementMultiThread", HasElementMultiThread),
        DECLARE_NAPI_FUNCTION("hasElementMultiCtx", HasElementMultiCtx),
        DECLARE_NAPI_FUNCTION("hasElementRuntime", HasElementRuntime),
        DECLARE_NAPI_FUNCTION("hasElementWorker", HasElementWorker),
        DECLARE_NAPI_FUNCTION("deleteElementStable", DeleteElementStable),
        DECLARE_NAPI_FUNCTION("deleteElementMultiThread", DeleteElementMultiThread),
        DECLARE_NAPI_FUNCTION("deleteElementMultiCtx", DeleteElementMultiCtx),
        DECLARE_NAPI_FUNCTION("deleteElementRuntime", DeleteElementRuntime),
        DECLARE_NAPI_FUNCTION("deleteElementWorker", DeleteElementWorker),
        DECLARE_NAPI_FUNCTION("createTypedarrayStable", CreateTypedarrayStable),
        DECLARE_NAPI_FUNCTION("createTypedarrayMultiThread", CreateTypedarrayMultiThread),
        DECLARE_NAPI_FUNCTION("createTypedarrayMultiCtx", CreateTypedarrayMultiCtx),
        DECLARE_NAPI_FUNCTION("createTypedarrayRuntime", CreateTypedarrayRuntime),
        DECLARE_NAPI_FUNCTION("createTypedarrayWorker", CreateTypedarrayWorker),
        DECLARE_NAPI_FUNCTION("isTypedarrayStable", IsTypedarrayStable),
        DECLARE_NAPI_FUNCTION("isTypedarrayMultiThread", IsTypedarrayMultiThread),
        DECLARE_NAPI_FUNCTION("isTypedarrayMultiCtx", IsTypedarrayMultiCtx),
        DECLARE_NAPI_FUNCTION("isTypedarrayWorker", IsTypedarrayWorker),
        DECLARE_NAPI_FUNCTION("getTypedarrayInfoStable", GetTypedarrayInfoStable),
        DECLARE_NAPI_FUNCTION("getTypedarrayInfoMultiThread", GetTypedarrayInfoMultiThread),
        DECLARE_NAPI_FUNCTION("getTypedarrayInfoMultiCtx", GetTypedarrayInfoMultiCtx),
        DECLARE_NAPI_FUNCTION("getTypedarrayInfoWorker", GetTypedarrayInfoWorker),
        DECLARE_NAPI_FUNCTION("createDataviewStable", CreateDataviewStable),
        DECLARE_NAPI_FUNCTION("createDataviewMultiThread", CreateDataviewMultiThread),
        DECLARE_NAPI_FUNCTION("createDataviewMultiCtx", CreateDataviewMultiCtx),
        DECLARE_NAPI_FUNCTION("createDataviewRuntime", CreateDataviewRuntime),
        DECLARE_NAPI_FUNCTION("createDataviewWorker", CreateDataviewWorker),
        DECLARE_NAPI_FUNCTION("isDataviewStable", IsDataviewStable),
        DECLARE_NAPI_FUNCTION("isDataviewMultiThread", IsDataviewMultiThread),
        DECLARE_NAPI_FUNCTION("isDataviewMultiCtx", IsDataviewMultiCtx),
        DECLARE_NAPI_FUNCTION("isDataviewRuntime", IsDataviewRuntime),
        DECLARE_NAPI_FUNCTION("isDataviewWorker", IsDataviewWorker),
        DECLARE_NAPI_FUNCTION("getDataviewInfoStable", GetDataviewInfoStable),
        DECLARE_NAPI_FUNCTION("getDataviewInfoMultiThread", GetDataviewInfoMultiThread),
        DECLARE_NAPI_FUNCTION("getDataviewInfoMultiCtx", GetDataviewInfoMultiCtx),
        DECLARE_NAPI_FUNCTION("getDataviewInfoRuntime", GetDataviewInfoRuntime),
        DECLARE_NAPI_FUNCTION("getDataviewInfoWorker", GetDataviewInfoWorker),
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
    .nm_modname = "napiCovArray",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}