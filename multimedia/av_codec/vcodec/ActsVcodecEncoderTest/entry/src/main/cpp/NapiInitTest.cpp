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
#include "include/ConfigureTest.h"
#include "include/GetparamTest.h"
#include "include/StateTest.h"
#include "include/TemporalTest.h"
#include "include/Func2Test.h"
#include "include/FuncTest.h"
#include "include/FuncTest2.h"
#include "include/SetparamTest.h"
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

// ====== Registration functions ======
static void InitPush1(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoEncodeIllegalPara0100Test", VideoEncodeIllegalPara0100Test));
    desc.push_back(XL("VideoEncodeIllegalPara0200Test", VideoEncodeIllegalPara0200Test));
    desc.push_back(XL("VideoEncodeIllegalPara0300Test", VideoEncodeIllegalPara0300Test));
    desc.push_back(XL("VideoEncodeIllegalPara0400Test", VideoEncodeIllegalPara0400Test));
    desc.push_back(XL("VideoEncodeIllegalPara0500Test", VideoEncodeIllegalPara0500Test));
    desc.push_back(XL("VideoEncodeIllegalPara0600Test", VideoEncodeIllegalPara0600Test));
    desc.push_back(XL("VideoEncodeIllegalPara0700Test", VideoEncodeIllegalPara0700Test));
    desc.push_back(XL("VideoEncodeIllegalPara0800Test", VideoEncodeIllegalPara0800Test));
    desc.push_back(XL("VideoEncodeIllegalPara0900Test", VideoEncodeIllegalPara0900Test));
    desc.push_back(XL("VideoEncodeIllegalPara1100Test", VideoEncodeIllegalPara1100Test));
    desc.push_back(XL("VideoEncodeIllegalPara1400Test", VideoEncodeIllegalPara1400Test));
    desc.push_back(XL("VideoEncodeIllegalPara1500Test", VideoEncodeIllegalPara1500Test));
    desc.push_back(XL("VideoEncodeIllegalPara1600Test", VideoEncodeIllegalPara1600Test));
    desc.push_back(XL("VideoEncodeIllegalPara1700Test", VideoEncodeIllegalPara1700Test));
    desc.push_back(XL("VideoEncodeIllegalPara1800Test", VideoEncodeIllegalPara1800Test));
    desc.push_back(XL("VideoEncodeIllegalPara1900Test", VideoEncodeIllegalPara1900Test));
    desc.push_back(XL("VideoEncodeIllegalPara2000Test", VideoEncodeIllegalPara2000Test));
    desc.push_back(XL("VideoEncodeIllegalPara2100Test", VideoEncodeIllegalPara2100Test));
    desc.push_back(XL("VideoEncodeIllegalPara2200Test", VideoEncodeIllegalPara2200Test));
    desc.push_back(XL("VideoEncodeIllegalPara2300Test", VideoEncodeIllegalPara2300Test));
    desc.push_back(XL("VideoEncodeIllegalPara2400Test", VideoEncodeIllegalPara2400Test));
    desc.push_back(XL("VideoEncodeIllegalPara2500Test", VideoEncodeIllegalPara2500Test));
    desc.push_back(XL("VideoEncodeIllegalPara2600Test", VideoEncodeIllegalPara2600Test));
    desc.push_back(XL("VideoEncodeIllegalPara2700Test", VideoEncodeIllegalPara2700Test));
    desc.push_back(XL("VideoEncodeIllegalPara2800Test", VideoEncodeIllegalPara2800Test));
    desc.push_back(XL("VideoEncodeIllegalPara2900Test", VideoEncodeIllegalPara2900Test));
    desc.push_back(XL("VideoEncodeApi0100Test", VideoEncodeApi0100Test));
    desc.push_back(XL("VideoEncodeApi3100Test", VideoEncodeApi3100Test));
    desc.push_back(XL("VideoEncodeApi0200Test", VideoEncodeApi0200Test));
    desc.push_back(XL("VideoEncodeApi0300Test", VideoEncodeApi0300Test));
    desc.push_back(XL("VideoEncodeApi0400Test", VideoEncodeApi0400Test));
    desc.push_back(XL("VideoEncodeApi0500Test", VideoEncodeApi0500Test));
    desc.push_back(XL("VideoEncodeApi0600Test", VideoEncodeApi0600Test));
    desc.push_back(XL("VideoEncodeApi0700Test", VideoEncodeApi0700Test));
    desc.push_back(XL("VideoEncodeApi0800Test", VideoEncodeApi0800Test));
    desc.push_back(XL("VideoEncodeApi0900Test", VideoEncodeApi0900Test));
    desc.push_back(XL("VideoEncodeApi1000Test", VideoEncodeApi1000Test));
    desc.push_back(XL("VideoEncodeApi1100Test", VideoEncodeApi1100Test));
    desc.push_back(XL("VideoEncodeApi1200Test", VideoEncodeApi1200Test));
    desc.push_back(XL("VideoEncodeApi1300Test", VideoEncodeApi1300Test));
}

