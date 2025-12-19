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
// OH_AI_TensorCreate接口，name为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0001
 * @tc.number SUBAIMindSporeTensorCreate0001
 * @tc.desc   SUBAIMindSporeTensorCreate0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0001()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate(nullptr, OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_EQ(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorCreate接口，type为异常类型
/**
 * @tc.name   SUBAIMindSporeTensorCreate0002
 * @tc.number SUBAIMindSporeTensorCreate0002
 * @tc.desc   SUBAIMindSporeTensorCreate0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0002()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DataTypeInvalid, createShape, createShapeNum, nullptr, 0);
    ASSERT_EQ(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorCreate接口，tensor维度数组长度为33，超过最大值32
/**
 * @tc.name   SUBAIMindSporeTensorCreate0003
 * @tc.number SUBAIMindSporeTensorCreate0003
 * @tc.desc   SUBAIMindSporeTensorCreate0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0003()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 33;
    int64_t createShape[createShapeNum] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1,  1, 1,
                                            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_EQ(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorCreate接口，tensor维度数组长度为32，shapeNum为3
/**
 * @tc.name   SUBAIMindSporeTensorCreate0004
 * @tc.number SUBAIMindSporeTensorCreate0004
 * @tc.desc   SUBAIMindSporeTensorCreate0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0004()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 32;
    int64_t createShape[createShapeNum] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1,  1,
                                            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, 3, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常调用接口创建Tensor，并传入input进行推理
/**
 * @tc.name   SUBAIMindSporeTensorCreate0005
 * @tc.number SUBAIMindSporeTensorCreate0005
 * @tc.desc   SUBAIMindSporeTensorCreate0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0005()
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
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    OH_AI_TensorHandleArray inTensorArray;
    inTensorArray.handle_num = 1;
    inTensorArray.handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * 1);
    inTensorArray.handle_list[0] = tensor;
    FillInputsData(inTensorArray, "ml_face_isface", true);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inTensorArray, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常调用接口创建Tensor，用不同的OH_AI_DataType，并传入input进行推理
/**
 * @tc.name   SUBAIMindSporeTensorCreate0006
 * @tc.number SUBAIMindSporeTensorCreate0006
 * @tc.desc   SUBAIMindSporeTensorCreate0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0006()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet = OH_AI_ModelBuildFromFile(
        model, FilePath("aiy_vision_classifier_plants_V1_3.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelGetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 224, 224, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_UINT8, createShape, createShapeNum, nullptr, 0);
    OH_AI_TensorHandleArray inTensorArray;
    inTensorArray.handle_num = 1;
    inTensorArray.handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * 1);
    inTensorArray.handle_list[0] = tensor;
    FillInputsData(inTensorArray, "aiy_vision_classifier_plants_V1_3", false);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inTensorArray, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    for (size_t i = 0; i < outputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs.handle_list[i];
        int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
        OHPrintf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), elementNum);
        uint8_t* outputData = reinterpret_cast<uint8_t*>(OH_AI_TensorGetMutableData(tensor));
        OHPrintf("output data is:");
        for (int j = 0; j < elementNum && j <= ActsMindSporeValues::OUTPUT_PRINT_LIMIT; ++j) {
            OHPrintf("%d ", outputData[j]);
        }
        OHPrintf("\n");
        OHPrintf("==========CompFp32WithTData==========\n");
        string expectedDataFile = FilePath("aiy_vision_classifier_plants_V1_3") + std::to_string(i) + ".output";
        bool result = CompUint8WithTData(outputData,
                                         expectedDataFile,
                                         ActsMindSporeValues::DEFAULT_TOLERANCE,
                                         ActsMindSporeValues::DEFAULT_TOLERANCE,
                                         false);
        ASSERT_EQ(result, true);
    }
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorCreate接口，OH_AI_DataType类型、shape数组长度，遍历设置
/**
 * @tc.name   SUBAIMindSporeTensorCreate0007
 * @tc.number SUBAIMindSporeTensorCreate0007
 * @tc.desc   SUBAIMindSporeTensorCreate0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0007()
{
    constexpr size_t datatypeNum = 12;
    OH_AI_DataType datatype[datatypeNum] = { OH_AI_DATATYPE_NUMBERTYPE_BOOL,    OH_AI_DATATYPE_NUMBERTYPE_INT8,
                                             OH_AI_DATATYPE_NUMBERTYPE_INT16,   OH_AI_DATATYPE_NUMBERTYPE_INT32,
                                             OH_AI_DATATYPE_NUMBERTYPE_INT64,   OH_AI_DATATYPE_NUMBERTYPE_UINT8,
                                             OH_AI_DATATYPE_NUMBERTYPE_UINT16,  OH_AI_DATATYPE_NUMBERTYPE_UINT32,
                                             OH_AI_DATATYPE_NUMBERTYPE_UINT64,  OH_AI_DATATYPE_NUMBERTYPE_FLOAT16,
                                             OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, OH_AI_DATATYPE_NUMBERTYPE_FLOAT64 };
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    for (size_t i = 0; i < datatypeNum; ++i) {
        OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype[i], createShape, createShapeNum, nullptr, 0);
        ASSERT_NE(tensor, nullptr);
        OH_AI_TensorDestroy(&tensor);
    }
    return OH_AI_STATUS_SUCCESS;
}

void CreateAndSetTensor(OH_AI_ModelHandle model,
                        OH_AI_ContextHandle context,
                        OH_AI_TensorHandleArray* inTensorArray,
                        bool isFirst)
{
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_TensorHandle tensor;
    if (isFirst) {
        OH_AI_Status buildRet =
            OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
        ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
        OHPrintf("==========OH_AI_ModelGetInputs==========\n");
        OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
        ASSERT_NE(inputs.handle_list, nullptr);
        OH_AI_TensorSetFormat(inputs.handle_list[0], OH_AI_FORMAT_NHWC);
        constexpr size_t createShapeNum = 4;
        int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
        tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    } else {
        OH_AI_Status buildRet = OH_AI_ModelBuildFromFile(
            model, FilePath("aiy_vision_classifier_plants_V1_3.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
        ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
        OHPrintf("==========OH_AI_ModelGetInputs==========\n");
        OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
        ASSERT_NE(inputs.handle_list, nullptr);
        constexpr size_t createShapeNum = 4;
        int64_t createShape[createShapeNum] = { 1, 224, 224, 3 };
        tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_UINT8, createShape, createShapeNum, nullptr, 0);
    }

    inTensorArray->handle_num = 1;
    inTensorArray->handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * 1);
    inTensorArray->handle_list[0] = tensor;
}

// 正常调用接口创建多个Tensor，并传入input进行推理
/**
 * @tc.name   SUBAIMindSporeTensorCreate0008
 * @tc.number SUBAIMindSporeTensorCreate0008
 * @tc.desc   SUBAIMindSporeTensorCreate0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0008()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TensorHandleArray inTensorArray;
    CreateAndSetTensor(model, context, &inTensorArray, true);
    FillInputsData(inTensorArray, "ml_face_isface", true);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inTensorArray, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    OH_AI_TensorHandleArray inTensorArray2;
    CreateAndSetTensor(model2, context2, &inTensorArray2, false);
    FillInputsData(inTensorArray2, "aiy_vision_classifier_plants_V1_3", false);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs2 = OH_AI_ModelGetOutputs(model2);
    OH_AI_Status predictRet2 = OH_AI_ModelPredict(model2, inTensorArray2, &outputs2, nullptr, nullptr);
    ASSERT_EQ(predictRet2, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    for (size_t i = 0; i < outputs2.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs2.handle_list[i];
        int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
        OHPrintf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), elementNum);
        uint8_t* outputData = reinterpret_cast<uint8_t*>(OH_AI_TensorGetMutableData(tensor));
        OHPrintf("output data is:");
        for (int j = 0; j < elementNum && j <= ActsMindSporeValues::OUTPUT_PRINT_LIMIT; ++j) {
            OHPrintf("%d ", outputData[j]);
        }
        OHPrintf("\n");
        OHPrintf("==========CompFp32WithTData==========\n");
        string expectedDataFile = FilePath("aiy_vision_classifier_plants_V1_3") + std::to_string(i) + ".output";
        bool result = CompUint8WithTData(outputData,
                                         expectedDataFile,
                                         ActsMindSporeValues::DEFAULT_TOLERANCE,
                                         ActsMindSporeValues::DEFAULT_TOLERANCE,
                                         false);
        ASSERT_EQ(result, true);
    }
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model2);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorDestroy接口，传入的tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0009
 * @tc.number SUBAIMindSporeTensorCreate0009
 * @tc.desc   SUBAIMindSporeTensorCreate0009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0009()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorDestroy(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorDestroy接口，多次释放已创建的tensor
/**
 * @tc.name   SUBAIMindSporeTensorCreate0010
 * @tc.number SUBAIMindSporeTensorCreate0010
 * @tc.desc   SUBAIMindSporeTensorCreate0010
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0010()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    OH_AI_TensorDestroy(&tensor);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorClone接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0011
 * @tc.number SUBAIMindSporeTensorCreate0011
 * @tc.desc   SUBAIMindSporeTensorCreate0011
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0011()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorHandle clone = OH_AI_TensorClone(nullptr);
    ASSERT_EQ(clone, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorClone 接口（深拷贝tensor），拷贝完释放原始tensor
/**
 * @tc.name   SUBAIMindSporeTensorCreate0012
 * @tc.number SUBAIMindSporeTensorCreate0012
 * @tc.desc   SUBAIMindSporeTensorCreate0012
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0012()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size1;
    size_t* ptrSize1 = &size1;
    char* imageBuf = ReadFile(FilePath("ml_face_isface.input").c_str(), ptrSize1);
    ASSERT_NE(imageBuf, nullptr);
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandle clone = OH_AI_TensorClone(tensor);
    ASSERT_NE(clone, nullptr);
    ASSERT_EQ(strcmp(OH_AI_TensorGetName(clone), "data_duplicate"), STRCMP_EQUAL);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    OH_AI_TensorDestroy(&clone);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorClone，克隆出多个tensor
/**
 * @tc.name   SUBAIMindSporeTensorCreate0013
 * @tc.number SUBAIMindSporeTensorCreate0013
 * @tc.desc   SUBAIMindSporeTensorCreate0013
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0013()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size1;
    size_t* ptrSize1 = &size1;
    char* imageBuf = ReadFile(FilePath("ml_face_isface.input").c_str(), ptrSize1);
    ASSERT_NE(imageBuf, nullptr);
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandle clone = OH_AI_TensorClone(tensor);
    ASSERT_NE(clone, nullptr);
    ASSERT_EQ(strcmp(OH_AI_TensorGetName(clone), "data_duplicate"), STRCMP_EQUAL);
    OH_AI_TensorHandle clone2 = OH_AI_TensorClone(tensor);
    ASSERT_NE(clone2, nullptr);
    ASSERT_EQ(strcmp(OH_AI_TensorGetName(clone2), "data_duplicate"), STRCMP_EQUAL);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    OH_AI_TensorDestroy(&clone);
    OH_AI_TensorDestroy(&clone2);
    return OH_AI_STATUS_SUCCESS;
}

// 正常设置name
/**
 * @tc.name   SUBAIMindSporeTensorCreate0014
 * @tc.number SUBAIMindSporeTensorCreate0014
 * @tc.desc   SUBAIMindSporeTensorCreate0014
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0014()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetName(tensor, "new_data");
    const char* tensorName = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensorName, "new_data"), STRCMP_EQUAL);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 多次设置name
/**
 * @tc.name   SUBAIMindSporeTensorCreate0015
 * @tc.number SUBAIMindSporeTensorCreate0015
 * @tc.desc   SUBAIMindSporeTensorCreate0015
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0015()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetName(tensor, "new_data");
    const char* tensorName = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensorName, "new_data"), STRCMP_EQUAL);
    OH_AI_TensorSetName(tensor, "new_data2");
    const char* tensorName2 = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensorName2, "new_data2"), STRCMP_EQUAL);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetName接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0016
 * @tc.number SUBAIMindSporeTensorCreate0016
 * @tc.desc   SUBAIMindSporeTensorCreate0016
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0016()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorSetName(nullptr, "data");
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetName接口，name为空字符、含有非法字符
/**
 * @tc.name   SUBAIMindSporeTensorCreate0017
 * @tc.number SUBAIMindSporeTensorCreate0017
 * @tc.desc   SUBAIMindSporeTensorCreate0017
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0017()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetName(tensor, "");
    OHPrintf("Tensor name: %s. \n", OH_AI_TensorGetName(tensor));
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorGetName接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0018
 * @tc.number SUBAIMindSporeTensorCreate0018
 * @tc.desc   SUBAIMindSporeTensorCreate0018
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0018()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    const char* tensorName = OH_AI_TensorGetName(nullptr);
    ASSERT_EQ(tensorName, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

} // namespace MindSpore
} // namespace Acts
