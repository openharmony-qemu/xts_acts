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

static napi_value CreateStrongReferenceNormal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_strong_ref ref = nullptr;
    napi_status status = napi_create_strong_reference(env, obj, &ref);
    int32_t ret = (status == napi_ok && ref != nullptr) ? 1 : 0;
    if (ref != nullptr) { napi_delete_strong_reference(env, ref); }
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateStrongReferenceStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_strong_ref ref = nullptr;
        napi_status status = napi_create_strong_reference(env, obj, &ref);
        int32_t singleRet = (status == napi_ok && ref != nullptr) ? 1 : 0;
        if (ref != nullptr) { napi_delete_strong_reference(env, ref); }
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateStrongReferenceMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_strong_reference(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateStrongReferenceMultiCtx(napi_env env, napi_callback_info info)
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
    napi_strong_ref ref = nullptr;
    napi_status status = napi_create_strong_reference(env, obj, &ref);
    int32_t ret = (status == napi_ok && ref != nullptr) ? 1 : 0;
    if (ref != nullptr) { napi_delete_strong_reference(env, ref); }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateStrongReferenceRuntime(napi_env env, napi_callback_info info)
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
        napi_strong_ref ref = nullptr;
        napi_status status = napi_create_strong_reference(newEnv, obj, &ref);
        int32_t ret = (status == napi_ok && ref != nullptr) ? 1 : 0;
        if (ref != nullptr) { napi_delete_strong_reference(newEnv, ref); }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateStrongReferenceWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_strong_reference(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteStrongReferenceNormal(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_strong_ref ref = nullptr;
    napi_create_strong_reference(env, obj, &ref);
    napi_status status = napi_delete_strong_reference(env, ref);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value DeleteStrongReferenceStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_strong_ref ref = nullptr;
        napi_create_strong_reference(env, obj, &ref);
        napi_status status = napi_delete_strong_reference(env, ref);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DeleteStrongReferenceMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_strong_reference(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteStrongReferenceMultiCtx(napi_env env, napi_callback_info info)
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
    napi_strong_ref ref = nullptr;
    napi_create_strong_reference(env, obj, &ref);
    napi_status status = napi_delete_strong_reference(env, ref);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DeleteStrongReferenceRuntime(napi_env env, napi_callback_info info)
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
        napi_strong_ref ref = nullptr;
        napi_create_strong_reference(newEnv, obj, &ref);
        napi_status status = napi_delete_strong_reference(newEnv, ref);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DeleteStrongReferenceWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_delete_strong_reference(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetStrongReferenceValueNormal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_strong_ref ref = nullptr;
    napi_create_strong_reference(env, obj, &ref);
    napi_value result = nullptr;
    napi_status status = napi_get_strong_reference_value(env, ref, &result);
    napi_delete_strong_reference(env, ref);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetStrongReferenceValueStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_strong_ref ref = nullptr;
        napi_create_strong_reference(env, obj, &ref);
        napi_value result = nullptr;
        napi_status status = napi_get_strong_reference_value(env, ref, &result);
        napi_delete_strong_reference(env, ref);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetStrongReferenceValueMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_strong_reference_value(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetStrongReferenceValueMultiCtx(napi_env env, napi_callback_info info)
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
    napi_strong_ref ref = nullptr;
    napi_create_strong_reference(env, obj, &ref);
    napi_value result = nullptr;
    napi_status status = napi_get_strong_reference_value(env, ref, &result);
    napi_delete_strong_reference(env, ref);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetStrongReferenceValueRuntime(napi_env env, napi_callback_info info)
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
        napi_strong_ref ref = nullptr;
        napi_create_strong_reference(newEnv, obj, &ref);
        napi_value napiRet = nullptr;
        napi_status status = napi_get_strong_reference_value(newEnv, ref, &napiRet);
        napi_delete_strong_reference(newEnv, ref);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetStrongReferenceValueWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_strong_reference_value(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createStrongReferenceNormal", CreateStrongReferenceNormal),
        DECLARE_NAPI_FUNCTION("createStrongReferenceStable", CreateStrongReferenceStable),
        DECLARE_NAPI_FUNCTION("createStrongReferenceMultiThread", CreateStrongReferenceMultiThread),
        DECLARE_NAPI_FUNCTION("createStrongReferenceMultiCtx", CreateStrongReferenceMultiCtx),
        DECLARE_NAPI_FUNCTION("createStrongReferenceRuntime", CreateStrongReferenceRuntime),
        DECLARE_NAPI_FUNCTION("createStrongReferenceWorker", CreateStrongReferenceWorker),
        DECLARE_NAPI_FUNCTION("deleteStrongReferenceNormal", DeleteStrongReferenceNormal),
        DECLARE_NAPI_FUNCTION("deleteStrongReferenceStable", DeleteStrongReferenceStable),
        DECLARE_NAPI_FUNCTION("deleteStrongReferenceMultiThread", DeleteStrongReferenceMultiThread),
        DECLARE_NAPI_FUNCTION("deleteStrongReferenceMultiCtx", DeleteStrongReferenceMultiCtx),
        DECLARE_NAPI_FUNCTION("deleteStrongReferenceRuntime", DeleteStrongReferenceRuntime),
        DECLARE_NAPI_FUNCTION("deleteStrongReferenceWorker", DeleteStrongReferenceWorker),
        DECLARE_NAPI_FUNCTION("getStrongReferenceValueNormal", GetStrongReferenceValueNormal),
        DECLARE_NAPI_FUNCTION("getStrongReferenceValueStable", GetStrongReferenceValueStable),
        DECLARE_NAPI_FUNCTION("getStrongReferenceValueMultiThread", GetStrongReferenceValueMultiThread),
        DECLARE_NAPI_FUNCTION("getStrongReferenceValueMultiCtx", GetStrongReferenceValueMultiCtx),
        DECLARE_NAPI_FUNCTION("getStrongReferenceValueRuntime", GetStrongReferenceValueRuntime),
        DECLARE_NAPI_FUNCTION("getStrongReferenceValueWorker", GetStrongReferenceValueWorker),
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
    .nm_modname = "napiCovStrongRef",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}