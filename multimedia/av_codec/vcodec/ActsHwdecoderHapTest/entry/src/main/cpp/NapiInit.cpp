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
#include "include/StateTest.h"
#include "include/Hwh265Hdr2sdrTest.h"
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
    napi_create_async_work(env, nullptr, resourceName,
        ExecuteTestAsync, CompleteTestAsync, context, &context->work);
    napi_queue_async_work(env, context->work);
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
    desc.push_back(XL("HevcHwHdr2sdrFunc002Test", HevcHwHdr2sdrFunc002Test));
    desc.push_back(XL("VideoHwdecIllegalPara0100Test", VideoHwdecIllegalPara0100Test));
    desc.push_back(XL("VideoHwdecIllegalPara0200Test", VideoHwdecIllegalPara0200Test));
    desc.push_back(XL("VideoHwdecIllegalPara3300Test", VideoHwdecIllegalPara3300Test));
    desc.push_back(XL("VideoHwdecIllegalPara1800Test", VideoHwdecIllegalPara1800Test));
    desc.push_back(XL("VideoHwdecIllegalPara0300Test", VideoHwdecIllegalPara0300Test));
    desc.push_back(XL("VideoHwdecIllegalPara0400Test", VideoHwdecIllegalPara0400Test));
    desc.push_back(XL("VideoHwdecIllegalPara0500Test", VideoHwdecIllegalPara0500Test));
    desc.push_back(XL("VideoHwdecIllegalPara1400Test", VideoHwdecIllegalPara1400Test));
    desc.push_back(XL("VideoHwdecIllegalPara5000Test", VideoHwdecIllegalPara5000Test));
    desc.push_back(XL("VideoHwdecIllegalPara5100Test", VideoHwdecIllegalPara5100Test));
    desc.push_back(XL("VideoHwdecIllegalPara0600Test", VideoHwdecIllegalPara0600Test));
    desc.push_back(XL("VideoHwdecIllegalPara0700Test", VideoHwdecIllegalPara0700Test));
    desc.push_back(XL("VideoHwdecIllegalPara0800Test", VideoHwdecIllegalPara0800Test));
    desc.push_back(XL("VideoHwdecIllegalPara0900Test", VideoHwdecIllegalPara0900Test));
    desc.push_back(XL("VideoHwdecIllegalPara1000Test", VideoHwdecIllegalPara1000Test));
    desc.push_back(XL("VideoHwdecIllegalPara1100Test", VideoHwdecIllegalPara1100Test));
    desc.push_back(XL("VideoHwdecIllegalPara4100Test", VideoHwdecIllegalPara4100Test));
    desc.push_back(XL("VideoHwdecIllegalPara1500Test", VideoHwdecIllegalPara1500Test));
    desc.push_back(XL("VideoHwdecIllegalPara1200Test", VideoHwdecIllegalPara1200Test));
    desc.push_back(XL("VideoHwdecIllegalPara1300Test", VideoHwdecIllegalPara1300Test));
    desc.push_back(XL("VideoHwdecIllegalPara1600Test", VideoHwdecIllegalPara1600Test));
    desc.push_back(XL("VideoHwdecIllegalPara1700Test", VideoHwdecIllegalPara1700Test));
    desc.push_back(XL("VideoHwdecIllegalPara2200Test", VideoHwdecIllegalPara2200Test));
    desc.push_back(XL("VideoHwdecIllegalPara2500Test", VideoHwdecIllegalPara2500Test));
    desc.push_back(XL("VideoHwdecIllegalPara2600Test", VideoHwdecIllegalPara2600Test));
    desc.push_back(XL("VideoHwdecIllegalPara2700Test", VideoHwdecIllegalPara2700Test));
    desc.push_back(XL("VideoHwdecIllegalPara2800Test", VideoHwdecIllegalPara2800Test));
    desc.push_back(XL("VideoHwdecIllegalPara2900Test", VideoHwdecIllegalPara2900Test));
    desc.push_back(XL("VideoHwdecIllegalPara3000Test", VideoHwdecIllegalPara3000Test));
    desc.push_back(XL("VideoHwdecIllegalPara3100Test", VideoHwdecIllegalPara3100Test));
    desc.push_back(XL("VideoHwdecIllegalPara3200Test", VideoHwdecIllegalPara3200Test));
}