static void InitPush2(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoEncodeApi1400Test", VideoEncodeApi1400Test));
    desc.push_back(XL("VideoEncodeApi1410Test", VideoEncodeApi1410Test));
    desc.push_back(XL("VideoEncodeSyncApi0010Test", VideoEncodeSyncApi0010Test));
    desc.push_back(XL("VideoEncodeSyncApi0020Test", VideoEncodeSyncApi0020Test));
    desc.push_back(XL("VideoEncodeSyncApi0030Test", VideoEncodeSyncApi0030Test));
    desc.push_back(XL("VideoEncodeSyncApi0040Test", VideoEncodeSyncApi0040Test));
    desc.push_back(XL("VideoEncodeSyncApi0050Test", VideoEncodeSyncApi0050Test));
    desc.push_back(XL("VideoEncodeSyncApi0060Test", VideoEncodeSyncApi0060Test));
    desc.push_back(XL("VideoEncodeSyncApi0070Test", VideoEncodeSyncApi0070Test));
    desc.push_back(XL("VideoEncodeSyncApi0080Test", VideoEncodeSyncApi0080Test));
    desc.push_back(XL("VideoEncodeApiAdd0010", VideoEncodeApiAdd0010));
    desc.push_back(XL("VideoEncodeApiAdd0020", VideoEncodeApiAdd0020));
    desc.push_back(XL("VideoEncodeApiAdd0030", VideoEncodeApiAdd0030));
    desc.push_back(XL("VideoEncodeApiAdd0040", VideoEncodeApiAdd0040));
    desc.push_back(XL("VideoEncodeApiAdd0050", VideoEncodeApiAdd0050));
    desc.push_back(XL("VideoEncodeApiDual0100", VideoEncodeApiDual0100));
    desc.push_back(XL("VideoEncodeApiDual0200", VideoEncodeApiDual0200));
    desc.push_back(XL("VideoEncodeApiDual0300", VideoEncodeApiDual0300));
    desc.push_back(XL("VideoEncodeApiDual0400", VideoEncodeApiDual0400));
    desc.push_back(XL("VideoEncodeApiDual0500", VideoEncodeApiDual0500));
    desc.push_back(XL("VideoEncodeApiDual0600", VideoEncodeApiDual0600));
    desc.push_back(XL("VideoEncodeApiDual0700", VideoEncodeApiDual0700));
    desc.push_back(XL("VideoEncodeApiDual0800", VideoEncodeApiDual0800));
    desc.push_back(XL("VideoEncodeFunction0100Test", VideoEncodeFunction0100Test));
    desc.push_back(XL("VideoEncodeFunction0200Test", VideoEncodeFunction0200Test));
    desc.push_back(XL("VideoEncodeFunction0300Test", VideoEncodeFunction0300Test));
    desc.push_back(XL("VideoEncodeFunction0400Test", VideoEncodeFunction0400Test));
    desc.push_back(XL("VideoEncodeFunction0500Test", VideoEncodeFunction0500Test));
    desc.push_back(XL("VideoEncodeFunction0600Test", VideoEncodeFunction0600Test));
    desc.push_back(XL("VideoEncodeFunction0700Test", VideoEncodeFunction0700Test));
    desc.push_back(XL("VideoEncodeFunction0800Test", VideoEncodeFunction0800Test));
    desc.push_back(XL("VideoEncodeFunction0810Test", VideoEncodeFunction0810Test));
    desc.push_back(XL("VideoEncodeFunction0900Test", VideoEncodeFunction0900Test));
    desc.push_back(XL("VideoEncodeFunction1000Test", VideoEncodeFunction1000Test));
    desc.push_back(XL("VideoEncodeFunction1100Test", VideoEncodeFunction1100Test));
    desc.push_back(XL("VideoEncodeFunction1400Test", VideoEncodeFunction1400Test));
    desc.push_back(XL("VideoEncodeFunction1600Test", VideoEncodeFunction1600Test));
    desc.push_back(XL("VideoEncodeFunction1700Test", VideoEncodeFunction1700Test));
    desc.push_back(XL("VideoEncodeFunction1800Test", VideoEncodeFunction1800Test));
    desc.push_back(XL("VideoEncodeFunction2000Test", VideoEncodeFunction2000Test));
    desc.push_back(XL("VideoEncodeFunction1900Test", VideoEncodeFunction1900Test));
}

static void InitPush3(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoEncodeCapability0100Test", VideoEncodeCapability0100Test));
    desc.push_back(XL("VideoEncodeCapability0200Test", VideoEncodeCapability0200Test));
    desc.push_back(XL("VideoEncodeCapability0300Test", VideoEncodeCapability0300Test));
    desc.push_back(XL("VideoEncodeCapability0400Test", VideoEncodeCapability0400Test));
    desc.push_back(XL("VideoEncodeCapability0500Test", VideoEncodeCapability0500Test));
    desc.push_back(XL("VideoEncodeCapability9900Test", VideoEncodeCapability9900Test));
    desc.push_back(XL("VideoEncodeCapability0600Test", VideoEncodeCapability0600Test));
    desc.push_back(XL("VideoEncodeCapability0700Test", VideoEncodeCapability0700Test));
    desc.push_back(XL("VideoEncodeCapability0800Test", VideoEncodeCapability0800Test));
    desc.push_back(XL("VideoEncodeCapability0900Test", VideoEncodeCapability0900Test));
    desc.push_back(XL("VideoEncodeCapability1000Test", VideoEncodeCapability1000Test));
    desc.push_back(XL("VideoEncodeCapability1100Test", VideoEncodeCapability1100Test));
    desc.push_back(XL("VideoEncodeCapability1200Test", VideoEncodeCapability1200Test));
    desc.push_back(XL("VideoEncodeCapability1300Test", VideoEncodeCapability1300Test));
    desc.push_back(XL("VideoEncodeCapability1310Test", VideoEncodeCapability1310Test));
    desc.push_back(XL("VideoEncodeCapability1400Test", VideoEncodeCapability1400Test));
    desc.push_back(XL("VideoEncodeCapability1500Test", VideoEncodeCapability1500Test));
    desc.push_back(XL("VideoEncodeCapability1700Test", VideoEncodeCapability1700Test));
    desc.push_back(XL("VideoEncodeCapability1800Test", VideoEncodeCapability1800Test));
    desc.push_back(XL("VideoEncodeCapability1900Test", VideoEncodeCapability1900Test));
    desc.push_back(XL("VideoEncodeCapability8400Test", VideoEncodeCapability8400Test));
    desc.push_back(XL("VideoEncodeCapability8500Test", VideoEncodeCapability8500Test));
    desc.push_back(XL("VideoEncodeCapability8600Test", VideoEncodeCapability8600Test));
    desc.push_back(XL("VideoEncodeCapability2000Test", VideoEncodeCapability2000Test));
    desc.push_back(XL("VideoEncodeCapability2100Test", VideoEncodeCapability2100Test));
    desc.push_back(XL("VideoEncodeCapability2200Test", VideoEncodeCapability2200Test));
    desc.push_back(XL("VideoEncodeCapability2300Test", VideoEncodeCapability2300Test));
    desc.push_back(XL("VideoEncodeCapability2400Test", VideoEncodeCapability2400Test));
    desc.push_back(XL("VideoEncodeCapability2500Test", VideoEncodeCapability2500Test));
    desc.push_back(XL("VideoEncodeCapability2700Test", VideoEncodeCapability2700Test));
    desc.push_back(XL("VideoEncodeCapability2800Test", VideoEncodeCapability2800Test));
    desc.push_back(XL("VideoEncodeCapability3100Test", VideoEncodeCapability3100Test));
    desc.push_back(XL("VideoEncodeCapability3200Test", VideoEncodeCapability3200Test));
    desc.push_back(XL("VideoEncodeCapability3300Test", VideoEncodeCapability3300Test));
    desc.push_back(XL("VideoEncodeCapability3400Test", VideoEncodeCapability3400Test));
    desc.push_back(XL("VideoEncodeCapability3500Test", VideoEncodeCapability3500Test));
    desc.push_back(XL("VideoEncodeCapability3600Test", VideoEncodeCapability3600Test));
    desc.push_back(XL("VideoEncodeCapability3700Test", VideoEncodeCapability3700Test));
    desc.push_back(XL("VideoEncodeCapability3800Test", VideoEncodeCapability3800Test));
    desc.push_back(XL("VideoEncodeCapability3900Test", VideoEncodeCapability3900Test));
}

