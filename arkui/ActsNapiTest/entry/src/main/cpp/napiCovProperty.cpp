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

static napi_value GetPropertyNamesStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value result = nullptr;
        napi_status status = napi_get_property_names(env, obj, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetPropertyNamesMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_property_names(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetPropertyNamesMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value result = nullptr;
    napi_status status = napi_get_property_names(env, obj, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetPropertyNamesRuntime(napi_env env, napi_callback_info info)
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
        napi_value napiRet = nullptr;
        napi_status status = napi_get_property_names(newEnv, obj, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetPropertyNamesWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_property_names(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetPropertyAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_set_property(env, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value SetPropertyStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(env, 42, &val);
        napi_status status = napi_set_property(env, obj, key, val);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value SetPropertyMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_set_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetPropertyMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, 42, &val);
    napi_status status = napi_set_property(env, obj, key, val);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value SetPropertyRuntime(napi_env env, napi_callback_info info)
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
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(newEnv, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(newEnv, 42, &val);
        napi_status status = napi_set_property(newEnv, obj, key, val);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetPropertyWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_set_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetPropertyStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(env, 42, &val);
        napi_set_property(env, obj, key, val);
        napi_value result = nullptr;
        napi_status status = napi_get_property(env, obj, key, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetPropertyMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetPropertyMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, 42, &val);
    napi_set_property(env, obj, key, val);
    napi_value result = nullptr;
    napi_status status = napi_get_property(env, obj, key, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetPropertyRuntime(napi_env env, napi_callback_info info)
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
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(newEnv, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(newEnv, 42, &val);
        napi_set_property(newEnv, obj, key, val);
        napi_value napiRet = nullptr;
        napi_status status = napi_get_property(newEnv, obj, key, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetPropertyWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasPropertyAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_has_property(env, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value HasPropertyRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, 42, &val);
    napi_set_property(env, obj, key, val);
    bool has = false;
    napi_status status = napi_has_property(env, obj, key, &has);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value HasPropertyStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(env, 42, &val);
        napi_set_property(env, obj, key, val);
        bool has = false;
        napi_status status = napi_has_property(env, obj, key, &has);
        int32_t singleRet = (status == napi_ok && has) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value HasPropertyMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_has_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasPropertyMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, 42, &val);
    napi_set_property(env, obj, key, val);
    bool has = false;
    napi_status status = napi_has_property(env, obj, key, &has);
    int32_t ret = (status == napi_ok && has) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value HasPropertyRuntime(napi_env env, napi_callback_info info)
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
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(newEnv, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(newEnv, 42, &val);
        napi_set_property(newEnv, obj, key, val);
        bool has = false;
        napi_status status = napi_has_property(newEnv, obj, key, &has);
        int32_t ret = (status == napi_ok && has) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasPropertyWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_has_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeletePropertyAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_delete_property(env, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value DeletePropertyRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_string_utf8(env, "del", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, 1, &val);
    napi_set_property(env, obj, key, val);
    bool deleted = false;
    napi_status status = napi_delete_property(env, obj, key, &deleted);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value DeletePropertyStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(env, "del", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(env, 1, &val);
        napi_set_property(env, obj, key, val);
        bool deleted = false;
        napi_status status = napi_delete_property(env, obj, key, &deleted);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DeletePropertyMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeletePropertyMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_string_utf8(env, "del", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, 1, &val);
    napi_set_property(env, obj, key, val);
    bool deleted = false;
    napi_status status = napi_delete_property(env, obj, key, &deleted);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DeletePropertyRuntime(napi_env env, napi_callback_info info)
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
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(newEnv, "del", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(newEnv, 1, &val);
        napi_set_property(newEnv, obj, key, val);
        bool deleted = false;
        napi_status status = napi_delete_property(newEnv, obj, key, &deleted);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeletePropertyWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasOwnPropertyRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_string_utf8(env, "own", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, 1, &val);
    napi_set_property(env, obj, key, val);
    bool hasOwn = false;
    napi_status status = napi_has_own_property(env, obj, key, &hasOwn);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value HasOwnPropertyStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(env, "own", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(env, 1, &val);
        napi_set_property(env, obj, key, val);
        bool hasOwn = false;
        napi_status status = napi_has_own_property(env, obj, key, &hasOwn);
        int32_t singleRet = (status == napi_ok && hasOwn) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value HasOwnPropertyMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_has_own_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasOwnPropertyMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_string_utf8(env, "own", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, 1, &val);
    napi_set_property(env, obj, key, val);
    bool hasOwn = false;
    napi_status status = napi_has_own_property(env, obj, key, &hasOwn);
    int32_t ret = (status == napi_ok && hasOwn) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value HasOwnPropertyRuntime(napi_env env, napi_callback_info info)
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
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_string_utf8(newEnv, "own", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(newEnv, 1, &val);
        napi_set_property(newEnv, obj, key, val);
        bool hasOwn = false;
        napi_status status = napi_has_own_property(newEnv, obj, key, &hasOwn);
        int32_t ret = (status == napi_ok && hasOwn) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasOwnPropertyWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_has_own_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetNamedPropertyAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_set_named_property(env, nullptr, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value SetNamedPropertyRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value val = nullptr;
    napi_create_int32(env, 42, &val);
    napi_status status = napi_set_named_property(env, obj, "myKey", val);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value SetNamedPropertyStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value val = nullptr;
        napi_create_int32(env, 42, &val);
        napi_status status = napi_set_named_property(env, obj, "myKey", val);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value SetNamedPropertyMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_set_named_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetNamedPropertyMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_int32(env, 42, &val);
    napi_status status = napi_set_named_property(env, obj, "myKey", val);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value SetNamedPropertyRuntime(napi_env env, napi_callback_info info)
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
        napi_create_int32(newEnv, 42, &val);
        napi_status status = napi_set_named_property(newEnv, obj, "myKey", val);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetNamedPropertyWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_set_named_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetNamedPropertyStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value val = nullptr;
        napi_create_int32(env, 42, &val);
        napi_set_named_property(env, obj, "myKey", val);
        napi_value result = nullptr;
        napi_status status = napi_get_named_property(env, obj, "myKey", &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetNamedPropertyMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_named_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetNamedPropertyMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_int32(env, 42, &val);
    napi_set_named_property(env, obj, "myKey", val);
    napi_value result = nullptr;
    napi_status status = napi_get_named_property(env, obj, "myKey", &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetNamedPropertyRuntime(napi_env env, napi_callback_info info)
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
        napi_create_int32(newEnv, 42, &val);
        napi_set_named_property(newEnv, obj, "myKey", val);
        napi_value napiRet = nullptr;
        napi_status status = napi_get_named_property(newEnv, obj, "myKey", &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetNamedPropertyWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_named_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasNamedPropertyRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value val = nullptr;
    napi_create_int32(env, 42, &val);
    napi_set_named_property(env, obj, "myKey", val);
    bool has = false;
    napi_status status = napi_has_named_property(env, obj, "myKey", &has);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value HasNamedPropertyStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value val = nullptr;
        napi_create_int32(env, 42, &val);
        napi_set_named_property(env, obj, "myKey", val);
        bool has = false;
        napi_status status = napi_has_named_property(env, obj, "myKey", &has);
        int32_t singleRet = (status == napi_ok && has) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value HasNamedPropertyMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_has_named_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasNamedPropertyMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_int32(env, 42, &val);
    napi_set_named_property(env, obj, "myKey", val);
    bool has = false;
    napi_status status = napi_has_named_property(env, obj, "myKey", &has);
    int32_t ret = (status == napi_ok && has) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value HasNamedPropertyRuntime(napi_env env, napi_callback_info info)
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
        napi_create_int32(newEnv, 42, &val);
        napi_set_named_property(newEnv, obj, "myKey", val);
        bool has = false;
        napi_status status = napi_has_named_property(newEnv, obj, "myKey", &has);
        int32_t ret = (status == napi_ok && has) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value HasNamedPropertyWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_has_named_property(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DefinePropertiesStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value propName = nullptr;
        napi_value propVal = nullptr;
        napi_create_string_utf8(env, "prop", NAPI_AUTO_LENGTH, &propName);
        napi_create_int32(env, 42, &propVal);
        napi_property_descriptor desc[] = {
            {"prop", nullptr, nullptr, nullptr, nullptr, propVal, napi_default, nullptr}
        };
        napi_status status = napi_define_properties(env, obj, 1, desc);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DefinePropertiesMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_define_properties(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DefinePropertiesMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value propName = nullptr;
    napi_value propVal = nullptr;
    napi_create_string_utf8(env, "prop", NAPI_AUTO_LENGTH, &propName);
    napi_create_int32(env, 42, &propVal);
    napi_property_descriptor desc[] = {{"prop", nullptr, nullptr, nullptr, nullptr, propVal, napi_default, nullptr}};
    napi_status status = napi_define_properties(env, obj, 1, desc);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DefinePropertiesRuntime(napi_env env, napi_callback_info info)
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
        napi_value propName = nullptr;
        napi_value propVal = nullptr;
        napi_create_string_utf8(newEnv, "prop", NAPI_AUTO_LENGTH, &propName);
        napi_create_int32(newEnv, 42, &propVal);
        napi_property_descriptor desc[] = {
            {"prop", nullptr, nullptr, nullptr, nullptr, propVal, napi_default, nullptr}
        };
        napi_status status = napi_define_properties(newEnv, obj, 1, desc);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DefinePropertiesWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_define_properties(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetAllPropertyNamesAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_all_property_names(env, nullptr, napi_key_include_prototypes,
        napi_key_all_properties, napi_key_numbers_to_strings, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetAllPropertyNamesRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value val = nullptr;
    napi_create_int32(env, 1, &val);
    napi_set_named_property(env, obj, "a", val);
    napi_value result = nullptr;
    napi_status status = napi_get_all_property_names(env, obj, napi_key_include_prototypes,
        napi_key_all_properties, napi_key_numbers_to_strings, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetAllPropertyNamesStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value val = nullptr;
        napi_create_int32(env, 1, &val);
        napi_set_named_property(env, obj, "a", val);
        napi_value result = nullptr;
        napi_status status = napi_get_all_property_names(env, obj, napi_key_include_prototypes,
            napi_key_all_properties, napi_key_numbers_to_strings, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetAllPropertyNamesMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_all_property_names(savedEnv, nullptr, napi_key_include_prototypes,
            napi_key_all_properties, napi_key_numbers_to_strings, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetAllPropertyNamesMultiCtx(napi_env env, napi_callback_info info)
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
    napi_create_int32(env, 1, &val);
    napi_set_named_property(env, obj, "a", val);
    napi_value result = nullptr;
    napi_status status = napi_get_all_property_names(env, obj, napi_key_include_prototypes,
        napi_key_all_properties, napi_key_numbers_to_strings, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetAllPropertyNamesRuntime(napi_env env, napi_callback_info info)
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
        napi_create_int32(newEnv, 1, &val);
        napi_set_named_property(newEnv, obj, "a", val);
        napi_value napiRet = nullptr;
        napi_status status = napi_get_all_property_names(newEnv, obj, napi_key_include_prototypes,
            napi_key_all_properties, napi_key_numbers_to_strings, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetAllPropertyNamesWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_all_property_names(savedEnv, nullptr, napi_key_include_prototypes,
            napi_key_all_properties, napi_key_numbers_to_strings, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("getPropertyNamesStable", GetPropertyNamesStable),
        DECLARE_NAPI_FUNCTION("getPropertyNamesMultiThread", GetPropertyNamesMultiThread),
        DECLARE_NAPI_FUNCTION("getPropertyNamesMultiCtx", GetPropertyNamesMultiCtx),
        DECLARE_NAPI_FUNCTION("getPropertyNamesRuntime", GetPropertyNamesRuntime),
        DECLARE_NAPI_FUNCTION("getPropertyNamesWorker", GetPropertyNamesWorker),
        DECLARE_NAPI_FUNCTION("setPropertyAbnormal", SetPropertyAbnormal),
        DECLARE_NAPI_FUNCTION("setPropertyStable", SetPropertyStable),
        DECLARE_NAPI_FUNCTION("setPropertyMultiThread", SetPropertyMultiThread),
        DECLARE_NAPI_FUNCTION("setPropertyMultiCtx", SetPropertyMultiCtx),
        DECLARE_NAPI_FUNCTION("setPropertyRuntime", SetPropertyRuntime),
        DECLARE_NAPI_FUNCTION("setPropertyWorker", SetPropertyWorker),
        DECLARE_NAPI_FUNCTION("getPropertyStable", GetPropertyStable),
        DECLARE_NAPI_FUNCTION("getPropertyMultiThread", GetPropertyMultiThread),
        DECLARE_NAPI_FUNCTION("getPropertyMultiCtx", GetPropertyMultiCtx),
        DECLARE_NAPI_FUNCTION("getPropertyRuntime", GetPropertyRuntime),
        DECLARE_NAPI_FUNCTION("getPropertyWorker", GetPropertyWorker),
        DECLARE_NAPI_FUNCTION("hasPropertyAbnormal", HasPropertyAbnormal),
        DECLARE_NAPI_FUNCTION("hasPropertyRetVal", HasPropertyRetVal),
        DECLARE_NAPI_FUNCTION("hasPropertyStable", HasPropertyStable),
        DECLARE_NAPI_FUNCTION("hasPropertyMultiThread", HasPropertyMultiThread),
        DECLARE_NAPI_FUNCTION("hasPropertyMultiCtx", HasPropertyMultiCtx),
        DECLARE_NAPI_FUNCTION("hasPropertyRuntime", HasPropertyRuntime),
        DECLARE_NAPI_FUNCTION("hasPropertyWorker", HasPropertyWorker),
        DECLARE_NAPI_FUNCTION("deletePropertyAbnormal", DeletePropertyAbnormal),
        DECLARE_NAPI_FUNCTION("deletePropertyRetVal", DeletePropertyRetVal),
        DECLARE_NAPI_FUNCTION("deletePropertyStable", DeletePropertyStable),
        DECLARE_NAPI_FUNCTION("deletePropertyMultiThread", DeletePropertyMultiThread),
        DECLARE_NAPI_FUNCTION("deletePropertyMultiCtx", DeletePropertyMultiCtx),
        DECLARE_NAPI_FUNCTION("deletePropertyRuntime", DeletePropertyRuntime),
        DECLARE_NAPI_FUNCTION("deletePropertyWorker", DeletePropertyWorker),
        DECLARE_NAPI_FUNCTION("hasOwnPropertyRetVal", HasOwnPropertyRetVal),
        DECLARE_NAPI_FUNCTION("hasOwnPropertyStable", HasOwnPropertyStable),
        DECLARE_NAPI_FUNCTION("hasOwnPropertyMultiThread", HasOwnPropertyMultiThread),
        DECLARE_NAPI_FUNCTION("hasOwnPropertyMultiCtx", HasOwnPropertyMultiCtx),
        DECLARE_NAPI_FUNCTION("hasOwnPropertyRuntime", HasOwnPropertyRuntime),
        DECLARE_NAPI_FUNCTION("hasOwnPropertyWorker", HasOwnPropertyWorker),
        DECLARE_NAPI_FUNCTION("setNamedPropertyAbnormal", SetNamedPropertyAbnormal),
        DECLARE_NAPI_FUNCTION("setNamedPropertyRetVal", SetNamedPropertyRetVal),
        DECLARE_NAPI_FUNCTION("setNamedPropertyStable", SetNamedPropertyStable),
        DECLARE_NAPI_FUNCTION("setNamedPropertyMultiThread", SetNamedPropertyMultiThread),
        DECLARE_NAPI_FUNCTION("setNamedPropertyMultiCtx", SetNamedPropertyMultiCtx),
        DECLARE_NAPI_FUNCTION("setNamedPropertyRuntime", SetNamedPropertyRuntime),
        DECLARE_NAPI_FUNCTION("setNamedPropertyWorker", SetNamedPropertyWorker),
        DECLARE_NAPI_FUNCTION("getNamedPropertyStable", GetNamedPropertyStable),
        DECLARE_NAPI_FUNCTION("getNamedPropertyMultiThread", GetNamedPropertyMultiThread),
        DECLARE_NAPI_FUNCTION("getNamedPropertyMultiCtx", GetNamedPropertyMultiCtx),
        DECLARE_NAPI_FUNCTION("getNamedPropertyRuntime", GetNamedPropertyRuntime),
        DECLARE_NAPI_FUNCTION("getNamedPropertyWorker", GetNamedPropertyWorker),
        DECLARE_NAPI_FUNCTION("hasNamedPropertyRetVal", HasNamedPropertyRetVal),
        DECLARE_NAPI_FUNCTION("hasNamedPropertyStable", HasNamedPropertyStable),
        DECLARE_NAPI_FUNCTION("hasNamedPropertyMultiThread", HasNamedPropertyMultiThread),
        DECLARE_NAPI_FUNCTION("hasNamedPropertyMultiCtx", HasNamedPropertyMultiCtx),
        DECLARE_NAPI_FUNCTION("hasNamedPropertyRuntime", HasNamedPropertyRuntime),
        DECLARE_NAPI_FUNCTION("hasNamedPropertyWorker", HasNamedPropertyWorker),
        DECLARE_NAPI_FUNCTION("definePropertiesStable", DefinePropertiesStable),
        DECLARE_NAPI_FUNCTION("definePropertiesMultiThread", DefinePropertiesMultiThread),
        DECLARE_NAPI_FUNCTION("definePropertiesMultiCtx", DefinePropertiesMultiCtx),
        DECLARE_NAPI_FUNCTION("definePropertiesRuntime", DefinePropertiesRuntime),
        DECLARE_NAPI_FUNCTION("definePropertiesWorker", DefinePropertiesWorker),
        DECLARE_NAPI_FUNCTION("getAllPropertyNamesAbnormal", GetAllPropertyNamesAbnormal),
        DECLARE_NAPI_FUNCTION("getAllPropertyNamesRetVal", GetAllPropertyNamesRetVal),
        DECLARE_NAPI_FUNCTION("getAllPropertyNamesStable", GetAllPropertyNamesStable),
        DECLARE_NAPI_FUNCTION("getAllPropertyNamesMultiThread", GetAllPropertyNamesMultiThread),
        DECLARE_NAPI_FUNCTION("getAllPropertyNamesMultiCtx", GetAllPropertyNamesMultiCtx),
        DECLARE_NAPI_FUNCTION("getAllPropertyNamesRuntime", GetAllPropertyNamesRuntime),
        DECLARE_NAPI_FUNCTION("getAllPropertyNamesWorker", GetAllPropertyNamesWorker),
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
    .nm_modname = "napiCovProperty",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}