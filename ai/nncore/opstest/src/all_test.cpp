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
class AllTest : public testing::Test {};

struct AllModel1 {
    const std::vector<int32_t> input_shape = {2, 2};
    const std::vector<int32_t> output_shape = {1};
    std::vector<int64_t> keepDimsValue = {0};
    bool inputValue[2][2] = {{true, true}, {true, false}};
    int64_t* axisValue = {};
    bool outputValue[1] = {false};

    OHNNOperandTest input = {OH_NN_BOOL, OH_NN_TENSOR, input_shape, inputValue, 4*sizeof(bool)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_TENSOR, {}, axisValue, 0*sizeof(int64_t)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, output_shape, outputValue, sizeof(bool)};
    OHNNOperandTest keepDims = {OH_NN_INT64, OH_NN_ALL_KEEP_DIMS, {1}, &keepDimsValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_ALL,
                               .operands = {input, axis, output, keepDims},
                               .paramIndices = {3},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct AllModel2 {
    const std::vector<int32_t> input_shape = {2, 3};
    const std::vector<int32_t> output_shape = {2, 1};
    std::vector<int64_t> keepDimsValue = {1};
    bool inputValue[2][3] = {{true, false, true}, {true, true, true}};
    int64_t axisValue[1] = {1};
    bool outputValue[2][1] = {false};

    OHNNOperandTest input = {OH_NN_BOOL, OH_NN_TENSOR, input_shape, inputValue, 6*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_TENSOR, {1}, axisValue, sizeof(int64_t)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, output_shape, outputValue, 2*sizeof(float)};
    OHNNOperandTest keepDims = {OH_NN_INT64, OH_NN_ALL_KEEP_DIMS, {1}, &keepDimsValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_ALL,
                               .operands = {input, axis, output, keepDims},
                               .paramIndices = {3},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct AllModel3 {
    const std::vector<int32_t> input_shape = {2, 2, 2};
    const std::vector<int32_t> output_shape = {1};
    std::vector<int64_t> keepDimsValue = {1};
    bool inputValue[2][2][2] = {{{true, true}, {true, true}}, {{true, true}, {true, true}}};
    int64_t* axisValue = {};
    bool outputValue[1] = {false};

    OHNNOperandTest input = {OH_NN_BOOL, OH_NN_TENSOR, input_shape, inputValue, 8*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_TENSOR, {}, axisValue, 0*sizeof(int64_t)};
    OHNNOperandTest output = {OH_NN_BOOL, OH_NN_TENSOR, output_shape, outputValue, sizeof(float)};
    OHNNOperandTest keepDims = {OH_NN_INT64, OH_NN_ALL_KEEP_DIMS, {1}, &keepDimsValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_ALL,
                               .operands = {input, axis, output, keepDims},
                               .paramIndices = {3},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_All_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_All_Build_01
 * @tc.desc   AllModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AllTest, SUB_AI_NNRt_Func_North_All_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    AllModel1 allModel;
    OHNNGraphArgs graphArgs = allModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_All_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_All_Build_02
 * @tc.desc   AllModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AllTest, SUB_AI_NNRt_Func_North_All_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    AllModel2 allModel;
    OHNNGraphArgs graphArgs = allModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_All_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_All_Build_03
 * @tc.desc   AllModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AllTest, SUB_AI_NNRt_Func_North_All_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    AllModel3 allModel;
    OHNNGraphArgs graphArgs = allModel.graphArgs;
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
