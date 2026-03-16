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
class ScatterNdTest : public testing::Test {};

struct ScatterNdModel1 {
    const std::vector<int32_t> indices_shape = {2, 1};
    const std::vector<int32_t> updates_shape = {2};
    const std::vector<int32_t> shape_shape = {1};
    const std::vector<int32_t> output_shape = {3};
    float indicesValue[2][1] = {{0}, {2}};
    float updatesValue[2] = {1, 3};
    float shapeValue[1] = {3};
    float outputValue[3] = {0};

    OHNNOperandTest indices = {OH_NN_FLOAT32, OH_NN_TENSOR, indices_shape, indicesValue, 4*sizeof(float)};
    OHNNOperandTest updates = {OH_NN_FLOAT32, OH_NN_TENSOR, updates_shape, updatesValue, 2*sizeof(float)};
    OHNNOperandTest shape = {OH_NN_FLOAT32, OH_NN_TENSOR, shape_shape, shapeValue, sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 3*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SCATTER_ND,
                               .operands = {indices, updates, shape, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct ScatterNdModel2 {
    const std::vector<int32_t> indices_shape = {2, 2};
    const std::vector<int32_t> updates_shape = {2};
    const std::vector<int32_t> shape_shape = {2};
    const std::vector<int32_t> output_shape = {3};
    float indicesValue[2][2] = {{1, 0}, {0, 1}};
    float updatesValue[2] = {4, 5};
    float shapeValue[2] = {2, 2};
    float outputValue[2][2] = {0};

    OHNNOperandTest indices = {OH_NN_FLOAT32, OH_NN_TENSOR, indices_shape, indicesValue, 4*sizeof(float)};
    OHNNOperandTest updates = {OH_NN_FLOAT32, OH_NN_TENSOR, updates_shape, updatesValue, 2*sizeof(float)};
    OHNNOperandTest shape = {OH_NN_FLOAT32, OH_NN_TENSOR, shape_shape, shapeValue, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 4*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SCATTER_ND,
                               .operands = {indices, updates, shape, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct ScatterNdModel3 {
    const std::vector<int32_t> indices_shape = {2, 2};
    const std::vector<int32_t> updates_shape = {2, 2};
    const std::vector<int32_t> shape_shape = {2};
    const std::vector<int32_t> output_shape = {2, 2};
    float indicesValue[2][2] = {{0, 1}, {1, 0}};
    float updatesValue[2][2] = {{6, 7}, {8, 9}};
    float shapeValue[2] = {2, 2};
    float outputValue[2][2] = {0};

    OHNNOperandTest indices = {OH_NN_FLOAT32, OH_NN_TENSOR, indices_shape, indicesValue, 4*sizeof(float)};
    OHNNOperandTest updates = {OH_NN_FLOAT32, OH_NN_TENSOR, updates_shape, updatesValue, 4*sizeof(float)};
    OHNNOperandTest shape = {OH_NN_FLOAT32, OH_NN_TENSOR, shape_shape, shapeValue, 2*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 4*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SCATTER_ND,
                               .operands = {indices, updates, shape, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

struct ScatterNdModel4 {
    const std::vector<int32_t> indices_shape = {2, 3};
    const std::vector<int32_t> updates_shape = {2};
    const std::vector<int32_t> shape_shape = {3};
    const std::vector<int32_t> output_shape = {2, 2, 2};
    float indicesValue[2][3] = {{0, 0, 1}, {1, 1, 0}};
    float updatesValue[2] = {10, 11};
    float shapeValue[3] = {2, 2, 2};
    float outputValue[2][2][2] = {0};

    OHNNOperandTest indices = {OH_NN_FLOAT32, OH_NN_TENSOR, indices_shape, indicesValue, 6*sizeof(float)};
    OHNNOperandTest updates = {OH_NN_FLOAT32, OH_NN_TENSOR, updates_shape, updatesValue, 2*sizeof(float)};
    OHNNOperandTest shape = {OH_NN_FLOAT32, OH_NN_TENSOR, shape_shape, shapeValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 8*sizeof(float)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_SCATTER_ND,
                               .operands = {indices, updates, shape, output},
                               .paramIndices = {},
                               .inputIndices = {0, 1, 2},
                               .outputIndices = {3}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_ScatterNd_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_ScatterNd_Build_01
 * @tc.desc   ScatterNdModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ScatterNdTest, SUB_AI_NNRt_Func_North_ScatterNd_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    ScatterNdModel1 scatterNdModel;
    OHNNGraphArgs graphArgs = scatterNdModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_ScatterNd_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_ScatterNd_Build_02
 * @tc.desc   ScatterNdModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ScatterNdTest, SUB_AI_NNRt_Func_North_ScatterNd_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    ScatterNdModel2 scatterNdModel;
    OHNNGraphArgs graphArgs = scatterNdModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_ScatterNd_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_ScatterNd_Build_03
 * @tc.desc   ScatterNdModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ScatterNdTest, SUB_AI_NNRt_Func_North_ScatterNd_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    ScatterNdModel3 scatterNdModel;
    OHNNGraphArgs graphArgs = scatterNdModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_ScatterNd_Build_04
 * @tc.number SUB_AI_NNRt_Func_North_ScatterNd_Build_04
 * @tc.desc   ScatterNdModel4模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ScatterNdTest, SUB_AI_NNRt_Func_North_ScatterNd_Build_04, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    ScatterNdModel4 scatterNdModel;
    OHNNGraphArgs graphArgs = scatterNdModel.graphArgs;
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