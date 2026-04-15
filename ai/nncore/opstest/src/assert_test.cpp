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
class AssertTest : public testing::Test {};

struct AssertModel1 {
    const std::vector<int32_t> tensor_shape = {2, 3};
    const std::vector<int32_t> condition_shape = {1};
    std::vector<int64_t> summarizeValue = {3};
    bool conditionValue[1] = {false};
    int64_t inputValue[2][3] = {{1, 2, 3}, {4, 5, 6}};
    int64_t outputValue[2][3] = {0};

    OHNNOperandTest input = {OH_NN_INT64, OH_NN_TENSOR, tensor_shape, inputValue, 6*sizeof(int64_t)};
    OHNNOperandTest condition = {OH_NN_BOOL, OH_NN_TENSOR, condition_shape, conditionValue, sizeof(bool)};
    OHNNOperandTest output = {OH_NN_INT64, OH_NN_TENSOR, tensor_shape, outputValue, 6*sizeof(int64_t)};
    OHNNOperandTest summarize = {OH_NN_INT64, OH_NN_ASSERT_SUMMARIZE, {1}, &summarizeValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_ASSERT,
                               .operands = {input, condition, output, summarize},
                               .paramIndices = {3},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct AssertModel2 {
    const std::vector<int32_t> tensor_shape = {2, 3};
    const std::vector<int32_t> condition_shape = {1};
    std::vector<int64_t> summarizeValue = {2};
    bool conditionValue[1] = {true};
    int64_t inputValue[2][3] = {{7, 8, 9}, {10, 11, 12}};
    int64_t outputValue[2][3] = {0};

    OHNNOperandTest input = {OH_NN_INT64, OH_NN_TENSOR, tensor_shape, inputValue, 6*sizeof(int64_t)};
    OHNNOperandTest condition = {OH_NN_BOOL, OH_NN_TENSOR, condition_shape, conditionValue, sizeof(bool)};
    OHNNOperandTest output = {OH_NN_INT64, OH_NN_TENSOR, tensor_shape, outputValue, 6*sizeof(int64_t)};
    OHNNOperandTest summarize = {OH_NN_INT64, OH_NN_ASSERT_SUMMARIZE, {1}, &summarizeValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_ASSERT,
                               .operands = {input, condition, output, summarize},
                               .paramIndices = {3},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Assert_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_Assert_Build_01
 * @tc.desc   AssertModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AssertTest, SUB_AI_NNRt_Func_North_Assert_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    AssertModel1 assertModel;
    OHNNGraphArgs graphArgs = assertModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Assert_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_Assert_Build_02
 * @tc.desc   AssertModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AssertTest, SUB_AI_NNRt_Func_North_Assert_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    AssertModel2 assertModel;
    OHNNGraphArgs graphArgs = assertModel.graphArgs;
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