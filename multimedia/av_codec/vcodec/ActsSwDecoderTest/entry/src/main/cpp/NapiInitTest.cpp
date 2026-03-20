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

#include <cstdint>
#include "include/ActsApiTest.h"
#include "include/ActsFuncTest.h"
#include "include/ActsStateTest.h"
#include "napi/native_api.h"

namespace {
constexpr int32_t RESULT_ERROR = -1;
// G.CNS.02: case index constants to avoid magic numbers
constexpr int kIdx0 = 0;
constexpr int kIdx1 = 1;
constexpr int kIdx2 = 2;
constexpr int kIdx3 = 3;
constexpr int kIdx4 = 4;
constexpr int kIdx5 = 5;
constexpr int kIdx6 = 6;
constexpr int kIdx7 = 7;
constexpr int kIdx8 = 8;
constexpr int kIdx9 = 9;
constexpr int kIdx10 = 10;
constexpr int kIdx11 = 11;
constexpr int kIdx12 = 12;
constexpr int kIdx13 = 13;
constexpr int kIdx14 = 14;
constexpr int kIdx15 = 15;
constexpr int kIdx16 = 16;
constexpr int kIdx17 = 17;
constexpr int kIdx18 = 18;
constexpr int kIdx19 = 19;
constexpr int kIdx20 = 20;
constexpr int kIdx21 = 21;
constexpr int kIdx22 = 22;
constexpr int kIdx23 = 23;
constexpr int kIdx24 = 24;
constexpr int kIdx25 = 25;
constexpr int kIdx26 = 26;
constexpr int kIdx27 = 27;
constexpr int kIdx28 = 28;
constexpr int kIdx29 = 29;
constexpr int kIdx30 = 30;
constexpr int kIdx31 = 31;
constexpr int kIdx32 = 32;
constexpr int kIdx33 = 33;
constexpr int kIdx34 = 34;
constexpr int kIdx35 = 35;
constexpr int kIdx36 = 36;
constexpr int kIdx37 = 37;
constexpr int kIdx38 = 38;
constexpr int kIdx39 = 39;
constexpr int kIdx40 = 40;
constexpr int kIdx41 = 41;
constexpr int kIdx42 = 42;
constexpr int kIdx43 = 43;
constexpr int kIdx44 = 44;
constexpr int kIdx45 = 45;
constexpr int kIdx46 = 46;
constexpr int kIdx47 = 47;
constexpr int kIdx48 = 48;
constexpr int kIdx49 = 49;
constexpr int kIdx50 = 50;

static int32_t GetInt32Arg(napi_env env, napi_callback_info info, size_t index, int32_t defaultVal)
{
    size_t argc = 1;
    napi_value args[1];
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc <= index) {
        return defaultVal;
    }
    napi_valuetype type = napi_undefined;
    if (napi_typeof(env, args[index], &type) != napi_ok || type != napi_number) {
        return defaultVal;
    }
    int32_t value = 0;
    if (napi_get_value_int32(env, args[index], &value) != napi_ok) {
        return defaultVal;
    }
    return value;
}

using SwdecRunner = int (*)(int32_t);

struct AsyncTestData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    SwdecRunner runner = nullptr;
    int32_t testCaseIndex = -1;
    int result = RESULT_ERROR;
};

static void ExecuteAsyncWork(napi_env /*env*/, void* data)
{
    AsyncTestData* workData = static_cast<AsyncTestData*>(data);
    try {
        if (workData->runner != nullptr) {
            workData->result = workData->runner(workData->testCaseIndex);
        } else {
            workData->result = RESULT_ERROR;
        }
    } catch (...) {
        workData->result = RESULT_ERROR;
    }
}

static void CompleteAsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncTestData* workData = static_cast<AsyncTestData*>(data);
    napi_value resultValue;
    (void)napi_create_int32(env, workData->result, &resultValue);
    if (status == napi_cancelled) {
        napi_reject_deferred(env, workData->deferred, resultValue);
    } else {
        napi_resolve_deferred(env, workData->deferred, resultValue);
    }
    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

