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
class UnstackTest : public testing::Test {};

struct UnstackModel1 {
    const std::vector<int32_t> input_shape = {3, 2};
    const std::vector<int32_t> output_shape = {3, 1};
    int64_t axisValue = -1;
    float inputValue[3][2] = {{1, 2}, {3, 4}, {5, 6}};
    float outputValue[3][1] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 6*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 3*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_UNSTACK_AXIS, {1}, &axisValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_UNSTACK,
                               .operands = {input, output, output, axis},
                               .paramIndices = {3},
                               .inputIndices = {0},
                               .outputIndices = {1, 2}};
};

struct UnstackModel2 {
    const std::vector<int32_t> input_shape = {3};
    const std::vector<int32_t> output_shape = {1};
    int64_t axisValue = 0;
    float inputValue[3] = {1, 5, 6};
    float outputValue[1] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_UNSTACK_AXIS, {1}, &axisValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_UNSTACK,
                               .operands = {input, output, output, output, axis},
                               .paramIndices = {4},
                               .inputIndices = {0},
                               .outputIndices = {1, 2, 3}};
};

struct UnstackModel3 {
    const std::vector<int32_t> input_shape = {3, 2};
    const std::vector<int32_t> output_shape = {3, 1};
    int64_t axisValue = 1;
    float inputValue[3][2] = {{1, 2}, {3, 4}, {5, 6}};
    float outputValue[3][1] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 6*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 3*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_UNSTACK_AXIS, {1}, &axisValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_UNSTACK,
                               .operands = {input, output, output, axis},
                               .paramIndices = {3},
                               .inputIndices = {0},
                               .outputIndices = {1, 2}};
};

struct UnstackModel4 {
    const std::vector<int32_t> input_shape = {3, 2};
    const std::vector<int32_t> output_shape = {1, 2};
    int64_t axisValue = 0;
    float inputValue[3][2] = {{1, 2}, {3, 4}, {5, 6}};
    float outputValue[3][1] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 6*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 2*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_UNSTACK_AXIS, {1}, &axisValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_UNSTACK,
                               .operands = {input, output, output, output, axis},
                               .paramIndices = {4},
                               .inputIndices = {0},
                               .outputIndices = {1, 2, 3}};
};

struct UnstackModel5 {
    const std::vector<int32_t> tensor_shape = {};
    int64_t axisValue = 0;
    float* inputValue = {};
    float* outputValue = {};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 0*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 0*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_UNSTACK_AXIS, {1}, &axisValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_UNSTACK,
                               .operands = {input, output, axis},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Unstack_Build_05
 * @tc.number SUB_AI_NNRt_Func_North_Unstack_Build_05
 * @tc.desc   UnstackModel5模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(UnstackTest, SUB_AI_NNRt_Func_North_Unstack_Build_05, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    UnstackModel5 unstackModel;
    OHNNGraphArgs graphArgs = unstackModel.graphArgs;
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