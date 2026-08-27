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
#include "include/ApiTest.h"
#include "include/FunctionTest.h"
#include "include/XComponentNotify.h"
#include <hilog/log.h>
#include <iostream>
#include <vector>
#include <functional>
#include <cstring>
#include <string>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <thread>
#include <cstdint>

constexpr unsigned int NAPI_LOG_DOMAIN = 0xFF02;
const char* const NAPI_LOG_TAG = "ActsAutoEffectNdkTest";

static napi_threadsafe_function g_tsfn = nullptr;

static std::mutex g_surfaceMutex;
static std::condition_variable g_surfaceCV;
static bool g_surfaceReady = false;

static napi_threadsafe_function g_tsfn2 = nullptr;
static std::mutex g_surfaceMutex2;
static std::condition_variable g_surfaceCV2;
static bool g_surfaceReady2 =false;

static int g_xcomponentCounter = 0;
static std::string g_currentXComponentName = "AutoEffectTest001";
static std::string g_currentXComponentName2 = "AutoEffectTest002";
static std::mutex g_nameMutex;

static void CallJsCallback(napi_env env, napi_value jsCb, void* context, void* data)
{
    if (jsCb == nullptr) {
        return;
    }
    napi_value readyValue = nullptr;
    napi_get_boolean(env, reinterpret_cast<intptr_t>(data) != 0, &readyValue);
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value unused = nullptr;
    napi_call_function(env, undefined, jsCb, 1, &readyValue, &unused);
}

using TestFunction = std::function<int()>;

struct AsyncTestContext {
    napi_deferred deferred;
    napi_async_work work;
    TestFunction func;
    int result;
};

static void ExecuteTestAsync(napi_env env, void* data)
{
    AsyncTestContext* context = static_cast<AsyncTestContext*>(data);
    context->result = -1;
    if (context->func) {
        context->result = context->func();
    }
}

static void CompleteTestAsync(napi_env env, napi_status status, void* data)
{
    AsyncTestContext* context = static_cast<AsyncTestContext*>(data);
    if (status != napi_ok) {
        napi_value error;
        napi_create_string_utf8(env, "Async test failed", NAPI_AUTO_LENGTH, &error);
        napi_reject_deferred(env, context->deferred, error);
    } else {
        napi_value result;
        napi_create_int32(env, context->result, &result);
        napi_resolve_deferred(env, context->deferred, result);
    }
    napi_delete_async_work(env, context->work);
    delete context;
}

static napi_value RunTestAsync(napi_env env, TestFunction func, const char* name)
{
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);
    AsyncTestContext* context = new AsyncTestContext{deferred, nullptr, func, -1};
    napi_value resourceName;
    napi_create_string_utf8(env, name, NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName, ExecuteTestAsync,
        CompleteTestAsync, context, &context->work);
    napi_queue_async_work(env, context->work);
    return promise;
}

EXTERN_C_START

struct Entry {
    int32_t (*func)();
    const char* name;
};

static napi_value AsyncWrapper(napi_env env, napi_callback_info info)
{
    void* data = nullptr;
    napi_get_cb_info(env, info, nullptr, nullptr, nullptr, &data);
    auto* entry = static_cast<Entry*>(data);
    auto func = entry->func;
    std::string name(entry->name);
    return RunTestAsync(env, [func, name]() { return func(); }, name.c_str());
}

static napi_property_descriptor XL(const char* functionName, int32_t (*func)())
{
    auto* entry = new Entry{func, functionName};
    return {functionName, nullptr, AsyncWrapper, nullptr, nullptr, nullptr,
            napi_default, entry};
}

