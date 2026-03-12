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
class LSTMTest : public testing::Test {};

struct LSTMModel1 {
    const std::vector<int32_t> input_shape = {5, 2, 10};
    const std::vector<int32_t> wih_shape = {8, 10};
    const std::vector<int32_t> whh_shape = {8, 2};
    const std::vector<int32_t> bias_shape = {16};
    const std::vector<int32_t> hx_shape = {2, 2};
    const std::vector<int32_t> output_shape = {5, 2};

    float inputValue[5][2][10] = {1};
    float wihValue[8][10] = {1};
    float whhValue[8][2] = {1};
    float biasValue[16] = {1};
    float hxValue[2][2] = {1};
    float cxValue[2][2] = {1};

    int64_t inputSizeValue[1] = {10};
    int64_t hiddenSizeValue[1] = {2};
    int64_t numLayersValue[1] = {1};

    float outputValue[5][2] = {0};
    float hyValue[2][2] = {0};
    float cyValue[2][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 100*sizeof(float)};
    OHNNOperandTest wih = {OH_NN_FLOAT32, OH_NN_TENSOR, wih_shape, wihValue, 80*sizeof(float)};
    OHNNOperandTest whh = {OH_NN_FLOAT32, OH_NN_TENSOR, whh_shape, whhValue, 16*sizeof(float)};
    OHNNOperandTest bias = {OH_NN_FLOAT32, OH_NN_TENSOR, bias_shape, biasValue, 16*sizeof(float)};
    OHNNOperandTest hx = {OH_NN_FLOAT32, OH_NN_TENSOR, hx_shape, hxValue, 4*sizeof(float)};
    OHNNOperandTest cx = {OH_NN_FLOAT32, OH_NN_TENSOR, hx_shape, cxValue, 4*sizeof(float)};

    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 10*sizeof(float)};
    OHNNOperandTest hy = {OH_NN_FLOAT32, OH_NN_TENSOR, hx_shape, hyValue, 4*sizeof(float)};
    OHNNOperandTest cy = {OH_NN_FLOAT32, OH_NN_TENSOR, hx_shape, cyValue, 4*sizeof(float)};

    OHNNOperandTest inputSize = {OH_NN_INT64, OH_NN_LSTM_INPUT_SIZE, {1}, inputSizeValue, sizeof(int64_t)};
    OHNNOperandTest hiddenSize = {OH_NN_INT64, OH_NN_LSTM_HIDDEN_SIZE, {1}, hiddenSizeValue, sizeof(int64_t)};
    OHNNOperandTest numLayers = {OH_NN_INT64, OH_NN_LSTM_NUM_LAYERS, {1}, numLayersValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_LSTM,
                               .operands = {input, wih, whh, bias, hx, cx, output, hy,
                                            cy, inputSize, hiddenSize, numLayers},
                               .paramIndices = {9, 10, 11},
                               .inputIndices = {0, 1, 2, 3, 4, 5},
                               .outputIndices = {6, 7, 8}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_LSTM_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_LSTM_Build_01
 * @tc.desc   LSTMModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(LSTMTest, SUB_AI_NNRt_Func_North_LSTM_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    LSTMModel1 lSTMModel;
    OHNNGraphArgs graphArgs = lSTMModel.graphArgs;
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