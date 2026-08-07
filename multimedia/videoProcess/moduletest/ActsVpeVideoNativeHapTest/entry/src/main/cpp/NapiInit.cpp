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

#include "include/ApiTest.h"
#include "include/CommonTool.h"
#include "napi/native_api.h"
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

static napi_value RunTestAsync(napi_env env, TestFunction func, const char* name)
{
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);
    AsyncTestContext* context = new AsyncTestContext{env, deferred, nullptr, func, -1};
    napi_value resourceName;
    napi_create_string_utf8(env, name, NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName,
        ExecuteTestAsync, CompleteTestAsync, context, &context->work);
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

static napi_value NapiTearDown(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    TearDown();
    napi_value result;
    napi_create_int32(env, SUCCESS_CODE, &result);
    return result;
}

static void InitPush1(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VpeVideoApiTest00100", VpeVideoApiTest00100));
    desc.push_back(XL("VpeVideoApiTest00200", VpeVideoApiTest00200));
    desc.push_back(XL("VpeVideoApiTest00300", VpeVideoApiTest00300));
    desc.push_back(XL("VpeVideoApiTest00400", VpeVideoApiTest00400));
    desc.push_back(XL("VpeVideoApiTest00500", VpeVideoApiTest00500));
    desc.push_back(XL("VpeVideoApiTest00600", VpeVideoApiTest00600));
    desc.push_back(XL("VpeVideoApiTest00700", VpeVideoApiTest00700));
    desc.push_back(XL("VpeVideoApiTest00800", VpeVideoApiTest00800));
    desc.push_back(XL("VpeVideoApiTest00900", VpeVideoApiTest00900));
    desc.push_back(XL("VpeVideoApiTest01000", VpeVideoApiTest01000));
    desc.push_back(XL("VpeVideoApiTest01100", VpeVideoApiTest01100));
    desc.push_back(XL("VpeVideoApiTest01200", VpeVideoApiTest01200));
    desc.push_back(XL("VpeVideoApiTest01300", VpeVideoApiTest01300));
    desc.push_back(XL("VpeVideoApiTest01400", VpeVideoApiTest01400));
    desc.push_back(XL("VpeVideoApiTest01500", VpeVideoApiTest01500));
    desc.push_back(XL("VpeVideoApiTest01600", VpeVideoApiTest01600));
    desc.push_back(XL("VpeVideoApiTest01700", VpeVideoApiTest01700));
    desc.push_back(XL("VpeVideoApiTest01800", VpeVideoApiTest01800));
    desc.push_back(XL("VpeVideoApiTest01900", VpeVideoApiTest01900));
    desc.push_back(XL("VpeVideoApiTest02000", VpeVideoApiTest02000));
    desc.push_back(XL("VpeVideoApiTest02100", VpeVideoApiTest02100));
}

static void InitPush2(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VpeVideoApiTest02200", VpeVideoApiTest02200));
    desc.push_back(XL("VpeVideoApiTest02300", VpeVideoApiTest02300));
    desc.push_back(XL("VpeVideoApiTest02400", VpeVideoApiTest02400));
    desc.push_back(XL("VpeVideoApiTest02500", VpeVideoApiTest02500));
    desc.push_back(XL("VpeVideoApiTest02600", VpeVideoApiTest02600));
    desc.push_back(XL("VpeVideoApiTest02700", VpeVideoApiTest02700));
    desc.push_back(XL("VpeVideoApiTest02800", VpeVideoApiTest02800));
    desc.push_back(XL("VpeVideoApiTest02900", VpeVideoApiTest02900));
    desc.push_back(XL("VpeVideoApiTest03000", VpeVideoApiTest03000));
    desc.push_back(XL("VpeVideoApiTest03100", VpeVideoApiTest03100));
    desc.push_back(XL("VpeVideoApiTest03200", VpeVideoApiTest03200));
    desc.push_back(XL("VpeVideoApiTest03300", VpeVideoApiTest03300));
    desc.push_back(XL("VpeVideoApiTest03400", VpeVideoApiTest03400));
    desc.push_back(XL("VpeVideoApiTest03500", VpeVideoApiTest03500));
    desc.push_back(XL("VpeVideoApiTest03600", VpeVideoApiTest03600));
    desc.push_back(XL("VpeVideoApiTest03700", VpeVideoApiTest03700));
    desc.push_back(XL("VpeVideoApiTest03800", VpeVideoApiTest03800));
    desc.push_back(XL("VpeVideoApiTest03900", VpeVideoApiTest03900));
    desc.push_back(XL("VpeVideoApiTest04000", VpeVideoApiTest04000));
    desc.push_back(XL("VpeVideoApiTest04100", VpeVideoApiTest04100));
}

static void InitPush3(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VpeVideoApiTest04200", VpeVideoApiTest04200));
    desc.push_back(XL("VpeVideoApiTest04300", VpeVideoApiTest04300));
    desc.push_back(XL("VpeVideoApiTest04400", VpeVideoApiTest04400));
    desc.push_back(XL("VpeVideoApiTest04500", VpeVideoApiTest04500));
    desc.push_back(XL("VpeVideoApiTest04600", VpeVideoApiTest04600));
    desc.push_back(XL("VpeVideoApiTest04700", VpeVideoApiTest04700));
    desc.push_back(XL("VpeVideoApiTest04800", VpeVideoApiTest04800));
    desc.push_back(XL("VpeVideoApiTest04900", VpeVideoApiTest04900));
    desc.push_back(XL("VpeVideoApiTest05000", VpeVideoApiTest05000));
    desc.push_back(XL("VpeVideoApiTest05100", VpeVideoApiTest05100));
    desc.push_back(XL("VpeVideoApiTest05200", VpeVideoApiTest05200));
    desc.push_back(XL("VpeVideoApiTest05300", VpeVideoApiTest05300));
    desc.push_back(XL("VpeVideoApiTest05400", VpeVideoApiTest05400));
    desc.push_back(XL("VpeVideoApiTest05500", VpeVideoApiTest05500));
    desc.push_back(XL("VpeVideoApiTest05600", VpeVideoApiTest05600));
    desc.push_back(XL("VpeVideoApiTest05700", VpeVideoApiTest05700));
    desc.push_back(XL("VpeVideoApiTest05800", VpeVideoApiTest05800));
    desc.push_back(XL("VpeVideoApiTest05900", VpeVideoApiTest05900));
    desc.push_back(XL("VpeVideoApiTest06000", VpeVideoApiTest06000));
    desc.push_back(XL("VpeVideoApiTest06100", VpeVideoApiTest06100));
    desc.push_back(XL("VpeVideoApiTest06200", VpeVideoApiTest06200));
    desc.push_back(XL("VpeVideoApiTest06300", VpeVideoApiTest06300));
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    desc.push_back({"TearDown", nullptr, NapiTearDown, nullptr, nullptr, nullptr, napi_default, nullptr});
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module g_vpeVideoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&g_vpeVideoModule);
}
