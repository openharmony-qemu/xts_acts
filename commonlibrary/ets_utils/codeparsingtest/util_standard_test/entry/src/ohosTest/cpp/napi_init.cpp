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

static napi_env g_mainEnv = nullptr;
static napi_env g_testEnv = nullptr;
static std::atomic<bool> g_testEnvReady{false};

static constexpr size_t ARGC_TWO = 2;

// Strong references created per napi_env, so the main VM and each worker VM keep
// independent reference stores. References are deleted from the end (stack order).
static std::mutex g_strongRefMutex;
static std::map<napi_env, std::vector<napi_strong_ref>> g_strongRefStore;

// Sendable strong references, only creatable on the main env. Keyed by napi_env so
// a call from a wrong env can never release references owned by another VM.
static std::mutex g_sendableRefMutex;
static std::map<napi_env, std::vector<napi_sendable_ref>> g_sendableRefStore;

// napi_ref instances created by napi_create_reference, stored per napi_env.
// refcount 0 entries are weak and must be turned strong by napi_reference_ref before use.
static std::mutex g_napiRefMutex;
static std::map<napi_env, std::vector<napi_ref>> g_napiRefStore;

// Wrap references returned by napi_wrap, kept only so a failed test can still
// clean up. napi_remove_wrap deletes the reference itself, entries are dropped then.
static std::mutex g_wrapRefMutex;
static std::map<napi_env, std::vector<napi_ref>> g_wrapRefStore;

// Deferreds of promises created by napi_create_promise, keyed by napi_env so a
// deferred can only be settled by the env that created it. Resolved on cleanup (never rejected).
static std::mutex g_deferredMutex;
static std::map<napi_env, std::vector<napi_deferred>> g_deferredStore;

// Threadsafe functions, keyed by napi_env so a function can only be acquired or
// released by the env that created it. Release(abort) finalizes them asynchronously
// on the JS event loop, so the vector is cleared right after release and never touched again.
static std::mutex g_tsfnMutex;
static std::map<napi_env, std::vector<napi_threadsafe_function>> g_tsfnStore;