static napi_value RunTestAsync(napi_env env, napi_callback_info info, SwdecRunner runner, const char* resourceName)
{
    int32_t caseIndex = GetInt32Arg(env, info, 0, RESULT_ERROR);
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    if (napi_create_promise(env, &deferred, &promise) != napi_ok) {
        return nullptr;
    }
    AsyncTestData* workData = new AsyncTestData();
    workData->deferred = deferred;
    workData->runner = runner;
    workData->testCaseIndex = caseIndex;

    napi_value resName;
    if (napi_create_string_utf8(env, resourceName, NAPI_AUTO_LENGTH, &resName) != napi_ok) {
        delete workData;
        return nullptr;
    }
    napi_status createStatus = napi_create_async_work(
        env, nullptr, resName, ExecuteAsyncWork, CompleteAsyncWork, workData, &workData->asyncWork);
    if (createStatus != napi_ok) {
        delete workData;
        return nullptr;
    }
    if (napi_queue_async_work(env, workData->asyncWork) != napi_ok) {
        napi_delete_async_work(env, workData->asyncWork);
        delete workData;
        return nullptr;
    }
    return promise;
}

// SwdecFuncCreateTest: 1 case (0200)
static int DispatchSwdecFuncCreateTest(int32_t caseNum)
{
    if (caseNum != 0) {
        return RESULT_ERROR;
    }
    return Acts::SwDecoder::VideoSwdecFunction0200();
}

// SwdecFuncNdkTest: 12 cases (0300..1600)
static int DispatchSwdecFuncNdkTest(int32_t caseNum)
{
    switch (caseNum) {
        case kIdx0:
            return Acts::SwDecoder::VideoSwdecFunction0300();
        case kIdx1:
            return Acts::SwDecoder::VideoSwdecFunction0400();
        case kIdx2:
            return Acts::SwDecoder::VideoSwdecFunction0700();
        case kIdx3:
            return Acts::SwDecoder::VideoSwdecFunction0800();
        case kIdx4:
            return Acts::SwDecoder::VideoSwdecFunction4000();
        case kIdx5:
            return Acts::SwDecoder::VideoSwdecFunction1000();
        case kIdx6:
            return Acts::SwDecoder::VideoSwdecFunction1100();
        case kIdx7:
            return Acts::SwDecoder::VideoSwdecFunction1200();
        case kIdx8:
            return Acts::SwDecoder::VideoSwdecFunction1300();
        case kIdx9:
            return Acts::SwDecoder::VideoSwdecFunction1400();
        case kIdx10:
            return Acts::SwDecoder::VideoSwdecFunction1500();
        case kIdx11:
            return Acts::SwDecoder::VideoSwdecFunction1600();
        default:
            return RESULT_ERROR;
    }
}

// SwdecSync264Test: 3 cases (0010, 0020, 0040)
static int DispatchSwdecSync264Test(int32_t caseNum)
{
    switch (caseNum) {
        case kIdx0:
            return Acts::SwDecoder::VideoDecodeSyncSw264Func0010();
        case kIdx1:
            return Acts::SwDecoder::VideoDecodeSyncSw264Func0020();
        case kIdx2:
            return Acts::SwDecoder::VideoDecodeSyncSw264Func0040();
        default:
            return RESULT_ERROR;
    }
}

// SwdecBlankFrameTest: 1 case (0010)
static int DispatchSwdecBlankFrameTest(int32_t caseNum)
{
    if (caseNum != 0) {
        return RESULT_ERROR;
    }
    return Acts::SwDecoder::VideoSwdecodeBlankFrame0010();
}

static napi_value SwdecFuncCreateTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecFuncCreateTest, "SwdecFuncCreateTest");
}

static napi_value SwdecFuncNdkTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecFuncNdkTest, "SwdecFuncNdkTest");
}

static napi_value SwdecSync264Test(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecSync264Test, "SwdecSync264Test");
}

static napi_value SwdecBlankFrameTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecBlankFrameTest, "SwdecBlankFrameTest");
}

