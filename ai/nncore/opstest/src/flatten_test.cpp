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
class FlattenTest : public testing::Test {};

struct FlattenModel1 {
    const std::vector<int32_t> input_shape = {3, 3};
    const std::vector<int32_t> output_shape = {9};
    float inputValue[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    float outputValue[9] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 9*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 9*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_FLATTEN,
                               .operands = {input, output},
                               .paramIndices = {},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct FlattenModel2 {
    const std::vector<int32_t> input_shape = {2, 2, 2};
    const std::vector<int32_t> output_shape = {8};
    float inputValue[2][2][2] = {{{1, 2}, {3, 4}}, {{5, 6}, {7, 8}}};
    float outputValue[8] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 8*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 8*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_FLATTEN,
                               .operands = {input, output},
                               .paramIndices = {},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct FlattenModel3 {
    const std::vector<int32_t> input_shape = {9};
    const std::vector<int32_t> output_shape = {9};
    float inputValue[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    float outputValue[9] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 9*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 9*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_FLATTEN,
                               .operands = {input, output},
                               .paramIndices = {},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct FlattenModel4 {
    const std::vector<int32_t> tensor_shape = {};
    float* inputValue = {};
    float* outputValue = {};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 0*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 0*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_FLATTEN,
                               .operands = {input, output},
                               .paramIndices = {},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Flatten_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_Flatten_Build_03
 * @tc.desc   FlattenModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(FlattenTest, SUB_AI_NNRt_Func_North_Flatten_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    FlattenModel3 flattenModel;
    OHNNGraphArgs graphArgs = flattenModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Flatten_Build_04
 * @tc.number SUB_AI_NNRt_Func_North_Flatten_Build_04
 * @tc.desc   FlattenModel4模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(FlattenTest, SUB_AI_NNRt_Func_North_Flatten_Build_04, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    FlattenModel4 flattenModel;
    OHNNGraphArgs graphArgs = flattenModel.graphArgs;
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