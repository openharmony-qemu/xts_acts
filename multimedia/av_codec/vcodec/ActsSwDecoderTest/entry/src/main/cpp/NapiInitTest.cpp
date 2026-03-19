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

#include "include/ActsFuncTest.h"
#include "include/ActsApiTest.h"
#include "include/ActsStateTest.h"
#include "napi/native_api.h"
#include <cstdint>

namespace {
constexpr int32_t RESULT_ERROR = -1;

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

static napi_value RunTestAsync(napi_env env, napi_callback_info info,
    SwdecRunner runner, const char* resourceName)
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
        case 0: return Acts::SwDecoder::VideoSwdecFunction0300();
        case 1: return Acts::SwDecoder::VideoSwdecFunction0400();
        case 2: return Acts::SwDecoder::VideoSwdecFunction0700();
        case 3: return Acts::SwDecoder::VideoSwdecFunction0800();
        case 4: return Acts::SwDecoder::VideoSwdecFunction4000();
        case 5: return Acts::SwDecoder::VideoSwdecFunction1000();
        case 6: return Acts::SwDecoder::VideoSwdecFunction1100();
        case 7: return Acts::SwDecoder::VideoSwdecFunction1200();
        case 8: return Acts::SwDecoder::VideoSwdecFunction1300();
        case 9: return Acts::SwDecoder::VideoSwdecFunction1400();
        case 10: return Acts::SwDecoder::VideoSwdecFunction1500();
        case 11: return Acts::SwDecoder::VideoSwdecFunction1600();
        default: return RESULT_ERROR;
    }
}

// SwdecSync264Test: 3 cases (0010, 0020, 0040)
static int DispatchSwdecSync264Test(int32_t caseNum)
{
    switch (caseNum) {
        case 0: return Acts::SwDecoder::VideoDecodeSyncSw264Func0010();
        case 1: return Acts::SwDecoder::VideoDecodeSyncSw264Func0020();
        case 2: return Acts::SwDecoder::VideoDecodeSyncSw264Func0040();
        default: return RESULT_ERROR;
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
        case 0: return Acts::SwDecoder::VideoSwdecIllegalPara0100();
        case 1: return Acts::SwDecoder::VideoSwdecIllegalPara0200();
        case 2: return Acts::SwDecoder::VideoSwdecIllegalPara3300();
        case 3: return Acts::SwDecoder::VideoSwdecIllegalPara1800();
        case 4: return Acts::SwDecoder::VideoSwdecIllegalPara0300();
        case 5: return Acts::SwDecoder::VideoSwdecIllegalPara0400();
        case 6: return Acts::SwDecoder::VideoSwdecIllegalPara0500();
        case 7: return Acts::SwDecoder::VideoSwdecIllegalPara1400();
        case 8: return Acts::SwDecoder::VideoSwdecIllegalPara5000();
        case 9: return Acts::SwDecoder::VideoSwdecIllegalPara5100();
        case 10: return Acts::SwDecoder::VideoSwdecIllegalPara0600();
        case 11: return Acts::SwDecoder::VideoSwdecIllegalPara0700();
        case 12: return Acts::SwDecoder::VideoSwdecIllegalPara0800();
        case 13: return Acts::SwDecoder::VideoSwdecIllegalPara0900();
        case 14: return Acts::SwDecoder::VideoSwdecIllegalPara1000();
        case 15: return Acts::SwDecoder::VideoSwdecIllegalPara1100();
        case 16: return Acts::SwDecoder::VideoSwdecIllegalPara4100();
        case 17: return Acts::SwDecoder::VideoSwdecIllegalPara1500();
        case 18: return Acts::SwDecoder::VideoSwdecIllegalPara1200();
        case 19: return Acts::SwDecoder::VideoSwdecIllegalPara1600();
        case 20: return Acts::SwDecoder::VideoSwdecIllegalPara1700();
        case 21: return Acts::SwDecoder::VideoSwdecIllegalPara2200();
        case 22: return Acts::SwDecoder::VideoSwdecIllegalPara2500();
        case 23: return Acts::SwDecoder::VideoSwdecIllegalPara2600();
        case 24: return Acts::SwDecoder::VideoSwdecIllegalPara2700();
        case 25: return Acts::SwDecoder::VideoSwdecIllegalPara2800();
        case 26: return Acts::SwDecoder::VideoSwdecIllegalPara2900();
        case 27: return Acts::SwDecoder::VideoSwdecIllegalPara3000();
        case 28: return Acts::SwDecoder::VideoSwdecIllegalPara3100();
        case 29: return Acts::SwDecoder::VideoSwdecIllegalPara3200();
        default: return RESULT_ERROR;
    }
}