static void InitPush2(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoHwdecApi0100Test", VideoHwdecApi0100Test));
    desc.push_back(XL("VideoHwdecApi0200Test", VideoHwdecApi0200Test));
    desc.push_back(XL("VideoHwdecApi0300Test", VideoHwdecApi0300Test));
    desc.push_back(XL("VideoHwdecApi0400Test", VideoHwdecApi0400Test));
    desc.push_back(XL("VideoHwdecApi0500Test", VideoHwdecApi0500Test));
    desc.push_back(XL("VideoHwdecApi0600Test", VideoHwdecApi0600Test));
    desc.push_back(XL("VideoHwdecApi0700Test", VideoHwdecApi0700Test));
    desc.push_back(XL("VideoHwdecApi0800Test", VideoHwdecApi0800Test));
    desc.push_back(XL("VideoHwdecApi0900Test", VideoHwdecApi0900Test));
    desc.push_back(XL("VideoHwdecApi1000Test", VideoHwdecApi1000Test));
    desc.push_back(XL("VideoHwdecApi1100Test", VideoHwdecApi1100Test));
    desc.push_back(XL("VideoHwdecApi1200Test", VideoHwdecApi1200Test));
    desc.push_back(XL("VideoHwdecCapApi0100Test", VideoHwdecCapApi0100Test));
    desc.push_back(XL("VideoHwdecCapApi0200Test", VideoHwdecCapApi0200Test));
    desc.push_back(XL("VideoHwdecCapApi0300Test", VideoHwdecCapApi0300Test));
    desc.push_back(XL("VideoHwdecCapApi0400Test", VideoHwdecCapApi0400Test));
    desc.push_back(XL("VideoHwdecCapApi0500Test", VideoHwdecCapApi0500Test));
    desc.push_back(XL("VideoHwdecCapApi0600Test", VideoHwdecCapApi0600Test));
    desc.push_back(XL("VideoHwdecCapApi0700Test", VideoHwdecCapApi0700Test));
    desc.push_back(XL("VideoHwdecCapApi0800Test", VideoHwdecCapApi0800Test));
    desc.push_back(XL("VideoHwdecCapApi0900Test", VideoHwdecCapApi0900Test));
    desc.push_back(XL("VideoHwdecCapApi1000Test", VideoHwdecCapApi1000Test));
    desc.push_back(XL("VideoHwdecCapApi3100Test", VideoHwdecCapApi3100Test));
    desc.push_back(XL("VideoHwdecCapApi3200Test", VideoHwdecCapApi3200Test));
    desc.push_back(XL("VideoHwdecCapApi3300Test", VideoHwdecCapApi3300Test));
    desc.push_back(XL("VideoHwdecCapApi3400Test", VideoHwdecCapApi3400Test));
    desc.push_back(XL("VideoHwdecCapApi3500Test", VideoHwdecCapApi3500Test));
    desc.push_back(XL("VideoHwdecCapApi3600Test", VideoHwdecCapApi3600Test));
    desc.push_back(XL("VideoHwdecCapApi3700Test", VideoHwdecCapApi3700Test));
    desc.push_back(XL("VideoHwdecCapApi3800Test", VideoHwdecCapApi3800Test));
    desc.push_back(XL("VideoHwdecCapApi3900Test", VideoHwdecCapApi3900Test));
    desc.push_back(XL("VideoHwdecCapApi4000Test", VideoHwdecCapApi4000Test));
}

