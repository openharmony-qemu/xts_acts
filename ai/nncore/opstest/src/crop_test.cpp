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
class CropTest : public testing::Test {};

struct CropModel1 {
    const std::vector<int32_t> input_shape = {2, 4, 4};
    const std::vector<int32_t> shape_shape = {3};
    const std::vector<int32_t> output_shape = {2, 2, 2};

    int64_t axisValue[1] = {0};
    std::vector<int64_t> offsetsValue = {0, 1, 1};
    float inputValue[2][4][4] = {1};
    float shapeValue[3] = {2, 2, 2};
    float outputValue[2][2][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 32*sizeof(float)};
    OHNNOperandTest shape = {OH_NN_FLOAT32, OH_NN_TENSOR, shape_shape, shapeValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 8*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_CROP_AXIS, {1}, axisValue, sizeof(int64_t)};
    OHNNOperandTest offsets = {OH_NN_INT64, OH_NN_CROP_OFFSET, {3}, &offsetsValue, 3*sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_CROP,
                               .operands = {input, shape, output, axis, offsets},
                               .paramIndices = {3, 4},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct CropModel2 {
    const std::vector<int32_t> input_shape = {3, 2, 2};
    const std::vector<int32_t> shape_shape = {3};
    const std::vector<int32_t> output_shape = {3, 2, 2};

    int64_t axisValue[1] = {1};
    std::vector<int64_t> offsetsValue = {0, 2, 2};
    float inputValue[3][2][2] = {1};
    float shapeValue[3] = {3, 2, 2};
    float outputValue[3][2][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 12*sizeof(float)};
    OHNNOperandTest shape = {OH_NN_FLOAT32, OH_NN_TENSOR, shape_shape, shapeValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 12*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_CROP_AXIS, {1}, axisValue, sizeof(int64_t)};
    OHNNOperandTest offsets = {OH_NN_INT64, OH_NN_CROP_OFFSET, {3}, &offsetsValue, 3*sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_CROP,
                               .operands = {input, shape, output, axis, offsets},
                               .paramIndices = {3, 4},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

struct CropModel3 {
    const std::vector<int32_t> input_shape = {3, 2, 2};
    const std::vector<int32_t> shape_shape = {3};
    const std::vector<int32_t> output_shape = {4, 2, 2};

    int64_t axisValue[1] = {1};
    std::vector<int64_t> offsetsValue = {0, 1, 1};
    float inputValue[3][2][2] = {1};
    float shapeValue[3] = {4, 2, 2};
    float outputValue[4][2][2] = {0};

    OHNNOperandTest input = {OH_NN_FLOAT32, OH_NN_TENSOR, input_shape, inputValue, 12*sizeof(float)};
    OHNNOperandTest shape = {OH_NN_FLOAT32, OH_NN_TENSOR, shape_shape, shapeValue, 3*sizeof(float)};
    OHNNOperandTest output = {OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, outputValue, 16*sizeof(float)};
    OHNNOperandTest axis = {OH_NN_INT64, OH_NN_CROP_AXIS, {1}, axisValue, sizeof(int64_t)};
    OHNNOperandTest offsets = {OH_NN_INT64, OH_NN_CROP_OFFSET, {3}, &offsetsValue, 3*sizeof(int64_t)};
    OHNNGraphArgs graphArgs = {.operationType = OH_NN_OPS_CROP,
                               .operands = {input, shape, output, axis, offsets},
                               .paramIndices = {3, 4},
                               .inputIndices = {0, 1},
                               .outputIndices = {2}};
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Crop_Build_01
 * @tc.number SUB_AI_NNRt_Func_North_Crop_Build_01
 * @tc.desc   CropModel1模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(CropTest, SUB_AI_NNRt_Func_North_Crop_Build_01, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CropModel1 cropModel;
    OHNNGraphArgs graphArgs = cropModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Crop_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_Crop_Build_02
 * @tc.desc   CropModel2模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(CropTest, SUB_AI_NNRt_Func_North_Crop_Build_02, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CropModel2 cropModel;
    OHNNGraphArgs graphArgs = cropModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Crop_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_Crop_Build_03
 * @tc.desc   CropModel3模型build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(CropTest, SUB_AI_NNRt_Func_North_Crop_Build_03, Function | MediumTest | Level1)
{
    OH_NNModel *model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CropModel3 cropModel;
    OHNNGraphArgs graphArgs = cropModel.graphArgs;
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