// SwdecApiTest: 12 cases (0-11)
static int DispatchSwdecApiTest(int32_t caseNum)
{
    switch (caseNum) {
        case 0: return Acts::SwDecoder::VideoSwdecApi0100();
        case 1: return Acts::SwDecoder::VideoSwdecApi0200();
        case 2: return Acts::SwDecoder::VideoSwdecApi0300();
        case 3: return Acts::SwDecoder::VideoSwdecApi0400();
        case 4: return Acts::SwDecoder::VideoSwdecApi0500();
        case 5: return Acts::SwDecoder::VideoSwdecApi0600();
        case 6: return Acts::SwDecoder::VideoSwdecApi0700();
        case 7: return Acts::SwDecoder::VideoSwdecApi0800();
        case 8: return Acts::SwDecoder::VideoSwdecApi0900();
        case 9: return Acts::SwDecoder::VideoSwdecApi1000();
        case 10: return Acts::SwDecoder::VideoSwdecApi1100();
        case 11: return Acts::SwDecoder::VideoSwdecApi1200();
        default: return RESULT_ERROR;
    }
}

// SwdecCapApiTest: 51 cases (0-50)
static int DispatchSwdecCapApiTest(int32_t caseNum)
{
    switch (caseNum) {
        case 0: return Acts::SwDecoder::VideoSwdecCapApi0100();
        case 1: return Acts::SwDecoder::VideoSwdecCapApi0300();
        case 2: return Acts::SwDecoder::VideoSwdecCapApi0400();
        case 3: return Acts::SwDecoder::VideoSwdecCapApi0500();
        case 4: return Acts::SwDecoder::VideoSwdecCapApi0600();
        case 5: return Acts::SwDecoder::VideoSwdecCapApi0700();
        case 6: return Acts::SwDecoder::VideoSwdecCapApi0800();
        case 7: return Acts::SwDecoder::VideoSwdecCapApi0900();
        case 8: return Acts::SwDecoder::VideoSwdecCapApi1000();
        case 9: return Acts::SwDecoder::VideoSwdecCapApi3100();
        case 10: return Acts::SwDecoder::VideoSwdecCapApi3200();
        case 11: return Acts::SwDecoder::VideoSwdecCapApi3300();
        case 12: return Acts::SwDecoder::VideoSwdecCapApi3400();
        case 13: return Acts::SwDecoder::VideoSwdecCapApi3500();
        case 14: return Acts::SwDecoder::VideoSwdecCapApi3600();
        case 15: return Acts::SwDecoder::VideoSwdecCapApi3700();
        case 16: return Acts::SwDecoder::VideoSwdecCapApi3800();
        case 17: return Acts::SwDecoder::VideoSwdecCapApi3900();
        case 18: return Acts::SwDecoder::VideoSwdecCapApi4000();
        case 19: return Acts::SwDecoder::VideoSwdecCapApi4100();
        case 20: return Acts::SwDecoder::VideoSwdecCapApi4200();
        case 21: return Acts::SwDecoder::VideoSwdecCapApi4300();
        case 22: return Acts::SwDecoder::VideoSwdecCapApi4400();
        case 23: return Acts::SwDecoder::VideoSwdecCapApi4500();
        case 24: return Acts::SwDecoder::VideoSwdecCapApi4600();
        case 25: return Acts::SwDecoder::VideoSwdecCapApi4700();
        case 26: return Acts::SwDecoder::VideoSwdecCapApi4800();
        case 27: return Acts::SwDecoder::VideoSwdecCapApi4900();
        case 28: return Acts::SwDecoder::VideoSwdecCapApi5000();
        case 29: return Acts::SwDecoder::VideoSwdecCapApi5100();
        case 30: return Acts::SwDecoder::VideoSwdecCapApi5200();
        case 31: return Acts::SwDecoder::VideoSwdecCapApi5300();
        case 32: return Acts::SwDecoder::VideoSwdecCapApi9400();
        case 33: return Acts::SwDecoder::VideoSwdecCapApi5400();
        case 34: return Acts::SwDecoder::VideoSwdecCapApi5500();
        case 35: return Acts::SwDecoder::VideoSwdecCapApi5600();
        case 36: return Acts::SwDecoder::VideoSwdecCapApi5700();
        case 37: return Acts::SwDecoder::VideoSwdecCapApi5800();
        case 38: return Acts::SwDecoder::VideoSwdecCapApi5900();
        case 39: return Acts::SwDecoder::VideoSwdecCapApi6000();
        case 40: return Acts::SwDecoder::VideoSwdecCapApi6100();
        case 41: return Acts::SwDecoder::VideoSwdecCapApi6200();
        case 42: return Acts::SwDecoder::VideoSwdecCapApi6300();
        case 43: return Acts::SwDecoder::VideoSwdecCapApi6400();
        case 44: return Acts::SwDecoder::VideoSwdecCapApi6500();
        case 45: return Acts::SwDecoder::VideoSwdecCapApi6600();
        case 46: return Acts::SwDecoder::VideoSwdecCapApi6700();
        case 47: return Acts::SwDecoder::VideoSwdecCapApi6800();
        case 48: return Acts::SwDecoder::VideoSwdecCapApi6900();
        case 49: return Acts::SwDecoder::VideoSwdecCapApi7000();
        case 50: return Acts::SwDecoder::VideoSwdecCapApi7100();
        default: return RESULT_ERROR;
    }
}

