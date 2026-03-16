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
class PowTest : public testing::Test {};

struct PowModel1 {
    const std::vector<int32_t> tensor_shape = {2};
    float scaleValue = 2;
    float shiftValue = 1;
    float input0Value[2] = {1, 2};
    float input1Value[2] = {2, 3};
    float outputValue[2] = {0};

    OHNNOperandTest input0 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input0Value, 2*sizeof(float)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input1Value, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 2*sizeof(float)};
    OHNNOperandTest scale = {OH_NN_FLOAT32, OH_NN_POW_SCALE, {1}, &scaleValue, sizeof(float)};
    OHNNOperandTest shift = {OH_NN_FLOAT32, OH_NN_POW_SHIFT, {1}, &shiftValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_POW,
                               .operands = {input0, input1, output, scale, shift},
                               .paramIndices = {3, 4},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct PowModel2 {
    const std::vector<int32_t> tensor_shape = {1};
    float scaleValue = 1;
    float shiftValue = 0;
    float input0Value[1] = {2};
    float input1Value[1] = {3};
    float outputValue[1] = {0};

    OHNNOperandTest input0 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input0Value, sizeof(float)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input1Value, sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, sizeof(float)};
    OHNNOperandTest scale = {OH_NN_FLOAT32, OH_NN_POW_SCALE, {1}, &scaleValue, sizeof(float)};
    OHNNOperandTest shift = {OH_NN_FLOAT32, OH_NN_POW_SHIFT, {1}, &shiftValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_POW,
                               .operands = {input0, input1, output, scale, shift},
                               .paramIndices = {3, 4},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct PowModel3 {
    const std::vector<int32_t> input0_shape = {2};
    const std::vector<int32_t> input1_shape = {1};
    float scaleValue = 0.5;
    float shiftValue = 2;
    float input0Value[2] = {0, 1};
    float input1Value[1] = {2};
    float outputValue[2] = {0};

    OHNNOperandTest input0 = {OH_NN_FLOAT32, OH_NN_TENSOR, input0_shape, input0Value, 2*sizeof(float)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, input1_shape, input1Value, sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, input0_shape, outputValue, 2*sizeof(float)};
    OHNNOperandTest scale = {OH_NN_FLOAT32, OH_NN_POW_SCALE, {1}, &scaleValue, sizeof(float)};
    OHNNOperandTest shift = {OH_NN_FLOAT32, OH_NN_POW_SHIFT, {1}, &shiftValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_POW,
                               .operands = {input0, input1, output, scale, shift},
                               .paramIndices = {3, 4},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Pow_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_Pow_Build_01
 * @tc.desc   PowModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(PowTest, SUB_AI_NNRt_Func_North_Pow_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    PowModel1 powModel;
    OHNNGraphArgs graphArgs = powModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Pow_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_Pow_Build_02
 * @tc.desc   PowModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(PowTest, SUB_AI_NNRt_Func_North_Pow_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    PowModel2 powModel;
    OHNNGraphArgs graphArgs = powModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Pow_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_Pow_Build_03
 * @tc.desc   PowModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(PowTest, SUB_AI_NNRt_Func_North_Pow_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    PowModel3 powModel;
    OHNNGraphArgs graphArgs = powModel.graphArgs;
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