// SwdecApiIllegalParaTest: 30 cases (0-29)
static int DispatchSwdecApiIllegalParaTest(int32_t caseNum)
{
    switch (caseNum) {
        case kIdx0:
            return Acts::SwDecoder::VideoSwdecIllegalPara0100();
        case kIdx1:
            return Acts::SwDecoder::VideoSwdecIllegalPara0200();
        case kIdx2:
            return Acts::SwDecoder::VideoSwdecIllegalPara3300();
        case kIdx3:
            return Acts::SwDecoder::VideoSwdecIllegalPara1800();
        case kIdx4:
            return Acts::SwDecoder::VideoSwdecIllegalPara0300();
        case kIdx5:
            return Acts::SwDecoder::VideoSwdecIllegalPara0400();
        case kIdx6:
            return Acts::SwDecoder::VideoSwdecIllegalPara0500();
        case kIdx7:
            return Acts::SwDecoder::VideoSwdecIllegalPara1400();
        case kIdx8:
            return Acts::SwDecoder::VideoSwdecIllegalPara5000();
        case kIdx9:
            return Acts::SwDecoder::VideoSwdecIllegalPara5100();
        case kIdx10:
            return Acts::SwDecoder::VideoSwdecIllegalPara0600();
        case kIdx11:
            return Acts::SwDecoder::VideoSwdecIllegalPara0700();
        case kIdx12:
            return Acts::SwDecoder::VideoSwdecIllegalPara0800();
        case kIdx13:
            return Acts::SwDecoder::VideoSwdecIllegalPara0900();
        case kIdx14:
            return Acts::SwDecoder::VideoSwdecIllegalPara1000();
        case kIdx15:
            return Acts::SwDecoder::VideoSwdecIllegalPara1100();
        case kIdx16:
            return Acts::SwDecoder::VideoSwdecIllegalPara4100();
        case kIdx17:
            return Acts::SwDecoder::VideoSwdecIllegalPara1500();
        case kIdx18:
            return Acts::SwDecoder::VideoSwdecIllegalPara1200();
        case kIdx19:
            return Acts::SwDecoder::VideoSwdecIllegalPara1600();
        case kIdx20:
            return Acts::SwDecoder::VideoSwdecIllegalPara1700();
        case kIdx21:
            return Acts::SwDecoder::VideoSwdecIllegalPara2200();
        case kIdx22:
            return Acts::SwDecoder::VideoSwdecIllegalPara2500();
        case kIdx23:
            return Acts::SwDecoder::VideoSwdecIllegalPara2600();
        case kIdx24:
            return Acts::SwDecoder::VideoSwdecIllegalPara2700();
        case kIdx25:
            return Acts::SwDecoder::VideoSwdecIllegalPara2800();
        case kIdx26:
            return Acts::SwDecoder::VideoSwdecIllegalPara2900();
        case kIdx27:
            return Acts::SwDecoder::VideoSwdecIllegalPara3000();
        case kIdx28:
            return Acts::SwDecoder::VideoSwdecIllegalPara3100();
        case kIdx29:
            return Acts::SwDecoder::VideoSwdecIllegalPara3200();
        default:
            return RESULT_ERROR;
    }
}

// SwdecApiTest: 12 cases (0-11)
static int DispatchSwdecApiTest(int32_t caseNum)
{
    switch (caseNum) {
        case kIdx0:
            return Acts::SwDecoder::VideoSwdecApi0100();
        case kIdx1:
            return Acts::SwDecoder::VideoSwdecApi0200();
        case kIdx2:
            return Acts::SwDecoder::VideoSwdecApi0300();
        case kIdx3:
            return Acts::SwDecoder::VideoSwdecApi0400();
        case kIdx4:
            return Acts::SwDecoder::VideoSwdecApi0500();
        case kIdx5:
            return Acts::SwDecoder::VideoSwdecApi0600();
        case kIdx6:
            return Acts::SwDecoder::VideoSwdecApi0700();
        case kIdx7:
            return Acts::SwDecoder::VideoSwdecApi0800();
        case kIdx8:
            return Acts::SwDecoder::VideoSwdecApi0900();
        case kIdx9:
            return Acts::SwDecoder::VideoSwdecApi1000();
        case kIdx10:
            return Acts::SwDecoder::VideoSwdecApi1100();
        case kIdx11:
            return Acts::SwDecoder::VideoSwdecApi1200();
        default:
            return RESULT_ERROR;
    }
}

