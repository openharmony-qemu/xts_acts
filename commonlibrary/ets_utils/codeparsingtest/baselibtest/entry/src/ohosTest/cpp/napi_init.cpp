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
#include <algorithm>
#include <atomic>
#include <cstdint>
#include <map>
#include <mutex>
#include <pthread.h>
#include <sstream>
#include <string>
#include <vector>

static constexpr size_t ARGC_TWO = 2;

static napi_env g_mainEnv = nullptr;
static napi_env g_testEnv = nullptr;
static std::atomic<bool> g_testEnvReady{false};

static std::mutex g_napiRefMutex;
static std::map<napi_env, std::vector<napi_ref>> g_napiRefStore;

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

static napi_ref g_trackTestRef = nullptr;
static napi_ref g_trackWeakTestRef = nullptr;

static napi_value CreateTestRef(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
        napi_value undefined;
        napi_get_undefined(env, &undefined);
        return undefined;
    }

    if (g_trackTestRef != nullptr) {
        napi_delete_reference(env, g_trackTestRef);
        g_trackTestRef = nullptr;
    }

    status = napi_create_reference(env, args[0], 1, &g_trackTestRef);
    if (status != napi_ok) {
        napi_value undefined;
        napi_get_undefined(env, &undefined);
        return undefined;
    }

    std::ostringstream addrStream;
    addrStream << "0x" << std::hex << static_cast<unsigned long>(reinterpret_cast<uintptr_t>(g_trackTestRef));
    std::string addrStr = addrStream.str();

    napi_value result;
    status = napi_create_string_utf8(env, addrStr.c_str(), NAPI_AUTO_LENGTH, &result);
    if (status != napi_ok) {
        napi_value undefined;
        napi_get_undefined(env, &undefined);
        return undefined;
    }
    return result;
}

static napi_value DeleteTestRef(napi_env env, napi_callback_info info)
{
    if (g_trackTestRef != nullptr) {
        napi_delete_reference(env, g_trackTestRef);
        g_trackTestRef = nullptr;
    }
    napi_value undefined;
    napi_get_undefined(env, &undefined);
    return undefined;
}

static napi_value CreateWeakTestRef(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
        napi_value undefined;
        napi_get_undefined(env, &undefined);
        return undefined;
    }

    if (g_trackWeakTestRef != nullptr) {
        napi_delete_reference(env, g_trackWeakTestRef);
        g_trackWeakTestRef = nullptr;
    }

    status = napi_create_reference(env, args[0], 0, &g_trackWeakTestRef);
    if (status != napi_ok) {
        napi_value undefined;
        napi_get_undefined(env, &undefined);
        return undefined;
    }

    std::ostringstream addrStream;
    addrStream << "0x" << std::hex << static_cast<unsigned long>(reinterpret_cast<uintptr_t>(g_trackWeakTestRef));
    std::string addrStr = addrStream.str();

    napi_value result;
    status = napi_create_string_utf8(env, addrStr.c_str(), NAPI_AUTO_LENGTH, &result);
    if (status != napi_ok) {
        napi_value undefined;
        napi_get_undefined(env, &undefined);
        return undefined;
    }
    return result;
}

static napi_value DeleteWeakTestRef(napi_env env, napi_callback_info info)
{
    if (g_trackWeakTestRef != nullptr) {
        napi_delete_reference(env, g_trackWeakTestRef);
        g_trackWeakTestRef = nullptr;
    }
    napi_value undefined;
    napi_get_undefined(env, &undefined);
    return undefined;
}

static std::vector<napi_ref> TakeNapiRefs(napi_env env, int32_t count, bool remove)
{
    std::vector<napi_ref> refs;
    std::lock_guard<std::mutex> lock(g_napiRefMutex);
    auto it = g_napiRefStore.find(env);
    if (it == g_napiRefStore.end()) {
        return refs;
    }
    int32_t toTake = std::min<int32_t>(count, static_cast<int32_t>(it->second.size()));
    for (int32_t i = 0; i < toTake; i++) {
        refs.push_back(it->second[it->second.size() - toTake + i]);
    }
    if (remove) {
        it->second.resize(it->second.size() - toTake);
    }
    return refs;
}

static napi_value CreateNapiRefs(napi_env env, napi_callback_info info)
{
    size_t argc = ARGC_TWO;
    napi_value args[ARGC_TWO] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < ARGC_TWO || args[0] == nullptr || args[1] == nullptr) {
        napi_throw_error(env, nullptr, "CreateNapiRefs: count and refcount are required");
        return nullptr;
    }
    int32_t count = 0;
    uint32_t refcount = 0;
    if (napi_get_value_int32(env, args[0], &count) != napi_ok || count <= 0 ||
        napi_get_value_uint32(env, args[1], &refcount) != napi_ok) {
        napi_throw_error(env, nullptr, "CreateNapiRefs: invalid arguments");
        return nullptr;
    }
    for (int32_t i = 0; i < count; i++) {
        napi_value obj = nullptr;
        if (napi_create_object(env, &obj) != napi_ok) {
            napi_throw_error(env, nullptr, "CreateNapiRefs: create object failed");
            return nullptr;
        }
        napi_ref ref = nullptr;
        if (napi_create_reference(env, obj, refcount, &ref) != napi_ok) {
            napi_throw_error(env, nullptr, "CreateNapiRefs: create reference failed");
            return nullptr;
        }
        std::lock_guard<std::mutex> lock(g_napiRefMutex);
        g_napiRefStore[env].push_back(ref);
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value DeleteNapiRefs(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1 || args[0] == nullptr) {
        napi_throw_error(env, nullptr, "DeleteNapiRefs: count is required");
        return nullptr;
    }
    int32_t count = 0;
    if (napi_get_value_int32(env, args[0], &count) != napi_ok || count <= 0) {
        napi_throw_error(env, nullptr, "DeleteNapiRefs: invalid count");
        return nullptr;
    }
    std::vector<napi_ref> refs = TakeNapiRefs(env, count, true);
    if (refs.empty()) {
        napi_throw_error(env, nullptr, "DeleteNapiRefs: no refs stored for this env");
        return nullptr;
    }
    for (napi_ref ref : refs) {
        napi_delete_reference(env, ref);
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value ClearNapiRefs(napi_env env, napi_callback_info info)
{
    std::vector<napi_ref> refs;
    {
        std::lock_guard<std::mutex> lock(g_napiRefMutex);
        auto it = g_napiRefStore.find(env);
        if (it != g_napiRefStore.end()) {
            refs = std::move(it->second);
            g_napiRefStore.erase(it);
        }
    }
    for (napi_ref ref : refs) {
        napi_delete_reference(env, ref);
    }
    napi_value result = nullptr;
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
        {"createTestRef", nullptr, CreateTestRef, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteTestRef", nullptr, DeleteTestRef, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createWeakTestRef", nullptr, CreateWeakTestRef, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteWeakTestRef", nullptr, DeleteWeakTestRef, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createNapiRefs", nullptr, CreateNapiRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteNapiRefs", nullptr, DeleteNapiRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearNapiRefs", nullptr, ClearNapiRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
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
