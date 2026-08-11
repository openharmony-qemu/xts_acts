/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "include/ApiTest.h"
#include "include/Func2Test.h"
#include "include/FuncTest.h"
#include "include/FuncHelperTest.h"
#include "include/ProcTest.h"
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
    CleanupResources();
    CleanupProcResources();
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

static napi_value RunTestAsync(napi_env env, TestFunction func,
                               const char* name)
{
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);
    AsyncTestContext* context = new AsyncTestContext{
        env, deferred, nullptr, func, -1};
    napi_value resourceName;
    napi_create_string_utf8(env, name, NAPI_AUTO_LENGTH, &resourceName);
    napi_status status = napi_create_async_work(env, nullptr, resourceName,
        ExecuteTestAsync, CompleteTestAsync, context, &context->work);
    if (status != napi_ok) {
        delete context;
        napi_value result;
        napi_create_int32(env, -1, &result);
        napi_resolve_deferred(env, deferred, result);
        return promise;
    }
    napi_status qStatus = napi_queue_async_work(env, context->work);
    if (qStatus != napi_ok) {
        napi_delete_async_work(env, context->work);
        delete context;
        napi_value result;
        napi_create_int32(env, -1, &result);
        napi_resolve_deferred(env, deferred, result);
        return promise;
    }
    return promise;
}

EXTERN_C_START

struct Entry {
    TestFunction func;
    const char* name;
};

static napi_value AsyncWrapper(napi_env env, napi_callback_info info)
{
    void* data = nullptr;
    napi_get_cb_info(env, info, nullptr, nullptr, nullptr, &data);
    auto* entry = static_cast<Entry*>(data);
    return RunTestAsync(env, entry->func, entry->name);
}

static napi_property_descriptor XL(const char* functionName, TestFunction func)
{
    auto* entry = new Entry{std::move(func), functionName};
    return {functionName, nullptr, AsyncWrapper, nullptr, nullptr, nullptr,
            napi_default, entry};
}

static void InitPush1(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("OhAvSourceCreateWithDataSource0100", OhAvSourceCreateWithDataSource0100));
    desc.push_back(XL("OhAvSourceCreateWithDataSourceExt0100", OhAvSourceCreateWithDataSourceExt0100));
    desc.push_back(XL("DemuxerIllegalPara0100", DemuxerIllegalPara0100));
    desc.push_back(XL("DemuxerIllegalPara0200", DemuxerIllegalPara0200));
    desc.push_back(XL("DemuxerIllegalPara0700", DemuxerIllegalPara0700));
    desc.push_back(XL("DemuxerIllegalPara0800", DemuxerIllegalPara0800));
    desc.push_back(XL("DemuxerIllegalPara0300", DemuxerIllegalPara0300));
    desc.push_back(XL("DemuxerIllegalPara0400", DemuxerIllegalPara0400));
    desc.push_back(XL("DemuxerIllegalPara0500", DemuxerIllegalPara0500));
    desc.push_back(XL("DemuxerIllegalPara0600", DemuxerIllegalPara0600));
    desc.push_back(XL("DemuxerIllegalPara2300", DemuxerIllegalPara2300));
    desc.push_back(XL("DemuxerIllegalPara0900", DemuxerIllegalPara0900));
    desc.push_back(XL("DemuxerIllegalPara1000", DemuxerIllegalPara1000));
    desc.push_back(XL("DemuxerIllegalPara1100", DemuxerIllegalPara1100));
    desc.push_back(XL("DemuxerIllegalPara1200", DemuxerIllegalPara1200));
    desc.push_back(XL("DemuxerIllegalPara1300", DemuxerIllegalPara1300));
    desc.push_back(XL("DemuxerIllegalPara1400", DemuxerIllegalPara1400));
    desc.push_back(XL("DemuxerIllegalPara1500", DemuxerIllegalPara1500));
    desc.push_back(XL("DemuxerIllegalPara1600", DemuxerIllegalPara1600));
    desc.push_back(XL("DemuxerIllegalPara1700", DemuxerIllegalPara1700));
    desc.push_back(XL("DemuxerIllegalPara1800", DemuxerIllegalPara1800));
    desc.push_back(XL("DemuxerIllegalPara1900", DemuxerIllegalPara1900));
    desc.push_back(XL("DemuxerIllegalPara2100", DemuxerIllegalPara2100));
    desc.push_back(XL("DemuxerIllegalPara2200", DemuxerIllegalPara2200));
    desc.push_back(XL("DemuxerIllegalPara2400", DemuxerIllegalPara2400));
    desc.push_back(XL("DemuxerIllegalPara2500", DemuxerIllegalPara2500));
    desc.push_back(XL("DemuxerIllegalPara2600", DemuxerIllegalPara2600));
    desc.push_back(XL("DemuxerIllegalPara2700", DemuxerIllegalPara2700));
    desc.push_back(XL("DemuxerIllegalPara2800", DemuxerIllegalPara2800));
    desc.push_back(XL("DemuxerIllegalPara2900", DemuxerIllegalPara2900));
    desc.push_back(XL("DemuxerIllegalPara3000", DemuxerIllegalPara3000));
    desc.push_back(XL("DemuxerApi0200", DemuxerApi0200));
    desc.push_back(XL("DemuxerApi0300", DemuxerApi0300));
    desc.push_back(XL("DemuxerApi0500", DemuxerApi0500));
    desc.push_back(XL("DemuxerApi0700", DemuxerApi0700));
    desc.push_back(XL("DemuxerApi1000", DemuxerApi1000));
    desc.push_back(XL("DemuxerApi1100", DemuxerApi1100));
    desc.push_back(XL("DemuxerApi1200", DemuxerApi1200));
    desc.push_back(XL("DemuxerApi1300", DemuxerApi1300));
    desc.push_back(XL("DemuxerApi1400", DemuxerApi1400));
    desc.push_back(XL("DemuxerApi2300", DemuxerApi2300));
    desc.push_back(XL("DemuxerApi2400", DemuxerApi2400));
    desc.push_back(XL("DemuxerApi2500", DemuxerApi2500));
}

