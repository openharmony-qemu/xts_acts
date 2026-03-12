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
class SparseToDenseTest : public testing::Test {};

struct SparseToDenseModel1 {
    const std::vector<int32_t> indices_shape = {2, 2};
    const std::vector<int32_t> value_shape = {2};
    const std::vector<int32_t> output_shape = {2, 3};

    float indicesValue[2][2] = {{0, 0}, {1, 2}};
    float valueValue[2] = {1, 2};
    float sparseShapeValue[2] = {2, 3};
    float outputValue[2][3] = {0};

    OHNNOperandTest indices = {OH_NN_FLOAT32, OH_NN_TENSOR, indices_shape, indicesValue, 4*sizeof(bool)};
    OHNNOperandTest value = {OH_NN_FLOAT32, OH_NN_TENSOR, value_shape, valueValue, 2*sizeof(float)};
    OHNNOperandTest sparseDense = {OH_NN_FLOAT32, OH_NN_TENSOR, value_shape, sparseShapeValue, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 6*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SPARSE_TO_DENSE,
                               .operands = {indices, value, sparseDense, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct SparseToDenseModel2 {
    const std::vector<int32_t> indices_shape = {3, 2};
    const std::vector<int32_t> value_shape = {3};
    const std::vector<int32_t> sparse_dense_shape = {2};
    const std::vector<int32_t> output_shape = {2, 3};

    float indicesValue[3][2] = {{0, 1}, {1, 1}, {1, 2}};
    float valueValue[3] = {3, 4, 5};
    float sparseShapeValue[3] = {2, 3};
    float outputValue[2][3] = {0};

    OHNNOperandTest indices = {OH_NN_FLOAT32, OH_NN_TENSOR, indices_shape, indicesValue, 6*sizeof(bool)};
    OHNNOperandTest value = {OH_NN_FLOAT32, OH_NN_TENSOR, value_shape, valueValue, 3*sizeof(float)};
    OHNNOperandTest sparseDense = {OH_NN_FLOAT32, OH_NN_TENSOR, sparse_dense_shape, sparseShapeValue, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 6*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SPARSE_TO_DENSE,
                               .operands = {indices, value, sparseDense, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct SparseToDenseModel3 {
    const std::vector<int32_t> indices_shape = {2, 2};
    const std::vector<int32_t> value_shape = {2};
    const std::vector<int32_t> output_shape = {3, 4};

    float indicesValue[2][2] = {{1, 0}, {0, 3}};
    float valueValue[2] = {9, 10};
    float sparseShapeValue[2] = {3, 4};
    float outputValue[3][4] = {0};

    OHNNOperandTest indices = {OH_NN_FLOAT32, OH_NN_TENSOR, indices_shape, indicesValue, 4*sizeof(bool)};
    OHNNOperandTest value = {OH_NN_FLOAT32, OH_NN_TENSOR, value_shape, valueValue, 2*sizeof(float)};
    OHNNOperandTest sparseDense = {OH_NN_FLOAT32, OH_NN_TENSOR, value_shape, sparseShapeValue, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 12*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SPARSE_TO_DENSE,
                               .operands = {indices, value, sparseDense, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct SparseToDenseModel4 {
    const std::vector<int32_t> indices_shape = {4};
    const std::vector<int32_t> value_shape = {2};
    const std::vector<int32_t> output_shape = {2, 3};

    float indicesValue[4] = {0, 0, 1, 2};
    float valueValue[2] = {1, 2};
    float sparseShapeValue[2] = {2, 3};
    float outputValue[2][3] = {0};

    OHNNOperandTest indices = {OH_NN_FLOAT32, OH_NN_TENSOR, indices_shape, indicesValue, 4*sizeof(bool)};
    OHNNOperandTest value = {OH_NN_FLOAT32, OH_NN_TENSOR, value_shape, valueValue, 2*sizeof(float)};
    OHNNOperandTest sparseDense = {OH_NN_FLOAT32, OH_NN_TENSOR, value_shape, sparseShapeValue, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 6*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SPARSE_TO_DENSE,
                               .operands = {indices, value, sparseDense, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct SparseToDenseModel5 {
    const std::vector<int32_t> indices_shape = {2, 2};
    const std::vector<int32_t> value_shape = {1, 2};
    const std::vector<int32_t> sparse_dense_shape = {2};
    const std::vector<int32_t> output_shape = {3, 4};

    float indicesValue[2][2] = {{0, 0}, {1, 2}};
    float valueValue[1][2] = {{1, 2}};
    float sparseShapeValue[2] = {2, 3};
    float outputValue[2][3] = {0};

    OHNNOperandTest indices = {OH_NN_FLOAT32, OH_NN_TENSOR, indices_shape, indicesValue, 4*sizeof(bool)};
    OHNNOperandTest value = {OH_NN_FLOAT32, OH_NN_TENSOR, value_shape, valueValue, 2*sizeof(float)};
    OHNNOperandTest sparseDense = {OH_NN_FLOAT32, OH_NN_TENSOR, sparse_dense_shape, sparseShapeValue, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 6*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SPARSE_TO_DENSE,
                               .operands = {indices, value, sparseDense, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct SparseToDenseModel6 {
    const std::vector<int32_t> indices_shape = {2, 2};
    const std::vector<int32_t> value_shape = {2};
    const std::vector<int32_t> sparse_dense_shape = {3};
    const std::vector<int32_t> output_shape = {3, 4};

    float indicesValue[2][2] = {{0, 0}, {1, 2}};
    float valueValue[2] = {1, 2};
    float sparseShapeValue[3] = {2, 3, 1};
    float outputValue[2][3][1] = {0};

    OHNNOperandTest indices = {OH_NN_FLOAT32, OH_NN_TENSOR, indices_shape, indicesValue, 4*sizeof(bool)};
    OHNNOperandTest value = {OH_NN_FLOAT32, OH_NN_TENSOR, value_shape, valueValue, 2*sizeof(float)};
    OHNNOperandTest sparseDense = {OH_NN_FLOAT32, OH_NN_TENSOR, sparse_dense_shape, sparseShapeValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 6*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SPARSE_TO_DENSE,
                               .operands = {indices, value, sparseDense, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_SparseToDense_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_SparseToDense_Build_01
 * @tc.desc   SparseToDenseModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SparseToDenseTest, SUB_AI_NNRt_Func_North_SparseToDense_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SparseToDenseModel1 sparseToDenseModel;
    OHNNGraphArgs graphArgs = sparseToDenseModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_SparseToDense_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_SparseToDense_Build_02
 * @tc.desc   SparseToDenseModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SparseToDenseTest, SUB_AI_NNRt_Func_North_SparseToDense_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SparseToDenseModel2 sparseToDenseModel;
    OHNNGraphArgs graphArgs = sparseToDenseModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_SparseToDense_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_SparseToDense_Build_03
 * @tc.desc   SparseToDenseModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SparseToDenseTest, SUB_AI_NNRt_Func_North_SparseToDense_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SparseToDenseModel3 sparseToDenseModel;
    OHNNGraphArgs graphArgs = sparseToDenseModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_SparseToDense_Build_04
 * @tc.number SUB_AI_NNRt_Func_North_SparseToDense_Build_04
 * @tc.desc   SparseToDenseModel4模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SparseToDenseTest, SUB_AI_NNRt_Func_North_SparseToDense_Build_04, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SparseToDenseModel4 sparseToDenseModel;
    OHNNGraphArgs graphArgs = sparseToDenseModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_SparseToDense_Build_05
 * @tc.number SUB_AI_NNRt_Func_North_SparseToDense_Build_05
 * @tc.desc   SparseToDenseModel5模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SparseToDenseTest, SUB_AI_NNRt_Func_North_SparseToDense_Build_05, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SparseToDenseModel5 sparseToDenseModel;
    OHNNGraphArgs graphArgs = sparseToDenseModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_SparseToDense_Build_06
 * @tc.number SUB_AI_NNRt_Func_North_SparseToDense_Build_06
 * @tc.desc   SparseToDenseModel6模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SparseToDenseTest, SUB_AI_NNRt_Func_North_SparseToDense_Build_06, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    SparseToDenseModel6 sparseToDenseModel;
    OHNNGraphArgs graphArgs = sparseToDenseModel.graphArgs;
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