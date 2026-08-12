/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include "include/ActsApiTest.h"
#include "include/ActsFuncTest.h"
#include "include/ActsStateTest.h"

using TestFunction = int (*)();

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
        napi_create_string_utf8(env, "Async test failed",
            NAPI_AUTO_LENGTH, &error);
        napi_reject_deferred(env, context->deferred, error);
    } else {
        napi_value result;
        napi_create_int32(env, context->result, &result);
        napi_resolve_deferred(env, context->deferred, result);
    }
    napi_delete_async_work(env, context->work);
    delete context;
}

static napi_value RunTestAsync(napi_env env, TestFunction func,
                               const char* name)
{
    napi_value promise;
    napi_deferred deferred;
    if (napi_create_promise(env, &deferred, &promise) != napi_ok) {
        return nullptr;
    }
    AsyncTestContext* context = new AsyncTestContext{
        deferred, nullptr, func, -1};
    napi_value resourceName;
    napi_create_string_utf8(env, name, NAPI_AUTO_LENGTH,
        &resourceName);
    if (napi_create_async_work(env, nullptr, resourceName,
        ExecuteTestAsync, CompleteTestAsync, context,
        &context->work) != napi_ok) {
        napi_value err;
        napi_create_int32(env, -1, &err);
        napi_reject_deferred(env, deferred, err);
        delete context;
        return promise;
    }
    if (napi_queue_async_work(env, context->work) != napi_ok) {
        napi_delete_async_work(env, context->work);
        napi_value err;
        napi_create_int32(env, -1, &err);
        napi_reject_deferred(env, deferred, err);
        delete context;
        return promise;
    }
    return promise;
}

struct Entry {
    TestFunction func;
    const char* name;
};

static Entry g_entries[200];
static int g_entryCount = 0;

static napi_value AsyncWrapper(napi_env env, napi_callback_info info)
{
    void* data = nullptr;
    napi_get_cb_info(env, info, nullptr, nullptr, nullptr, &data);
    auto* entry = static_cast<Entry*>(data);
    return RunTestAsync(env, entry->func, entry->name);
}

static napi_property_descriptor XL(const char* name, TestFunction func)
{
    Entry* entry = &g_entries[g_entryCount++];
    entry->func = func;
    entry->name = name;
    return {name, nullptr, AsyncWrapper, nullptr, nullptr,
        nullptr, napi_default, entry};
}

