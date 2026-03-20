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
class LogicalAndTest : public testing::Test {};

struct LogicalAndModel1 {
    const std::vector<int32_t> tensor_shape = {3};
    int64_t input0Value[3] = {1, 0, 1};
    int64_t input1Value[3] = {0, 1, 1};
    bool outputValue[3] = {false};

    OHNNOperandTest input0 = {OH_NN_INT64, OH_NN_TENSOR, tensor_shape, input0Value, 3*sizeof(int64_t)};
    OHNNOperandTest input1 = {OH_NN_INT64, OH_NN_TENSOR, tensor_shape, input1Value, 3*sizeof(int64_t)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, outputValue, 3*sizeof(bool)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LOGICAL_AND,
                               .operands = {input0, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct LogicalAndModel2 {
    const std::vector<int32_t> tensor_shape = {3};
    int64_t input0Value[3] = {1, 0, 1};
    bool input1Value[1] = {false};
    bool outputValue[3] = {false};

    OHNNOperandTest input0 = {OH_NN_INT64, OH_NN_TENSOR, tensor_shape, input0Value, 3*sizeof(int64_t)};
    OHNNOperandTest input1 = {OH_NN_BOOL, OH_NN_TENSOR, {1}, input1Value, sizeof(bool)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, outputValue, 3*sizeof(bool)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LOGICAL_AND,
                               .operands = {input0, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct LogicalAndModel3 {
    const std::vector<int32_t> tensor_shape = {2};
    bool input0Value[2] = {true, false};
    bool input1Value[1] = {true};
    bool outputValue[2] = {false};

    OHNNOperandTest input0 = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, input0Value, 2*sizeof(bool)};
    OHNNOperandTest input1 = {OH_NN_BOOL, OH_NN_TENSOR, {1}, input1Value, sizeof(bool)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, outputValue, 2*sizeof(bool)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LOGICAL_AND,
                               .operands = {input0, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct LogicalAndModel4 {
    const std::vector<int32_t> tensor_shape = {2};
    bool input0Value[1] = {false};
    bool input1Value[2] = {true, false};
    bool outputValue[2] = {false};

    OHNNOperandTest input0 = {OH_NN_BOOL, OH_NN_TENSOR, {1}, input0Value, sizeof(bool)};
    OHNNOperandTest input1 = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, input1Value, 2*sizeof(bool)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, outputValue, 2*sizeof(bool)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LOGICAL_AND,
                               .operands = {input0, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct LogicalAndModel5 {
    const std::vector<int32_t> tensor_shape = {3};
    bool input0Value[3] = {true, false, true};
    bool input1Value[3] = {false, false, true};
    bool outputValue[3] = {false};

    OHNNOperandTest input0 = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, input0Value, 3*sizeof(bool)};
    OHNNOperandTest input1 = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, input1Value, 3*sizeof(bool)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, outputValue, 3*sizeof(bool)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LOGICAL_AND,
                               .operands = {input0, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Build_01
 * @tc.desc   LogicalAndModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(LogicalAndTest, SUB_AI_NNRt_Func_North_LogicalAnd_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    LogicalAndModel1 logicalAndModel;
    OHNNGraphArgs graphArgs = logicalAndModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Build_02
 * @tc.desc   LogicalAndModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(LogicalAndTest, SUB_AI_NNRt_Func_North_LogicalAnd_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    LogicalAndModel2 logicalAndModel;
    OHNNGraphArgs graphArgs = logicalAndModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_09
 * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_09
 * @tc.desc   添加算子，outputindices为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(LogicalAndTest, SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_09, Function | MediumTest | Level2)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    LogicalAndModel1 logicalAndModel;
    OHNNGraphArgs graphArgs = logicalAndModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, OH_NNModel_AddOperation(nullptr, graphArgs.operationType,
                                                               &paramIndices, &inputIndices, nullptr));

    Free(model, nullptr, nullptr);
}