static napi_value InitTests(napi_env env, napi_callback_info info)
{
    (void)info;
    InitApiTest();
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value SetXComponentReadyCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value arg = nullptr;
    napi_get_cb_info(env, info, &argc, &arg, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "callback expected");
        return nullptr;
    }
    napi_valuetype type = napi_undefined;
    napi_typeof(env, arg, &type);
    if (type != napi_function) {
        napi_throw_type_error(env, nullptr, "callback must be a function");
        return nullptr;
    }
    if (g_tsfn != nullptr) {
        napi_release_threadsafe_function(g_tsfn, napi_tsfn_release);
        g_tsfn = nullptr;
    }
    napi_value name;
    napi_create_string_utf8(env, "XComponentReadyCallback", NAPI_AUTO_LENGTH, &name);
    napi_create_threadsafe_function(env, arg, nullptr, name, 1, 1, nullptr,
                                     nullptr, nullptr, CallJsCallback, &g_tsfn);
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "SetXComponentReadyCallback tsfn created=%{public}d", g_tsfn != nullptr));
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

void NotifyXComponentReady(bool ready)
{
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "NotifyXComponentReady ready=%{public}d tsfnNull=%{public}d",
                        static_cast<int32_t>(ready), g_tsfn == nullptr));
    if (g_tsfn == nullptr) {
        return;
    }
    napi_call_threadsafe_function(g_tsfn, reinterpret_cast<void*>(ready ? 1 : 0),
                                  napi_tsfn_nonblocking);
}

void WaitForSurfaceReady(uint32_t timeoutMs)
{
    std::unique_lock<std::mutex> lock(g_surfaceMutex);
    if (g_surfaceReady) {
        return;
    }
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "WaitForSurfaceReady waiting timeout=%{public}u ms", timeoutMs));
    bool ready = g_surfaceCV.wait_for(lock, std::chrono::milliseconds(timeoutMs),
                                        [] { return g_surfaceReady; });
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "WaitForSurfaceReady done ready=%{public}d", ready));
}

napi_value NotifySurfaceReady(napi_env env, napi_callback_info info)
{
    (void)info;
    {
        std::lock_guard<std::mutex> lock(g_surfaceMutex);
        g_surfaceReady = true;
    }
    g_surfaceCV.notify_one();
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "NotifySurfaceReady signaled"));
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value SetXComponentReadyCallback2(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value arg = nullptr;
    napi_get_cb_info(env, info, &argc, &arg, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "callback expected");
        return nullptr;
    }
    napi_valuetype type = napi_undefined;
    napi_typeof(env, arg, &type);
    if (type != napi_function) {
        napi_throw_type_error(env, nullptr, "callback must be a function");
        return nullptr;
    }
    if (g_tsfn2 != nullptr) {
        napi_release_threadsafe_function(g_tsfn2, napi_tsfn_release);
        g_tsfn2 = nullptr;
    }
    napi_value name;
    napi_create_string_utf8(env, "XComponentReadyCallback2", NAPI_AUTO_LENGTH, &name);
    napi_create_threadsafe_function(env, arg, nullptr, name, 1, 1, nullptr,
                                     nullptr, nullptr, CallJsCallback, &g_tsfn2);
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "SetXComponentReadyCallback2 tsfn created=%{public}d", g_tsfn2 != nullptr));
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

void NotifyXComponentReady2(bool ready)
{
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "NotifyXComponentReady2 ready=%{public}d tsfnNull=%{public}d",
                        static_cast<int32_t>(ready), g_tsfn2 == nullptr));
    if (g_tsfn2 == nullptr) {
        return;
    }
    napi_call_threadsafe_function(g_tsfn2, reinterpret_cast<void*>(ready ? 1 : 0),
                                  napi_tsfn_nonblocking);
}

void WaitForSurfaceReady2(uint32_t timeoutMs)
{
    std::unique_lock<std::mutex> lock(g_surfaceMutex2);
    if (g_surfaceReady2) {
        return;
    }
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "WaitForSurfaceReady2 waiting timeout=%{public}u ms", timeoutMs));
    bool ready = g_surfaceCV2.wait_for(lock, std::chrono::milliseconds(timeoutMs),
                                        [] { return g_surfaceReady2; });
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "WaitForSurfaceReady2 done ready=%{public}d", ready));
}