static void InitPush4(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoEncodeCapability4100Test", VideoEncodeCapability4100Test));
    desc.push_back(XL("VideoEncodeCapability4200Test", VideoEncodeCapability4200Test));
    desc.push_back(XL("VideoEncodeCapability4300Test", VideoEncodeCapability4300Test));
    desc.push_back(XL("VideoEncodeCapability4500Test", VideoEncodeCapability4500Test));
    desc.push_back(XL("VideoEncodeCapability4600Test", VideoEncodeCapability4600Test));
    desc.push_back(XL("VideoEncodeCapability4800Test", VideoEncodeCapability4800Test));
    desc.push_back(XL("VideoEncodeCapability4900Test", VideoEncodeCapability4900Test));
    desc.push_back(XL("VideoEncodeCapability9800Test", VideoEncodeCapability9800Test));
    desc.push_back(XL("VideoEncodeCapability5100Test", VideoEncodeCapability5100Test));
    desc.push_back(XL("VideoEncodeCapability5200Test", VideoEncodeCapability5200Test));
    desc.push_back(XL("VideoEncodeCapability5300Test", VideoEncodeCapability5300Test));
    desc.push_back(XL("VideoEncodeCapability5400Test", VideoEncodeCapability5400Test));
    desc.push_back(XL("VideoEncodeCapability5500Test", VideoEncodeCapability5500Test));
    desc.push_back(XL("VideoEncodeCapability5600Test", VideoEncodeCapability5600Test));
    desc.push_back(XL("VideoEncodeCapability5700Test", VideoEncodeCapability5700Test));
    desc.push_back(XL("VideoEncodeCapability5800Test", VideoEncodeCapability5800Test));
    desc.push_back(XL("VideoEncodeCapability5900Test", VideoEncodeCapability5900Test));
    desc.push_back(XL("VideoEncodeCapability6000Test", VideoEncodeCapability6000Test));
    desc.push_back(XL("VideoEncodeCapability6100Test", VideoEncodeCapability6100Test));
    desc.push_back(XL("VideoEncodeCapability6200Test", VideoEncodeCapability6200Test));
    desc.push_back(XL("VideoEncodeCapability6300Test", VideoEncodeCapability6300Test));
    desc.push_back(XL("VideoEncodeCapability6400Test", VideoEncodeCapability6400Test));
    desc.push_back(XL("VideoEncodeCapability6500Test", VideoEncodeCapability6500Test));
    desc.push_back(XL("VideoEncodeCapability6600Test", VideoEncodeCapability6600Test));
    desc.push_back(XL("VideoEncodeCapability6700Test", VideoEncodeCapability6700Test));
    desc.push_back(XL("VideoEncodeCapability6800Test", VideoEncodeCapability6800Test));
    desc.push_back(XL("VideoEncodeCapability6900Test", VideoEncodeCapability6900Test));
    desc.push_back(XL("VideoEncodeCapability7000Test", VideoEncodeCapability7000Test));
    desc.push_back(XL("VideoEncodeCapability7100Test", VideoEncodeCapability7100Test));
    desc.push_back(XL("VideoEncodeCapability7200Test", VideoEncodeCapability7200Test));
    desc.push_back(XL("VideoEncodeCapability7300Test", VideoEncodeCapability7300Test));
    desc.push_back(XL("VideoEncodeCapability7400Test", VideoEncodeCapability7400Test));
    desc.push_back(XL("VideoEncodeCapability7500Test", VideoEncodeCapability7500Test));
    desc.push_back(XL("VideoEncodeCapability7600Test", VideoEncodeCapability7600Test));
    desc.push_back(XL("VideoEncodeCapability7700Test", VideoEncodeCapability7700Test));
    desc.push_back(XL("VideoEncodeCapability7800Test", VideoEncodeCapability7800Test));
    desc.push_back(XL("VideoEncodeCapability7900Test", VideoEncodeCapability7900Test));
    desc.push_back(XL("VideoEncodeCapability8000Test", VideoEncodeCapability8000Test));
    desc.push_back(XL("VideoEncodeCapability8100Test", VideoEncodeCapability8100Test));
    desc.push_back(XL("VideoEncodeCapability8200Test", VideoEncodeCapability8200Test));
}