static void InitPush2(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("SubMediaDemuxerVtt6100", SubMediaDemuxerVtt6100));
    desc.push_back(XL("DemuxerMeta0090", DemuxerMeta0090));
    desc.push_back(XL("DemuxerWavAlawFunc0001", DemuxerWavAlawFunc0001));
    desc.push_back(XL("DemuxerWavAlawFunc0002", DemuxerWavAlawFunc0002));
    desc.push_back(XL("DemuxerWavAlawFunc0003", DemuxerWavAlawFunc0003));
    desc.push_back(XL("DemuxerWavAlawFunc0004", DemuxerWavAlawFunc0004));
    desc.push_back(XL("DemuxerWavAlawFunc0005", DemuxerWavAlawFunc0005));
    desc.push_back(XL("DemuxerWavAlawFunc0006", DemuxerWavAlawFunc0006));
    desc.push_back(XL("DemuxerWavAlawFunc0007", DemuxerWavAlawFunc0007));
    desc.push_back(XL("DemuxerWavAlawFunc0008", DemuxerWavAlawFunc0008));
    desc.push_back(XL("DemuxerWavAlawFunc0009", DemuxerWavAlawFunc0009));
    desc.push_back(XL("DemuxerWavAlawFunc0010", DemuxerWavAlawFunc0010));
    desc.push_back(XL("DemuxerFunctionTrack0010", DemuxerFunctionTrack0010));
    desc.push_back(XL("DemuxerFunctionTrack0020", DemuxerFunctionTrack0020));
    desc.push_back(XL("DemuxerFunctionTrack0030", DemuxerFunctionTrack0030));
    desc.push_back(XL("DemuxerFunctionTrack0040", DemuxerFunctionTrack0040));
    desc.push_back(XL("DemuxerFunctionTrack0050", DemuxerFunctionTrack0050));
    desc.push_back(XL("DemuxerFunctionTrack0060", DemuxerFunctionTrack0060));
    desc.push_back(XL("DemuxerFunctionTrack0061", DemuxerFunctionTrack0061));
    desc.push_back(XL("DemuxerFunctionTrack0070", DemuxerFunctionTrack0070));
    desc.push_back(XL("DemuxerFunctionTrack0080", DemuxerFunctionTrack0080));
    desc.push_back(XL("DemuxerFunctionTrack0090", DemuxerFunctionTrack0090));
    desc.push_back(XL("DemuxerFunctionTrack0130", DemuxerFunctionTrack0130));
    desc.push_back(XL("DemuxerFunctionTrack0140", DemuxerFunctionTrack0140));
    desc.push_back(XL("DemuxerFunctionTrack0150", DemuxerFunctionTrack0150));
}