napi_value NotifySurfaceReady2(napi_env env, napi_callback_info info)
{
    (void)info;
    {
        std::lock_guard<std::mutex> lock(g_surfaceMutex2);
        g_surfaceReady2 = true;
    }
    g_surfaceCV2.notify_one();
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "NotifySurfaceReady2 signaled"));
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

void SetCurrentXComponentName(const char* name)
{
    std::lock_guard<std::mutex> lock(g_nameMutex);
    g_currentXComponentName = name ? name : "";
}

void SetCurrentXComponentName2(const char* name)
{
    std::lock_guard<std::mutex> lock(g_nameMutex);
    g_currentXComponentName2 = name ? name : "";
}

napi_value GetCurrentXComponentName(napi_env env, napi_callback_info info)
{
    (void)info;
    std::lock_guard<std::mutex> lock(g_nameMutex);
    napi_value result;
    napi_create_string_utf8(env, g_currentXComponentName.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

napi_value GetCurrentXComponentName2(napi_env env, napi_callback_info info)
{
    (void)info;
    std::lock_guard<std::mutex> lock(g_nameMutex);
    napi_value result;
    napi_create_string_utf8(env, g_currentXComponentName2.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

const char* GenerateXComponentName()
{
    g_xcomponentCounter++;
    std::lock_guard<std::mutex> lock(g_nameMutex);
    g_currentXComponentName = "AutoEffectTest_" + std::to_string(g_xcomponentCounter);
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "GenerateXComponentName name=%{public}s", g_currentXComponentName.c_str()));
    return g_currentXComponentName.c_str();
}

const char* GenerateXComponentName2()
{
    g_xcomponentCounter++;
    std::lock_guard<std::mutex> lock(g_nameMutex);
    g_currentXComponentName2 = "AutoEffectTest_" + std::to_string(g_xcomponentCounter);
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "GenerateXComponentName2 name=%{public}s", g_currentXComponentName2.c_str()));
    return g_currentXComponentName2.c_str();
}

void PrepareXComponent()
{
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "PrepareXComponent name=%{public}s", g_currentXComponentName.c_str()));
    {
        std::lock_guard<std::mutex> lock(g_surfaceMutex);
        g_surfaceReady = false;
    }
    NotifyXComponentReady(false);
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    NotifyXComponentReady(true);
    WaitForSurfaceReady(5000);
}

void PrepareXComponent2()
{
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, NAPI_LOG_DOMAIN, NAPI_LOG_TAG,
                        "PrepareXComponent2 name=%{public}s", g_currentXComponentName2.c_str()));
    {
        std::lock_guard<std::mutex> lock(g_surfaceMutex2);
        g_surfaceReady2 = false;
    }
    NotifyXComponentReady2(false);
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    NotifyXComponentReady2(true);
    WaitForSurfaceReady2(5000);
}