static void InitPush5(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoEncodeCapability8300Test", VideoEncodeCapability8300Test));
    desc.push_back(XL("VideoEncodeHevcCapability0100Test", VideoEncodeHevcCapability0100Test));
    desc.push_back(XL("VideoEncodeHevcCapability0200Test", VideoEncodeHevcCapability0200Test));
    desc.push_back(XL("VideoEncodeHevcCapability0300Test", VideoEncodeHevcCapability0300Test));
    desc.push_back(XL("VideoEncodeHevcCapability0400Test", VideoEncodeHevcCapability0400Test));
    desc.push_back(XL("VideoEncodeHevcCapability0500Test", VideoEncodeHevcCapability0500Test));
    desc.push_back(XL("VideoEncodeHevcCapability0600Test", VideoEncodeHevcCapability0600Test));
    desc.push_back(XL("VideoEncodeHevcCapability0700Test", VideoEncodeHevcCapability0700Test));
    desc.push_back(XL("VideoEncodeHevcCapability5200Test", VideoEncodeHevcCapability5200Test));
    desc.push_back(XL("VideoEncodeHevcCapability5300Test", VideoEncodeHevcCapability5300Test));
    desc.push_back(XL("VideoEncodeHevcCapability5400Test", VideoEncodeHevcCapability5400Test));
    desc.push_back(XL("VideoEncodeHevcCapability0800Test", VideoEncodeHevcCapability0800Test));
    desc.push_back(XL("VideoEncodeHevcCapability0900Test", VideoEncodeHevcCapability0900Test));
    desc.push_back(XL("VideoEncodeHevcCapability1000Test", VideoEncodeHevcCapability1000Test));
    desc.push_back(XL("VideoEncodeHevcCapability1100Test", VideoEncodeHevcCapability1100Test));
    desc.push_back(XL("VideoEncodeHevcCapability1200Test", VideoEncodeHevcCapability1200Test));
    desc.push_back(XL("VideoEncodeHevcCapability1300Test", VideoEncodeHevcCapability1300Test));
    desc.push_back(XL("VideoEncodeHevcCapability1400Test", VideoEncodeHevcCapability1400Test));
    desc.push_back(XL("VideoEncodeHevcCapability1500Test", VideoEncodeHevcCapability1500Test));
    desc.push_back(XL("VideoEncodeHevcCapability1600Test", VideoEncodeHevcCapability1600Test));
    desc.push_back(XL("VideoEncodeHevcCapability1700Test", VideoEncodeHevcCapability1700Test));
    desc.push_back(XL("VideoEncodeHevcCapability1900Test", VideoEncodeHevcCapability1900Test));
    desc.push_back(XL("VideoEncodeHevcCapability2000Test", VideoEncodeHevcCapability2000Test));
    desc.push_back(XL("VideoEncodeHevcCapability2100Test", VideoEncodeHevcCapability2100Test));
    desc.push_back(XL("VideoEncodeHevcCapability2200Test", VideoEncodeHevcCapability2200Test));
    desc.push_back(XL("VideoEncodeHevcCapability2300Test", VideoEncodeHevcCapability2300Test));
    desc.push_back(XL("VideoEncodeHevcCapability2400Test", VideoEncodeHevcCapability2400Test));
    desc.push_back(XL("VideoEncodeHevcCapability2500Test", VideoEncodeHevcCapability2500Test));
    desc.push_back(XL("VideoEncodeHevcCapability2600Test", VideoEncodeHevcCapability2600Test));
    desc.push_back(XL("VideoEncodeHevcCapability2700Test", VideoEncodeHevcCapability2700Test));
    desc.push_back(XL("VideoEncodeHevcCapability2800Test", VideoEncodeHevcCapability2800Test));
    desc.push_back(XL("VideoEncodeHevcCapability2900Test", VideoEncodeHevcCapability2900Test));
    desc.push_back(XL("VideoEncodeHevcCapability3000Test", VideoEncodeHevcCapability3000Test));
    desc.push_back(XL("VideoEncodeSetMaxFrameDelayCount0100Test", VideoEncodeSetMaxFrameDelayCount0100Test));
    desc.push_back(XL("VideoEncodeSetMaxFrameDelayCount0200Test", VideoEncodeSetMaxFrameDelayCount0200Test));
    desc.push_back(XL("VideoEncodeSetMaxFrameDelayCount0300Test", VideoEncodeSetMaxFrameDelayCount0300Test));
    desc.push_back(XL("VideoEncodeSetMaxFrameDelayCount0400Test", VideoEncodeSetMaxFrameDelayCount0400Test));
    desc.push_back(XL("VideoEncodeHevcCapability1800Test", VideoEncodeHevcCapability1800Test));
    desc.push_back(XL("VideoEncodeCapability4000Test", VideoEncodeCapability4000Test));
    desc.push_back(XL("VideoEncodeCapability4400Test", VideoEncodeCapability4400Test));
}

