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
class ExpTest : public testing::Test {};

struct ExpModel1 {
    const std::vector<int32_t> tensor_shape = {3, 3};
    float baseValue = 1;
    float scaleValue = 1.5;
    float shiftValue = 1;
    float inputValue[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    float outputValue[3][3] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 9*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 9*sizeof(float)};
    OHNNOperandTest base = {OH_NN_FLOAT32, OH_NN_EXP_BASE, {1}, &baseValue, sizeof(float)};
    OHNNOperandTest scale = {OH_NN_FLOAT32, OH_NN_EXP_SCALE, {1}, &scaleValue, sizeof(float)};
    OHNNOperandTest shift = {OH_NN_FLOAT32, OH_NN_EXP_SHIFT, {1}, &scaleValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_EXP,
                               .operands = {input, output, base, scale, shift},
                               .paramIndices = {2, 3, 4},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct ExpModel2 {
    const std::vector<int32_t> tensor_shape = {3};
    float inputValue[3] = {0, 1, 2};
    float outputValue[3] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 3*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_EXP,
                               .operands = {input, output},
                               .paramIndices = {},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct ExpModel3 {
    const std::vector<int32_t> tensor_shape = {3, 3};
    float baseValue = 0;
    float scaleValue = 1.5;
    float shiftValue = 1;
    float inputValue[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    float outputValue[3][3] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 9*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 9*sizeof(float)};
    OHNNOperandTest base = {OH_NN_FLOAT32, OH_NN_EXP_BASE, {1}, &baseValue, sizeof(float)};
    OHNNOperandTest scale = {OH_NN_FLOAT32, OH_NN_EXP_SCALE, {1}, &scaleValue, sizeof(float)};
    OHNNOperandTest shift = {OH_NN_FLOAT32, OH_NN_EXP_SHIFT, {1}, &scaleValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_EXP,
                               .operands = {input, output, base, scale, shift},
                               .paramIndices = {2, 3, 4},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct ExpModel4 {
    const std::vector<int32_t> tensor_shape = {};
    float baseValue = 1;
    float scaleValue = 1.5;
    float shiftValue = 1;
    float* inputValue = {};
    float* outputValue = {};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 0*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 0*sizeof(float)};
    OHNNOperandTest base = {OH_NN_FLOAT32, OH_NN_EXP_BASE, {1}, &baseValue, sizeof(float)};
    OHNNOperandTest scale = {OH_NN_FLOAT32, OH_NN_EXP_SCALE, {1}, &scaleValue, sizeof(float)};
    OHNNOperandTest shift = {OH_NN_FLOAT32, OH_NN_EXP_SHIFT, {1}, &scaleValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_EXP,
                               .operands = {input, output, base, scale, shift},
                               .paramIndices = {2, 3, 4},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Exp_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_Exp_Build_03
 * @tc.desc   ExpModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ExpTest, SUB_AI_NNRt_Func_North_Exp_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    ExpModel3 expModel;
    OHNNGraphArgs graphArgs = expModel.graphArgs;
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