static void InitPush3(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoHwdecCapApi4100Test", VideoHwdecCapApi4100Test));
    desc.push_back(XL("VideoHwdecCapApi4200Test", VideoHwdecCapApi4200Test));
    desc.push_back(XL("VideoHwdecCapApi4300Test", VideoHwdecCapApi4300Test));
    desc.push_back(XL("VideoHwdecCapApi4400Test", VideoHwdecCapApi4400Test));
    desc.push_back(XL("VideoHwdecCapApi4500Test", VideoHwdecCapApi4500Test));
    desc.push_back(XL("VideoHwdecCapApi4600Test", VideoHwdecCapApi4600Test));
    desc.push_back(XL("VideoHwdecCapApi4700Test", VideoHwdecCapApi4700Test));
    desc.push_back(XL("VideoHwdecCapApi4800Test", VideoHwdecCapApi4800Test));
    desc.push_back(XL("VideoHwdecCapApi4900Test", VideoHwdecCapApi4900Test));
    desc.push_back(XL("VideoHwdecCapApi5000Test", VideoHwdecCapApi5000Test));
    desc.push_back(XL("VideoHwdecCapApi1700Test", VideoHwdecCapApi1700Test));
    desc.push_back(XL("VideoHwdecCapApi5100Test", VideoHwdecCapApi5100Test));
    desc.push_back(XL("VideoHwdecCapApi5200Test", VideoHwdecCapApi5200Test));
    desc.push_back(XL("VideoHwdecCapApi5300Test", VideoHwdecCapApi5300Test));
    desc.push_back(XL("VideoHwdecCapApi9400Test", VideoHwdecCapApi9400Test));
    desc.push_back(XL("VideoHwdecCapApi5400Test", VideoHwdecCapApi5400Test));
    desc.push_back(XL("VideoHwdecCapApi5500Test", VideoHwdecCapApi5500Test));
    desc.push_back(XL("VideoHwdecCapApi5600Test", VideoHwdecCapApi5600Test));
    desc.push_back(XL("VideoHwdecCapApi5700Test", VideoHwdecCapApi5700Test));
    desc.push_back(XL("VideoHwdecCapApi1600Test", VideoHwdecCapApi1600Test));
    desc.push_back(XL("VideoHwdecCapApi5800Test", VideoHwdecCapApi5800Test));
    desc.push_back(XL("VideoHwdecCapApi5900Test", VideoHwdecCapApi5900Test));
    desc.push_back(XL("VideoHwdecCapApi6000Test", VideoHwdecCapApi6000Test));
    desc.push_back(XL("VideoHwdecCapApi6100Test", VideoHwdecCapApi6100Test));
    desc.push_back(XL("VideoHwdecCapApi6200Test", VideoHwdecCapApi6200Test));
    desc.push_back(XL("VideoHwdecCapApi6300Test", VideoHwdecCapApi6300Test));
    desc.push_back(XL("VideoHwdecCapApi6400Test", VideoHwdecCapApi6400Test));
    desc.push_back(XL("VideoHwdecCapApi6500Test", VideoHwdecCapApi6500Test));
    desc.push_back(XL("VideoHwdecCapApi6600Test", VideoHwdecCapApi6600Test));
    desc.push_back(XL("VideoHwdecCapApi6700Test", VideoHwdecCapApi6700Test));
    desc.push_back(XL("VideoHwdecCapApi6800Test", VideoHwdecCapApi6800Test));
    desc.push_back(XL("VideoHwdecCapApi6900Test", VideoHwdecCapApi6900Test));
}

