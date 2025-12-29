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

// 异步工作数据结构
struct AsyncWorkData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int testCaseIndex = -1; // 测试用例索引
    int result = -1;        // 测试结果
};

// 测试函数注册表（静态数组）
static TestFunction g_testFunctions[] = {
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_Create_0100,             // 索引 0
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_Create_0200,             // 索引 1
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100,          // 索引 2
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200,          // 索引 3
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetCache_0100,           // 索引 4
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetCache_0200,           // 索引 5
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100, // 索引 6
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100,        // 索引 7
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100,      // 索引 8
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_Build_0100,              // 索引 9
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_Build_0200,              // 索引 10
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_Destroy_0100,            // 索引 11
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_Destroy_0200,            // 索引 12
    // Device 测试系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Device_DeviceID_0100,   // 索引 13
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Device_DeviceID_0200,   // 索引 15
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Device_DeviceID_0300,   // 索引 16
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Device_DeviceID_0400,   // 索引 17
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Device_DeviceName_0100, // 索引 18
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Device_DeviceName_0200, // 索引 19
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Device_DeviceName_0300, // 索引 20
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Device_DeviceName_0400, // 索引 21
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Device_DeviceType_0100, // 索引 22
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Device_DeviceType_0200, // 索引 23
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Device_DeviceType_0300, // 索引 24
    // Executor 测试系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Create_0100,              // 索引 25
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Create_0200,              // 索引 26
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetInput_0100,            // 索引 27
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetInput_0200,            // 索引 28
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetInput_0300,            // 索引 29
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetInput_0400,            // 索引 30
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetInput_0500,            // 索引 31
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetInput_0600,            // 索引 32
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetInput_0700,            // 索引 33
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetOutput_0100,           // 索引 34
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetOutput_0200,           // 索引 35
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetOutput_0300,           // 索引 36
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetOutput_0400,           // 索引 37
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_SetOutput_0500,           // 索引 38
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Run_0100,                 // 索引 39
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Run_0200,                 // 索引 40
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Run_0300,                 // 索引 41
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Run_0400,                 // 索引 42
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Run_0500,                 // 索引 43
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Run_0600,                 // 索引 44
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Run_0700,                 // 索引 45
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100, // 索引 46
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0200, // 索引 47
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0300, // 索引 48
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0400, // 索引 49
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0500, // 索引 50
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0600, // 索引 51
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0700, // 索引 52
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0800, // 索引 53
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Destroy_0100,             // 索引 54
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Destroy_0200,             // 索引 55
    OHOS::NeuralNetworkRuntime::SUB_AI_NNR_Func_North_Executor_Combine_0100,              // 索引 56
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Combine_0200,             // 索引 57
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Combine_0300,             // 索引 58
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Combine_0400,             // 索引 59
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Combine_0500,             // 索引 60
    // Memory 测试系列
    // CreateInputMemory 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0100, // 索引 61
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0200, // 索引 62
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0300, // 索引 63
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0400, // 索引 64
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0500, // 索引 65
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0600, // 索引 66
    // CreateOutputMemory 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0100, // 索引 67
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0200, // 索引 68
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0300, // 索引 69
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0400, // 索引 70
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0500, // 索引 71
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0600, // 索引 72
    // DestroyInputMemory 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0100, // 索引 73
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0200, // 索引 74
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0300, // 索引 75
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0400, // 索引 76
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0500, // 索引 77
    // DestroyOutputMemory 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0100, // 索引 78
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0200, // 索引 79
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0300, // 索引 80
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0400, // 索引 81
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0500, // 索引 82
    // SetInputFromMemory 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0100, // 索引 83
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0200, // 索引 84
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0300, // 索引 85
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0400, // 索引 86
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0500, // 索引 87
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_SetInputFromMemory_0600, // 索引 88
    // SetOutputFromMemory 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0100, // 索引 89
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0200, // 索引 90
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0300, // 索引 91
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_SetOutputFromMemory_0400, // 索引 92
    // Run 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_Run_0100, // 索引 93
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_Run_0200, // 索引 94
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_Run_0300, // 索引 95
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Executor_Memory_Run_0400, // 索引 96
    // Model 测试系列
    // CreateModel 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_CreateModel_0100, // 索引 97
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_CreateModel_0200, // 索引 98
    // AddOperand 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperand_0100, // 索引 99
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperand_0200, // 索引 100
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperand_0300, // 索引 101
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperand_0400, // 索引 102
    // SetOperandValue 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SetOperandValue_0100, // 索引 103
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SetOperandValue_0200, // 索引 104
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SetOperandValue_0300, // 索引 105
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SetOperandValue_0400, // 索引 106
    // AddOperation 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_0100, // 索引 107
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_0200, // 索引 108
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_0300, // 索引 109
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_0400, // 索引 110
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_0500, // 索引 111
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_0600, // 索引 112
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_0700, // 索引 113
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_0800, // 索引 114
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_0900, // 索引 115
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_1000, // 索引 116
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_1100, // 索引 117
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_1200, // 索引 118
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_AddOperation_1300, // 索引 119
    // SpecifyInputsAndOutputs 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0100, // 索引 120
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0200, // 索引 121
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0300, // 索引 122
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0400, // 索引 123
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0500, // 索引 124
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0600, // 索引 125
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0700, // 索引 126
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0800, // 索引 127
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0900, // 索引 128
    // Finish 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_Finish_0100, // 索引 129
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_Finish_0200, // 索引 130
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_Finish_0300, // 索引 131
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_Finish_0400, // 索引 132
    // Destroy 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_Destroy_0100, // 索引 133
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_Destroy_0200, // 索引 134
    // GetSupportedOperation 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0100, // 索引 135
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0200, // 索引 136
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0300, // 索引 137
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0400, // 索引 138
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0500, // 索引 139
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0600, // 索引 140
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0700, // 索引 141
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Model_GetSupportedOperation_0800, // 索引 142
    // Combine 系列
    OHOS::NeuralNetworkRuntime::SUB_AI_NNR_Func_North_Model_Combine_0100, // 索引 143
    OHOS::NeuralNetworkRuntime::SUB_AI_NNR_Func_North_Model_Combine_0200, // 索引 144
    // ========== 新增 Compilation 测试（补充） ==========
    // EnableFloat16 补充测试
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200, // 索引 143
    // SetCache 补充测试
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetCache_0500, // 索引 144
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetCache_0600, // 索引 145
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetCache_0700, // 索引 146
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetCache_0800, // 索引 147
    // SetPerformanceMode 补充测试
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0300, // 索引 148
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0400, // 索引 149
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0500, // 索引 150
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0600, // 索引 151
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0700, // 索引 152
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0800, // 索引 153
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0900, // 索引 154
    // SetPriority 补充测试
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPriority_0300, // 索引 155
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPriority_0400, // 索引 156
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPriority_0500, // 索引 157
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPriority_0600, // 索引 158
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPriority_0700, // 索引 159
    OHOS::NeuralNetworkRuntime::SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800, // 索引 160
    // 后续添加新测试函数在此处追加即可
};

