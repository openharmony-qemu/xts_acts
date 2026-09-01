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
#include <atomic>
#include <pthread.h>

static napi_env g_mainEnv = nullptr;
static napi_env g_testEnv = nullptr;
static std::atomic<bool> g_testEnvReady{false};

static void *CreateSubEnvFunc(void *arg)
{
    napi_create_ark_runtime(&g_testEnv);
    g_testEnvReady.store(true, std::memory_order_release);
    return nullptr;
}

static napi_value CreateSubEnv(napi_env env, napi_callback_info info)
{
    if (!g_testEnvReady.load(std::memory_order_acquire)) {
        pthread_t tid;
        pthread_create(&tid, nullptr, CreateSubEnvFunc, nullptr);
        pthread_join(tid, nullptr);
    }
    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);

    int32_t value1;
    napi_get_value_int32(env, args[1], &value1);

    napi_value sum;
    const int cyclesNum = 200;
    for (int i = 0; i < cyclesNum; i++) {
        napi_create_double(g_testEnv, value0 + value1, &sum);
    }

    return sum;
}

static napi_value SaveMainEnv(napi_env env, napi_callback_info info)
{
    g_mainEnv = env;
    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value DestroyEnv(napi_env env, napi_callback_info info)
{
    if (g_testEnv != nullptr) {
        napi_destroy_ark_runtime(&g_testEnv);
        g_testEnv = nullptr;
    }
    g_testEnvReady.store(false, std::memory_order_release);
    g_mainEnv = nullptr;
    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"createSubEnv", nullptr, CreateSubEnv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"saveMainEnv", nullptr, SaveMainEnv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"destroyEnv", nullptr, DestroyEnv, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
