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

#include <vector>
#include <string>
#include <iostream>
#include "nncore_utils.h"

using namespace testing::ext;
using namespace OHOS::NeuralNetworkRuntime::Test;
class ConstantOfShapeTest : public testing::Test {};

struct ConstantOfShapeModel1 {
    const std::vector<int32_t> input_shape = {2};
    const std::vector<int32_t> output_shape = {2, 3};
    const std::vector<int32_t> param_shape = {1};
    int64_t dataTypeValue[1] = {45};
    float valueValue[1] = {4.5};
    float inputValue[2] = {2, 3};
    float outputValue[2][3] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT16, OH_NN_TENSOR, output_shape, outputValue, 6*sizeof(float)};
    OHNNOperandTest dataType = {OH_NN_INT64, OH_NN_CONSTANT_OF_SHAPE_DATA_TYPE, {1}, dataTypeValue, sizeof(int64_t)};
    OHNNOperandTest value = {OH_NN_FLOAT32, OH_NN_CONSTANT_OF_SHAPE_VALUE, {1}, valueValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_CONSTANT_OF_SHAPE,
                               .operands = {input, output, dataType, value},
                               .paramIndices = {2, 3},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct ConstantOfShapeModel2 {
    const std::vector<int32_t> input_shape = {1};
    const std::vector<int32_t> output_shape = {};
    int64_t dataTypeValue[1] = {45};
    float valueValue[1] = {4.5};
    float inputValue[1] = {0};
    float* outputValue = {};

    OHNNOperandTest input = {OH_NN_FLOAT16, OH_NN_TENSOR, input_shape, inputValue, sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT16, OH_NN_TENSOR, output_shape, outputValue, 0*sizeof(float)};
    OHNNOperandTest dataType = {OH_NN_INT64, OH_NN_CONSTANT_OF_SHAPE_DATA_TYPE, {1}, dataTypeValue, sizeof(int64_t)};
    OHNNOperandTest value = {OH_NN_FLOAT32, OH_NN_CONSTANT_OF_SHAPE_VALUE, {1}, valueValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_CONSTANT_OF_SHAPE,
                               .operands = {input, output, dataType, value},
                               .paramIndices = {2, 3},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_ConstantOfShape_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_ConstantOfShape_Build_01
 * @tc.desc   ConstantOfShapeModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ConstantOfShapeTest, SUB_AI_NNRt_Func_North_ConstantOfShape_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    ConstantOfShapeModel1 constantOfShapeModel;
    OHNNGraphArgs graphArgs = constantOfShapeModel.graphArgs;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    EXPECT_NE(nullptr, compilation);

    OHNNCompileParam compileParam{
        .performanceMode = OH_NN_PERFORMANCE_HIGH,
        .priority = OH_NN_PRIORITY_HIGH,
    };
    EXPECT_EQ(OH_NN_SUCCESS, CompileGraphMock(compilation, compileParam));

    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    EXPECT_NE(nullptr, executor);

    Free(model, compilation, executor);
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_ConstantOfShape_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_ConstantOfShape_Build_02
 * @tc.desc   ConstantOfShapeModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ConstantOfShapeTest, SUB_AI_NNRt_Func_North_ConstantOfShape_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    ConstantOfShapeModel2 constantOfShapeModel;
    OHNNGraphArgs graphArgs = constantOfShapeModel.graphArgs;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    EXPECT_NE(nullptr, compilation);

    OHNNCompileParam compileParam{
        .performanceMode = OH_NN_PERFORMANCE_HIGH,
        .priority = OH_NN_PRIORITY_HIGH,
    };
    EXPECT_EQ(OH_NN_SUCCESS, CompileGraphMock(compilation, compileParam));

    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    EXPECT_NE(nullptr, executor);

    Free(model, compilation, executor);
}