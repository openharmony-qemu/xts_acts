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
class BroadcastToTest : public testing::Test {};

struct BroadcastToModel1 {
    const std::vector<int32_t> input_shape = {3};
    const std::vector<int32_t> output_shape = {3, 3};
    std::vector<int64_t> shapeValue = {3, 3};
    float inputValue[3] = {1, 2, 3};
    float outputValue[9] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 9*sizeof(float)};
    OHNNOperandTest shape = {OH_NN_INT64, OH_NN_BROADCAST_TO_SHAPE, {2}, &shapeValue, 2*sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_BROADCAST_TO,
                               .operands = {input, output, shape},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct BroadcastToModel2 {
    const std::vector<int32_t> input_shape = {3};
    const std::vector<int32_t> output_shape = {2, 2};
    std::vector<int64_t> shapeValue = {2, 2};
    float inputValue[3] = {1, 2, 3};
    float* outputValue = {};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 4*sizeof(float)};
    OHNNOperandTest shape = {OH_NN_INT64, OH_NN_BROADCAST_TO_SHAPE, {2}, &shapeValue, 2*sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_BROADCAST_TO,
                               .operands = {input, output, shape},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct BroadcastToModel3 {
    const std::vector<int32_t> input_shape = {3};
    const std::vector<int32_t> output_shape = {1, 3};
    std::vector<int64_t> shapeValue = {0, 3};
    float inputValue[3] = {1, 2, 3};
    float* outputValue = {};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 3*sizeof(float)};
    OHNNOperandTest shape = {OH_NN_INT64, OH_NN_BROADCAST_TO_SHAPE, {2}, &shapeValue, 2*sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_BROADCAST_TO,
                               .operands = {input, output, shape},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_BroadcastTo_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_BroadcastTo_Build_01
 * @tc.desc   BroadcastToModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(BroadcastToTest, SUB_AI_NNRt_Func_North_BroadcastTo_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    BroadcastToModel1 broadcastToModel;
    OHNNGraphArgs graphArgs = broadcastToModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_BroadcastTo_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_BroadcastTo_Build_02
 * @tc.desc   BroadcastToModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(BroadcastToTest, SUB_AI_NNRt_Func_North_BroadcastTo_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    BroadcastToModel2 broadcastToModel;
    OHNNGraphArgs graphArgs = broadcastToModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_BroadcastTo_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_BroadcastTo_Build_03
 * @tc.desc   BroadcastToModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(BroadcastToTest, SUB_AI_NNRt_Func_North_BroadcastTo_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    BroadcastToModel3 broadcastToModel;
    OHNNGraphArgs graphArgs = broadcastToModel.graphArgs;
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