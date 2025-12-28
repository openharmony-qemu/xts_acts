/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <cassert>
#include <cstdio>
#include "CompileTest.h"
#include "DeviceTest.h"
#include "ExecutorTest.h"
#include "MemoryTest.h"
#include "ModelTest.h"
#include "napi/native_api.h"

// 测试函数统一类型：返回 int，无参数
using TestFunction = int (*)();

// 测试函数注册表（静态数组）
static TestFunction g_testFunctions[] = {

};

// 自动计算测试用例总数
static const int g_testFunctionCount = sizeof(g_testFunctions) / sizeof(g_testFunctions[0]);

/**
 * 创建结果值的辅助函数
 * @param env NAPI环境
 * @param success 是否成功
 * @return napi_value 返回0表示成功，-1表示失败
 */
static napi_value createResultValue(napi_env env, bool success)
{
    napi_value result;
    napi_create_int32(env, success ? 0 : -1, &result);
    return result;
}

/**
 * 统一的NNRT接口测试函数
 * @param env NAPI环境
 * @param info 回调信息
 * @return napi_value 测试结果（0=成功，-1=失败）
 */
static napi_value nnrtInterfaceTest(napi_env env, napi_callback_info info)
{
    // 1. 获取参数
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "NAPI call failed");
        return createResultValue(env, false);
    }

    // 2. 验证参数类型
    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return createResultValue(env, false);
    }

    // 3. 获取测试用例编号
    int32_t caseNum = -1;
    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get case number");
        return createResultValue(env, false);
    }

    // 4. 验证范围并调用对应测试函数
    if (caseNum < 0 || caseNum >= g_testFunctionCount) {
        char errorMsg[64];
        snprintf_s(errorMsg, sizeof(errorMsg), _TRUNCATE, "The range of case must be 0 to %d", g_testFunctionCount - 1);
        napi_throw_type_error(env, nullptr, errorMsg);
        return createResultValue(env, false);
    }

    // 直接通过数组索引调用
    int result = g_testFunctions[caseNum]();

    // 5. 返回测试结果
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

/**
 * NAPI模块初始化
 */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "nnrtInterfaceTest", nullptr, nnrtInterfaceTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

/**
 * 模块注册
 * nm_modname必须与ETS中import的模块名一致
 */
static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "ai_nnrt_interface_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

/**
 * 模块注册入口
 */
extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