// SwdecOtherCodecIllegalTest: 3 cases (0-2)
static int DispatchSwdecOtherCodecIllegalTest(int32_t caseNum)
{
    switch (caseNum) {
        case 0: return Acts::SwDecoder::VideoMpeg2SwdecIllegalPara0700();
        case 1: return Acts::SwDecoder::VideoMpeg4SwdecIllegalPara0700();
        case 2: return Acts::SwDecoder::VideoH263SwdecIllegalPara0700();
        default: return RESULT_ERROR;
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
        case 0: return Acts::SwDecoder::VideoSwdecState0100();
        case 1: return Acts::SwDecoder::VideoSwdecState0101();
        case 2: return Acts::SwDecoder::VideoSwdecState0200();
        case 3: return Acts::SwDecoder::VideoSwdecState0300();
        case 4: return Acts::SwDecoder::VideoSwdecState0400();
        case 5: return Acts::SwDecoder::VideoSwdecState0500();
        case 6: return Acts::SwDecoder::VideoSwdecState0600();
        case 7: return Acts::SwDecoder::VideoSwdecState0700();
        case 8: return Acts::SwDecoder::VideoSwdecState0800();
        case 9: return Acts::SwDecoder::VideoSwdecState0900();
        case 10: return Acts::SwDecoder::VideoSwdecState1000();
        case 11: return Acts::SwDecoder::VideoSwdecState1100();
        case 12: return Acts::SwDecoder::VideoSwdecState1200();
        case 13: return Acts::SwDecoder::VideoSwdecState1300();
        case 14: return Acts::SwDecoder::VideoSwdecState1400();
        case 15: return Acts::SwDecoder::VideoSwdecState1500();
        case 16: return Acts::SwDecoder::VideoSwdecState1600();
        case 17: return Acts::SwDecoder::VideoSwdecState1700();
        case 18: return Acts::SwDecoder::VideoSwdecState1800();
        case 19: return Acts::SwDecoder::VideoSwdecState1900();
        case 20: return Acts::SwDecoder::VideoSwdecState2000();
        case 21: return Acts::SwDecoder::VideoSwdecState2100();
        case 22: return Acts::SwDecoder::VideoSwdecState2200();
        case 23: return Acts::SwDecoder::VideoSwdecState2300();
        case 24: return Acts::SwDecoder::VideoSwdecState2400();
        case 25: return Acts::SwDecoder::VideoSwdecState2500();
        case 26: return Acts::SwDecoder::VideoSwdecState2600();
        case 27: return Acts::SwDecoder::VideoSwdecState2700();
        case 28: return Acts::SwDecoder::VideoSwdecState2800();
        case 29: return Acts::SwDecoder::VideoSwdecState2900();
        case 30: return Acts::SwDecoder::VideoSwdecState3000();
        case 31: return Acts::SwDecoder::VideoSwdecState3100();
        case 32: return Acts::SwDecoder::VideoSwdecState3200();
        case 33: return Acts::SwDecoder::VideoSwdecState3300();
        case 34: return Acts::SwDecoder::VideoSwdecState3400();
        default: return RESULT_ERROR;
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
    { "SwdecOtherCodecIllegalTest", nullptr, SwdecOtherCodecIllegalTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecStateTest", nullptr, SwdecStateTest, nullptr, nullptr, nullptr, napi_default, nullptr },
};
} // namespace

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports,
        sizeof(g_swdecDescriptors) / sizeof(g_swdecDescriptors[0]), g_swdecDescriptors);
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
