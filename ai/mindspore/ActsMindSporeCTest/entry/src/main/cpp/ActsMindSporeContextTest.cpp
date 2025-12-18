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

#include <cinttypes>
#include <cstring>
#include <mindspore/context.h>
#include <mindspore/data_type.h>
#include <mindspore/format.h>
#include <mindspore/model.h>
#include <mindspore/status.h>
#include <mindspore/tensor.h>
#include <mindspore/types.h>
#include <random>
#include <thread>
#include "include/ActsMindSporeTest.h"
#include "include/OhosCommonTest.h"

namespace Acts {
namespace MindSpore {

namespace {
bool AddFirstNpuDeviceByType(OH_AI_ContextHandle context)
{
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return false;
    }

    const std::string npuNamePrefix = "NPU_";
    OH_AI_NNRTDeviceType npuType = OH_AI_NNRTDEVICE_OTHERS;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        std::cout << "OH_AI_GetTypeFromNNRTDeviceDesc " << type << std::endl;
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            npuType = type;
        }
    }

    auto nnrtDeviceInfo = OH_AI_CreateNNRTDeviceInfoByType(npuType);
    ASSERT_NE(nnrtDeviceInfo, nullptr);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    return true;
}

bool AddFirstNpuDeviceId(OH_AI_DeviceInfoHandle deviceInfo)
{
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return false;
    }
    const std::string npuNamePrefix = "NPU_";
    NNRTDeviceDesc* matched = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            matched = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    if (matched == nullptr) {
        OH_AI_DestroyAllNNRTDeviceDescs(&descs);
        return false;
    }
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(matched);
    OH_AI_DeviceInfoSetDeviceId(deviceInfo, id);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    return true;
}
} // namespace


// 创建多个context
/**
 * @tc.name   SUBAIMindSporeContextCreate0001
 * @tc.number SUBAIMindSporeContextCreate0001
 * @tc.desc   SUBAIMindSporeContextCreate0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelGetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo2 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context2, cpuDeviceInfo2);
    OH_AI_ContextHandle context3 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo3 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context3, cpuDeviceInfo3);
    OH_AI_ContextHandle context4 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo4 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context4, cpuDeviceInfo4);
    OH_AI_ContextHandle context5 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo5 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context5, cpuDeviceInfo5);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ContextDestroy(&context3);
    OH_AI_ContextDestroy(&context4);
    OH_AI_ContextDestroy(&context5);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextDestroy接口context对象为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0002
 * @tc.number SUBAIMindSporeContextCreate0002
 * @tc.desc   SUBAIMindSporeContextCreate0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0002()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextDestroy(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadNum接口，context设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0003
 * @tc.number SUBAIMindSporeContextCreate0003
 * @tc.desc   SUBAIMindSporeContextCreate0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0003()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextSetThreadNum(nullptr, THREAD_NUM_DOUBLE);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadNum接口，threadNum设置为-100
/**
 * @tc.name   SUBAIMindSporeContextCreate0004
 * @tc.number SUBAIMindSporeContextCreate0004
 * @tc.desc   SUBAIMindSporeContextCreate0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0004()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextSetThreadNum(context, INVALID_THREAD_NUM);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    std::cout << threadNum << std::endl;
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadNum接口，重复设置线程数，均可设置成功
/**
 * @tc.name   SUBAIMindSporeContextCreate0005
 * @tc.number SUBAIMindSporeContextCreate0005
 * @tc.desc   SUBAIMindSporeContextCreate0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0005()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_DOUBLE);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    ASSERT_EQ(threadNum, THREAD_NUM_DOUBLE);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_TEN);
    threadNum = OH_AI_ContextGetThreadNum(context);
    ASSERT_EQ(threadNum, THREAD_NUM_TEN);
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadNum接口，设置的context已被销毁，然后传入ThreadNum接口
/**
 * @tc.name   SUBAIMindSporeContextCreate0006
 * @tc.number SUBAIMindSporeContextCreate0006
 * @tc.desc   SUBAIMindSporeContextCreate0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0006()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_DOUBLE);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextGetThreadNum接口，context设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0007
 * @tc.number SUBAIMindSporeContextCreate0007
 * @tc.desc   SUBAIMindSporeContextCreate0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0007()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    int32_t threadNum = OH_AI_ContextGetThreadNum(nullptr);
    std::cout << threadNum << std::endl;
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadAffinityMode接口，context设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0008
 * @tc.number SUBAIMindSporeContextCreate0008
 * @tc.desc   SUBAIMindSporeContextCreate0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0008()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextSetThreadAffinityMode(nullptr, 1);
    return OH_AI_STATUS_SUCCESS;
}

} // namespace MindSpore
}