static void InitPush4(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoHwdecCapApi7000Test", VideoHwdecCapApi7000Test));
    desc.push_back(XL("VideoHwdecCapApi7100Test", VideoHwdecCapApi7100Test));
    desc.push_back(XL("VideoHwdecCapApi1200Test", VideoHwdecCapApi1200Test));
    desc.push_back(XL("VideoHwdecCapApi7200Test", VideoHwdecCapApi7200Test));
    desc.push_back(XL("VideoHwdecCapApi7300Test", VideoHwdecCapApi7300Test));
    desc.push_back(XL("VideoHwdecCapApi7400Test", VideoHwdecCapApi7400Test));
    desc.push_back(XL("VideoHwdecCapApi7500Test", VideoHwdecCapApi7500Test));
    desc.push_back(XL("VideoHwdecCapApi1300Test", VideoHwdecCapApi1300Test));
    desc.push_back(XL("VideoHwdecCapApi7600Test", VideoHwdecCapApi7600Test));
    desc.push_back(XL("VideoHwdecCapApi7700Test", VideoHwdecCapApi7700Test));
    desc.push_back(XL("VideoHwdecCapApi7800Test", VideoHwdecCapApi7800Test));
    desc.push_back(XL("VideoHwdecCapApi7900Test", VideoHwdecCapApi7900Test));
    desc.push_back(XL("VideoHwdecCapApi8000Test", VideoHwdecCapApi8000Test));
    desc.push_back(XL("VideoHwdecCapApi1400Test", VideoHwdecCapApi1400Test));
    desc.push_back(XL("VideoHwdecCapApi8100Test", VideoHwdecCapApi8100Test));
    desc.push_back(XL("VideoHwdecCapApi8200Test", VideoHwdecCapApi8200Test));
    desc.push_back(XL("VideoHwdecCapApi8300Test", VideoHwdecCapApi8300Test));
    desc.push_back(XL("VideoHwdecAttimeApi0010Test", VideoHwdecAttimeApi0010Test));
    desc.push_back(XL("VideoDecodeSyncApi0010Test", VideoDecodeSyncApi0010Test));
    desc.push_back(XL("VideoDecodeSyncApi0020Test", VideoDecodeSyncApi0020Test));
    desc.push_back(XL("VideoDecodeSyncApi0030Test", VideoDecodeSyncApi0030Test));
    desc.push_back(XL("VideoDecodeSyncApi0040Test", VideoDecodeSyncApi0040Test));
    desc.push_back(XL("VideoDecodeSyncApi0050Test", VideoDecodeSyncApi0050Test));
    desc.push_back(XL("VideoDecodeSyncApi0060Test", VideoDecodeSyncApi0060Test));
    desc.push_back(XL("VideoDecodeSyncApi0070Test", VideoDecodeSyncApi0070Test));
    desc.push_back(XL("VideoDecodeSyncApi0080Test", VideoDecodeSyncApi0080Test));
    desc.push_back(XL("VideoHwdecFormatApi0010Test", VideoHwdecFormatApi0010Test));
    desc.push_back(XL("VideoHwdecFormatApi0020Test", VideoHwdecFormatApi0020Test));
    desc.push_back(XL("VideoHwdecApiAdd0010Test", VideoHwdecApiAdd0010Test));
    desc.push_back(XL("VideoHwdecApiAdd0020Test", VideoHwdecApiAdd0020Test));
    desc.push_back(XL("VideoHwdecApiAdd0030Test", VideoHwdecApiAdd0030Test));
    desc.push_back(XL("VideoHwdecApiAdd0040Test", VideoHwdecApiAdd0040Test));
}