// 自动计算测试用例总数
static const int g_testFunctionCount = sizeof(g_testFunctions) / sizeof(g_testFunctions[0]);

// 异步执行函数（在工作线程中执行）
static void ExecuteAsyncWork(napi_env env, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);

    // 验证测试用例索引有效性
    if (workData->testCaseIndex >= 0 && workData->testCaseIndex < g_testFunctionCount) {
        // 在工作线程中执行测试函数
        workData->result = g_testFunctions[workData->testCaseIndex]();
    } else {
        workData->result = -1;
    }
}

// 异步完成回调（在主线程中执行）
static void CompleteAsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);

    napi_value result;
    napi_create_int32(env, workData->result, &result);

    if (workData->result == 0) {
        // 测试成功，resolve Promise
        napi_resolve_deferred(env, workData->deferred, result);
    } else {
        // 测试失败，reject Promise
        napi_reject_deferred(env, workData->deferred, result);
    }

    // 清理异步工作
    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

/**
| * 创建结果值的辅助函数
| * @param env NAPI环境
| * @param success 是否成功
| * @return napi_value 返回0表示成功，-1表示失败
| */
static napi_value createResultValue(napi_env env, bool success)
{
    napi_value result;
    napi_create_int32(env, success ? 0 : -1, &result);
    return result;
}

/**
| * 统一的NNRT接口测试函数（异步版本）
| * @param env NAPI环境
| * @param info 回调信息
| * @return napi_value Promise对象，成功返回0，失败返回-1
| */
static napi_value nnrtInterfaceTest(napi_env env, napi_callback_info info)
{
    // 1. 获取参数
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "NAPI call failed");
        return nullptr;
    }

    // 2. 验证参数类型
    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return nullptr;
    }

    // 3. 获取测试用例编号
    int32_t caseNum = -1;
    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get case number");
        return nullptr;
    }

    // 4. 验证范围
    if (caseNum < 0 || caseNum >= g_testFunctionCount) {
        char errorMsg[64];
        snprintf(errorMsg, sizeof(errorMsg), "The range of case must be 0 to %d", g_testFunctionCount - 1);
        napi_throw_type_error(env, nullptr, errorMsg);
        return nullptr;
    }

    // 5. 创建 Promise
    napi_value promise;
    napi_deferred deferred;
    status = napi_create_promise(env, &deferred, &promise);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }

    // 6. 创建异步工作数据
    AsyncWorkData* workData = new AsyncWorkData();
    workData->deferred = deferred;
    workData->testCaseIndex = caseNum;

    // 7. 创建异步工作
    napi_value resourceName;
    napi_create_string_utf8(env, "NNRtInterfaceTest", NAPI_AUTO_LENGTH, &resourceName);

    status = napi_create_async_work(
        env, nullptr, resourceName, ExecuteAsyncWork, CompleteAsyncWork, workData, &workData->asyncWork);
    if (status != napi_ok) {
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create async work");
        return nullptr;
    }

    // 8. 加入异步队列
    status = napi_queue_async_work(env, workData->asyncWork);
    if (status != napi_ok) {
        napi_delete_async_work(env, workData->asyncWork);
        delete workData;
        napi_throw_error(env, nullptr, "Failed to queue async work");
        return nullptr;
    }

    return promise;
}

/**
| * NAPI模块初始化
| */
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
| * 模块注册
| * nm_modname必须与ETS中import的模块名一致
| */
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
| * 模块注册入口
| */
extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
