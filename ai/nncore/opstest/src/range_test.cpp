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
class RangeTest : public testing::Test {};

struct RangeModel1 {
    const std::vector<int32_t> tensor_shape = {3};
    std::vector<int64_t> startValue = {-1};
    std::vector<int64_t> limitValue = {10};
    std::vector<int64_t> deltaValue = {4};
    int32_t inputValue[3] = {0};
    int32_t outputValue[3] = {0};

    OHNNOperandTest input = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, inputValue, 3*sizeof(int32_t)};
    OHNNOperandTest output = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, outputValue, 3*sizeof(int32_t)};
    OHNNOperandTest start = {OH_NN_INT64, OH_NN_RANGE_START, {1}, &startValue, sizeof(int64_t)};
    OHNNOperandTest limit = {OH_NN_INT64, OH_NN_RANGE_LIMIT, {1}, &limitValue, sizeof(int64_t)};
    OHNNOperandTest delta = {OH_NN_INT64, OH_NN_RANGE_DELTA, {1}, &deltaValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_RANGE,
                               .operands = {input, output, start, limit, delta},
                               .paramIndices = {2, 3, 4},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct RangeModel2 {
    const std::vector<int32_t> tensor_shape = {1};
    std::vector<int64_t> startValue = {1};
    std::vector<int64_t> limitValue = {1};
    std::vector<int64_t> deltaValue = {4};
    int32_t inputValue[1] = {0};
    int32_t outputValue[1] = {0};

    OHNNOperandTest input = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, inputValue, sizeof(int32_t)};
    OHNNOperandTest output = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, outputValue, sizeof(int32_t)};
    OHNNOperandTest start = {OH_NN_INT64, OH_NN_RANGE_START, {1}, &startValue, sizeof(int64_t)};
    OHNNOperandTest limit = {OH_NN_INT64, OH_NN_RANGE_LIMIT, {1}, &limitValue, sizeof(int64_t)};
    OHNNOperandTest delta = {OH_NN_INT64, OH_NN_RANGE_DELTA, {1}, &deltaValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_RANGE,
                               .operands = {input, output, start, limit, delta},
                               .paramIndices = {2, 3, 4},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct RangeModel3 {
    const std::vector<int32_t> tensor_shape = {1};
    std::vector<int64_t> startValue = {2};
    std::vector<int64_t> limitValue = {1};
    std::vector<int64_t> deltaValue = {4};
    int32_t inputValue[1] = {0};
    int32_t outputValue[1] = {0};

    OHNNOperandTest input = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, inputValue, sizeof(int32_t)};
    OHNNOperandTest output = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, outputValue, sizeof(int32_t)};
    OHNNOperandTest start = {OH_NN_INT64, OH_NN_RANGE_START, {1}, &startValue, sizeof(int64_t)};
    OHNNOperandTest limit = {OH_NN_INT64, OH_NN_RANGE_LIMIT, {1}, &limitValue, sizeof(int64_t)};
    OHNNOperandTest delta = {OH_NN_INT64, OH_NN_RANGE_DELTA, {1}, &deltaValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_RANGE,
                               .operands = {input, output, start, limit, delta},
                               .paramIndices = {2, 3, 4},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct RangeModel4 {
    const std::vector<int32_t> tensor_shape = {2};
    std::vector<int64_t> startValue = {2.4};
    std::vector<int64_t> limitValue = {10};
    std::vector<int64_t> deltaValue = {4};
    float inputValue[2] = {0};
    float outputValue[2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT16, OH_NN_TENSOR, tensor_shape, inputValue, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT16, OH_NN_TENSOR, tensor_shape, outputValue, 2*sizeof(float)};
    OHNNOperandTest start = {OH_NN_INT64, OH_NN_RANGE_START, {1}, &startValue, sizeof(int64_t)};
    OHNNOperandTest limit = {OH_NN_INT64, OH_NN_RANGE_LIMIT, {1}, &limitValue, sizeof(int64_t)};
    OHNNOperandTest delta = {OH_NN_INT64, OH_NN_RANGE_DELTA, {1}, &deltaValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_RANGE,
                               .operands = {input, output, start, limit, delta},
                               .paramIndices = {2, 3, 4},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct RangeModel5 {
    const std::vector<int32_t> tensor_shape = {2};
    std::vector<int64_t> startValue = {2.4};
    std::vector<int64_t> limitValue = {10};
    std::vector<int64_t> deltaValue = {4};
    int32_t inputValue[2] = {0};
    int32_t outputValue[2] = {0};

    OHNNOperandTest input = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, inputValue, 2*sizeof(int32_t)};
    OHNNOperandTest output = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, outputValue, 2*sizeof(int32_t)};
    OHNNOperandTest start = {OH_NN_INT64, OH_NN_RANGE_START, {1}, &startValue, sizeof(int64_t)};
    OHNNOperandTest limit = {OH_NN_INT64, OH_NN_RANGE_LIMIT, {1}, &limitValue, sizeof(int64_t)};
    OHNNOperandTest delta = {OH_NN_INT64, OH_NN_RANGE_DELTA, {1}, &deltaValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_RANGE,
                               .operands = {input, output, start, limit, delta},
                               .paramIndices = {2, 3, 4},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Range_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_Range_Build_01
 * @tc.desc   RangeModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(RangeTest, SUB_AI_NNRt_Func_North_Range_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    RangeModel1 rangeModel;
    OHNNGraphArgs graphArgs = rangeModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Range_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_Range_Build_02
 * @tc.desc   RangeModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(RangeTest, SUB_AI_NNRt_Func_North_Range_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    RangeModel2 rangeModel;
    OHNNGraphArgs graphArgs = rangeModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Range_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_Range_Build_03
 * @tc.desc   RangeModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(RangeTest, SUB_AI_NNRt_Func_North_Range_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    RangeModel3 rangeModel;
    OHNNGraphArgs graphArgs = rangeModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Range_Build_04
 * @tc.number SUB_AI_NNRt_Func_North_Range_Build_04
 * @tc.desc   RangeModel4模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(RangeTest, SUB_AI_NNRt_Func_North_Range_Build_04, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    RangeModel4 rangeModel;
    OHNNGraphArgs graphArgs = rangeModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Range_Build_05
 * @tc.number SUB_AI_NNRt_Func_North_Range_Build_05
 * @tc.desc   RangeModel5模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(RangeTest, SUB_AI_NNRt_Func_North_Range_Build_05, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    RangeModel5 rangeModel;
    OHNNGraphArgs graphArgs = rangeModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Range_Build_06
 * @tc.number SUB_AI_NNRt_Func_North_Range_Build_06
 * @tc.desc   RangeModel1模型输入Tensor+1进行build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(RangeTest, SUB_AI_NNRt_Func_North_Range_Build_06, Function | MediumTest | Level2)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    RangeModel1 rangeModel;
    OHNNGraphArgs graphArgs = rangeModel.graphArgs;
    graphArgs.operands = {rangeModel.input, rangeModel.input, rangeModel.output,
                          rangeModel.start, rangeModel.limit, rangeModel.delta};
    graphArgs.inputIndices = {0, 1};
    graphArgs.outputIndices = {2};
    graphArgs.paramIndices = {3, 4, 5};
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, BuildSingleOpGraph(model, graphArgs));

    Free(model, nullptr, nullptr);
}