static napi_value CreateStrongRefs(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1 || args[0] == nullptr) {
        napi_throw_error(env, nullptr, "CreateStrongRefs: count is required");
        return nullptr;
    }
    int32_t count = 0;
    if (napi_get_value_int32(env, args[0], &count) != napi_ok || count <= 0) {
        napi_throw_error(env, nullptr, "CreateStrongRefs: invalid count");
        return nullptr;
    }
    for (int32_t i = 0; i < count; i++) {
        napi_value obj = nullptr;
        if (napi_create_object(env, &obj) != napi_ok) {
            napi_throw_error(env, nullptr, "CreateStrongRefs: create object failed");
            return nullptr;
        }
        napi_strong_ref ref = nullptr;
        if (napi_create_strong_reference(env, obj, &ref) != napi_ok) {
            napi_throw_error(env, nullptr, "CreateStrongRefs: create strong ref failed");
            return nullptr;
        }
        std::lock_guard<std::mutex> lock(g_strongRefMutex);
        g_strongRefStore[env].push_back(ref);
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value DeleteStrongRefs(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1 || args[0] == nullptr) {
        napi_throw_error(env, nullptr, "DeleteStrongRefs: count is required");
        return nullptr;
    }
    int32_t count = 0;
    if (napi_get_value_int32(env, args[0], &count) != napi_ok || count <= 0) {
        napi_throw_error(env, nullptr, "DeleteStrongRefs: invalid count");
        return nullptr;
    }
    std::vector<napi_strong_ref> refsToDelete;
    {
        std::lock_guard<std::mutex> lock(g_strongRefMutex);
        auto it = g_strongRefStore.find(env);
        if (it == g_strongRefStore.end() || it->second.empty()) {
            napi_throw_error(env, nullptr, "DeleteStrongRefs: no refs stored for this env");
            return nullptr;
        }
        int32_t toDelete = std::min<int32_t>(count, static_cast<int32_t>(it->second.size()));
        for (int32_t i = 0; i < toDelete; i++) {
            refsToDelete.push_back(it->second.back());
            it->second.pop_back();
        }
    }
    for (napi_strong_ref ref : refsToDelete) {
        napi_delete_strong_reference(env, ref);
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value ClearStrongRefs(napi_env env, napi_callback_info info)
{
    std::vector<napi_strong_ref> refsToDelete;
    {
        std::lock_guard<std::mutex> lock(g_strongRefMutex);
        auto it = g_strongRefStore.find(env);
        if (it != g_strongRefStore.end()) {
            refsToDelete = std::move(it->second);
            g_strongRefStore.erase(it);
        }
    }
    for (napi_strong_ref ref : refsToDelete) {
        napi_delete_strong_reference(env, ref);
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value CreateStrongSendableRefs(napi_env env, napi_callback_info info)
{
    size_t argc = ARGC_TWO;
    napi_value args[ARGC_TWO] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < ARGC_TWO || args[0] == nullptr || args[1] == nullptr) {
        napi_throw_error(env, nullptr, "CreateStrongSendableRefs: value and count are required");
        return nullptr;
    }
    int32_t count = 0;
    if (napi_get_value_int32(env, args[1], &count) != napi_ok || count <= 0) {
        napi_throw_error(env, nullptr, "CreateStrongSendableRefs: invalid count");
        return nullptr;
    }
    for (int32_t i = 0; i < count; i++) {
        napi_sendable_ref ref = nullptr;
        if (napi_create_strong_sendable_reference(env, args[0], &ref) != napi_ok) {
            napi_throw_error(env, nullptr, "CreateStrongSendableRefs: create sendable ref failed");
            return nullptr;
        }
        std::lock_guard<std::mutex> lock(g_sendableRefMutex);
        g_sendableRefStore[env].push_back(ref);
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value ClearStrongSendableRefs(napi_env env, napi_callback_info info)
{
    std::vector<napi_sendable_ref> refsToDelete;
    {
        std::lock_guard<std::mutex> lock(g_sendableRefMutex);
        auto it = g_sendableRefStore.find(env);
        if (it != g_sendableRefStore.end()) {
            refsToDelete = std::move(it->second);
            g_sendableRefStore.erase(it);
        }
    }
    for (napi_sendable_ref ref : refsToDelete) {
        napi_delete_strong_sendable_reference(env, ref);
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
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

static napi_value RefNapiRefs(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1 || args[0] == nullptr) {
        napi_throw_error(env, nullptr, "RefNapiRefs: count is required");
        return nullptr;
    }
    int32_t count = 0;
    if (napi_get_value_int32(env, args[0], &count) != napi_ok || count <= 0) {
        napi_throw_error(env, nullptr, "RefNapiRefs: invalid count");
        return nullptr;
    }
    std::vector<napi_ref> refs = TakeNapiRefs(env, count, false);
    if (refs.empty()) {
        napi_throw_error(env, nullptr, "RefNapiRefs: no refs stored for this env");
        return nullptr;
    }
    for (napi_ref ref : refs) {
        uint32_t refcount = 0;
        if (napi_reference_ref(env, ref, &refcount) != napi_ok) {
            napi_throw_error(env, nullptr, "RefNapiRefs: reference ref failed");
            return nullptr;
        }
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value UnrefNapiRefs(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1 || args[0] == nullptr) {
        napi_throw_error(env, nullptr, "UnrefNapiRefs: count is required");
        return nullptr;
    }
    int32_t count = 0;
    if (napi_get_value_int32(env, args[0], &count) != napi_ok || count <= 0) {
        napi_throw_error(env, nullptr, "UnrefNapiRefs: invalid count");
        return nullptr;
    }
    std::vector<napi_ref> refs = TakeNapiRefs(env, count, false);
    if (refs.empty()) {
        napi_throw_error(env, nullptr, "UnrefNapiRefs: no refs stored for this env");
        return nullptr;
    }
    for (napi_ref ref : refs) {
        uint32_t refcount = 0;
        if (napi_reference_unref(env, ref, &refcount) != napi_ok) {
            napi_throw_error(env, nullptr, "UnrefNapiRefs: reference unref failed");
            return nullptr;
        }
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

static void NoopFinalize(napi_env env, void* data, void* hint)
{
    (void)env;
    (void)data;
    (void)hint;
}

static napi_value WrapObjects(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1 || args[0] == nullptr) {
        napi_throw_error(env, nullptr, "WrapObjects: objects array is required");
        return nullptr;
    }
    bool isArray = false;
    if (napi_is_array(env, args[0], &isArray) != napi_ok || !isArray) {
        napi_throw_error(env, nullptr, "WrapObjects: argument must be an array");
        return nullptr;
    }
    uint32_t length = 0;
    napi_get_array_length(env, args[0], &length);
    for (uint32_t i = 0; i < length; i++) {
        napi_value obj = nullptr;
        if (napi_get_element(env, args[0], i, &obj) != napi_ok || obj == nullptr) {
            napi_throw_error(env, nullptr, "WrapObjects: get element failed");
            return nullptr;
        }
        static int dummyNativeData = 0;
        napi_ref ref = nullptr;
        if (napi_wrap(env, obj, &dummyNativeData, NoopFinalize, nullptr, &ref) != napi_ok) {
            napi_throw_error(env, nullptr, "WrapObjects: napi_wrap failed");
            return nullptr;
        }
        std::lock_guard<std::mutex> lock(g_wrapRefMutex);
        g_wrapRefStore[env].push_back(ref);
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value RemoveWraps(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1 || args[0] == nullptr) {
        napi_throw_error(env, nullptr, "RemoveWraps: objects array is required");
        return nullptr;
    }
    bool isArray = false;
    if (napi_is_array(env, args[0], &isArray) != napi_ok || !isArray) {
        napi_throw_error(env, nullptr, "RemoveWraps: argument must be an array");
        return nullptr;
    }
    uint32_t length = 0;
    napi_get_array_length(env, args[0], &length);
    {
        std::lock_guard<std::mutex> lock(g_wrapRefMutex);
        auto it = g_wrapRefStore.find(env);
        if (it == g_wrapRefStore.end() || it->second.size() != length) {
            // The store maps refs by creation order only, so partial removal cannot be
            // tracked. Require the exact same full array that was passed to WrapObjects.
            napi_throw_error(env, nullptr,
                "RemoveWraps: requires the same full array of objects passed to WrapObjects");
            return nullptr;
        }
    }
    for (uint32_t i = 0; i < length; i++) {
        napi_value obj = nullptr;
        if (napi_get_element(env, args[0], i, &obj) != napi_ok || obj == nullptr) {
            napi_throw_error(env, nullptr, "RemoveWraps: get element failed");
            return nullptr;
        }
        void* nativeData = nullptr;
        if (napi_remove_wrap(env, obj, &nativeData) != napi_ok) {
            napi_throw_error(env, nullptr, "RemoveWraps: napi_remove_wrap failed");
            return nullptr;
        }
    }
    std::lock_guard<std::mutex> lock(g_wrapRefMutex);
    g_wrapRefStore.erase(env);
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value ClearWrapRefs(napi_env env, napi_callback_info info)
{
    std::vector<napi_ref> refs;
    {
        std::lock_guard<std::mutex> lock(g_wrapRefMutex);
        auto it = g_wrapRefStore.find(env);
        if (it != g_wrapRefStore.end()) {
            refs = std::move(it->second);
            g_wrapRefStore.erase(it);
        }
    }
    for (napi_ref ref : refs) {
        napi_delete_reference(env, ref);
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value CreatePromises(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1 || args[0] == nullptr) {
        napi_throw_error(env, nullptr, "CreatePromises: count is required");
        return nullptr;
    }
    int32_t count = 0;
    if (napi_get_value_int32(env, args[0], &count) != napi_ok || count <= 0) {
        napi_throw_error(env, nullptr, "CreatePromises: invalid count");
        return nullptr;
    }
    napi_value promiseArray = nullptr;
    if (napi_create_array(env, &promiseArray) != napi_ok) {
        napi_throw_error(env, nullptr, "CreatePromises: create array failed");
        return nullptr;
    }
    for (int32_t i = 0; i < count; i++) {
        napi_deferred deferred = nullptr;
        napi_value promise = nullptr;
        if (napi_create_promise(env, &deferred, &promise) != napi_ok) {
            napi_throw_error(env, nullptr, "CreatePromises: napi_create_promise failed");
            return nullptr;
        }
        if (napi_set_element(env, promiseArray, i, promise) != napi_ok) {
            napi_throw_error(env, nullptr, "CreatePromises: set element failed");
            return nullptr;
        }
        std::lock_guard<std::mutex> lock(g_deferredMutex);
        g_deferredStore[env].push_back(deferred);
    }
    return promiseArray;
}

static napi_value SettlePromises(napi_env env, napi_callback_info info)
{
    std::vector<napi_deferred> deferreds;
    {
        std::lock_guard<std::mutex> lock(g_deferredMutex);
        auto it = g_deferredStore.find(env);
        if (it != g_deferredStore.end()) {
            deferreds = std::move(it->second);
            g_deferredStore.erase(it);
        }
    }
    napi_value value = nullptr;
    napi_get_undefined(env, &value);
    bool resolveNext = true;
    for (napi_deferred deferred : deferreds) {
        if (resolveNext) {
            napi_resolve_deferred(env, deferred, value);
        } else {
            napi_reject_deferred(env, deferred, value);
        }
        resolveNext = !resolveNext;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value ClearDeferreds(napi_env env, napi_callback_info info)
{
    std::vector<napi_deferred> deferreds;
    {
        std::lock_guard<std::mutex> lock(g_deferredMutex);
        auto it = g_deferredStore.find(env);
        if (it != g_deferredStore.end()) {
            deferreds = std::move(it->second);
            g_deferredStore.erase(it);
        }
    }
    napi_value value = nullptr;
    napi_get_undefined(env, &value);
    for (napi_deferred deferred : deferreds) {
        napi_resolve_deferred(env, deferred, value);
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static void TsfnCallJs(napi_env env, napi_value jsCallback, void* context, void* data)
{
    (void)env;
    (void)jsCallback;
    (void)context;
    (void)data;
}

static void TsfnFinalize(napi_env env, void* data, void* hint)
{
    (void)env;
    (void)data;
    (void)hint;
}

static napi_value CreateThreadsafeFunctions(napi_env env, napi_callback_info info)
{
    size_t argc = ARGC_TWO;
    napi_value args[ARGC_TWO] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < ARGC_TWO || args[0] == nullptr || args[1] == nullptr) {
        napi_throw_error(env, nullptr, "CreateThreadsafeFunctions: callback and count are required");
        return nullptr;
    }
    int32_t count = 0;
    if (napi_get_value_int32(env, args[1], &count) != napi_ok || count <= 0) {
        napi_throw_error(env, nullptr, "CreateThreadsafeFunctions: invalid count");
        return nullptr;
    }
    {
        std::lock_guard<std::mutex> lock(g_tsfnMutex);
        auto it = g_tsfnStore.find(env);
        if (it != g_tsfnStore.end() && !it->second.empty()) {
            napi_throw_error(env, nullptr, "CreateThreadsafeFunctions: previous functions not released");
            return nullptr;
        }
    }
    napi_value resourceName = nullptr;
    if (napi_create_string_utf8(env, "GetGlobalHandleCountTsfn", NAPI_AUTO_LENGTH, &resourceName) != napi_ok) {
        napi_throw_error(env, nullptr, "CreateThreadsafeFunctions: create resource name failed");
        return nullptr;
    }
    for (int32_t i = 0; i < count; i++) {
        napi_threadsafe_function tsfn = nullptr;
        napi_status status = napi_create_threadsafe_function(env, args[0], nullptr, resourceName, 0, 1,
            nullptr, TsfnFinalize, nullptr, TsfnCallJs, &tsfn);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "CreateThreadsafeFunctions: create threadsafe function failed");
            return nullptr;
        }
        std::lock_guard<std::mutex> lock(g_tsfnMutex);
        g_tsfnStore[env].push_back(tsfn);
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value AcquireThreadsafeFunctions(napi_env env, napi_callback_info info)
{
    std::vector<napi_threadsafe_function> funcs;
    {
        std::lock_guard<std::mutex> lock(g_tsfnMutex);
        auto it = g_tsfnStore.find(env);
        if (it != g_tsfnStore.end()) {
            funcs = it->second;
        }
    }
    if (funcs.empty()) {
        napi_throw_error(env, nullptr, "AcquireThreadsafeFunctions: no threadsafe functions stored");
        return nullptr;
    }
    for (napi_threadsafe_function func : funcs) {
        if (napi_acquire_threadsafe_function(func) != napi_ok) {
            napi_throw_error(env, nullptr, "AcquireThreadsafeFunctions: acquire failed");
            return nullptr;
        }
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value ReleaseThreadsafeFunctions(napi_env env, napi_callback_info info)
{
    std::vector<napi_threadsafe_function> funcs;
    {
        std::lock_guard<std::mutex> lock(g_tsfnMutex);
        auto it = g_tsfnStore.find(env);
        if (it != g_tsfnStore.end()) {
            funcs = std::move(it->second);
            g_tsfnStore.erase(it);
        }
    }
    for (napi_threadsafe_function func : funcs) {
        napi_status status = napi_release_threadsafe_function(func, napi_tsfn_abort);
        if (status != napi_ok && status != napi_generic_failure) {
            napi_throw_error(env, nullptr, "ReleaseThreadsafeFunctions: release failed");
            return nullptr;
        }
    }
    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value GetCApiHandleCount(napi_env env, napi_callback_info info)
{
    size_t count = 0;
    napi_status status = napi_get_global_handle_count(env, &count);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "GetCApiHandleCount: failed to get count");
        return nullptr;
    }
    napi_value result = nullptr;
    napi_create_double(env, static_cast<double>(count), &result);
    return result;
}

static napi_value GetSubRuntimeHandleCount(napi_env env, napi_callback_info info)
{
    napi_env subEnv = nullptr;
    if (napi_create_ark_runtime(&subEnv) != napi_ok || subEnv == nullptr) {
        napi_throw_error(env, nullptr, "GetSubRuntimeHandleCount: create ark runtime failed");
        return nullptr;
    }
    size_t count = 0;
    napi_status status = napi_get_global_handle_count(subEnv, &count);
    napi_destroy_ark_runtime(&subEnv);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "GetSubRuntimeHandleCount: C API failed on sub runtime");
        return nullptr;
    }
    napi_value result = nullptr;
    napi_create_double(env, static_cast<double>(count), &result);
    return result;
}

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

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"createSubEnv", nullptr, CreateSubEnv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"saveMainEnv", nullptr, SaveMainEnv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"destroyEnv", nullptr, DestroyEnv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createStrongRefs", nullptr, CreateStrongRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteStrongRefs", nullptr, DeleteStrongRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearStrongRefs", nullptr, ClearStrongRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createStrongSendableRefs", nullptr, CreateStrongSendableRefs,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearStrongSendableRefs", nullptr, ClearStrongSendableRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createNapiRefs", nullptr, CreateNapiRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"refNapiRefs", nullptr, RefNapiRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unrefNapiRefs", nullptr, UnrefNapiRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteNapiRefs", nullptr, DeleteNapiRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearNapiRefs", nullptr, ClearNapiRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wrapObjects", nullptr, WrapObjects, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"removeWraps", nullptr, RemoveWraps, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearWrapRefs", nullptr, ClearWrapRefs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createPromises", nullptr, CreatePromises, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"settlePromises", nullptr, SettlePromises, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearDeferreds", nullptr, ClearDeferreds, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createThreadsafeFunctions", nullptr, CreateThreadsafeFunctions,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acquireThreadsafeFunctions", nullptr, AcquireThreadsafeFunctions,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseThreadsafeFunctions", nullptr, ReleaseThreadsafeFunctions,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCApiHandleCount", nullptr, GetCApiHandleCount,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getSubRuntimeHandleCount", nullptr, GetSubRuntimeHandleCount,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createTestRef", nullptr, CreateTestRef, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteTestRef", nullptr, DeleteTestRef, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createWeakTestRef", nullptr, CreateWeakTestRef, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteWeakTestRef", nullptr, DeleteWeakTestRef, nullptr, nullptr, nullptr, napi_default, nullptr},
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
