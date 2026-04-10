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
class LogSoftmaxTest : public testing::Test {};

struct LogSoftmaxModel1 {
    const std::vector<int32_t> tensor_shape = {4, 2};
    int64_t axisValue[1] = {1};
    float inputValue[4][2] = {{1, 2}, {3, 4}, {5, 6}, {7, 8}};
    float outputValue[4][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 8*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 8*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_LOG_SOFTMAX_AXIS, {1}, axisValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LOG_SOFTMAX,
                               .operands = {input, output, axis},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct LogSoftmaxModel2 {
    const std::vector<int32_t> tensor_shape = {4, 2};
    int64_t axisValue[1] = {0};
    float inputValue[4][2] = {{1, 2}, {3, 4}, {5, 6}, {7, 8}};
    float outputValue[4][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 8*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 8*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_LOG_SOFTMAX_AXIS, {1}, axisValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LOG_SOFTMAX,
                               .operands = {input, output, axis},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct LogSoftmaxModel3 {
    const std::vector<int32_t> tensor_shape = {4, 2};
    int64_t axisValue[1] = {2};
    float inputValue[4][2] = {{1, 2}, {3, 4}, {5, 6}, {7, 8}};
    float outputValue[4][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 8*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 8*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_LOG_SOFTMAX_AXIS, {1}, axisValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LOG_SOFTMAX,
                               .operands = {input, output, axis},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_LogSoftmax_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_LogSoftmax_Build_03
 * @tc.desc   LogSoftmaxModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(LogSoftmaxTest, SUB_AI_NNRt_Func_North_LogSoftmax_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    LogSoftmaxModel3 logSoftmaxModel;
    OHNNGraphArgs graphArgs = logSoftmaxModel.graphArgs;
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