static void InitPush3(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("DemuxerFunctionTrack0160", DemuxerFunctionTrack0160));
    desc.push_back(XL("DemuxerFunctionTrack0170", DemuxerFunctionTrack0170));
    desc.push_back(XL("DemuxerFunctionTrack0180", DemuxerFunctionTrack0180));
    desc.push_back(XL("DemuxerFunctionTrack0190", DemuxerFunctionTrack0190));
    desc.push_back(XL("DemuxerFunctionAudioTrack0010", DemuxerFunctionAudioTrack0010));
    desc.push_back(XL("DemuxerFunctionAudioTrack0020", DemuxerFunctionAudioTrack0020));
    desc.push_back(XL("DemuxerFunctionAudioTrack0030", DemuxerFunctionAudioTrack0030));
    desc.push_back(XL("DemuxerFunctionAudioTrack0040", DemuxerFunctionAudioTrack0040));
    desc.push_back(XL("DemuxerFunctionAudioTrack0050", DemuxerFunctionAudioTrack0050));
    desc.push_back(XL("DemuxerFunctionAudioTrack0060", DemuxerFunctionAudioTrack0060));
    desc.push_back(XL("DemuxerFunctionAudioTrack0061", DemuxerFunctionAudioTrack0061));
    desc.push_back(XL("DemuxerFunctionAudioTrack0070", DemuxerFunctionAudioTrack0070));
    desc.push_back(XL("DemuxerFunctionAudioTrack0080", DemuxerFunctionAudioTrack0080));
    desc.push_back(XL("DemuxerFunctionAudioTrack0090", DemuxerFunctionAudioTrack0090));
    desc.push_back(XL("DemuxerFunctionAudioTrack0130", DemuxerFunctionAudioTrack0130));
    desc.push_back(XL("DemuxerFunctionAudioTrack0140", DemuxerFunctionAudioTrack0140));
    desc.push_back(XL("DemuxerFunctionAudioTrack0150", DemuxerFunctionAudioTrack0150));
    desc.push_back(XL("DemuxerFunctionAudioTrack0160", DemuxerFunctionAudioTrack0160));
    desc.push_back(XL("DemuxerFunctionAudioTrack0170", DemuxerFunctionAudioTrack0170));
    desc.push_back(XL("DemuxerFunctionAudioTrack0180", DemuxerFunctionAudioTrack0180));
    desc.push_back(XL("DemuxerFunctionAudioTrack0190", DemuxerFunctionAudioTrack0190));
    desc.push_back(XL("DemuxerFunctionAdd0010", DemuxerFunctionAdd0010));
    desc.push_back(XL("DemuxerFunctionAdd0020", DemuxerFunctionAdd0020));
    desc.push_back(XL("DemuxerFunctionAdd0030", DemuxerFunctionAdd0030));
    desc.push_back(XL("DemuxerSkipSampleFunc0010", DemuxerSkipSampleFunc0010));
    desc.push_back(XL("DemuxerSkipSampleFunc0020", DemuxerSkipSampleFunc0020));
}