static void InitPush5(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoHwdecApiAdd0050Test", VideoHwdecApiAdd0050Test));
    desc.push_back(XL("VideoHwdecApiAdd0060Test", VideoHwdecApiAdd0060Test));
    desc.push_back(XL("VideoHwdecApiAdd0070Test", VideoHwdecApiAdd0070Test));
    desc.push_back(XL("VideoHwdecApiAdd0080Test", VideoHwdecApiAdd0080Test));
    desc.push_back(XL("VideoHwdecApiAdd0090Test", VideoHwdecApiAdd0090Test));
    desc.push_back(XL("VideoHwdecApiAdd0100Test", VideoHwdecApiAdd0100Test));
    desc.push_back(XL("VideoDecodeSyncFunc0010Test", VideoDecodeSyncFunc0010Test));
    desc.push_back(XL("VideoDecodeSyncFunc0020Test", VideoDecodeSyncFunc0020Test));
    desc.push_back(XL("VideoDecodeSyncFunc0030Test", VideoDecodeSyncFunc0030Test));
    desc.push_back(XL("VideoDecodeSyncFunc0040Test", VideoDecodeSyncFunc0040Test));
    desc.push_back(XL("VideoDecodeSyncFunc0050Test", VideoDecodeSyncFunc0050Test));
    desc.push_back(XL("VideoDecodeSyncFunc0060Test", VideoDecodeSyncFunc0060Test));
    desc.push_back(XL("VideoDecodeSyncFunc0070Test", VideoDecodeSyncFunc0070Test));
    desc.push_back(XL("VideoDecodeSyncFunc0080Test", VideoDecodeSyncFunc0080Test));
    desc.push_back(XL("VideoDecodeSyncFunc0090Test", VideoDecodeSyncFunc0090Test));
    desc.push_back(XL("VideoDecodeSyncFunc0100Test", VideoDecodeSyncFunc0100Test));
    desc.push_back(XL("VideoDecodeSyncFunc0110Test", VideoDecodeSyncFunc0110Test));
    desc.push_back(XL("VideoDecodeSyncFunc0120Test", VideoDecodeSyncFunc0120Test));
    desc.push_back(XL("VideoDecodeSyncFunc0130Test", VideoDecodeSyncFunc0130Test));
    desc.push_back(XL("VideoDecodeSyncFunc0140Test", VideoDecodeSyncFunc0140Test));
    desc.push_back(XL("VideoDecodeSyncFunc0150Test", VideoDecodeSyncFunc0150Test));
    desc.push_back(XL("VideoDecodeSyncFunc0160Test", VideoDecodeSyncFunc0160Test));
    desc.push_back(XL("VideoDecodeSyncFunc0170Test", VideoDecodeSyncFunc0170Test));
    desc.push_back(XL("VideoDecodeSyncHw264Func0010Test", VideoDecodeSyncHw264Func0010Test));
    desc.push_back(XL("VideoDecodeSyncHw264Func0020Test", VideoDecodeSyncHw264Func0020Test));
    desc.push_back(XL("VideoDecodeSyncHw265Func0010Test", VideoDecodeSyncHw265Func0010Test));
    desc.push_back(XL("VideoDecodeSyncHw265Func0020Test", VideoDecodeSyncHw265Func0020Test));
    desc.push_back(XL("VideoDecodeSyncHw265Func0040Test", VideoDecodeSyncHw265Func0040Test));
    desc.push_back(XL("VideoDecodeSyncHw266Func0010Test", VideoDecodeSyncHw266Func0010Test));
    desc.push_back(XL("VideoDecodeSyncHw266Func0020Test", VideoDecodeSyncHw266Func0020Test));
    desc.push_back(XL("VideoDecodeSyncHw266Func0040Test", VideoDecodeSyncHw266Func0040Test));
    desc.push_back(XL("VideoDecodeSyncHw264LowlatencyFunc0010Test", VideoDecodeSyncHw264LowlatencyFunc0010Test));
}

