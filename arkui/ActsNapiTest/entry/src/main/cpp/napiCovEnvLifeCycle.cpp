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

static napi_value SetInstanceDataAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_set_instance_data(env, nullptr, nullptr, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value SetInstanceDataRetVal(napi_env env, napi_callback_info info)
{
    static int32_t instData = 42;
    napi_status status = napi_set_instance_data(env, &instData, nullptr, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value SetInstanceDataStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        static int32_t instData = 42;
        napi_status status = napi_set_instance_data(env, &instData, nullptr, nullptr);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value SetInstanceDataMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_set_instance_data(savedEnv, nullptr, nullptr, nullptr);
        result.store(status == napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetInstanceDataMultiCtx(napi_env env, napi_callback_info info)
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
    static int32_t instData = 42;
    napi_status status = napi_set_instance_data(env, &instData, nullptr, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value SetInstanceDataRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        static int32_t instData = 42;
        napi_status status = napi_set_instance_data(newEnv, &instData, nullptr, nullptr);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value SetInstanceDataWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_set_instance_data(savedEnv, nullptr, nullptr, nullptr);
        result.store(status == napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetInstanceDataAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_instance_data(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetInstanceDataRetVal(napi_env env, napi_callback_info info)
{
    static int32_t instData = 42;
    napi_set_instance_data(env, &instData, nullptr, nullptr);
    void* data = nullptr;
    napi_status status = napi_get_instance_data(env, &data);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetInstanceDataStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        static int32_t instData = 42;
        napi_set_instance_data(env, &instData, nullptr, nullptr);
        void* data = nullptr;
        napi_status status = napi_get_instance_data(env, &data);
        int32_t singleRet = (status == napi_ok && data != nullptr) ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetInstanceDataMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_instance_data(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetInstanceDataMultiCtx(napi_env env, napi_callback_info info)
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
    static int32_t instData = 42;
    napi_set_instance_data(env, &instData, nullptr, nullptr);
    void* data = nullptr;
    napi_status status = napi_get_instance_data(env, &data);
    int32_t ret = (status == napi_ok && data != nullptr) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetInstanceDataRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        static int32_t instData = 42;
        napi_set_instance_data(newEnv, &instData, nullptr, nullptr);
        void* data = nullptr;
        napi_status status = napi_get_instance_data(newEnv, &data);
        int32_t ret = (status == napi_ok && data != nullptr) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetInstanceDataWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_instance_data(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AddEnvCleanupHookStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_status status = napi_add_env_cleanup_hook(env, [](void* d) { (void)d; }, nullptr);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (status == napi_ok) {
            napi_remove_env_cleanup_hook(env, [](void* d) {
                (void)d;
            }, nullptr);
        }
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value AddEnvCleanupHookMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_add_env_cleanup_hook(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AddEnvCleanupHookMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_add_env_cleanup_hook(env, [](void* d) { (void)d; }, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    if (status == napi_ok) {
        napi_remove_env_cleanup_hook(env, [](void* d) {
            (void)d;
        }, nullptr);

    }
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value AddEnvCleanupHookRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_status status = napi_add_env_cleanup_hook(newEnv, [](void* d) { (void)d; }, nullptr);
        int32_t ret = status == napi_ok ? 1 : 0;
        if (status == napi_ok) {
            napi_remove_env_cleanup_hook(newEnv, [](void* d) {
                (void)d;
            }, nullptr);
        }
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AddEnvCleanupHookWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_add_env_cleanup_hook(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RemoveEnvCleanupHookRetVal(napi_env env, napi_callback_info info)
{
    napi_add_env_cleanup_hook(env, [](void* d) { (void)d; }, nullptr);
    napi_status status = napi_remove_env_cleanup_hook(env, [](void* d) { (void)d; }, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value RemoveEnvCleanupHookStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_add_env_cleanup_hook(env, [](void* d) { (void)d; }, nullptr);
        napi_status status = napi_remove_env_cleanup_hook(env, [](void* d) { (void)d; }, nullptr);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value RemoveEnvCleanupHookMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_remove_env_cleanup_hook(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RemoveEnvCleanupHookMultiCtx(napi_env env, napi_callback_info info)
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
    napi_add_env_cleanup_hook(env, [](void* d) { (void)d; }, nullptr);
    napi_status status = napi_remove_env_cleanup_hook(env, [](void* d) { (void)d; }, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value RemoveEnvCleanupHookRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_add_env_cleanup_hook(newEnv, [](void* d) { (void)d; }, nullptr);
        napi_status status = napi_remove_env_cleanup_hook(newEnv, [](void* d) { (void)d; }, nullptr);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RemoveEnvCleanupHookWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_remove_env_cleanup_hook(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AddAsyncCleanupHookStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_async_cleanup_hook_handle hook = nullptr;
        napi_status status = napi_add_async_cleanup_hook(env,
            [](napi_async_cleanup_hook_handle h, void* d) {
                (void)d;
                napi_remove_async_cleanup_hook(h);
            }, nullptr, &hook);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value AddAsyncCleanupHookMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_add_async_cleanup_hook(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AddAsyncCleanupHookMultiCtx(napi_env env, napi_callback_info info)
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
    napi_async_cleanup_hook_handle hook = nullptr;
    napi_status status = napi_add_async_cleanup_hook(env,
        [](napi_async_cleanup_hook_handle h, void* d) {
            (void)d;
            napi_remove_async_cleanup_hook(h);
        }, nullptr, &hook);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value AddAsyncCleanupHookRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_async_cleanup_hook_handle hook = nullptr;
        napi_status status = napi_add_async_cleanup_hook(newEnv,
            [](napi_async_cleanup_hook_handle h, void* d) {
                (void)d;
                napi_remove_async_cleanup_hook(h);
            }, nullptr, &hook);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value AddAsyncCleanupHookWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_add_async_cleanup_hook(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RemoveAsyncCleanupHookRetVal(napi_env env, napi_callback_info info)
{
    napi_async_cleanup_hook_handle hook = nullptr;
    napi_add_async_cleanup_hook(env, [](napi_async_cleanup_hook_handle h, void* d) { (void)d; (void)h; }, nullptr, &hook);
    napi_status status = napi_remove_async_cleanup_hook(hook);
    int32_t ret = status == napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value RemoveAsyncCleanupHookStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_async_cleanup_hook_handle hook = nullptr;
    napi_add_async_cleanup_hook(env, [](napi_async_cleanup_hook_handle h, void* d) {
        (void)d;
        (void)h;
    }, nullptr, &hook);
        napi_status status = napi_remove_async_cleanup_hook(hook);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value RemoveAsyncCleanupHookMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_remove_async_cleanup_hook(nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RemoveAsyncCleanupHookMultiCtx(napi_env env, napi_callback_info info)
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
    napi_async_cleanup_hook_handle hook = nullptr;
    napi_add_async_cleanup_hook(env, [](napi_async_cleanup_hook_handle h, void* d) { (void)d; (void)h; }, nullptr, &hook);
    napi_status status = napi_remove_async_cleanup_hook(hook);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value RemoveAsyncCleanupHookRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_async_cleanup_hook_handle hook = nullptr;
        napi_add_async_cleanup_hook(newEnv, [](napi_async_cleanup_hook_handle h, void* d) { (void)d; (void)h; }, nullptr, &hook);
        napi_status status = napi_remove_async_cleanup_hook(hook);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value RemoveAsyncCleanupHookWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_remove_async_cleanup_hook(nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("setInstanceDataAbnormal", SetInstanceDataAbnormal),
        DECLARE_NAPI_FUNCTION("setInstanceDataRetVal", SetInstanceDataRetVal),
        DECLARE_NAPI_FUNCTION("setInstanceDataStable", SetInstanceDataStable),
        DECLARE_NAPI_FUNCTION("setInstanceDataMultiThread", SetInstanceDataMultiThread),
        DECLARE_NAPI_FUNCTION("setInstanceDataMultiCtx", SetInstanceDataMultiCtx),
        DECLARE_NAPI_FUNCTION("setInstanceDataRuntime", SetInstanceDataRuntime),
        DECLARE_NAPI_FUNCTION("setInstanceDataWorker", SetInstanceDataWorker),
        DECLARE_NAPI_FUNCTION("getInstanceDataAbnormal", GetInstanceDataAbnormal),
        DECLARE_NAPI_FUNCTION("getInstanceDataRetVal", GetInstanceDataRetVal),
        DECLARE_NAPI_FUNCTION("getInstanceDataStable", GetInstanceDataStable),
        DECLARE_NAPI_FUNCTION("getInstanceDataMultiThread", GetInstanceDataMultiThread),
        DECLARE_NAPI_FUNCTION("getInstanceDataMultiCtx", GetInstanceDataMultiCtx),
        DECLARE_NAPI_FUNCTION("getInstanceDataRuntime", GetInstanceDataRuntime),
        DECLARE_NAPI_FUNCTION("getInstanceDataWorker", GetInstanceDataWorker),
        DECLARE_NAPI_FUNCTION("addEnvCleanupHookStable", AddEnvCleanupHookStable),
        DECLARE_NAPI_FUNCTION("addEnvCleanupHookMultiThread", AddEnvCleanupHookMultiThread),
        DECLARE_NAPI_FUNCTION("addEnvCleanupHookMultiCtx", AddEnvCleanupHookMultiCtx),
        DECLARE_NAPI_FUNCTION("addEnvCleanupHookRuntime", AddEnvCleanupHookRuntime),
        DECLARE_NAPI_FUNCTION("addEnvCleanupHookWorker", AddEnvCleanupHookWorker),
        DECLARE_NAPI_FUNCTION("removeEnvCleanupHookRetVal", RemoveEnvCleanupHookRetVal),
        DECLARE_NAPI_FUNCTION("removeEnvCleanupHookStable", RemoveEnvCleanupHookStable),
        DECLARE_NAPI_FUNCTION("removeEnvCleanupHookMultiThread", RemoveEnvCleanupHookMultiThread),
        DECLARE_NAPI_FUNCTION("removeEnvCleanupHookMultiCtx", RemoveEnvCleanupHookMultiCtx),
        DECLARE_NAPI_FUNCTION("removeEnvCleanupHookRuntime", RemoveEnvCleanupHookRuntime),
        DECLARE_NAPI_FUNCTION("removeEnvCleanupHookWorker", RemoveEnvCleanupHookWorker),
        DECLARE_NAPI_FUNCTION("addAsyncCleanupHookStable", AddAsyncCleanupHookStable),
        DECLARE_NAPI_FUNCTION("addAsyncCleanupHookMultiThread", AddAsyncCleanupHookMultiThread),
        DECLARE_NAPI_FUNCTION("addAsyncCleanupHookMultiCtx", AddAsyncCleanupHookMultiCtx),
        DECLARE_NAPI_FUNCTION("addAsyncCleanupHookRuntime", AddAsyncCleanupHookRuntime),
        DECLARE_NAPI_FUNCTION("addAsyncCleanupHookWorker", AddAsyncCleanupHookWorker),
        DECLARE_NAPI_FUNCTION("removeAsyncCleanupHookRetVal", RemoveAsyncCleanupHookRetVal),
        DECLARE_NAPI_FUNCTION("removeAsyncCleanupHookStable", RemoveAsyncCleanupHookStable),
        DECLARE_NAPI_FUNCTION("removeAsyncCleanupHookMultiThread", RemoveAsyncCleanupHookMultiThread),
        DECLARE_NAPI_FUNCTION("removeAsyncCleanupHookMultiCtx", RemoveAsyncCleanupHookMultiCtx),
        DECLARE_NAPI_FUNCTION("removeAsyncCleanupHookRuntime", RemoveAsyncCleanupHookRuntime),
        DECLARE_NAPI_FUNCTION("removeAsyncCleanupHookWorker", RemoveAsyncCleanupHookWorker),
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
    .nm_modname = "napiCovEnvLifeCycle",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}