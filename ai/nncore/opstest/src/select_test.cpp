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
class SelectTest : public testing::Test {};

struct SelectModel1 {
    const std::vector<int32_t> tensor_shape = {1};
    bool input0Value[1] = {true};
    float input1Value[1] = {1};
    float input2Value[1] = {4};
    float outputValue[1] = {0};

    OHNNOperandTest input0 = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, input0Value, sizeof(bool)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input1Value, sizeof(float)};
    OHNNOperandTest input2 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input2Value, sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SELECT,
                               .operands = {input0, input1, input2, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct SelectModel2 {
    const std::vector<int32_t> tensor_shape = {3};
    bool input0Value[3] = {true, false, false};
    float input1Value[3] = {1, 2, 3};
    float input2Value[3] = {4, 5, 6};
    float outputValue[3] = {0};

    OHNNOperandTest input0 = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, input0Value, 3*sizeof(bool)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input1Value, 3*sizeof(float)};
    OHNNOperandTest input2 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input2Value, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 3*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SELECT,
                               .operands = {input0, input1, input2, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct SelectModel3 {
    const std::vector<int32_t> input0_shape = {2};
    const std::vector<int32_t> input_shape = {3};
    bool input0Value[2] = {true, false};
    float input1Value[3] = {1, 2, 3};
    float input2Value[3] = {4, 5, 6};
    float outputValue[3] = {0};

    OHNNOperandTest input0 = {OH_NN_BOOL, OH_NN_TENSOR, input0_shape, input0Value, 2*sizeof(bool)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, input1Value, 3*sizeof(float)};
    OHNNOperandTest input2 = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, input2Value, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, outputValue, 3*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SELECT,
                               .operands = {input0, input1, input2, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct SelectModel4 {
    const std::vector<int32_t> input0_shape = {2};
    const std::vector<int32_t> input1_shape = {3};
    const std::vector<int32_t> input2_shape = {4};
    bool input0Value[2] = {true, false};
    float input1Value[3] = {1, 2, 3};
    float input2Value[4] = {4, 5, 6, 7};
    float outputValue[3] = {0};

    OHNNOperandTest input0 = {OH_NN_BOOL, OH_NN_TENSOR, input0_shape, input0Value, 2*sizeof(bool)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, input1_shape, input1Value, 3*sizeof(float)};
    OHNNOperandTest input2 = {OH_NN_FLOAT32, OH_NN_TENSOR, input2_shape, input2Value, 4*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, input1_shape, outputValue, 3*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SELECT,
                               .operands = {input0, input1, input2, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct SelectModel5 {
    const std::vector<int32_t> tensor_shape = {1};
    bool* input0Value = {};
    float* input1Value = {};
    float* outputValue = {};

    OHNNOperandTest input0 = {OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, input0Value, sizeof(bool)};
    OHNNOperandTest input1 = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, input1Value, sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SELECT,
                               .operands = {input0, input1, input1, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Select_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_Select_Build_03
 * @tc.desc   SelectModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SelectTest, SUB_AI_NNRt_Func_North_Select_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SelectModel3 selectModel;
    OHNNGraphArgs graphArgs = selectModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Select_Build_04
 * @tc.number SUB_AI_NNRt_Func_North_Select_Build_04
 * @tc.desc   SelectModel4模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SelectTest, SUB_AI_NNRt_Func_North_Select_Build_04, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SelectModel4 selectModel;
    OHNNGraphArgs graphArgs = selectModel.graphArgs;
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