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

// 正常场景：更新权重
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0001
 * @tc.number SUBAIMindSporeTrainUpdateWeights0001
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */

int SUBAIMindSporeTrainUpdateWeights0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto genRandomData = [](size_t size, void* data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 randomEngine;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(
            static_cast<float*>(data), elementsNum, [&]() { return static_cast<float>(generator(randomEngine)); });
    };
    std::vector<OH_AI_TensorHandle> vecInputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 10 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    genRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vecInputs.push_back(tensor);
    OH_AI_TensorHandleArray updateWeights = { 1, vecInputs.data() };
    status = OH_AI_ModelUpdateWeights(model, updateWeights);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

void ModelUpdateWeightsTest(OH_AI_ModelHandle model)
{
    OH_AI_TensorHandleArray getUpdateWeights = OH_AI_ModelGetWeights(model);
    for (size_t i = 0; i < getUpdateWeights.handle_num; ++i) {
        OH_AI_TensorHandle weightsTensor = getUpdateWeights.handle_list[i];
        if (strcmp(OH_AI_TensorGetName(weightsTensor), "fc3.bias") == 0) {
            float* inputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(weightsTensor));
            std::cout << "fc3.bias:" << inputData[0] << std::endl;
        }
    }
    auto genRandomData = [](size_t size, void* data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 randomEngine;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(
            static_cast<float*>(data), elementsNum, [&]() { return static_cast<float>(generator(randomEngine)); });
    };
    std::vector<OH_AI_TensorHandle> vecInputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 10 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    genRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vecInputs.push_back(tensor);
    OH_AI_TensorHandleArray updateWeights = { 1, vecInputs.data() };
    OH_AI_ModelUpdateWeights(model, updateWeights);
}