static void InitPush6(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoEncodeCapability4410Test", VideoEncodeCapability4410Test));
    desc.push_back(XL("VideoEncodeCapability4700Test", VideoEncodeCapability4700Test));
    desc.push_back(XL("VideoEncodeCapability4710Test", VideoEncodeCapability4710Test));
    desc.push_back(XL("VideoEncodeCapability5000Test", VideoEncodeCapability5000Test));
    desc.push_back(XL("VideoEncodeCapability5010Test", VideoEncodeCapability5010Test));
    desc.push_back(XL("VideoEncodeCapability5020Test", VideoEncodeCapability5020Test));
    desc.push_back(XL("VideoEncodeCapability5030Test", VideoEncodeCapability5030Test));
    desc.push_back(XL("VideoEncodeMseQp0100Test", VideoEncodeMseQp0100Test));
    desc.push_back(XL("VideoEncodeMseQp0200Test", VideoEncodeMseQp0200Test));
    desc.push_back(XL("VideoEncodeMseQp0300Test", VideoEncodeMseQp0300Test));
    desc.push_back(XL("VideoEncodeMseQp0400Test", VideoEncodeMseQp0400Test));
    desc.push_back(XL("VideoEncodeRepeat0100Test", VideoEncodeRepeat0100Test));
    desc.push_back(XL("PreProcess0100", PreProcess0100));
    desc.push_back(XL("PreProcess0200", PreProcess0200));
    desc.push_back(XL("PreProcess0300Test", PreProcess0300Test));
    desc.push_back(XL("RESET_BITRATE_001Test", RESET_BITRATE_001Test));
    desc.push_back(XL("RESET_BITRATE_002Test", RESET_BITRATE_002Test));
    desc.push_back(XL("RESET_BITRATE_003Test", RESET_BITRATE_003Test));
    desc.push_back(XL("RESET_BITRATE_004Test", RESET_BITRATE_004Test));
    desc.push_back(XL("RESET_BITRATE_005Test", RESET_BITRATE_005Test));
    desc.push_back(XL("RESET_BITRATE_006Test", RESET_BITRATE_006Test));
    desc.push_back(XL("RESET_BITRATE_007Test", RESET_BITRATE_007Test));
    desc.push_back(XL("RESET_BITRATE_008Test", RESET_BITRATE_008Test));
    desc.push_back(XL("RESET_BITRATE_009Test", RESET_BITRATE_009Test));
    desc.push_back(XL("RESET_BITRATE_010Test", RESET_BITRATE_010Test));
    desc.push_back(XL("RESET_BITRATE_011Test", RESET_BITRATE_011Test));
    desc.push_back(XL("RESET_BITRATE_012Test", RESET_BITRATE_012Test));
    desc.push_back(XL("RESET_FRAMERATE_001Test", RESET_FRAMERATE_001Test));
    desc.push_back(XL("RESET_FRAMERATE_012Test", RESET_FRAMERATE_012Test));
    desc.push_back(XL("RESET_FRAMERATE_013Test", RESET_FRAMERATE_013Test));
    desc.push_back(XL("RESET_FRAMERATE_014Test", RESET_FRAMERATE_014Test));
    desc.push_back(XL("RESET_FRAMERATE_002Test", RESET_FRAMERATE_002Test));
    desc.push_back(XL("RESET_FRAMERATE_003Test", RESET_FRAMERATE_003Test));
    desc.push_back(XL("RESET_FRAMERATE_004Test", RESET_FRAMERATE_004Test));
    desc.push_back(XL("RESET_FRAMERATE_005Test", RESET_FRAMERATE_005Test));
    desc.push_back(XL("RESET_FRAMERATE_006Test", RESET_FRAMERATE_006Test));
    desc.push_back(XL("RESET_FRAMERATE_007Test", RESET_FRAMERATE_007Test));
    desc.push_back(XL("RESET_FRAMERATE_008Test", RESET_FRAMERATE_008Test));
    desc.push_back(XL("RESET_FRAMERATE_009Test", RESET_FRAMERATE_009Test));
    desc.push_back(XL("RESET_FRAMERATE_010Test", RESET_FRAMERATE_010Test));
}

static void InitPush7(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("RESET_FRAMERATE_011Test", RESET_FRAMERATE_011Test));
    desc.push_back(XL("RESET_QP_001Test", RESET_QP_001Test));
    desc.push_back(XL("RESET_QP_002Test", RESET_QP_002Test));
    desc.push_back(XL("RESET_QP_003Test", RESET_QP_003Test));
    desc.push_back(XL("RESET_QP_004Test", RESET_QP_004Test));
    desc.push_back(XL("RESET_QP_005Test", RESET_QP_005Test));
    desc.push_back(XL("RESET_QP_006Test", RESET_QP_006Test));
    desc.push_back(XL("RESET_QP_007Test", RESET_QP_007Test));
    desc.push_back(XL("RESET_QP_008Test", RESET_QP_008Test));
    desc.push_back(XL("RESET_QP_009Test", RESET_QP_009Test));
    desc.push_back(XL("RESET_QP_010Test", RESET_QP_010Test));
    desc.push_back(XL("RESET_QP_011Test", RESET_QP_011Test));
    desc.push_back(XL("RESET_QP_012Test", RESET_QP_012Test));
    desc.push_back(XL("RESET_QP_013Test", RESET_QP_013Test));
    desc.push_back(XL("RESET_QP_014Test", RESET_QP_014Test));
    desc.push_back(XL("SET_PROFILE_001Test", SET_PROFILE_001Test));
    desc.push_back(XL("SET_PROFILE_002Test", SET_PROFILE_002Test));
    desc.push_back(XL("SET_PROFILE_003Test", SET_PROFILE_003Test));
    desc.push_back(XL("SET_PROFILE_004Test", SET_PROFILE_004Test));
    desc.push_back(XL("SET_PROFILE_005Test", SET_PROFILE_005Test));
    desc.push_back(XL("SET_RANGE_FLAG_001Test", SET_RANGE_FLAG_001Test));
    desc.push_back(XL("SET_RANGE_FLAG_002Test", SET_RANGE_FLAG_002Test));
    desc.push_back(XL("SET_COLORSPACE_001Test", SET_COLORSPACE_001Test));
    desc.push_back(XL("SET_COLORSPACE_002Test", SET_COLORSPACE_002Test));
    desc.push_back(XL("SET_FORCE_IDR_001Test", SET_FORCE_IDR_001Test));
    desc.push_back(XL("SET_FORCE_IDR_002Test", SET_FORCE_IDR_002Test));
    desc.push_back(XL("COLORSPACE_CONFIG_001Test", COLORSPACE_CONFIG_001Test));
    desc.push_back(XL("COLORSPACE_CONFIG_002Test", COLORSPACE_CONFIG_002Test));
    desc.push_back(XL("COLORSPACE_CONFIG_003Test", COLORSPACE_CONFIG_003Test));
    desc.push_back(XL("COLORSPACE_CONFIG_004Test", COLORSPACE_CONFIG_004Test));
    desc.push_back(XL("COLORSPACE_CONFIG_005Test", COLORSPACE_CONFIG_005Test));
    desc.push_back(XL("COLORSPACE_CONFIG_006Test", COLORSPACE_CONFIG_006Test));
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_001Test", COLORSPACE_CONFIG_ADD_001Test));
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_002Test", COLORSPACE_CONFIG_ADD_002Test));
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_003Test", COLORSPACE_CONFIG_ADD_003Test));
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_004Test", COLORSPACE_CONFIG_ADD_004Test));
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_005Test", COLORSPACE_CONFIG_ADD_005Test));
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_006Test", COLORSPACE_CONFIG_ADD_006Test));
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_007Test", COLORSPACE_CONFIG_ADD_007Test));
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_008Test", COLORSPACE_CONFIG_ADD_008Test));
}

