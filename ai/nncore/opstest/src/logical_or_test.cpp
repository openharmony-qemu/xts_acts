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
class LogicalOrTest : public testing::Test {};

struct LogicalOrModel1 {
    const std::vector<int32_t> tensor_shape = {3};
    bool input0Value[3] = {true, false, true};
    bool input1Value[3] = {false, false, true};
    bool outputValue[3] = {false};

    OHNNOperandTest input0 = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, input0Value, 3*sizeof(bool)};
    OHNNOperandTest input1 = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, input1Value, 3*sizeof(bool)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, outputValue, 3*sizeof(bool)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LOGICAL_OR,
                               .operands = {input0, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct LogicalOrModel2 {
    const std::vector<int32_t> tensor_shape = {3};
    int64_t input0Value[3] = {0, 1, 0};
    int64_t input1Value[3] = {1, 0, 1};
    bool outputValue[3] = {false};

    OHNNOperandTest input0 = {OH_NN_INT64, OH_NN_TENSOR, tensor_shape, input0Value, 3*sizeof(int64_t)};
    OHNNOperandTest input1 = {OH_NN_INT64, OH_NN_TENSOR, tensor_shape, input1Value, 3*sizeof(int64_t)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, outputValue, 3*sizeof(bool)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LOGICAL_OR,
                               .operands = {input0, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_LogicalOr_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_LogicalOr_Build_02
 * @tc.desc   LogicalOrModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(LogicalOrTest, SUB_AI_NNRt_Func_North_LogicalOr_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    LogicalOrModel2 logicalOrModel;
    OHNNGraphArgs graphArgs = logicalOrModel.graphArgs;
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