// SwdecCapApiTest: 51 cases (0-50)
static int DispatchSwdecCapApiTest(int32_t caseNum)
{
    switch (caseNum) {
        case kIdx0:
            return Acts::SwDecoder::VideoSwdecCapApi0100();
        case kIdx1:
            return Acts::SwDecoder::VideoSwdecCapApi0300();
        case kIdx2:
            return Acts::SwDecoder::VideoSwdecCapApi0400();
        case kIdx3:
            return Acts::SwDecoder::VideoSwdecCapApi0500();
        case kIdx4:
            return Acts::SwDecoder::VideoSwdecCapApi0600();
        case kIdx5:
            return Acts::SwDecoder::VideoSwdecCapApi0700();
        case kIdx6:
            return Acts::SwDecoder::VideoSwdecCapApi0800();
        case kIdx7:
            return Acts::SwDecoder::VideoSwdecCapApi0900();
        case kIdx8:
            return Acts::SwDecoder::VideoSwdecCapApi1000();
        case kIdx9:
            return Acts::SwDecoder::VideoSwdecCapApi3100();
        case kIdx10:
            return Acts::SwDecoder::VideoSwdecCapApi3200();
        case kIdx11:
            return Acts::SwDecoder::VideoSwdecCapApi3300();
        case kIdx12:
            return Acts::SwDecoder::VideoSwdecCapApi3400();
        case kIdx13:
            return Acts::SwDecoder::VideoSwdecCapApi3500();
        case kIdx14:
            return Acts::SwDecoder::VideoSwdecCapApi3600();
        case kIdx15:
            return Acts::SwDecoder::VideoSwdecCapApi3700();
        case kIdx16:
            return Acts::SwDecoder::VideoSwdecCapApi3800();
        case kIdx17:
            return Acts::SwDecoder::VideoSwdecCapApi3900();
        case kIdx18:
            return Acts::SwDecoder::VideoSwdecCapApi4000();
        case kIdx19:
            return Acts::SwDecoder::VideoSwdecCapApi4100();
        case kIdx20:
            return Acts::SwDecoder::VideoSwdecCapApi4200();
        case kIdx21:
            return Acts::SwDecoder::VideoSwdecCapApi4300();
        case kIdx22:
            return Acts::SwDecoder::VideoSwdecCapApi4400();
        case kIdx23:
            return Acts::SwDecoder::VideoSwdecCapApi4500();
        case kIdx24:
            return Acts::SwDecoder::VideoSwdecCapApi4600();
        case kIdx25:
            return Acts::SwDecoder::VideoSwdecCapApi4700();
        case kIdx26:
            return Acts::SwDecoder::VideoSwdecCapApi4800();
        case kIdx27:
            return Acts::SwDecoder::VideoSwdecCapApi4900();
        case kIdx28:
            return Acts::SwDecoder::VideoSwdecCapApi5000();
        case kIdx29:
            return Acts::SwDecoder::VideoSwdecCapApi5100();
        case kIdx30:
            return Acts::SwDecoder::VideoSwdecCapApi5200();
        case kIdx31:
            return Acts::SwDecoder::VideoSwdecCapApi5300();
        case kIdx32:
            return Acts::SwDecoder::VideoSwdecCapApi9400();
        case kIdx33:
            return Acts::SwDecoder::VideoSwdecCapApi5400();
        case kIdx34:
            return Acts::SwDecoder::VideoSwdecCapApi5500();
        case kIdx35:
            return Acts::SwDecoder::VideoSwdecCapApi5600();
        case kIdx36:
            return Acts::SwDecoder::VideoSwdecCapApi5700();
        case kIdx37:
            return Acts::SwDecoder::VideoSwdecCapApi5800();
        case kIdx38:
            return Acts::SwDecoder::VideoSwdecCapApi5900();
        case kIdx39:
            return Acts::SwDecoder::VideoSwdecCapApi6000();
        case kIdx40:
            return Acts::SwDecoder::VideoSwdecCapApi6100();
        case kIdx41:
            return Acts::SwDecoder::VideoSwdecCapApi6200();
        case kIdx42:
            return Acts::SwDecoder::VideoSwdecCapApi6300();
        case kIdx43:
            return Acts::SwDecoder::VideoSwdecCapApi6400();
        case kIdx44:
            return Acts::SwDecoder::VideoSwdecCapApi6500();
        case kIdx45:
            return Acts::SwDecoder::VideoSwdecCapApi6600();
        case kIdx46:
            return Acts::SwDecoder::VideoSwdecCapApi6700();
        case kIdx47:
            return Acts::SwDecoder::VideoSwdecCapApi6800();
        case kIdx48:
            return Acts::SwDecoder::VideoSwdecCapApi6900();
        case kIdx49:
            return Acts::SwDecoder::VideoSwdecCapApi7000();
        case kIdx50:
            return Acts::SwDecoder::VideoSwdecCapApi7100();
        default:
            return RESULT_ERROR;
    }
}

// SwdecOtherCodecIllegalTest: 3 cases (0-2)
static int DispatchSwdecOtherCodecIllegalTest(int32_t caseNum)
{
    switch (caseNum) {
        case kIdx0:
            return Acts::SwDecoder::VideoMpeg2SwdecIllegalPara0700();
        case kIdx1:
            return Acts::SwDecoder::VideoMpeg4SwdecIllegalPara0700();
        case kIdx2:
            return Acts::SwDecoder::VideoH263SwdecIllegalPara0700();
        default:
            return RESULT_ERROR;
    }
}

static napi_value SwdecApiIllegalParaTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecApiIllegalParaTest, "SwdecApiIllegalParaTest");
}

static napi_value SwdecApiTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecApiTest, "SwdecApiTest");
}

static napi_value SwdecCapApiTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecCapApiTest, "SwdecCapApiTest");
}

static napi_value SwdecOtherCodecIllegalTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecOtherCodecIllegalTest, "SwdecOtherCodecIllegalTest");
}

// SwdecStateTest: 35 cases (0-34)
static int DispatchSwdecStateTest(int32_t caseNum)
{
    switch (caseNum) {
        case kIdx0:
            return Acts::SwDecoder::VideoSwdecState0100();
        case kIdx1:
            return Acts::SwDecoder::VideoSwdecState0101();
        case kIdx2:
            return Acts::SwDecoder::VideoSwdecState0200();
        case kIdx3:
            return Acts::SwDecoder::VideoSwdecState0300();
        case kIdx4:
            return Acts::SwDecoder::VideoSwdecState0400();
        case kIdx5:
            return Acts::SwDecoder::VideoSwdecState0500();
        case kIdx6:
            return Acts::SwDecoder::VideoSwdecState0600();
        case kIdx7:
            return Acts::SwDecoder::VideoSwdecState0700();
        case kIdx8:
            return Acts::SwDecoder::VideoSwdecState0800();
        case kIdx9:
            return Acts::SwDecoder::VideoSwdecState0900();
        case kIdx10:
            return Acts::SwDecoder::VideoSwdecState1000();
        case kIdx11:
            return Acts::SwDecoder::VideoSwdecState1100();
        case kIdx12:
            return Acts::SwDecoder::VideoSwdecState1200();
        case kIdx13:
            return Acts::SwDecoder::VideoSwdecState1300();
        case kIdx14:
            return Acts::SwDecoder::VideoSwdecState1400();
        case kIdx15:
            return Acts::SwDecoder::VideoSwdecState1500();
        case kIdx16:
            return Acts::SwDecoder::VideoSwdecState1600();
        case kIdx17:
            return Acts::SwDecoder::VideoSwdecState1700();
        case kIdx18:
            return Acts::SwDecoder::VideoSwdecState1800();
        case kIdx19:
            return Acts::SwDecoder::VideoSwdecState1900();
        case kIdx20:
            return Acts::SwDecoder::VideoSwdecState2000();
        case kIdx21:
            return Acts::SwDecoder::VideoSwdecState2100();
        case kIdx22:
            return Acts::SwDecoder::VideoSwdecState2200();
        case kIdx23:
            return Acts::SwDecoder::VideoSwdecState2300();
        case kIdx24:
            return Acts::SwDecoder::VideoSwdecState2400();
        case kIdx25:
            return Acts::SwDecoder::VideoSwdecState2500();
        case kIdx26:
            return Acts::SwDecoder::VideoSwdecState2600();
        case kIdx27:
            return Acts::SwDecoder::VideoSwdecState2700();
        case kIdx28:
            return Acts::SwDecoder::VideoSwdecState2800();
        case kIdx29:
            return Acts::SwDecoder::VideoSwdecState2900();
        case kIdx30:
            return Acts::SwDecoder::VideoSwdecState3000();
        case kIdx31:
            return Acts::SwDecoder::VideoSwdecState3100();
        case kIdx32:
            return Acts::SwDecoder::VideoSwdecState3200();
        case kIdx33:
            return Acts::SwDecoder::VideoSwdecState3300();
        case kIdx34:
            return Acts::SwDecoder::VideoSwdecState3400();
        default:
            return RESULT_ERROR;
    }
}

static napi_value SwdecStateTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecStateTest, "SwdecStateTest");
}

static napi_property_descriptor g_swdecDescriptors[] = {
    { "SwdecFuncCreateTest", nullptr, SwdecFuncCreateTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecFuncNdkTest", nullptr, SwdecFuncNdkTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecSync264Test", nullptr, SwdecSync264Test, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecBlankFrameTest", nullptr, SwdecBlankFrameTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecApiIllegalParaTest", nullptr, SwdecApiIllegalParaTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecApiTest", nullptr, SwdecApiTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecCapApiTest", nullptr, SwdecCapApiTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecOtherCodecIllegalTest",
      nullptr,
      SwdecOtherCodecIllegalTest,
      nullptr,
      nullptr,
      nullptr,
      napi_default,
      nullptr },
    { "SwdecStateTest", nullptr, SwdecStateTest, nullptr, nullptr, nullptr, napi_default, nullptr },
};
} // namespace

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(
        env, exports, sizeof(g_swdecDescriptors) / sizeof(g_swdecDescriptors[0]), g_swdecDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module swdecoderTestModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "swdecoder_test",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&swdecoderTestModule);
}