static void InitPush8(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_009Test", COLORSPACE_CONFIG_ADD_009Test));
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_010Test", COLORSPACE_CONFIG_ADD_010Test));
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_011Test", COLORSPACE_CONFIG_ADD_011Test));
    desc.push_back(XL("COLORSPACE_CONFIG_ADD_012Test", COLORSPACE_CONFIG_ADD_012Test));
    desc.push_back(XL("FRAMENUM_JUDGMENT_001Test", FRAMENUM_JUDGMENT_001Test));
    desc.push_back(XL("FRAMENUM_JUDGMENT_002Test", FRAMENUM_JUDGMENT_002Test));
    desc.push_back(XL("VideoEncodeState0100Test", VideoEncodeState0100Test));
    desc.push_back(XL("VideoEncodeState0101Test", VideoEncodeState0101Test));
    desc.push_back(XL("VideoEncodeState0200Test", VideoEncodeState0200Test));
    desc.push_back(XL("VideoEncodeState0300Test", VideoEncodeState0300Test));
    desc.push_back(XL("VideoEncodeState0400Test", VideoEncodeState0400Test));
    desc.push_back(XL("VideoEncodeState0500Test", VideoEncodeState0500Test));
    desc.push_back(XL("VideoEncodeState0600Test", VideoEncodeState0600Test));
    desc.push_back(XL("VideoEncodeState0700Test", VideoEncodeState0700Test));
    desc.push_back(XL("VideoEncodeState0800Test", VideoEncodeState0800Test));
    desc.push_back(XL("VideoEncodeState0900Test", VideoEncodeState0900Test));
    desc.push_back(XL("VideoEncodeState1000Test", VideoEncodeState1000Test));
    desc.push_back(XL("VideoEncodeState1100Test", VideoEncodeState1100Test));
    desc.push_back(XL("VideoEncodeState1200Test", VideoEncodeState1200Test));
    desc.push_back(XL("VideoEncodeState1300Test", VideoEncodeState1300Test));
    desc.push_back(XL("VideoEncodeState1400Test", VideoEncodeState1400Test));
    desc.push_back(XL("VideoEncodeState1500Test", VideoEncodeState1500Test));
    desc.push_back(XL("VideoEncodeState1600Test", VideoEncodeState1600Test));
    desc.push_back(XL("VideoEncodeState1700Test", VideoEncodeState1700Test));
    desc.push_back(XL("VideoEncodeState1800Test", VideoEncodeState1800Test));
    desc.push_back(XL("VideoEncodeState1900Test", VideoEncodeState1900Test));
    desc.push_back(XL("VideoEncodeState2000Test", VideoEncodeState2000Test));
    desc.push_back(XL("VideoEncodeState2100Test", VideoEncodeState2100Test));
    desc.push_back(XL("VideoEncodeState2200Test", VideoEncodeState2200Test));
    desc.push_back(XL("VideoEncodeState2300Test", VideoEncodeState2300Test));
    desc.push_back(XL("VideoEncodeState2400Test", VideoEncodeState2400Test));
    desc.push_back(XL("VideoEncodeState2500Test", VideoEncodeState2500Test));
    desc.push_back(XL("VideoEncodeState2600Test", VideoEncodeState2600Test));
    desc.push_back(XL("VideoEncodeState2700Test", VideoEncodeState2700Test));
    desc.push_back(XL("VideoEncodeState2800Test", VideoEncodeState2800Test));
    desc.push_back(XL("VideoEncodeState2900Test", VideoEncodeState2900Test));
    desc.push_back(XL("VideoEncodeState3000Test", VideoEncodeState3000Test));
    desc.push_back(XL("VideoEncodeState3100Test", VideoEncodeState3100Test));
    desc.push_back(XL("VideoEncodeState3200Test", VideoEncodeState3200Test));
    desc.push_back(XL("VideoEncodeState3300Test", VideoEncodeState3300Test));
}

static void InitPush9(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoEncodeState3400Test", VideoEncodeState3400Test));
    desc.push_back(XL("VideoEncodeState3500Test", VideoEncodeState3500Test));
    desc.push_back(XL("VideoEncodeState3600Test", VideoEncodeState3600Test));
    desc.push_back(XL("VideoEncodeState3700Test", VideoEncodeState3700Test));
    desc.push_back(XL("VideoEncodeState3800Test", VideoEncodeState3800Test));
    desc.push_back(XL("VideoEncodeState3900Test", VideoEncodeState3900Test));
    desc.push_back(XL("VideoEncodeState4000Test", VideoEncodeState4000Test));
    desc.push_back(XL("VideoTemporalEncodeApi0020Test", VideoTemporalEncodeApi0020Test));
    desc.push_back(XL("VideoTemporalEncodeApi0030Test", VideoTemporalEncodeApi0030Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0010Test", VideoTemporalEncodeFunction0010Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0020Test", VideoTemporalEncodeFunction0020Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0030Test", VideoTemporalEncodeFunction0030Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0040Test", VideoTemporalEncodeFunction0040Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0440Test", VideoTemporalEncodeFunction0440Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0050Test", VideoTemporalEncodeFunction0050Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0060Test", VideoTemporalEncodeFunction0060Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0070Test", VideoTemporalEncodeFunction0070Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0080Test", VideoTemporalEncodeFunction0080Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0090Test", VideoTemporalEncodeFunction0090Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0100Test", VideoTemporalEncodeFunction0100Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0110Test", VideoTemporalEncodeFunction0110Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0120Test", VideoTemporalEncodeFunction0120Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0130Test", VideoTemporalEncodeFunction0130Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0140Test", VideoTemporalEncodeFunction0140Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0150Test", VideoTemporalEncodeFunction0150Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0160Test", VideoTemporalEncodeFunction0160Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0170Test", VideoTemporalEncodeFunction0170Test));
    desc.push_back(XL("VideoTemporalEncodeFunction0180Test", VideoTemporalEncodeFunction0180Test));
    desc.push_back(XL("LTR_FUNC_001Test", LTR_FUNC_001Test));
    desc.push_back(XL("LTR_FUNC_002Test", LTR_FUNC_002Test));
    desc.push_back(XL("LTR_FUNC_004Test", LTR_FUNC_004Test));
    desc.push_back(XL("LTR_FUNC_005Test", LTR_FUNC_005Test));
    desc.push_back(XL("LTR_FUNC_006Test", LTR_FUNC_006Test));
    desc.push_back(XL("LTR_FUNC_007Test", LTR_FUNC_007Test));
    desc.push_back(XL("LTR_FUNC_008Test", LTR_FUNC_008Test));
    desc.push_back(XL("LTR_FUNC_009Test", LTR_FUNC_009Test));
    desc.push_back(XL("LTR_FUNC_010Test", LTR_FUNC_010Test));
    desc.push_back(XL("LTR_FUNC_011Test", LTR_FUNC_011Test));
    desc.push_back(XL("LTR_FUNC_012Test", LTR_FUNC_012Test));
    desc.push_back(XL("LTR_FUNC_013Test", LTR_FUNC_013Test));
}

