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
class SpaceToDepthTest : public testing::Test {};

struct SpaceToDepthModel1 {
    const std::vector<int32_t> input_shape = {1, 1, 4, 4};
    const std::vector<int32_t> output_shape = {1, 4, 2, 2};
    std::vector<int64_t> blockSizeValue = {2};
    float inputValue[1][1][4][4] = {1};
    float outputValue[1][4][2][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 16*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 16*sizeof(float)};
    OHNNOperandTest blockSize = {OH_NN_INT64, OH_NN_SPACE_TO_DEPTH_BLOCK_SIZE, {1}, &blockSizeValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SPACE_TO_DEPTH,
                               .operands = {input, output, blockSize},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct SpaceToDepthModel2 {
    const std::vector<int32_t> input_shape = {2, 3, 8, 8};
    const std::vector<int32_t> output_shape = {2, 48, 2, 2};
    std::vector<int64_t> blockSizeValue = {4};
    float inputValue[2][3][8][8] = {1};
    float outputValue[2][48][2][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 384*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 384*sizeof(float)};
    OHNNOperandTest blockSize = {OH_NN_INT64, OH_NN_SPACE_TO_DEPTH_BLOCK_SIZE, {1}, &blockSizeValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SPACE_TO_DEPTH,
                               .operands = {input, output, blockSize},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct SpaceToDepthModel3 {
    const std::vector<int32_t> input_shape = {1, 2, 6, 6};
    const std::vector<int32_t> output_shape = {1, 18, 2, 2};
    std::vector<int64_t> blockSizeValue = {3};
    float inputValue[1][2][6][6] = {1};
    float outputValue[1][18][2][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 72*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 72*sizeof(float)};
    OHNNOperandTest blockSize = {OH_NN_INT64, OH_NN_SPACE_TO_DEPTH_BLOCK_SIZE, {1}, &blockSizeValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SPACE_TO_DEPTH,
                               .operands = {input, output, blockSize},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct SpaceToDepthModel4 {
    const std::vector<int32_t> input_shape = {1, 4, 2, 2};
    const std::vector<int32_t> output_shape = {1, 16, 1, 1};
    std::vector<int64_t> blockSizeValue = {2};
    float inputValue[1][4][2][2] = {1};
    float outputValue[1][16][1][1] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 16*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 16*sizeof(float)};
    OHNNOperandTest blockSize = {OH_NN_INT64, OH_NN_SPACE_TO_DEPTH_BLOCK_SIZE, {1}, &blockSizeValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SPACE_TO_DEPTH,
                               .operands = {input, output, blockSize},
                               .paramIndices = {2},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_SpaceToDepth_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_SpaceToDepth_Build_01
 * @tc.desc   SpaceToDepthModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SpaceToDepthTest, SUB_AI_NNRt_Func_North_SpaceToDepth_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SpaceToDepthModel1 spaceToDepthModel;
    OHNNGraphArgs graphArgs = spaceToDepthModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_SpaceToDepth_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_SpaceToDepth_Build_02
 * @tc.desc   SpaceToDepthModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SpaceToDepthTest, SUB_AI_NNRt_Func_North_SpaceToDepth_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SpaceToDepthModel2 spaceToDepthModel;
    OHNNGraphArgs graphArgs = spaceToDepthModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_SpaceToDepth_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_SpaceToDepth_Build_03
 * @tc.desc   SpaceToDepthModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SpaceToDepthTest, SUB_AI_NNRt_Func_North_SpaceToDepth_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SpaceToDepthModel3 spaceToDepthModel;
    OHNNGraphArgs graphArgs = spaceToDepthModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_SpaceToDepth_Build_04
 * @tc.number SUB_AI_NNRt_Func_North_SpaceToDepth_Build_04
 * @tc.desc   SpaceToDepthModel4模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SpaceToDepthTest, SUB_AI_NNRt_Func_North_SpaceToDepth_Build_04, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SpaceToDepthModel4 spaceToDepthModel;
    OHNNGraphArgs graphArgs = spaceToDepthModel.graphArgs;
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