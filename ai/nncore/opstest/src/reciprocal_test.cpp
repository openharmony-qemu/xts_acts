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
class ReciprocalTest : public testing::Test {};

struct ReciprocalModel1 {
    const std::vector<int32_t> tensor_shape = {2, 2};
    float inputValue[2][2] = {{1, 2}, {3, 4}};
    float outputValue[2][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 4*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 4*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_RECIPROCAL,
                               .operands = {input, output},
                               .paramIndices = {},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct ReciprocalModel2 {
    const std::vector<int32_t> tensor_shape = {3};
    float inputValue[3] = {-1, -2, -4};
    float outputValue[3] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 3*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_RECIPROCAL,
                               .operands = {input, output},
                               .paramIndices = {},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct ReciprocalModel3 {
    const std::vector<int32_t> tensor_shape = {1};
    bool inputValue[1] = {false};
    float outputValue[1] = {0};

    OHNNOperandTest input = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, inputValue, sizeof(bool)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_RECIPROCAL,
                               .operands = {input, output},
                               .paramIndices = {},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Reciprocal_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_Reciprocal_Build_03
 * @tc.desc   ReciprocalModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ReciprocalTest, SUB_AI_NNRt_Func_North_Reciprocal_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    ReciprocalModel3 reciprocalModel;
    OHNNGraphArgs graphArgs = reciprocalModel.graphArgs;
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