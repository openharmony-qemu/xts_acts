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
class SinTest : public testing::Test {};

struct SinModel1 {
    const std::vector<int32_t> tensor_shape = {3};
    float inputValue[3] = {0, 1, 2};
    float outputValue[3] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, inputValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 3*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SIN,
                               .operands = {input, output},
                               .paramIndices = {},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};


struct SinModel2 {
    const std::vector<int32_t> tensor_shape = {2};
    bool inputValue[2] = {false, true};
    float outputValue[2] = {0};

    OHNNOperandTest input = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, inputValue, 2*sizeof(bool)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 2*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SIN,
                               .operands = {input, output},
                               .paramIndices = {},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Sin_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_Sin_Build_02
 * @tc.desc   SinModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SinTest, SUB_AI_NNRt_Func_North_Sin_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SinModel2 sinModel;
    OHNNGraphArgs graphArgs = sinModel.graphArgs;
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