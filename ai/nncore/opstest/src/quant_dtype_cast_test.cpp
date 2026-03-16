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
class QuantDTypeCastTest : public testing::Test {};

struct QuantDTypeCastModel1 {
    const std::vector<int32_t> tensor_shape = {4};
    std::vector<int64_t> axisValue = {0};
    std::vector<int64_t> srcValue = {1};
    std::vector<int64_t> dstValue = {1};
    int32_t inputValue[4] = {0.5, 1.0, 1.5, 2.0};
    int32_t outputValue[4] = {0};

    OHNNOperandTest input = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, inputValue, 4*sizeof(int32_t)};
    OHNNOperandTest output = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, outputValue, 4*sizeof(int32_t)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_QUANT_DTYPE_CAST_AXIS, {1}, &axisValue, sizeof(int64_t)};
    OHNNOperandTest src = {OH_NN_INT64, OH_NN_QUANT_DTYPE_CAST_SRC_T, {1}, &srcValue, sizeof(int64_t)};
    OHNNOperandTest dst = {OH_NN_INT64, OH_NN_QUANT_DTYPE_CAST_DST_T, {1}, &dstValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_QUANT_DTYPE_CAST,
                               .operands = {input, output, axis, src, dst},
                               .paramIndices = {2, 3, 4},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct QuantDTypeCastModel2 {
    const std::vector<int32_t> tensor_shape = {4};
    std::vector<int64_t> axisValue = {0};
    std::vector<int64_t> srcValue = {1};
    std::vector<int64_t> dstValue = {1};
    int32_t inputValue[4] = {0.5, 1.0, 1.5, 2.0};
    int32_t outputValue[4] = {0};

    OHNNOperandTest input = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, inputValue, 4*sizeof(int32_t)};
    OHNNOperandTest output = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, outputValue, 4*sizeof(int32_t)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_QUANT_DTYPE_CAST_AXIS, {1}, &axisValue, sizeof(int64_t)};
    OHNNOperandTest src = {OH_NN_INT64, OH_NN_QUANT_DTYPE_CAST_SRC_T, {1}, &srcValue, sizeof(int64_t)};
    OHNNOperandTest dst = {OH_NN_INT64, OH_NN_QUANT_DTYPE_CAST_DST_T, {1}, &dstValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_QUANT_DTYPE_CAST,
                               .operands = {input, output, axis, src, dst},
                               .paramIndices = {2, 3, 4},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

struct QuantDTypeCastModel3 {
    const std::vector<int32_t> tensor_shape = {2, 3};
    std::vector<int64_t> axisValue = {0};
    std::vector<int64_t> srcValue = {1};
    std::vector<int64_t> dstValue = {1};
    int32_t inputValue[2][3] = {{1.5, 2.5, 3.5}, {4.5, 5.5, 6.5}};
    int32_t outputValue[2][3] = {0};

    OHNNOperandTest input = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, inputValue, 6*sizeof(int32_t)};
    OHNNOperandTest output = {OH_NN_INT32, OH_NN_TENSOR, tensor_shape, outputValue, 6*sizeof(int32_t)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_QUANT_DTYPE_CAST_AXIS, {1}, &axisValue, sizeof(int64_t)};
    OHNNOperandTest src = {OH_NN_INT64, OH_NN_QUANT_DTYPE_CAST_SRC_T, {1}, &srcValue, sizeof(int64_t)};
    OHNNOperandTest dst = {OH_NN_INT64, OH_NN_QUANT_DTYPE_CAST_DST_T, {1}, &dstValue, sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_QUANT_DTYPE_CAST,
                               .operands = {input, output, axis, src, dst},
                               .paramIndices = {2, 3, 4},
                               .inputIndices = {0},
                               .outputIndices = {1}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_QuantDTypeCast_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_QuantDTypeCast_Build_01
 * @tc.desc   QuantDTypeCastModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(QuantDTypeCastTest, SUB_AI_NNRt_Func_North_QuantDTypeCast_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    QuantDTypeCastModel1 quantDTypeCastModel;
    OHNNGraphArgs graphArgs = quantDTypeCastModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_QuantDTypeCast_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_QuantDTypeCast_Build_02
 * @tc.desc   QuantDTypeCastModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(QuantDTypeCastTest, SUB_AI_NNRt_Func_North_QuantDTypeCast_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    QuantDTypeCastModel2 quantDTypeCastModel;
    OHNNGraphArgs graphArgs = quantDTypeCastModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_QuantDTypeCast_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_QuantDTypeCast_Build_03
 * @tc.desc   QuantDTypeCastModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(QuantDTypeCastTest, SUB_AI_NNRt_Func_North_QuantDTypeCast_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    QuantDTypeCastModel3 quantDTypeCastModel;
    OHNNGraphArgs graphArgs = quantDTypeCastModel.graphArgs;
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