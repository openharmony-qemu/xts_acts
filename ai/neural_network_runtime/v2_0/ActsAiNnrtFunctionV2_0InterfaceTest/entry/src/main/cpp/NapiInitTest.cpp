/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "DeviceTest.cpp"

// Device test case constants
namespace DeviceTestCase {
constexpr int32_t DEVICE_ID_0100 = 0;
constexpr int32_t DEVICE_ID_0200 = 1;
constexpr int32_t DEVICE_ID_0300 = 2;
constexpr int32_t DEVICE_ID_0400 = 3;
constexpr int32_t DEVICE_NAME_0100 = 4;
constexpr int32_t DEVICE_NAME_0200 = 5;
constexpr int32_t DEVICE_NAME_0300 = 6;
constexpr int32_t DEVICE_TYPE_0100 = 8;
constexpr int32_t DEVICE_TYPE_0200 = 9;
constexpr int32_t DEVICE_TYPE_0300 = 10;
}

static napi_value createResultValue(napi_env env, int result)
{
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

// 辅助函数：解析NAPI参数获取测试用例编号
static int ParseTestCaseNumber(napi_env env, napi_callback_info info, int32_t *caseNum)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return -1;
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return -1;
    }

    *caseNum = -1;
    status = napi_get_value_int32(env, args[0], caseNum);
    if (status != napi_ok) {
        return -1;
    }

    return 0;
}

// NAPI function for Device test cases
static napi_value nnrtDeviceTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return createResultValue(env, -1);
    }

    int32_t caseNum = -1;
    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    int result;
    switch (caseNum) {
        case DeviceTestCase::DEVICE_ID_0100: result = SubAiNnrtFuncNorthDeviceDeviceId0100(); break;
        case DeviceTestCase::DEVICE_ID_0200: result = SubAiNnrtFuncNorthDeviceDeviceId0200(); break;
        case DeviceTestCase::DEVICE_ID_0300: result = SubAiNnrtFuncNorthDeviceDeviceId0300(); break;
        case DeviceTestCase::DEVICE_ID_0400: result = SubAiNnrtFuncNorthDeviceDeviceId0400(); break;
        case DeviceTestCase::DEVICE_NAME_0100: result = SubAiNnrtFuncNorthDeviceDeviceName0100(); break;
        case DeviceTestCase::DEVICE_NAME_0200: result = SubAiNnrtFuncNorthDeviceDeviceName0200(); break;
        case DeviceTestCase::DEVICE_NAME_0300: result = SubAiNnrtFuncNorthDeviceDeviceName0300(); break;
        case DeviceTestCase::DEVICE_TYPE_0100: result = SubAiNnrtFuncNorthDeviceDeviceType0100(); break;
        case DeviceTestCase::DEVICE_TYPE_0200: result = SubAiNnrtFuncNorthDeviceDeviceType0200(); break;
        case DeviceTestCase::DEVICE_TYPE_0300: result = SubAiNnrtFuncNorthDeviceDeviceType0300(); break;
        default:
            napi_throw_type_error(env, nullptr, "Invalid case number");
            return createResultValue(env, -1);
    }

    return createResultValue(env, result);
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"nnrtDeviceTest", nullptr, nnrtDeviceTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nnrt_function_v2_0_interface_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
