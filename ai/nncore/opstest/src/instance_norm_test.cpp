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
class InstanceNormTest : public testing::Test {};

struct InstanceNormModel1 {
    const std::vector<int32_t> input_shape = {2, 3, 2, 2};
    const std::vector<int32_t> channel_shape = {3};
    const std::vector<int32_t> output_shape = {4};
    float epsilonValue[1] = {1.0e-6f};
    float inputValue[2][3][2][2] = {{{{1, 1}, {1, 1}}, {{1, 1}, {1, 1}}, {{1, 1}, {1, 1}}},
                                    {{{1, 1}, {1, 1}}, {{1, 1}, {1, 1}}, {{1, 1}, {1, 1}}}};
    float scaleValue[3] = {1};
    float biasValue[3] = {1};
    float outputValue[4] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 24*sizeof(float)};
    OHNNOperandTest scale = {OH_NN_FLOAT32, OH_NN_TENSOR, channel_shape, scaleValue, 3*sizeof(float)};
    OHNNOperandTest bias = {OH_NN_FLOAT32, OH_NN_TENSOR, channel_shape, biasValue, 3*sizeof(float)};

    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 4*sizeof(float)};
    OHNNOperandTest epsilon = {OH_NN_FLOAT32, OH_NN_INSTANCE_NORM_EPSILON, {1}, &epsilonValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_INSTANCE_NORM,
                               .operands = {input, scale, bias, output, epsilon},
                               .paramIndices = {4},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct InstanceNormModel2 {
    const std::vector<int32_t> input_shape = {};
    const std::vector<int32_t> channel_shape = {};
    const std::vector<int32_t> output_shape = {};
    float epsilonValue[1] = {1.0e-6f};
    float* inputValue = {};
    float* scaleValue = {};
    float* biasValue = {};
    float* outputValue = {};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 0*sizeof(float)};
    OHNNOperandTest scale = {OH_NN_FLOAT32, OH_NN_TENSOR, channel_shape, scaleValue, 0*sizeof(float)};
    OHNNOperandTest bias = {OH_NN_FLOAT32, OH_NN_TENSOR, channel_shape, biasValue, 0*sizeof(float)};

    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 0*sizeof(float)};
    OHNNOperandTest epsilon = {OH_NN_FLOAT32, OH_NN_INSTANCE_NORM_EPSILON, {1}, &epsilonValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_INSTANCE_NORM,
                               .operands = {input, scale, bias, output, epsilon},
                               .paramIndices = {4},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_InstanceNorm_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_InstanceNorm_Build_02
 * @tc.desc   InstanceNormModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(InstanceNormTest, SUB_AI_NNRt_Func_North_InstanceNorm_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    InstanceNormModel2 instanceNormModel;
    OHNNGraphArgs graphArgs = instanceNormModel.graphArgs;
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