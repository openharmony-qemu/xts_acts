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
class DepthToSpaceTest : public testing::Test {};

struct DepthToSpaceModel1 {
    const std::vector<int32_t> input_shape = {1, 4, 4, 4};
    const std::vector<int32_t> output_shape = {1, 1, 8, 8};
    std::vector<int64_t> blockSizeValue = {2};
    float inputValue[1][4][4][4] = {{{{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}, {13, 14, 15, 16}},
                                     {{17, 18, 19, 20}, {21, 22, 23, 24}, {25, 26, 27, 28}, {29, 30, 31, 32}},
                                     {{33, 34, 35, 36}, {37, 38, 39, 40}, {41, 42, 43, 44}, {45, 46, 47, 48}},
                                     {{49, 50, 51, 52}, {53, 54, 55, 56}, {57, 58, 59, 60}, {61, 62, 63, 64}}}};
    float outputValue[1][1][8][8] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 64*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 64*sizeof(float)};
    OHNNOperandTest blockSize = {OH_NN_INT64, OH_NN_DEPTH_TO_SPACE_BLOCK_SIZE, {1}, &blockSizeValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_DEPTH_TO_SPACE,
                               .operands = {input, output, blockSize},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct DepthToSpaceModel2 {
    const std::vector<int32_t> tensor_shape = {1, 12, 1, 1};
    std::vector<int64_t> blockSizeValue = {0};
    float inputValue[1][12][1][1] = {{{{1}}, {{2}}, {{3}}, {{4}}, {{5}}, {{6}},
                                      {{7}}, {{8}}, {{9}}, {{10}}, {{11}}, {{12}}}};
    float outputValue[1][12][1][1] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 12*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 12*sizeof(float)};
    OHNNOperandTest blockSize = {OH_NN_INT64, OH_NN_DEPTH_TO_SPACE_BLOCK_SIZE, {1}, &blockSizeValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_DEPTH_TO_SPACE,
                               .operands = {input, output, blockSize},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DepthToSpace_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_DepthToSpace_Build_01
 * @tc.desc   DepthToSpaceModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DepthToSpaceTest, SUB_AI_NNRt_Func_North_DepthToSpace_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DepthToSpaceModel1 depthToSpaceModel;
    OHNNGraphArgs graphArgs = depthToSpaceModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_DepthToSpace_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_DepthToSpace_Build_02
 * @tc.desc   DepthToSpaceModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DepthToSpaceTest, SUB_AI_NNRt_Func_North_DepthToSpace_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DepthToSpaceModel2 depthToSpaceModel;
    OHNNGraphArgs graphArgs = depthToSpaceModel.graphArgs;
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