static void InitPush4(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("DemuxerFunction0200", DemuxerFunction0200));
    desc.push_back(XL("DemuxerFunction0300", DemuxerFunction0300));
    desc.push_back(XL("DemuxerFunction0400", DemuxerFunction0400));
    desc.push_back(XL("DemuxerFunction0500", DemuxerFunction0500));
    desc.push_back(XL("DemuxerFunction0700", DemuxerFunction0700));
    desc.push_back(XL("DemuxerFunction0800", DemuxerFunction0800));
    desc.push_back(XL("DemuxerFunction0900", DemuxerFunction0900));
    desc.push_back(XL("DemuxerFunction1000", DemuxerFunction1000));
    desc.push_back(XL("DemuxerFunction1100", DemuxerFunction1100));
    desc.push_back(XL("DemuxerFunction1200", DemuxerFunction1200));
    desc.push_back(XL("DemuxerFunction1300", DemuxerFunction1300));
    desc.push_back(XL("DemuxerFunction1400", DemuxerFunction1400));
    desc.push_back(XL("DemuxerFunction1500", DemuxerFunction1500));
    desc.push_back(XL("DemuxerFunction1600", DemuxerFunction1600));
    desc.push_back(XL("DemuxerFunction1700", DemuxerFunction1700));
    desc.push_back(XL("DemuxerFunction1800", DemuxerFunction1800));
    desc.push_back(XL("DemuxerFunction1900", DemuxerFunction1900));
    desc.push_back(XL("DemuxerFunction2000", DemuxerFunction2000));
    desc.push_back(XL("DemuxerFunction2100", DemuxerFunction2100));
    desc.push_back(XL("DemuxerFunction2200", DemuxerFunction2200));
    desc.push_back(XL("DemuxerFunction2300", DemuxerFunction2300));
    desc.push_back(XL("DemuxerFunction2400", DemuxerFunction2400));
    desc.push_back(XL("DemuxerFunction3100", DemuxerFunction3100));
    desc.push_back(XL("DemuxerFunction3200", DemuxerFunction3200));
    desc.push_back(XL("DemuxerFunction3300", DemuxerFunction3300));
}

static void InitPush5(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("DemuxerFunction3400", DemuxerFunction3400));
    desc.push_back(XL("DemuxerFunction3500", DemuxerFunction3500));
    desc.push_back(XL("DemuxerFunction3600", DemuxerFunction3600));
    desc.push_back(XL("DemuxerFunction3700", DemuxerFunction3700));
    desc.push_back(XL("DemuxerFunction3800", DemuxerFunction3800));
    desc.push_back(XL("DemuxerFunction3900", DemuxerFunction3900));
    desc.push_back(XL("DemuxerFunction4000", DemuxerFunction4000));
    desc.push_back(XL("DemuxerFunction4100", DemuxerFunction4100));
    desc.push_back(XL("DemuxerFunction4200", DemuxerFunction4200));
    desc.push_back(XL("DemuxerFunction4300", DemuxerFunction4300));
    desc.push_back(XL("DemuxerFunction4400", DemuxerFunction4400));
    desc.push_back(XL("DemuxerFunction4500", DemuxerFunction4500));
    desc.push_back(XL("DemuxerFunction7000", DemuxerFunction7000));
    desc.push_back(XL("DemuxerFunction7100", DemuxerFunction7100));
    desc.push_back(XL("DemuxerFunction7200", DemuxerFunction7200));
    desc.push_back(XL("DemuxerFunction7300", DemuxerFunction7300));
    desc.push_back(XL("DemuxerFunction7400", DemuxerFunction7400));
    desc.push_back(XL("DemuxerFunction7500", DemuxerFunction7500));
    desc.push_back(XL("DemuxerFunction7600", DemuxerFunction7600));
    desc.push_back(XL("DemuxerFunction7700", DemuxerFunction7700));
    desc.push_back(XL("DemuxerFunction7800", DemuxerFunction7800));
    desc.push_back(XL("DemuxerFunction7900", DemuxerFunction7900));
    desc.push_back(XL("DemuxerFunction8000", DemuxerFunction8000));
    desc.push_back(XL("DemuxerFunction8100", DemuxerFunction8100));
    desc.push_back(XL("DemuxerFunction8200", DemuxerFunction8200));
}

