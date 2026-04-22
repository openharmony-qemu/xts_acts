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
class GreaterTest : public testing::Test {};

struct GreaterModel1 {
    const std::vector<int32_t> tensor_shape = {3};
    float input0Value[3] = {1, 2, 3};
    float input1Value[3] = {4, 5, 6};
    bool outputValue[3] = {0};

    OHNNOperandTest input0 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input0Value, 3*sizeof(float)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input1Value, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, outputValue, 3*sizeof(bool)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_GREATER,
                               .operands = {input0, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct GreaterModel2 {
    const std::vector<int32_t> tensor_shape = {1};
    float input0Value[1] = {1};
    float input1Value[1] = {1};
    bool outputValue[1] = {0};

    OHNNOperandTest input0 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input0Value, sizeof(float)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input1Value, sizeof(float)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, outputValue, sizeof(bool)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_GREATER,
                               .operands = {input0, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct GreaterModel3 {
    const std::vector<int32_t> tensor_shape = {3};
    const std::vector<int32_t> input1_shape = {4};
    float input0Value[3] = {1, 2, 3};
    float input1Value[4] = {4, 5, 6, 7};
    bool outputValue[3] = {0};

    OHNNOperandTest input0 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input0Value, 3*sizeof(float)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, input1_shape, input1Value, 4*sizeof(float)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, outputValue, 4*sizeof(bool)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_GREATER,
                               .operands = {input0, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct GreaterModel4 {
    const std::vector<int32_t> tensor_shape = {};
    float* input0Value = {};
    float* input1Value = {};
    bool* outputValue = {};

    OHNNOperandTest input0 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input0Value, 0*sizeof(float)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input1Value, 0*sizeof(float)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, outputValue, 0*sizeof(bool)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_GREATER,
                               .operands = {input0, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Greater_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_Greater_Build_03
 * @tc.desc   GreaterModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(GreaterTest, SUB_AI_NNRt_Func_North_Greater_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    GreaterModel3 greaterModel;
    OHNNGraphArgs graphArgs = greaterModel.graphArgs;
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