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
class LeakyReluTest : public testing::Test {};

struct LeakyReluModel1 {
    const std::vector<int32_t> input_shape = {3};
    const std::vector<int32_t> output_shape = {3};
    float negativeSlopeValue[1] = {0.01};
    float inputValue[3] = {0.5, 1.0, 1.5};
    float outputValue[3] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 3*sizeof(float)};
    OHNNOperandTest negativeSlope = {
        OH_NN_FLOAT32, OH_NN_LEAKY_RELU_NEGATIVE_SLOPE, {1}, negativeSlopeValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LEAKY_RELU,
                               .operands = {input, output, negativeSlope},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct LeakyReluModel2 {
    const std::vector<int32_t> input_shape = {3};
    const std::vector<int32_t> output_shape = {3};
    float negativeSlopeValue[1] = {0.01};
    float inputValue[3] = {-0.5, -1.0, -1.5};
    float outputValue[3] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 3*sizeof(float)};
    OHNNOperandTest negativeSlope = {
        OH_NN_FLOAT32, OH_NN_LEAKY_RELU_NEGATIVE_SLOPE, {1}, negativeSlopeValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LEAKY_RELU,
                               .operands = {input, output, negativeSlope},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct LeakyReluModel3 {
    const std::vector<int32_t> input_shape = {3};
    const std::vector<int32_t> output_shape = {3};
    float negativeSlopeValue[1] = {0};
    float inputValue[3] = {-0.5, -1.0, -1.5};
    float outputValue[3] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 3*sizeof(float)};
    OHNNOperandTest negativeSlope = {
        OH_NN_FLOAT32, OH_NN_LEAKY_RELU_NEGATIVE_SLOPE, {1}, negativeSlopeValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LEAKY_RELU,
                               .operands = {input, output, negativeSlope},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct LeakyReluModel4 {
    const std::vector<int32_t> input_shape = {};
    const std::vector<int32_t> output_shape = {};
    float* inputValue = {};
    float* outputValue = {};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 0*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 0*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LEAKY_RELU,
                               .operands = {input, output},
                               .paramIndices = {},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_LeakyRelu_Model_AddOperation_08
 * @tc.number SUB_AI_NNRt_Func_North_LeakyRelu_Model_AddOperation_08
 * @tc.desc   添加算子，inputindices中size为0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(LeakyReluTest, SUB_AI_NNRt_Func_North_LeakyRelu_Model_AddOperation_08, Function | MediumTest | Level2)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    LeakyReluModel1 leakyReluModel;
    OHNNGraphArgs graphArgs = leakyReluModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    inputIndices.size = 0;
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, OH_NNModel_AddOperation(model, graphArgs.operationType,
                                                               &paramIndices, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
}