static void InitPush10(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("LTR_FUNC_014Test", LTR_FUNC_014Test));
    desc.push_back(XL("LTR_FUNC_015Test", LTR_FUNC_015Test));
    desc.push_back(XL("LTR_FUNC_016Test", LTR_FUNC_016Test));
    desc.push_back(XL("VideoUniformlyEncodeFunction0100Test", VideoUniformlyEncodeFunction0100Test));
    desc.push_back(XL("VideoUniformlyEncodeFunction0200Test", VideoUniformlyEncodeFunction0200Test));
    desc.push_back(XL("VideoUniformlyEncodeFunction0300Test", VideoUniformlyEncodeFunction0300Test));
    desc.push_back(XL("VideoUniformlyEncodeFunction0400Test", VideoUniformlyEncodeFunction0400Test));
    desc.push_back(XL("VideoUniformlyEncodeFunction0500Test", VideoUniformlyEncodeFunction0500Test));
    desc.push_back(XL("VideoUniformlyEncodeFunction0600Test", VideoUniformlyEncodeFunction0600Test));
    desc.push_back(XL("VideoUniformlyEncodeFunction0700Test", VideoUniformlyEncodeFunction0700Test));
    desc.push_back(XL("VideoUniformlyEncodeFunction0800Test", VideoUniformlyEncodeFunction0800Test));
    desc.push_back(XL("VideoUniformlyEncodeFunction0900Test", VideoUniformlyEncodeFunction0900Test));
    desc.push_back(XL("VideoUniformlyEncodeFunction1000Test", VideoUniformlyEncodeFunction1000Test));
    desc.push_back(XL("VideoEncodeHevcCapability3100Test", VideoEncodeHevcCapability3100Test));
    desc.push_back(XL("VideoEncodeHevcCapability3200Test", VideoEncodeHevcCapability3200Test));
    desc.push_back(XL("VideoEncodeHevcCapability3300Test", VideoEncodeHevcCapability3300Test));
    desc.push_back(XL("VideoEncodeHevcCapability3400Test", VideoEncodeHevcCapability3400Test));
    desc.push_back(XL("VideoEncodeHevcCapability3500Test", VideoEncodeHevcCapability3500Test));
    desc.push_back(XL("VideoEncodeHevcCapability3600Test", VideoEncodeHevcCapability3600Test));
    desc.push_back(XL("VideoEncodeHevcCapability3700Test", VideoEncodeHevcCapability3700Test));
    desc.push_back(XL("VideoEncodeHevcCapability3800Test", VideoEncodeHevcCapability3800Test));
    desc.push_back(XL("VideoEncodeHevcCapability3900Test", VideoEncodeHevcCapability3900Test));
    desc.push_back(XL("VideoEncodeHevcCapability4000Test", VideoEncodeHevcCapability4000Test));
    desc.push_back(XL("VideoEncodeHevcCapability4100Test", VideoEncodeHevcCapability4100Test));
    desc.push_back(XL("VideoEncodeHevcCapability4200Test", VideoEncodeHevcCapability4200Test));
    desc.push_back(XL("VideoEncodeHevcCapability4300Test", VideoEncodeHevcCapability4300Test));
    desc.push_back(XL("VideoEncodeHevcCapability4400Test", VideoEncodeHevcCapability4400Test));
    desc.push_back(XL("VideoEncodeHevcCapability4500Test", VideoEncodeHevcCapability4500Test));
    desc.push_back(XL("VideoEncodeHevcCapability4600Test", VideoEncodeHevcCapability4600Test));
    desc.push_back(XL("VideoEncodeHevcCapability4700Test", VideoEncodeHevcCapability4700Test));
    desc.push_back(XL("VideoEncodeHevcCapability4800Test", VideoEncodeHevcCapability4800Test));
    desc.push_back(XL("VideoEncodeHevcCapability4900Test", VideoEncodeHevcCapability4900Test));
    desc.push_back(XL("VideoEncodeHevcCapability5000Test", VideoEncodeHevcCapability5000Test));
    desc.push_back(XL("VideoEncodeHevcCapability5100Test", VideoEncodeHevcCapability5100Test));
    desc.push_back(XL("VideoEncodeCapability8700Test", VideoEncodeCapability8700Test));
    desc.push_back(XL("VideoEncodeCapability8800Test", VideoEncodeCapability8800Test));
    desc.push_back(XL("VideoEncodeCapability8900Test", VideoEncodeCapability8900Test));
    desc.push_back(XL("VideoEncodeCapability9000Test", VideoEncodeCapability9000Test));
    desc.push_back(XL("VideoEncodeHevcCapability5500Test", VideoEncodeHevcCapability5500Test));
    desc.push_back(XL("VideoEncodeHevcCapability5600Test", VideoEncodeHevcCapability5600Test));
}