static napi_value InitTests(napi_env env, napi_callback_info info)
{
    InitActsApiTest();
    InitActsFuncTest();
    InitActsStateTest();
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static void RegisterChunk1(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        XL("VideoSwdecIllegalPara0100", VideoSwdecIllegalPara0100),
        XL("VideoSwdecIllegalPara0200", VideoSwdecIllegalPara0200),
        XL("VideoSwdecIllegalPara3300", VideoSwdecIllegalPara3300),
        XL("VideoSwdecIllegalPara1800", VideoSwdecIllegalPara1800),
        XL("VideoSwdecIllegalPara0300", VideoSwdecIllegalPara0300),
        XL("VideoSwdecIllegalPara0400", VideoSwdecIllegalPara0400),
        XL("VideoSwdecIllegalPara0500", VideoSwdecIllegalPara0500),
        XL("VideoSwdecIllegalPara1400", VideoSwdecIllegalPara1400),
        XL("VideoSwdecIllegalPara5000", VideoSwdecIllegalPara5000),
        XL("VideoSwdecIllegalPara5100", VideoSwdecIllegalPara5100),
        XL("VideoSwdecIllegalPara0600", VideoSwdecIllegalPara0600),
        XL("VideoSwdecIllegalPara0700", VideoSwdecIllegalPara0700),
        XL("VideoSwdecIllegalPara0800", VideoSwdecIllegalPara0800),
        XL("VideoSwdecIllegalPara0900", VideoSwdecIllegalPara0900),
        XL("VideoSwdecIllegalPara1000", VideoSwdecIllegalPara1000),
        XL("VideoSwdecIllegalPara1100", VideoSwdecIllegalPara1100),
        XL("VideoSwdecIllegalPara4100", VideoSwdecIllegalPara4100),
        XL("VideoSwdecIllegalPara1500", VideoSwdecIllegalPara1500),
        XL("VideoSwdecIllegalPara1200", VideoSwdecIllegalPara1200),
        XL("VideoSwdecIllegalPara1600", VideoSwdecIllegalPara1600),
        XL("VideoSwdecIllegalPara1700", VideoSwdecIllegalPara1700),
        XL("VideoSwdecIllegalPara2200", VideoSwdecIllegalPara2200),
        XL("VideoSwdecIllegalPara2500", VideoSwdecIllegalPara2500),
        XL("VideoSwdecIllegalPara2600", VideoSwdecIllegalPara2600),
        XL("VideoSwdecIllegalPara2700", VideoSwdecIllegalPara2700),
        XL("VideoSwdecIllegalPara2800", VideoSwdecIllegalPara2800),
        XL("VideoSwdecIllegalPara2900", VideoSwdecIllegalPara2900),
        XL("VideoSwdecIllegalPara3000", VideoSwdecIllegalPara3000),
        XL("VideoSwdecIllegalPara3100", VideoSwdecIllegalPara3100),
        XL("VideoSwdecIllegalPara3200", VideoSwdecIllegalPara3200),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterChunk2(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        XL("VideoSwdecApi0100", VideoSwdecApi0100),
        XL("VideoSwdecApi0200", VideoSwdecApi0200),
        XL("VideoSwdecApi0300", VideoSwdecApi0300),
        XL("VideoSwdecApi0400", VideoSwdecApi0400),
        XL("VideoSwdecApi0500", VideoSwdecApi0500),
        XL("VideoSwdecApi0600", VideoSwdecApi0600),
        XL("VideoSwdecApi0700", VideoSwdecApi0700),
        XL("VideoSwdecApi0800", VideoSwdecApi0800),
        XL("VideoSwdecApi0900", VideoSwdecApi0900),
        XL("VideoSwdecApi1000", VideoSwdecApi1000),
        XL("VideoSwdecApi1100", VideoSwdecApi1100),
        XL("VideoSwdecApi1200", VideoSwdecApi1200),
        XL("VideoMpeg2SwdecIllegalPara0700", VideoMpeg2SwdecIllegalPara0700),
        XL("VideoMpeg4SwdecIllegalPara0700", VideoMpeg4SwdecIllegalPara0700),
        XL("VideoH263SwdecIllegalPara0700", VideoH263SwdecIllegalPara0700),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterChunk3(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        XL("VideoSwdecCapApi0100", VideoSwdecCapApi0100),
        XL("VideoSwdecCapApi0300", VideoSwdecCapApi0300),
        XL("VideoSwdecCapApi0400", VideoSwdecCapApi0400),
        XL("VideoSwdecCapApi0500", VideoSwdecCapApi0500),
        XL("VideoSwdecCapApi0600", VideoSwdecCapApi0600),
        XL("VideoSwdecCapApi0700", VideoSwdecCapApi0700),
        XL("VideoSwdecCapApi0800", VideoSwdecCapApi0800),
        XL("VideoSwdecCapApi0900", VideoSwdecCapApi0900),
        XL("VideoSwdecCapApi1000", VideoSwdecCapApi1000),
        XL("VideoSwdecCapApi3100", VideoSwdecCapApi3100),
        XL("VideoSwdecCapApi3200", VideoSwdecCapApi3200),
        XL("VideoSwdecCapApi3300", VideoSwdecCapApi3300),
        XL("VideoSwdecCapApi3400", VideoSwdecCapApi3400),
        XL("VideoSwdecCapApi3500", VideoSwdecCapApi3500),
        XL("VideoSwdecCapApi3600", VideoSwdecCapApi3600),
        XL("VideoSwdecCapApi3700", VideoSwdecCapApi3700),
        XL("VideoSwdecCapApi3800", VideoSwdecCapApi3800),
        XL("VideoSwdecCapApi3900", VideoSwdecCapApi3900),
        XL("VideoSwdecCapApi4000", VideoSwdecCapApi4000),
        XL("VideoSwdecCapApi4100", VideoSwdecCapApi4100),
        XL("VideoSwdecCapApi4200", VideoSwdecCapApi4200),
        XL("VideoSwdecCapApi4300", VideoSwdecCapApi4300),
        XL("VideoSwdecCapApi4400", VideoSwdecCapApi4400),
        XL("VideoSwdecCapApi4500", VideoSwdecCapApi4500),
        XL("VideoSwdecCapApi4600", VideoSwdecCapApi4600),
        XL("VideoSwdecCapApi4700", VideoSwdecCapApi4700),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterChunk4(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        XL("VideoSwdecCapApi4800", VideoSwdecCapApi4800),
        XL("VideoSwdecCapApi4900", VideoSwdecCapApi4900),
        XL("VideoSwdecCapApi5000", VideoSwdecCapApi5000),
        XL("VideoSwdecCapApi5100", VideoSwdecCapApi5100),
        XL("VideoSwdecCapApi5200", VideoSwdecCapApi5200),
        XL("VideoSwdecCapApi5300", VideoSwdecCapApi5300),
        XL("VideoSwdecCapApi9400", VideoSwdecCapApi9400),
        XL("VideoSwdecCapApi5400", VideoSwdecCapApi5400),
        XL("VideoSwdecCapApi5500", VideoSwdecCapApi5500),
        XL("VideoSwdecCapApi5600", VideoSwdecCapApi5600),
        XL("VideoSwdecCapApi5700", VideoSwdecCapApi5700),
        XL("VideoSwdecCapApi5800", VideoSwdecCapApi5800),
        XL("VideoSwdecCapApi5900", VideoSwdecCapApi5900),
        XL("VideoSwdecCapApi6000", VideoSwdecCapApi6000),
        XL("VideoSwdecCapApi6100", VideoSwdecCapApi6100),
        XL("VideoSwdecCapApi6200", VideoSwdecCapApi6200),
        XL("VideoSwdecCapApi6300", VideoSwdecCapApi6300),
        XL("VideoSwdecCapApi6400", VideoSwdecCapApi6400),
        XL("VideoSwdecCapApi6500", VideoSwdecCapApi6500),
        XL("VideoSwdecCapApi6600", VideoSwdecCapApi6600),
        XL("VideoSwdecCapApi6700", VideoSwdecCapApi6700),
        XL("VideoSwdecCapApi6800", VideoSwdecCapApi6800),
        XL("VideoSwdecCapApi6900", VideoSwdecCapApi6900),
        XL("VideoSwdecCapApi7000", VideoSwdecCapApi7000),
        XL("VideoSwdecCapApi7100", VideoSwdecCapApi7100),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterChunk5(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        XL("VideoSwdecFunction0200", VideoSwdecFunction0200),
        XL("VideoSwdecFunction0300", VideoSwdecFunction0300),
        XL("VideoSwdecFunction0400", VideoSwdecFunction0400),
        XL("VideoSwdecFunction0700", VideoSwdecFunction0700),
        XL("VideoSwdecFunction0800", VideoSwdecFunction0800),
        XL("VideoSwdecFunction4000", VideoSwdecFunction4000),
        XL("VideoSwdecFunction1000", VideoSwdecFunction1000),
        XL("VideoSwdecFunction1100", VideoSwdecFunction1100),
        XL("VideoSwdecFunction1200", VideoSwdecFunction1200),
        XL("VideoSwdecFunction1300", VideoSwdecFunction1300),
        XL("VideoSwdecFunction1400", VideoSwdecFunction1400),
        XL("VideoSwdecFunction1500", VideoSwdecFunction1500),
        XL("VideoSwdecFunction1600", VideoSwdecFunction1600),
        XL("VideoDecodeSyncSw264Func0010", VideoDecodeSyncSw264Func0010),
        XL("VideoDecodeSyncSw264Func0020", VideoDecodeSyncSw264Func0020),
        XL("VideoDecodeSyncSw264Func0040", VideoDecodeSyncSw264Func0040),
        XL("VideoSwdecodeBlankFrame0010", VideoSwdecodeBlankFrame0010),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterChunk6(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        XL("VideoSwdecState0100", VideoSwdecState0100),
        XL("VideoSwdecState0101", VideoSwdecState0101),
        XL("VideoSwdecState0200", VideoSwdecState0200),
        XL("VideoSwdecState0300", VideoSwdecState0300),
        XL("VideoSwdecState0400", VideoSwdecState0400),
        XL("VideoSwdecState0500", VideoSwdecState0500),
        XL("VideoSwdecState0600", VideoSwdecState0600),
        XL("VideoSwdecState0700", VideoSwdecState0700),
        XL("VideoSwdecState0800", VideoSwdecState0800),
        XL("VideoSwdecState0900", VideoSwdecState0900),
        XL("VideoSwdecState1000", VideoSwdecState1000),
        XL("VideoSwdecState1100", VideoSwdecState1100),
        XL("VideoSwdecState1200", VideoSwdecState1200),
        XL("VideoSwdecState1300", VideoSwdecState1300),
        XL("VideoSwdecState1400", VideoSwdecState1400),
        XL("VideoSwdecState1500", VideoSwdecState1500),
        XL("VideoSwdecState1600", VideoSwdecState1600),
        XL("VideoSwdecState1700", VideoSwdecState1700),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterChunk7(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        XL("VideoSwdecState1800", VideoSwdecState1800),
        XL("VideoSwdecState1900", VideoSwdecState1900),
        XL("VideoSwdecState2000", VideoSwdecState2000),
        XL("VideoSwdecState2100", VideoSwdecState2100),
        XL("VideoSwdecState2200", VideoSwdecState2200),
        XL("VideoSwdecState2300", VideoSwdecState2300),
        XL("VideoSwdecState2400", VideoSwdecState2400),
        XL("VideoSwdecState2500", VideoSwdecState2500),
        XL("VideoSwdecState2600", VideoSwdecState2600),
        XL("VideoSwdecState2700", VideoSwdecState2700),
        XL("VideoSwdecState2800", VideoSwdecState2800),
        XL("VideoSwdecState2900", VideoSwdecState2900),
        XL("VideoSwdecState3000", VideoSwdecState3000),
        XL("VideoSwdecState3100", VideoSwdecState3100),
        XL("VideoSwdecState3200", VideoSwdecState3200),
        XL("VideoSwdecState3300", VideoSwdecState3300),
        XL("VideoSwdecState3400", VideoSwdecState3400),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor initDesc[] = {
        {"initTests", nullptr, InitTests, nullptr, nullptr,
         nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, 1, initDesc);
    RegisterChunk1(env, exports);
    RegisterChunk2(env, exports);
    RegisterChunk3(env, exports);
    RegisterChunk4(env, exports);
    RegisterChunk5(env, exports);
    RegisterChunk6(env, exports);
    RegisterChunk7(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module swdecoderTestModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "swdecoder_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&swdecoderTestModule);
}
