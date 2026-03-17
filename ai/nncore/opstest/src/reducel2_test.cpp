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
class ReduceL2Test : public testing::Test {};

struct ReduceL2Model1 {
    const std::vector<int32_t> input_shape = {2, 2};
    const std::vector<int32_t> output_shape = {2, 2};

    bool keepDimsValue[1] = {false};
    bool reduceToEndValue[1] = {false};
    float coeffValue[1] = {1};
    float inputValue[2][2] = {{1, 2}, {3, 4}};
    float axisValue[1] = {0};
    float outputValue[2][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 4*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_FLOAT32, OH_NN_TENSOR, {1}, axisValue, sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 4*sizeof(float)};
    OHNNOperandTest keepDims = {OH_NN_BOOL, OH_NN_REDUCE_L2_KEEP_DIMS, {1}, keepDimsValue, sizeof(bool)};
    OHNNOperandTest reduceToEnd = {OH_NN_BOOL, OH_NN_REDUCE_L2_REDUCE_TO_END, {1}, reduceToEndValue, sizeof(bool)};
    OHNNOperandTest coeff = {OH_NN_FLOAT32, OH_NN_REDUCE_L2_COEFF, {1}, coeffValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_REDUCE_L2,
                               .operands = {input, axis, output, keepDims, reduceToEnd, coeff},
                               .paramIndices = {3, 4, 5},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct ReduceL2Model2 {
    const std::vector<int32_t> input_shape = {2, 2};
    const std::vector<int32_t> output_shape = {1, 2};

    bool keepDimsValue[1] = {true};
    bool reduceToEndValue[1] = {false};
    float coeffValue[1] = {1};
    float inputValue[2][2] = {{1, 2}, {3, 4}};
    float axisValue[1] = {1};
    float outputValue[1][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 4*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_FLOAT32, OH_NN_TENSOR, {1}, axisValue, sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 2*sizeof(float)};
    OHNNOperandTest keepDims = {OH_NN_BOOL, OH_NN_REDUCE_L2_KEEP_DIMS, {1}, keepDimsValue, sizeof(bool)};
    OHNNOperandTest reduceToEnd = {OH_NN_BOOL, OH_NN_REDUCE_L2_REDUCE_TO_END, {1}, reduceToEndValue, sizeof(bool)};
    OHNNOperandTest coeff = {OH_NN_FLOAT32, OH_NN_REDUCE_L2_COEFF, {1}, coeffValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_REDUCE_L2,
                               .operands = {input, axis, output, keepDims, reduceToEnd, coeff},
                               .paramIndices = {3, 4, 5},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct ReduceL2Model3 {
    const std::vector<int32_t> input_shape = {2, 2, 2};
    const std::vector<int32_t> output_shape = {2, 2};

    bool keepDimsValue[1] = {false};
    bool reduceToEndValue[1] = {false};
    float coeffValue[1] = {1};
    float inputValue[2][2][2] = {{{1, 2}, {3, 4}}, {{5, 6}, {7, 8}}};
    float axisValue[2] = {0, 1};
    float outputValue[2][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 8*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_FLOAT32, OH_NN_TENSOR, {2}, axisValue, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 4*sizeof(float)};
    OHNNOperandTest keepDims = {OH_NN_BOOL, OH_NN_REDUCE_L2_KEEP_DIMS, {1}, keepDimsValue, sizeof(bool)};
    OHNNOperandTest reduceToEnd = {OH_NN_BOOL, OH_NN_REDUCE_L2_REDUCE_TO_END, {1}, reduceToEndValue, sizeof(bool)};
    OHNNOperandTest coeff = {OH_NN_FLOAT32, OH_NN_REDUCE_L2_COEFF, {1}, coeffValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_REDUCE_L2,
                               .operands = {input, axis, output, keepDims, reduceToEnd, coeff},
                               .paramIndices = {3, 4, 5},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct ReduceL2Model4 {
    const std::vector<int32_t> input_shape = {2, 2, 2};
    const std::vector<int32_t> output_shape = {2, 2};

    bool keepDimsValue[1] = {true};
    bool reduceToEndValue[1] = {true};
    float coeffValue[1] = {1};
    float inputValue[2][2][2] = {{{1, 2}, {3, 4}}, {{5, 6}, {7, 8}}};
    float axisValue[1] = {0};
    float outputValue[1][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 8*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_FLOAT32, OH_NN_TENSOR, {1}, axisValue, sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 2*sizeof(float)};
    OHNNOperandTest keepDims = {OH_NN_BOOL, OH_NN_REDUCE_L2_KEEP_DIMS, {1}, keepDimsValue, sizeof(bool)};
    OHNNOperandTest reduceToEnd = {OH_NN_BOOL, OH_NN_REDUCE_L2_REDUCE_TO_END, {1}, reduceToEndValue, sizeof(bool)};
    OHNNOperandTest coeff = {OH_NN_FLOAT32, OH_NN_REDUCE_L2_COEFF, {1}, coeffValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_REDUCE_L2,
                               .operands = {input, axis, output, keepDims, reduceToEnd, coeff},
                               .paramIndices = {3, 4, 5},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct ReduceL2Model5 {
    const std::vector<int32_t> input_shape = {2, 2, 2};
    const std::vector<int32_t> output_shape = {2, 2};

    bool keepDimsValue[1] = {false};
    bool reduceToEndValue[1] = {true};
    float coeffValue[1] = {2};
    float inputValue[2][2][2] = {{{1, 2}, {3, 4}}, {{5, 6}, {7, 8}}};
    float axisValue[2] = {0, 1};
    float outputValue[2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 8*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_FLOAT32, OH_NN_TENSOR, {2}, axisValue, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 2*sizeof(float)};
    OHNNOperandTest keepDims = {OH_NN_BOOL, OH_NN_REDUCE_L2_KEEP_DIMS, {1}, keepDimsValue, sizeof(bool)};
    OHNNOperandTest reduceToEnd = {OH_NN_BOOL, OH_NN_REDUCE_L2_REDUCE_TO_END, {1}, reduceToEndValue, sizeof(bool)};
    OHNNOperandTest coeff = {OH_NN_FLOAT32, OH_NN_REDUCE_L2_COEFF, {1}, coeffValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_REDUCE_L2,
                               .operands = {input, axis, output, keepDims, reduceToEnd, coeff},
                               .paramIndices = {3, 4, 5},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_ReduceL2_Build_04
 * @tc.number SUB_AI_NNRt_Func_North_ReduceL2_Build_04
 * @tc.desc   ReduceL2Model4模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ReduceL2Test, SUB_AI_NNRt_Func_North_ReduceL2_Build_04, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    ReduceL2Model4 reduceL2Model;
    OHNNGraphArgs graphArgs = reduceL2Model.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_ReduceL2_Build_05
 * @tc.number SUB_AI_NNRt_Func_North_ReduceL2_Build_05
 * @tc.desc   ReduceL2Model5模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ReduceL2Test, SUB_AI_NNRt_Func_North_ReduceL2_Build_05, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    ReduceL2Model5 reduceL2Model;
    OHNNGraphArgs graphArgs = reduceL2Model.graphArgs;
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