static void InitPush6(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoDecodeSyncHw265LowlatencyFunc0010Test", VideoDecodeSyncHw265LowlatencyFunc0010Test));
    desc.push_back(XL("VideoDecodeSyncHw266LowlatencyFunc0010Test", VideoDecodeSyncHw266LowlatencyFunc0010Test));
    desc.push_back(XL("VideoDecodeH264BlankFrame0010Test", VideoDecodeH264BlankFrame0010Test));
    desc.push_back(XL("VideoDecodeH265BlankFrame0020Test", VideoDecodeH265BlankFrame0020Test));
    desc.push_back(XL("VideoDecodeH266BlankFrame0030Test", VideoDecodeH266BlankFrame0030Test));
    desc.push_back(XL("VideoDecodeLowLatency0001Test", VideoDecodeLowLatency0001Test));
    desc.push_back(XL("VideoDecodeLowLatency0002Test", VideoDecodeLowLatency0002Test));
    desc.push_back(XL("VideoDecodeLowLatency0003Test", VideoDecodeLowLatency0003Test));
    desc.push_back(XL("VideoDecodeLowLatency0004Test", VideoDecodeLowLatency0004Test));
    desc.push_back(XL("VideoDecodeLowLatency0005Test", VideoDecodeLowLatency0005Test));
    desc.push_back(XL("VideoDecodeLowLatency0006Test", VideoDecodeLowLatency0006Test));
    desc.push_back(XL("VideoDecodeLowLatency0007Test", VideoDecodeLowLatency0007Test));
    desc.push_back(XL("VideoDecodeLowLatency0008Test", VideoDecodeLowLatency0008Test));
    desc.push_back(XL("VideoDecodeLowLatency0009Test", VideoDecodeLowLatency0009Test));
    desc.push_back(XL("VideoHwdecPixeFormat0030Test", VideoHwdecPixeFormat0030Test));
    desc.push_back(XL("VideoDecodeTransform0010Test", VideoDecodeTransform0010Test));
    desc.push_back(XL("VideoDecodeTransform0020Test", VideoDecodeTransform0020Test));
    desc.push_back(XL("VideoDecodeResolution0010Test", VideoDecodeResolution0010Test));
    desc.push_back(XL("VideoDecodeAnother0010Test", VideoDecodeAnother0010Test));
    desc.push_back(XL("VideoCapabilityConfig0010Test", VideoCapabilityConfig0010Test));
    desc.push_back(XL("VideoCapabilityConfig0020Test", VideoCapabilityConfig0020Test));
    desc.push_back(XL("VideoCapabilityConfig0030Test", VideoCapabilityConfig0030Test));
    desc.push_back(XL("VideoDecodeOrder0100Test", VideoDecodeOrder0100Test));
    desc.push_back(XL("VideoDecodeOrder0200Test", VideoDecodeOrder0200Test));
    desc.push_back(XL("VideoDecodeOrder0300Test", VideoDecodeOrder0300Test));
    desc.push_back(XL("VideoDecodeOrder0400Test", VideoDecodeOrder0400Test));
    desc.push_back(XL("VideoDecodeOrder0500Test", VideoDecodeOrder0500Test));
    desc.push_back(XL("VideoHwdecFunction0200Test", VideoHwdecFunction0200Test));
    desc.push_back(XL("VideoHwdecFunction0300Test", VideoHwdecFunction0300Test));
    desc.push_back(XL("VideoHwdecFunction0400Test", VideoHwdecFunction0400Test));
    desc.push_back(XL("VideoHwdecFunction0700Test", VideoHwdecFunction0700Test));
    desc.push_back(XL("VideoHwdecFunction0800Test", VideoHwdecFunction0800Test));
}

static void InitPush7(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoHwdecFunction0900Test", VideoHwdecFunction0900Test));
    desc.push_back(XL("VideoHwdecFunction1000Test", VideoHwdecFunction1000Test));
    desc.push_back(XL("VideoHwdecFunction1100Test", VideoHwdecFunction1100Test));
    desc.push_back(XL("VideoHwdecFunction1200Test", VideoHwdecFunction1200Test));
    desc.push_back(XL("VideoHwdecFunction1300Test", VideoHwdecFunction1300Test));
    desc.push_back(XL("VideoHwdecFunction1400Test", VideoHwdecFunction1400Test));
    desc.push_back(XL("VideoHwdecFunction1600Test", VideoHwdecFunction1600Test));
    desc.push_back(XL("VideoHwdecFunction1700Test", VideoHwdecFunction1700Test));
    desc.push_back(XL("SurfChangeFunc001Test", SurfChangeFunc001Test));
    desc.push_back(XL("SurfChangeFunc002Test", SurfChangeFunc002Test));
    desc.push_back(XL("SurfChangeFunc003Test", SurfChangeFunc003Test));
    desc.push_back(XL("SurfChangeFunc004Test", SurfChangeFunc004Test));
    desc.push_back(XL("OutputDecsFunc001Test", OutputDecsFunc001Test));
    desc.push_back(XL("OutputDecsFunc002Test", OutputDecsFunc002Test));
    desc.push_back(XL("OutputDecsFunc003Test", OutputDecsFunc003Test));
    desc.push_back(XL("OutputDecsFunc004Test", OutputDecsFunc004Test));
    desc.push_back(XL("OutputDecsFunc005Test", OutputDecsFunc005Test));
    desc.push_back(XL("OutputDecsFunc006Test", OutputDecsFunc006Test));
    desc.push_back(XL("OutputDecsFunc007Test", OutputDecsFunc007Test));
    desc.push_back(XL("VideoHwdecState0100Test", VideoHwdecState0100Test));
    desc.push_back(XL("VideoHwdecState0101Test", VideoHwdecState0101Test));
    desc.push_back(XL("VideoHwdecState0200Test", VideoHwdecState0200Test));
    desc.push_back(XL("VideoHwdecState0300Test", VideoHwdecState0300Test));
    desc.push_back(XL("VideoHwdecState0400Test", VideoHwdecState0400Test));
    desc.push_back(XL("VideoHwdecState0500Test", VideoHwdecState0500Test));
    desc.push_back(XL("VideoHwdecState0600Test", VideoHwdecState0600Test));
    desc.push_back(XL("VideoHwdecState0700Test", VideoHwdecState0700Test));
    desc.push_back(XL("VideoHwdecState0800Test", VideoHwdecState0800Test));
    desc.push_back(XL("VideoHwdecState0900Test", VideoHwdecState0900Test));
    desc.push_back(XL("VideoHwdecState1000Test", VideoHwdecState1000Test));
    desc.push_back(XL("VideoHwdecState1100Test", VideoHwdecState1100Test));
    desc.push_back(XL("VideoHwdecState1200Test", VideoHwdecState1200Test));
}

