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

static napi_value CreateArkContextAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_ark_context(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateArkContextRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_env ctxEnv = nullptr;
    napi_status status = napi_create_ark_context(env, &ctxEnv);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    if (ctxEnv != nullptr) { napi_destroy_ark_context(env); }
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateArkContextStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
    napi_env ctxEnv = nullptr;
        napi_status status = napi_create_ark_context(env, &ctxEnv);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        if (ctxEnv != nullptr) { napi_destroy_ark_context(env); }
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateArkContextWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_ark_context(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SwitchArkContextAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_switch_ark_context(env);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value SwitchArkContextRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_env ctxEnv = nullptr;
    napi_create_ark_context(env, &ctxEnv);
    napi_status status = napi_switch_ark_context(env);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value SwitchArkContextStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
    napi_env ctxEnv = nullptr;
        napi_create_ark_context(env, &ctxEnv);
        napi_status status = napi_switch_ark_context(env);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_switch_ark_context(env);
        napi_destroy_ark_context(env);
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value SwitchArkContextMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_switch_ark_context(savedEnv);
        result.store(status == napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SwitchArkContextWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_switch_ark_context(savedEnv);
        result.store(status == napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DestroyArkContextNormal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_env ctxEnv = nullptr;
    napi_create_ark_context(env, &ctxEnv);
    napi_status status = napi_destroy_ark_context(env);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value DestroyArkContextAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_destroy_ark_context(env);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value DestroyArkContextRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_env ctxEnv = nullptr;
    napi_create_ark_context(env, &ctxEnv);
    napi_status status = napi_destroy_ark_context(env);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value DestroyArkContextStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
    napi_env ctxEnv = nullptr;
        napi_create_ark_context(env, &ctxEnv);
        napi_status status = napi_destroy_ark_context(env);
        int32_t singleRet = status != napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DestroyArkContextMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_destroy_ark_context(savedEnv);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DestroyArkContextWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_destroy_ark_context(savedEnv);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createArkContextAbnormal", CreateArkContextAbnormal),
        DECLARE_NAPI_FUNCTION("createArkContextRetVal", CreateArkContextRetVal),
        DECLARE_NAPI_FUNCTION("createArkContextStable", CreateArkContextStable),
        DECLARE_NAPI_FUNCTION("createArkContextWorker", CreateArkContextWorker),
        DECLARE_NAPI_FUNCTION("switchArkContextAbnormal", SwitchArkContextAbnormal),
        DECLARE_NAPI_FUNCTION("switchArkContextRetVal", SwitchArkContextRetVal),
        DECLARE_NAPI_FUNCTION("switchArkContextStable", SwitchArkContextStable),
        DECLARE_NAPI_FUNCTION("switchArkContextMultiThread", SwitchArkContextMultiThread),
        DECLARE_NAPI_FUNCTION("switchArkContextWorker", SwitchArkContextWorker),
        DECLARE_NAPI_FUNCTION("destroyArkContextNormal", DestroyArkContextNormal),
        DECLARE_NAPI_FUNCTION("destroyArkContextAbnormal", DestroyArkContextAbnormal),
        DECLARE_NAPI_FUNCTION("destroyArkContextRetVal", DestroyArkContextRetVal),
        DECLARE_NAPI_FUNCTION("destroyArkContextStable", DestroyArkContextStable),
        DECLARE_NAPI_FUNCTION("destroyArkContextMultiThread", DestroyArkContextMultiThread),
        DECLARE_NAPI_FUNCTION("destroyArkContextWorker", DestroyArkContextWorker),
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
    .nm_modname = "napiCovArkContext",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}