static void InitPush1(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AutoEffectApiTest00100", AutoEffectApiTest00100));
    desc.push_back(XL("AutoEffectApiTest00200", AutoEffectApiTest00200));
    desc.push_back(XL("AutoEffectApiTest00300", AutoEffectApiTest00300));
    desc.push_back(XL("AutoEffectApiTest00400", AutoEffectApiTest00400));
    desc.push_back(XL("AutoEffectApiTest00500", AutoEffectApiTest00500));
    desc.push_back(XL("AutoEffectApiTest00600", AutoEffectApiTest00600));
    desc.push_back(XL("AutoEffectApiTest00700", AutoEffectApiTest00700));
    desc.push_back(XL("AutoEffectApiTest00800", AutoEffectApiTest00800));
    desc.push_back(XL("AutoEffectApiTest00900", AutoEffectApiTest00900));
    desc.push_back(XL("AutoEffectApiTest01000", AutoEffectApiTest01000));
    desc.push_back(XL("AutoEffectApiTest01100", AutoEffectApiTest01100));
    desc.push_back(XL("AutoEffectApiTest01200", AutoEffectApiTest01200));
    desc.push_back(XL("AutoEffectApiTest01300", AutoEffectApiTest01300));
    desc.push_back(XL("AutoEffectApiTest01400", AutoEffectApiTest01400));
    desc.push_back(XL("AutoEffectApiTest01500", AutoEffectApiTest01500));
    desc.push_back(XL("AutoEffectApiTest01600", AutoEffectApiTest01600));
    desc.push_back(XL("AutoEffectApiTest01700", AutoEffectApiTest01700));
    desc.push_back(XL("AutoEffectApiTest01800", AutoEffectApiTest01800));
    desc.push_back(XL("AutoEffectApiTest01900", AutoEffectApiTest01900));
    desc.push_back(XL("AutoEffectApiTest02000", AutoEffectApiTest02000));
    desc.push_back(XL("AutoEffectApiTest02100", AutoEffectApiTest02100));
    desc.push_back(XL("AutoEffectApiTest02200", AutoEffectApiTest02200));
    desc.push_back(XL("AutoEffectApiTest02300", AutoEffectApiTest02300));
    desc.push_back(XL("AutoEffectApiTest02500", AutoEffectApiTest02500));
    desc.push_back(XL("AutoEffectApiTest02600", AutoEffectApiTest02600));
    desc.push_back(XL("AutoEffectApiTest02700", AutoEffectApiTest02700));
    desc.push_back(XL("AutoEffectApiTest02900", AutoEffectApiTest02900));
    desc.push_back(XL("AutoEffectApiTest03000", AutoEffectApiTest03000));
    desc.push_back(XL("AutoEffectFuncTest00100", AutoEffectFuncTest00100));
    desc.push_back(XL("AutoEffectFuncTest00200", AutoEffectFuncTest00200));
    desc.push_back(XL("AutoEffectFuncTest00300", AutoEffectFuncTest00300));
    desc.push_back(XL("AutoEffectFuncTest00400", AutoEffectFuncTest00400));
    desc.push_back(XL("AutoEffectFuncTest00500", AutoEffectFuncTest00500));
    desc.push_back(XL("AutoEffectFuncTest00600", AutoEffectFuncTest00600));
    desc.push_back(XL("AutoEffectFuncTest00700", AutoEffectFuncTest00700));
    desc.push_back(XL("AutoEffectFuncTest00800", AutoEffectFuncTest00800));
    desc.push_back(XL("AutoEffectFuncTest00900", AutoEffectFuncTest00900));
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    desc.push_back({"initTests", nullptr, InitTests, nullptr, nullptr, nullptr,
                     napi_default, nullptr});
    desc.push_back({"GetXComponentNameId", nullptr, GetXComponentNameId, nullptr, nullptr, nullptr,
                     napi_default, nullptr});
    desc.push_back({"setReadyCallback", nullptr, SetXComponentReadyCallback, nullptr, nullptr, nullptr,
                     napi_default, nullptr});
    desc.push_back({"notifySurfaceReady", nullptr, NotifySurfaceReady, nullptr, nullptr, nullptr,
                     napi_default, nullptr});
    desc.push_back({"GetXComponentNameId2", nullptr, GetXComponentNameId2, nullptr, nullptr, nullptr,
                     napi_default, nullptr});
    desc.push_back({"setReadyCallback2", nullptr, SetXComponentReadyCallback2, nullptr, nullptr, nullptr,
                     napi_default, nullptr});
    desc.push_back({"notifySurfaceReady2", nullptr, NotifySurfaceReady2, nullptr, nullptr, nullptr,
                     napi_default, nullptr});
    desc.push_back({"GetCurrentXComponentName", nullptr, GetCurrentXComponentName, nullptr, nullptr, nullptr,
                     napi_default, nullptr});
    desc.push_back({"GetCurrentXComponentName2", nullptr, GetCurrentXComponentName2, nullptr, nullptr, nullptr,
                     napi_default, nullptr});
    InitPush1(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module autoeffecttestModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "autoeffecttest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&autoeffecttestModule);
}