// 正常场景：更新权重后导出训练图，再获取权重
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0002
 * @tc.number SUBAIMindSporeTrainUpdateWeights0002
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainUpdateWeights0002()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    ModelUpdateWeightsTest(model);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray exportUpdateWeights = OH_AI_ModelGetWeights(model);
    for (size_t i = 0; i < exportUpdateWeights.handle_num; ++i) {
        OH_AI_TensorHandle weightsTensor = exportUpdateWeights.handle_list[i];
        if (strcmp(OH_AI_TensorGetName(weightsTensor), "fc3.bias") == 0) {
            float* inputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(weightsTensor));
            std::cout << "fc3.bias:" << inputData[0] << std::endl;
        }
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：更新权重tensor name错误
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0003
 * @tc.number SUBAIMindSporeTrainUpdateWeights0003
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainUpdateWeights0003()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    std::vector<OH_AI_TensorHandle> vecInputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 10 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("aaaaa", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    vecInputs.push_back(tensor);
    OH_AI_TensorHandleArray updateWeights = { 1, vecInputs.data() };
    status = OH_AI_ModelUpdateWeights(model, updateWeights);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：更新权重tensor type错误
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0004
 * @tc.number SUBAIMindSporeTrainUpdateWeights0004
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainUpdateWeights0004()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    std::vector<OH_AI_TensorHandle> vecInputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 10 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT16, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    vecInputs.push_back(tensor);
    OH_AI_TensorHandleArray updateWeights = { 1, vecInputs.data() };
    status = OH_AI_ModelUpdateWeights(model, updateWeights);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：更新权重tensor name全部错误
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0005
 * @tc.number SUBAIMindSporeTrainUpdateWeights0005
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainUpdateWeights0005()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray getWeights = OH_AI_ModelGetWeights(model);
    std::vector<OH_AI_TensorHandle> featureMaps;
    for (size_t i = 0; i < getWeights.handle_num; i++) {
        auto name = OH_AI_TensorGetName(getWeights.handle_list[i]);
        size_t shapeNum;
        auto shape = OH_AI_TensorGetShape(getWeights.handle_list[i], &shapeNum);
        OH_AI_DataType dataType = OH_AI_TensorGetDataType(getWeights.handle_list[i]);
        auto data = OH_AI_TensorGetData(getWeights.handle_list[i]);
        auto dataSize = OH_AI_TensorGetDataSize(getWeights.handle_list[i]);
        OH_AI_TensorHandle tensor = OH_AI_TensorCreate(name, dataType, shape, shapeNum, data, dataSize);
        OH_AI_TensorSetName(tensor, "AAAA");
        featureMaps.push_back(tensor);
    }
    OHPrintf("==========OH_AI_TrainModel updateWeights==========\n");
    status = OH_AI_ModelUpdateWeights(model, { featureMaps.size(), featureMaps.data() });
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：更新权重tensor name错误一个
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0006
 * @tc.number SUBAIMindSporeTrainUpdateWeights0006
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainUpdateWeights0006()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray getWeights = OH_AI_ModelGetWeights(model);
    std::vector<OH_AI_TensorHandle> featureMaps;
    for (size_t i = 0; i < getWeights.handle_num; i++) {
        auto name = OH_AI_TensorGetName(getWeights.handle_list[i]);
        size_t shapeNum;
        auto shape = OH_AI_TensorGetShape(getWeights.handle_list[i], &shapeNum);
        OH_AI_DataType dataType = OH_AI_TensorGetDataType(getWeights.handle_list[i]);
        auto data = OH_AI_TensorGetData(getWeights.handle_list[i]);
        auto dataSize = OH_AI_TensorGetDataSize(getWeights.handle_list[i]);
        OH_AI_TensorHandle tensor = OH_AI_TensorCreate(name, dataType, shape, shapeNum, data, dataSize);
        featureMaps.push_back(tensor);
    }
    OHPrintf("==========OH_AI_TrainModel updateWeights==========\n");
    OH_AI_TensorSetName(featureMaps.at(1), "AAAA");
    status = OH_AI_ModelUpdateWeights(model, { featureMaps.size(), featureMaps.data() });
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置学习率为0.01
/**
 * @tc.name   SUBAIMindSporeTrainSetLearningRate0001
 * @tc.number SUBAIMindSporeTrainSetLearningRate0001
 * @tc.desc   SUBAIMindSporeTrainSetLearningRate0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainSetLearningRate0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto learingRate = OH_AI_ModelGetLearningRate(model);
    std::cout << "learingRate:" << learingRate << std::endl;
    status = OH_AI_ModelSetLearningRate(model, DEFAULT_LEARNING_RATE);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    learingRate = OH_AI_ModelGetLearningRate(model);
    std::cout << "get_learing_rate:" << learingRate << std::endl;
    ASSERT_EQ(learingRate, DEFAULT_LEARNING_RATE);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置学习率值为1000.0
/**
 * @tc.name   SUBAIMindSporeTrainSetLearningRate0002
 * @tc.number SUBAIMindSporeTrainSetLearningRate0002
 * @tc.desc   SUBAIMindSporeTrainSetLearningRate0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainSetLearningRate0002()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto learingRate = OH_AI_ModelGetLearningRate(model);
    std::cout << "learingRate:" << learingRate << std::endl;
    status = OH_AI_ModelSetLearningRate(model, EXTREME_LEARNING_RATE);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    learingRate = OH_AI_ModelGetLearningRate(model);
    std::cout << "get_learing_rate:" << learingRate << std::endl;
    ASSERT_EQ(learingRate, EXTREME_LEARNING_RATE);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置虚拟batch_size为2
/**
 * @tc.name   SUBAIMindSporeTrainSetupVirtualBatch0001
 * @tc.number SUBAIMindSporeTrainSetupVirtualBatch0001
 * @tc.desc   SUBAIMindSporeTrainSetupVirtualBatch0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainSetupVirtualBatch0001()
{
    constexpr size_t setupVirtualBatchArg1 = 2;
    constexpr float setupVirtualBatchArg2 = -1.0f;
    constexpr float setupVirtualBatchArg3 = -1.0f;
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ModelSetupVirtualBatch(model, setupVirtualBatchArg1, setupVirtualBatchArg2, setupVirtualBatchArg3);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, ModelPredictOptions("lenet_train_infer", {}, false, false, false));
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置优化等级
/**
 * @tc.name   SUBAIMindSporeTrainSetOptimizationLevel0001
 * @tc.number SUBAIMindSporeTrainSetOptimizationLevel0001
 * @tc.desc   SUBAIMindSporeTrainSetOptimizationLevel0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainSetOptimizationLevel0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    auto optLevel = OH_AI_TrainCfgGetOptimizationLevel(trainCfg);
    std::cout << "optLevel:" << optLevel << std::endl;
    OH_AI_TrainCfgSetOptimizationLevel(trainCfg, OH_AI_KO2);
    auto setOptLevel = OH_AI_TrainCfgGetOptimizationLevel(trainCfg);
    std::cout << "setOptLevel:" << setOptLevel << std::endl;
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, ModelPredictOptions("lenet_train_infer", {}, false, false, false));
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：创建TrainCfg对象并销毁
/**
 * @tc.name   SUBAIMindSporeTrainTrainCfg0001
 * @tc.number SUBAIMindSporeTrainTrainCfg0001
 * @tc.desc   SUBAIMindSporeTrainTrainCfg0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainTrainCfg0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OH_AI_TrainCfgDestroy(&trainCfg);
    ASSERT_EQ(trainCfg, nullptr);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置存在的损失函数名
/**
 * @tc.name   SUBAIMindSporeTrainTrainCfg0002
 * @tc.number SUBAIMindSporeTrainTrainCfg0002
 * @tc.desc   SUBAIMindSporeTrainTrainCfg0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainTrainCfg0002()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    PrintTrainLossName(trainCfg);

    std::vector<std::string> setTrainCfgLossName = { "loss_fct", "_loss_fn" };
    char** setLossName = TransStrVectorToCharArrays(setTrainCfgLossName);
    OH_AI_TrainCfgSetLossName(trainCfg, const_cast<const char**>(setLossName), setTrainCfgLossName.size());
    PrintTrainLossName(trainCfg);

    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, ModelPredictOptions("lenet_train_infer", {}, false, false, false));
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置不存在的损失函数名
/**
 * @tc.name   SUBAIMindSporeTrainTrainCfg0003
 * @tc.number SUBAIMindSporeTrainTrainCfg0003
 * @tc.desc   SUBAIMindSporeTrainTrainCfg0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainTrainCfg0003()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    PrintTrainLossName(trainCfg);

    std::vector<std::string> setTrainCfgLossName = { "aaa", "bbb" };
    char** setLossName = TransStrVectorToCharArrays(setTrainCfgLossName);
    OH_AI_TrainCfgSetLossName(trainCfg, const_cast<const char**>(setLossName), setTrainCfgLossName.size());
    PrintTrainLossName(trainCfg);

    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置损失函数名个数大于num
/**
 * @tc.name   SUBAIMindSporeTrainTrainCfg0004
 * @tc.number SUBAIMindSporeTrainTrainCfg0004
 * @tc.desc   SUBAIMindSporeTrainTrainCfg0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainTrainCfg0004()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    PrintTrainLossName(trainCfg);

    std::vector<std::string> setTrainCfgLossName = { "loss_fct", "_loss_fn" };
    char** setLossName = TransStrVectorToCharArrays(setTrainCfgLossName);
    OH_AI_TrainCfgSetLossName(trainCfg, const_cast<const char**>(setLossName), 1);
    PrintTrainLossName(trainCfg);

    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

} // namespace MindSpore
} // namespace Acts