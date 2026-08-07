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
#include <iostream>
#include <vector>
#include <functional>
#include <cstring>

using TestFunction = std::function<int()>;

struct AsyncTestContext {
    napi_env env;
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

// 通用异步测试执行包装函数
static napi_value RunTestAsync(napi_env env, TestFunction func, const char* name)
{
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);
    AsyncTestContext* context = new AsyncTestContext{env, deferred, nullptr, func, -1};
    napi_value resourceName;
    napi_create_string_utf8(env, name, NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName, ExecuteTestAsync,
        CompleteTestAsync, context, &context->work);
    napi_queue_async_work(env, context->work);
    return promise;
}

EXTERN_C_START

struct Entry {
    napi_callback func;
    const char* name;
};

static napi_value AsyncWrapper(napi_env env, napi_callback_info info)
{
    void* data = nullptr;
    napi_get_cb_info(env, info, nullptr, nullptr, nullptr, &data);
    auto* entry = static_cast<Entry*>(data);
    napi_value ret = entry->func(env, info);
    int32_t val = -1;
    napi_get_value_int32(env, ret, &val);
    return RunTestAsync(env, [val]() { return val; }, entry->name);
}

static napi_property_descriptor XL(const char* functionName, napi_callback func)
{
    auto* entry = new Entry{func, functionName};
    return {functionName, nullptr, AsyncWrapper, nullptr, nullptr, nullptr,
            napi_default, entry};
}

static napi_value InitTests(napi_env env, napi_callback_info info)
{
    InitApiTest();
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static void InitPush1(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VpeImageApiTest00100", VpeImageApiTest00100));
    desc.push_back(XL("VpeImageApiTest00200", VpeImageApiTest00200));
    desc.push_back(XL("VpeImageApiTest00300", VpeImageApiTest00300));
    desc.push_back(XL("VpeImageApiTest00400", VpeImageApiTest00400));
    desc.push_back(XL("VpeImageApiTest00500", VpeImageApiTest00500));
    desc.push_back(XL("VpeImageApiTest00600", VpeImageApiTest00600));
    desc.push_back(XL("VpeImageApiTest00700", VpeImageApiTest00700));
    desc.push_back(XL("VpeImageApiTest00800", VpeImageApiTest00800));
    desc.push_back(XL("VpeImageApiTest00900", VpeImageApiTest00900));
    desc.push_back(XL("VpeImageApiTest01000", VpeImageApiTest01000));
    desc.push_back(XL("VpeImageApiTest01100", VpeImageApiTest01100));
    desc.push_back(XL("VpeImageApiTest01200", VpeImageApiTest01200));
    desc.push_back(XL("VpeImageApiTest01300", VpeImageApiTest01300));
    desc.push_back(XL("VpeImageApiTest01400", VpeImageApiTest01400));
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    desc.push_back({"initTests", nullptr, InitTests, nullptr, nullptr, nullptr,
                     napi_default, nullptr});
    InitPush1(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module imagetestModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "imagetest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&imagetestModule);
}