static void InitPush8(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoHwdecState1300Test", VideoHwdecState1300Test));
    desc.push_back(XL("VideoHwdecState1400Test", VideoHwdecState1400Test));
    desc.push_back(XL("VideoHwdecState1500Test", VideoHwdecState1500Test));
    desc.push_back(XL("VideoHwdecState1600Test", VideoHwdecState1600Test));
    desc.push_back(XL("VideoHwdecState1700Test", VideoHwdecState1700Test));
    desc.push_back(XL("VideoHwdecState1800Test", VideoHwdecState1800Test));
    desc.push_back(XL("VideoHwdecState1900Test", VideoHwdecState1900Test));
    desc.push_back(XL("VideoHwdecState2000Test", VideoHwdecState2000Test));
    desc.push_back(XL("VideoHwdecState2100Test", VideoHwdecState2100Test));
    desc.push_back(XL("VideoHwdecState2200Test", VideoHwdecState2200Test));
    desc.push_back(XL("VideoHwdecState2300Test", VideoHwdecState2300Test));
    desc.push_back(XL("VideoHwdecState2400Test", VideoHwdecState2400Test));
    desc.push_back(XL("VideoHwdecState2500Test", VideoHwdecState2500Test));
    desc.push_back(XL("VideoHwdecState2600Test", VideoHwdecState2600Test));
    desc.push_back(XL("VideoHwdecState2700Test", VideoHwdecState2700Test));
    desc.push_back(XL("VideoHwdecState2800Test", VideoHwdecState2800Test));
    desc.push_back(XL("VideoHwdecState2900Test", VideoHwdecState2900Test));
    desc.push_back(XL("VideoHwdecState3000Test", VideoHwdecState3000Test));
    desc.push_back(XL("VideoHwdecState3100Test", VideoHwdecState3100Test));
    desc.push_back(XL("VideoHwdecState3200Test", VideoHwdecState3200Test));
    desc.push_back(XL("VideoHwdecState3300Test", VideoHwdecState3300Test));
    desc.push_back(XL("VideoHwdecState3400Test", VideoHwdecState3400Test));
    desc.push_back(XL("VideoHwdecState3500Test", VideoHwdecState3500Test));
    desc.push_back(XL("VideoHwdecState3600Test", VideoHwdecState3600Test));
    desc.push_back(XL("VideoHwdecState3700Test", VideoHwdecState3700Test));
    desc.push_back(XL("VideoHwdecState3800Test", VideoHwdecState3800Test));
    desc.push_back(XL("VideoHwdecState3900Test", VideoHwdecState3900Test));
    desc.push_back(XL("VideoHwdecState4000Test", VideoHwdecState4000Test));
    desc.push_back(XL("VideoHwdecState4100Test", VideoHwdecState4100Test));
    desc.push_back(XL("VideoHwdecState4200Test", VideoHwdecState4200Test));
}

static napi_value InitTests(napi_env env, napi_callback_info info)
{
    InitApiTest();
    InitFunc2Test();
    InitFuncTest();
    InitStateTest();
    InitHwdecHdr2sdrTest();
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
    InitPush8(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
