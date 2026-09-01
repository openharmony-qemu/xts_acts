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

static napi_value CreateArkRuntimeAbnormal(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_status status = napi_create_ark_runtime(nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    int32_t ret = result.load();
    return Ret(env, ret);
}

static napi_value CreateArkRuntimeRetVal(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status status = napi_create_ark_runtime(&newEnv);
        result.store((status == napi_ok && newEnv != nullptr) ? 1 : 0);
        if (newEnv != nullptr) { napi_destroy_ark_runtime(&newEnv); }
    });
    t.join();
    int32_t ret = result.load();
    return Ret(env, ret);
}

static napi_value CreateArkRuntimeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        std::atomic<int32_t> result(0);
        std::thread t([&result]() {
            napi_env newEnv = nullptr;
            napi_status status = napi_create_ark_runtime(&newEnv);
            result.store((status == napi_ok && newEnv != nullptr) ? 1 : 0);
            if (newEnv != nullptr) { napi_destroy_ark_runtime(&newEnv); }
        });
        t.join();
        int32_t singleRet = result.load();
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateArkRuntimeMultiCtx(napi_env env, napi_callback_info info)
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
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status status = napi_create_ark_runtime(&newEnv);
        result.store((status == napi_ok && newEnv != nullptr) ? 1 : 0);
        if (newEnv != nullptr) { napi_destroy_ark_runtime(&newEnv); }
    });
    t.join();
    int32_t ret = result.load();
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateArkRuntimeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
            napi_status status = napi_create_ark_runtime(nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DestroyArkRuntimeAbnormal(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_status status = napi_destroy_ark_runtime(nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    int32_t ret = result.load();
    return Ret(env, ret);
}

static napi_value DestroyArkRuntimeRetVal(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_create_ark_runtime(&newEnv);
        napi_status status = napi_destroy_ark_runtime(&newEnv);
        result.store(status == napi_ok ? 1 : 0);
    });
    t.join();
    int32_t ret = result.load();
    return Ret(env, ret);
}

static napi_value DestroyArkRuntimeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        std::atomic<int32_t> result(0);
        std::thread t([&result]() {
            napi_env newEnv = nullptr;
            napi_create_ark_runtime(&newEnv);
            napi_status status = napi_destroy_ark_runtime(&newEnv);
            result.store(status == napi_ok ? 1 : 0);
        });
        t.join();
        int32_t singleRet = result.load();
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value DestroyArkRuntimeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
            napi_status status = napi_destroy_ark_runtime(nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value DestroyArkRuntimeMultiCtx(napi_env env, napi_callback_info info)
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
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_create_ark_runtime(&newEnv);
        napi_status status = napi_destroy_ark_runtime(&newEnv);
        result.store(status == napi_ok ? 1 : 0);
    });
    t.join();
    int32_t ret = result.load();
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value DestroyArkRuntimeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
            napi_status status = napi_destroy_ark_runtime(nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RunEventLoopAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_run_event_loop(env, (napi_event_mode)-1);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value RunEventLoopRetVal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_run_event_loop(env, napi_event_mode_default);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value RunEventLoopStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_status status = napi_run_event_loop(env, napi_event_mode_default);
        int32_t singleRet = status != napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value RunEventLoopMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_run_event_loop(savedEnv, (napi_event_mode)-1);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RunEventLoopMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_run_event_loop(env, napi_event_mode_default);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value RunEventLoopWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_run_event_loop(savedEnv, (napi_event_mode)-1);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value StopEventLoopAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_stop_event_loop(nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value StopEventLoopRetVal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_stop_event_loop(env);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value StopEventLoopStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_status status = napi_stop_event_loop(env);
        int32_t singleRet = status != napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value StopEventLoopMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_stop_event_loop(nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value StopEventLoopMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_stop_event_loop(env);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value StopEventLoopRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_status status = napi_stop_event_loop(newEnv);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value StopEventLoopWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_stop_event_loop(nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createArkRuntimeAbnormal", CreateArkRuntimeAbnormal),
        DECLARE_NAPI_FUNCTION("createArkRuntimeRetVal", CreateArkRuntimeRetVal),
        DECLARE_NAPI_FUNCTION("createArkRuntimeStable", CreateArkRuntimeStable),
        DECLARE_NAPI_FUNCTION("createArkRuntimeMultiCtx", CreateArkRuntimeMultiCtx),
        DECLARE_NAPI_FUNCTION("createArkRuntimeWorker", CreateArkRuntimeWorker),
        DECLARE_NAPI_FUNCTION("destroyArkRuntimeAbnormal", DestroyArkRuntimeAbnormal),
        DECLARE_NAPI_FUNCTION("destroyArkRuntimeRetVal", DestroyArkRuntimeRetVal),
        DECLARE_NAPI_FUNCTION("destroyArkRuntimeStable", DestroyArkRuntimeStable),
        DECLARE_NAPI_FUNCTION("destroyArkRuntimeMultiThread", DestroyArkRuntimeMultiThread),
        DECLARE_NAPI_FUNCTION("destroyArkRuntimeMultiCtx", DestroyArkRuntimeMultiCtx),
        DECLARE_NAPI_FUNCTION("destroyArkRuntimeWorker", DestroyArkRuntimeWorker),
        DECLARE_NAPI_FUNCTION("runEventLoopAbnormal", RunEventLoopAbnormal),
        DECLARE_NAPI_FUNCTION("runEventLoopRetVal", RunEventLoopRetVal),
        DECLARE_NAPI_FUNCTION("runEventLoopStable", RunEventLoopStable),
        DECLARE_NAPI_FUNCTION("runEventLoopMultiThread", RunEventLoopMultiThread),
        DECLARE_NAPI_FUNCTION("runEventLoopMultiCtx", RunEventLoopMultiCtx),
        DECLARE_NAPI_FUNCTION("runEventLoopWorker", RunEventLoopWorker),
        DECLARE_NAPI_FUNCTION("stopEventLoopAbnormal", StopEventLoopAbnormal),
        DECLARE_NAPI_FUNCTION("stopEventLoopRetVal", StopEventLoopRetVal),
        DECLARE_NAPI_FUNCTION("stopEventLoopStable", StopEventLoopStable),
        DECLARE_NAPI_FUNCTION("stopEventLoopMultiThread", StopEventLoopMultiThread),
        DECLARE_NAPI_FUNCTION("stopEventLoopMultiCtx", StopEventLoopMultiCtx),
        DECLARE_NAPI_FUNCTION("stopEventLoopRuntime", StopEventLoopRuntime),
        DECLARE_NAPI_FUNCTION("stopEventLoopWorker", StopEventLoopWorker),
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
    .nm_modname = "napiCovArkRuntime",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}