static void InitPush11(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoEncodeHevcCapability5700Test", VideoEncodeHevcCapability5700Test));
    desc.push_back(XL("VideoEncodeHevcCapability5800Test", VideoEncodeHevcCapability5800Test));
    desc.push_back(XL("VideoEncodeHevcCapability5900Test", VideoEncodeHevcCapability5900Test));
    desc.push_back(XL("VideoEncodeSyncFunc0010Test", VideoEncodeSyncFunc0010Test));
    desc.push_back(XL("VideoEncodeSyncFunc0020Test", VideoEncodeSyncFunc0020Test));
    desc.push_back(XL("VideoEncodeSyncFunc0030Test", VideoEncodeSyncFunc0030Test));
    desc.push_back(XL("VideoEncodeSyncFunc0040Test", VideoEncodeSyncFunc0040Test));
    desc.push_back(XL("VideoEncodeSyncFunc0050Test", VideoEncodeSyncFunc0050Test));
    desc.push_back(XL("VideoEncodeSyncFunc0070Test", VideoEncodeSyncFunc0070Test));
    desc.push_back(XL("VideoEncodeSyncFunc0080Test", VideoEncodeSyncFunc0080Test));
    desc.push_back(XL("VideoEncodeSyncFunc0090Test", VideoEncodeSyncFunc0090Test));
    desc.push_back(XL("VideoEncodeSyncFunc0100Test", VideoEncodeSyncFunc0100Test));
    desc.push_back(XL("VideoEncodeSyncFunc0110Test", VideoEncodeSyncFunc0110Test));
    desc.push_back(XL("VideoEncodeSyncFunc0120Test", VideoEncodeSyncFunc0120Test));
    desc.push_back(XL("VideoEncodeSyncFunc0130Test", VideoEncodeSyncFunc0130Test));
    desc.push_back(XL("VideoEncodeSyncFunc0140Test", VideoEncodeSyncFunc0140Test));
    desc.push_back(XL("VideoEncodeSyncFunc0150Test", VideoEncodeSyncFunc0150Test));
    desc.push_back(XL("VideoEncodeSyncFunc0160Test", VideoEncodeSyncFunc0160Test));
    desc.push_back(XL("VideoEncodeSyncFunc0210Test", VideoEncodeSyncFunc0210Test));
    desc.push_back(XL("VideoEncodeSyncFunc0220Test", VideoEncodeSyncFunc0220Test));
    desc.push_back(XL("VideoEncodeSyncFunc0230Test", VideoEncodeSyncFunc0230Test));
    desc.push_back(XL("VideoEncodeSyncFunc0240Test", VideoEncodeSyncFunc0240Test));
    desc.push_back(XL("VideoEncodeSyncFunc0360Test", VideoEncodeSyncFunc0360Test));
    desc.push_back(XL("VideoEncodeSyncFunc0370Test", VideoEncodeSyncFunc0370Test));
    desc.push_back(XL("VideoEncodeSyncFunc0380Test", VideoEncodeSyncFunc0380Test));
    desc.push_back(XL("VideoEncodeSyncFunc0390Test", VideoEncodeSyncFunc0390Test));
    desc.push_back(XL("VideoEncodeSyncFunc0400Test", VideoEncodeSyncFunc0400Test));
    desc.push_back(XL("VideoEncodeSyncFunc0410Test", VideoEncodeSyncFunc0410Test));
    desc.push_back(XL("VideoEncodeRgba10101020010Test", VideoEncodeRgba10101020010Test));
    desc.push_back(XL("VideoEncodeRgba10101020020Test", VideoEncodeRgba10101020020Test));
    desc.push_back(XL("VideoEncodeRgba10101020030Test", VideoEncodeRgba10101020030Test));
    desc.push_back(XL("VideoEncodeRgba10101020040Test", VideoEncodeRgba10101020040Test));
    desc.push_back(XL("VideoEncodeRgba10101020110Test", VideoEncodeRgba10101020110Test));
    desc.push_back(XL("VideoEncodeRgba10101020130Test", VideoEncodeRgba10101020130Test));
    desc.push_back(XL("VideoEncodeRgba10101020150Test", VideoEncodeRgba10101020150Test));
    desc.push_back(XL("VideoEncodeRgba10101020170Test", VideoEncodeRgba10101020170Test));
    desc.push_back(XL("VideoEncodeRgba10101020180Test", VideoEncodeRgba10101020180Test));
    desc.push_back(XL("VideoEncodeRgba10101020190Test", VideoEncodeRgba10101020190Test));
    desc.push_back(XL("VideoEncodeSyncFormat0010Test", VideoEncodeSyncFormat0010Test));
    desc.push_back(XL("VideoEncodeAnother0010Test", VideoEncodeAnother0010Test));
}

static void InitPush12(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("CapabilityConfig0010", CapabilityConfig0010));
    desc.push_back(XL("VideoCapabilityConfig0020Test", VideoCapabilityConfig0020Test));
    desc.push_back(XL("VideoEncoderSetXPS0010Test", VideoEncoderSetXPS0010Test));
    desc.push_back(XL("VideoEncoderSetXPS0020Test", VideoEncoderSetXPS0020Test));
}

static napi_value InitTests(napi_env env, napi_callback_info info)
{
    InitApiTest();
    InitConfigureTest();
    InitGetparamTest();
    InitStateTest();
    InitTemporalTest();
    InitFunc2Test();
    InitFuncTest();
    InitFuncTest2();
    InitSetparamTest();
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    desc.push_back(XL("initTests", InitTests));
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    InitPush4(desc);
    InitPush5(desc);
    InitPush6(desc);
    InitPush7(desc);
    InitPush8(desc);
    InitPush9(desc);
    InitPush10(desc);
    InitPush11(desc);
    InitPush12(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "vcodec_encoder_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
