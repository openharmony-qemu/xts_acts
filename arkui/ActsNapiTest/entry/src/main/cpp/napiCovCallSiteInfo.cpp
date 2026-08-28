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
static const int32_t CALLSITE_TEST_VALUE = 42;

static napi_value CreateCallsiteInfoStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_callsite_info csiResult = nullptr;
        napi_status status = napi_create_callsite_info(env, &csiResult);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateCallsiteInfoMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_callsite_info(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateCallsiteInfoMultiCtx(napi_env env, napi_callback_info info)
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
    napi_callsite_info csiResult = nullptr;
    napi_status status = napi_create_callsite_info(env, &csiResult);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateCallsiteInfoRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_callsite_info csiResult = nullptr;
        napi_status status = napi_create_callsite_info(newEnv, &csiResult);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateCallsiteInfoWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_callsite_info(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteCallsiteInfoNormal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_callsite_info csi = nullptr;
    napi_create_callsite_info(env, &csi);
    napi_status status = napi_delete_callsite_info(env, csi);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value DeleteCallsiteInfoStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_callsite_info csi = nullptr;
        napi_create_callsite_info(env, &csi);
        napi_status status = napi_delete_callsite_info(env, csi);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DeleteCallsiteInfoMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_callsite_info(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteCallsiteInfoMultiCtx(napi_env env, napi_callback_info info)
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
    napi_callsite_info csi = nullptr;
    napi_create_callsite_info(env, &csi);
    napi_status status = napi_delete_callsite_info(env, csi);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DeleteCallsiteInfoRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_callsite_info csi = nullptr;
        napi_create_callsite_info(newEnv, &csi);
        napi_status status = napi_delete_callsite_info(newEnv, csi);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteCallsiteInfoWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_callsite_info(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetPropertyWithCallsiteInfoStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_object(env, &obj);
        napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(env, CALLSITE_TEST_VALUE, &val);
        napi_set_property(env, obj, key, val);
        napi_callsite_info csi = nullptr;
        napi_create_callsite_info(env, &csi);
        napi_value result = nullptr;
        napi_status status = napi_get_property_with_callsite_info(env, obj, key, csi, &result, nullptr);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetPropertyWithCallsiteInfoMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_property_with_callsite_info(savedEnv, nullptr, nullptr,
            nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetPropertyWithCallsiteInfoMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_object(env, &obj);
    napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, CALLSITE_TEST_VALUE, &val);
    napi_set_property(env, obj, key, val);
    napi_callsite_info csi = nullptr;
    napi_create_callsite_info(env, &csi);
    napi_value result = nullptr;
    napi_status status = napi_get_property_with_callsite_info(env, obj, key, csi, &result, nullptr);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetPropertyWithCallsiteInfoRuntime(napi_env env, napi_callback_info info)
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
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_object(newEnv, &obj);
        napi_create_string_utf8(newEnv, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(newEnv, CALLSITE_TEST_VALUE, &val);
        napi_set_property(newEnv, obj, key, val);
        napi_callsite_info csi = nullptr;
        napi_create_callsite_info(newEnv, &csi);
        napi_value napiRet = nullptr;
        napi_status status = napi_get_property_with_callsite_info(newEnv, obj, key, csi, &napiRet, nullptr);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetPropertyWithCallsiteInfoWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_property_with_callsite_info(savedEnv, nullptr, nullptr,
            nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetPropertyWithCallsiteInfoRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_object(env, &obj);
    napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, CALLSITE_TEST_VALUE, &val);
    napi_callsite_info csi = nullptr;
    napi_create_callsite_info(env, &csi);
    napi_status status = napi_set_property_with_callsite_info(env, obj, key, val, csi, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value SetPropertyWithCallsiteInfoStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_object(env, &obj);
        napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(env, CALLSITE_TEST_VALUE, &val);
        napi_callsite_info csi = nullptr;
        napi_create_callsite_info(env, &csi);
        napi_status status = napi_set_property_with_callsite_info(env, obj, key, val, csi, nullptr);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value SetPropertyWithCallsiteInfoMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_set_property_with_callsite_info(savedEnv, nullptr, nullptr,
            nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetPropertyWithCallsiteInfoMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value key = nullptr;
    napi_value val = nullptr;
    napi_create_object(env, &obj);
    napi_create_string_utf8(env, "key", NAPI_AUTO_LENGTH, &key);
    napi_create_int32(env, CALLSITE_TEST_VALUE, &val);
    napi_callsite_info csi = nullptr;
    napi_create_callsite_info(env, &csi);
    napi_status status = napi_set_property_with_callsite_info(env, obj, key, val, csi, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value SetPropertyWithCallsiteInfoRuntime(napi_env env, napi_callback_info info)
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
        napi_value key = nullptr;
        napi_value val = nullptr;
        napi_create_object(newEnv, &obj);
        napi_create_string_utf8(newEnv, "key", NAPI_AUTO_LENGTH, &key);
        napi_create_int32(newEnv, CALLSITE_TEST_VALUE, &val);
        napi_callsite_info csi = nullptr;
        napi_create_callsite_info(newEnv, &csi);
        napi_status status = napi_set_property_with_callsite_info(newEnv, obj, key, val, csi, nullptr);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetPropertyWithCallsiteInfoWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_set_property_with_callsite_info(savedEnv, nullptr, nullptr,
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
        DECLARE_NAPI_FUNCTION("createCallsiteInfoStable", CreateCallsiteInfoStable),
        DECLARE_NAPI_FUNCTION("createCallsiteInfoMultiThread", CreateCallsiteInfoMultiThread),
        DECLARE_NAPI_FUNCTION("createCallsiteInfoMultiCtx", CreateCallsiteInfoMultiCtx),
        DECLARE_NAPI_FUNCTION("createCallsiteInfoRuntime", CreateCallsiteInfoRuntime),
        DECLARE_NAPI_FUNCTION("createCallsiteInfoWorker", CreateCallsiteInfoWorker),
        DECLARE_NAPI_FUNCTION("deleteCallsiteInfoNormal", DeleteCallsiteInfoNormal),
        DECLARE_NAPI_FUNCTION("deleteCallsiteInfoStable", DeleteCallsiteInfoStable),
        DECLARE_NAPI_FUNCTION("deleteCallsiteInfoMultiThread", DeleteCallsiteInfoMultiThread),
        DECLARE_NAPI_FUNCTION("deleteCallsiteInfoMultiCtx", DeleteCallsiteInfoMultiCtx),
        DECLARE_NAPI_FUNCTION("deleteCallsiteInfoRuntime", DeleteCallsiteInfoRuntime),
        DECLARE_NAPI_FUNCTION("deleteCallsiteInfoWorker", DeleteCallsiteInfoWorker),
        DECLARE_NAPI_FUNCTION("getPropertyWithCallsiteInfoStable", GetPropertyWithCallsiteInfoStable),
        DECLARE_NAPI_FUNCTION("getPropertyWithCallsiteInfoMultiThread", GetPropertyWithCallsiteInfoMultiThread),
        DECLARE_NAPI_FUNCTION("getPropertyWithCallsiteInfoMultiCtx", GetPropertyWithCallsiteInfoMultiCtx),
        DECLARE_NAPI_FUNCTION("getPropertyWithCallsiteInfoRuntime", GetPropertyWithCallsiteInfoRuntime),
        DECLARE_NAPI_FUNCTION("getPropertyWithCallsiteInfoWorker", GetPropertyWithCallsiteInfoWorker),
        DECLARE_NAPI_FUNCTION("setPropertyWithCallsiteInfoRetVal", SetPropertyWithCallsiteInfoRetVal),
        DECLARE_NAPI_FUNCTION("setPropertyWithCallsiteInfoStable", SetPropertyWithCallsiteInfoStable),
        DECLARE_NAPI_FUNCTION("setPropertyWithCallsiteInfoMultiThread", SetPropertyWithCallsiteInfoMultiThread),
        DECLARE_NAPI_FUNCTION("setPropertyWithCallsiteInfoMultiCtx", SetPropertyWithCallsiteInfoMultiCtx),
        DECLARE_NAPI_FUNCTION("setPropertyWithCallsiteInfoRuntime", SetPropertyWithCallsiteInfoRuntime),
        DECLARE_NAPI_FUNCTION("setPropertyWithCallsiteInfoWorker", SetPropertyWithCallsiteInfoWorker),
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
    .nm_modname = "napiCovCallSiteInfo",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}