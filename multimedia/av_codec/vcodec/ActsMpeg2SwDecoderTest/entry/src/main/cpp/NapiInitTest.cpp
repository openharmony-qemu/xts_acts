/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <iostream>
#include <vector>
#include <functional>
#include <cstring>
#include "napi/native_api.h"
#include "include/FuncTest.h"

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
    (void)env;
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

static void InitPush1(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoDecodeSyncSwMpeg2Func00100Test", VideoDecodeSyncSwMpeg2Func00100Test));
    desc.push_back(XL("VideoDecodeSyncSwMpeg2Func00200Test", VideoDecodeSyncSwMpeg2Func00200Test));
    desc.push_back(XL("VideoDecodeSyncSwMpeg2Func00400Test", VideoDecodeSyncSwMpeg2Func00400Test));
    desc.push_back(XL("VideoDecodeBlankFrame00100Test", VideoDecodeBlankFrame00100Test));
    desc.push_back(XL("VideoDecodeBlankAdd00100Test", VideoDecodeBlankAdd00100Test));
}

static napi_value InitTests(napi_env env, napi_callback_info info)
{
    (void)info;
    InitMpeg2Test();
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    desc.push_back(XL("initTests", InitTests));
    InitPush1(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module mpeg2swdecoderModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "mpeg2swdecoder_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&mpeg2swdecoderModule);
}