static void InitPush6(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("DemuxerFunction8300", DemuxerFunction8300));
    desc.push_back(XL("DemuxerFunction8400", DemuxerFunction8400));
    desc.push_back(XL("DemuxerFunction8500", DemuxerFunction8500));
    desc.push_back(XL("DemuxerFunction8600", DemuxerFunction8600));
    desc.push_back(XL("DemuxerFunction8700", DemuxerFunction8700));
    desc.push_back(XL("DemuxerFunction8800", DemuxerFunction8800));
    desc.push_back(XL("DemuxerFunction8900", DemuxerFunction8900));
    desc.push_back(XL("DemuxerFunction9000", DemuxerFunction9000));
    desc.push_back(XL("SubMediaDemuxerFunction0200", SubMediaDemuxerFunction0200));
    desc.push_back(XL("SubMediaDemuxerFunction0300", SubMediaDemuxerFunction0300));
    desc.push_back(XL("SubMediaDemuxerFunction1000", SubMediaDemuxerFunction1000));
    desc.push_back(XL("SubMediaDemuxerFunction1100", SubMediaDemuxerFunction1100));
    desc.push_back(XL("SubMediaDemuxerFunction1200", SubMediaDemuxerFunction1200));
    desc.push_back(XL("SubMediaDemuxerFunction1300", SubMediaDemuxerFunction1300));
    desc.push_back(XL("SubMediaDemuxerProcess1400", SubMediaDemuxerProcess1400));
    desc.push_back(XL("SubMediaDemuxerProcess1500", SubMediaDemuxerProcess1500));
    desc.push_back(XL("SubMediaDemuxerProcess1600", SubMediaDemuxerProcess1600));
    desc.push_back(XL("SubMediaDemuxerProcess1700", SubMediaDemuxerProcess1700));
    desc.push_back(XL("SubMediaDemuxerProcess1800", SubMediaDemuxerProcess1800));
    desc.push_back(XL("SubMediaDemuxerProcess1900", SubMediaDemuxerProcess1900));
    desc.push_back(XL("SubMediaDemuxerProcess2000", SubMediaDemuxerProcess2000));
    desc.push_back(XL("SubMediaDemuxerProcess2100", SubMediaDemuxerProcess2100));
    desc.push_back(XL("SubMediaDemuxerProcess2200", SubMediaDemuxerProcess2200));
    desc.push_back(XL("SubMediaDemuxerProcess2300", SubMediaDemuxerProcess2300));
}

static void InitPush7(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("SubMediaDemuxerProcess2400", SubMediaDemuxerProcess2400));
    desc.push_back(XL("SubMediaDemuxerProcess2500", SubMediaDemuxerProcess2500));
    desc.push_back(XL("SubMediaDemuxerProcess2600", SubMediaDemuxerProcess2600));
    desc.push_back(XL("SubMediaDemuxerProcess2700", SubMediaDemuxerProcess2700));
    desc.push_back(XL("SubMediaDemuxerProcess2800", SubMediaDemuxerProcess2800));
    desc.push_back(XL("SubMediaDemuxerProcess2900", SubMediaDemuxerProcess2900));
    desc.push_back(XL("SubMediaDemuxerProcess3000", SubMediaDemuxerProcess3000));
    desc.push_back(XL("SubMediaDemuxerProcess3100", SubMediaDemuxerProcess3100));
    desc.push_back(XL("SubMediaDemuxerProcess3200", SubMediaDemuxerProcess3200));
    desc.push_back(XL("SubMediaDemuxerProcess3300", SubMediaDemuxerProcess3300));
    desc.push_back(XL("SubMediaDemuxerProcess3400", SubMediaDemuxerProcess3400));
    desc.push_back(XL("SubMediaDemuxerProcess3800", SubMediaDemuxerProcess3800));
    desc.push_back(XL("SubMediaDemuxerProcess3700", SubMediaDemuxerProcess3700));
    desc.push_back(XL("SubMediaDemuxerProcess3600", SubMediaDemuxerProcess3600));
    desc.push_back(XL("SubMediaDemuxerProcess3510", SubMediaDemuxerProcess3510));
    desc.push_back(XL("SubMediaDemuxerProcess3500", SubMediaDemuxerProcess3500));
}

static napi_value InitTests(napi_env env, napi_callback_info info)
{
    InitApiTest();
    InitFunc2Test();
    InitFuncTest();
    InitProcTest();
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    desc.push_back({ "initTests", nullptr, InitTests, nullptr, nullptr, nullptr, napi_default, nullptr });
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    InitPush4(desc);
    InitPush5(desc);
    InitPush6(desc);
    InitPush7(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "demuxer_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
