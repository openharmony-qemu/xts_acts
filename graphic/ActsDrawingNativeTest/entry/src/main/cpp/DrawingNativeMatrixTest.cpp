/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "include/DrawingNativeMatrixTest.h"
#include <iostream>
#include <random>
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_6 6
#define DRAWING_NUMBER_7 7
#define DRAWING_NUMBER_8 8
#define DRAWING_NUMBER_9 9
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_30 30
#define DRAWING_NUMBER_90 90
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_180 180
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_360 360
#define DRAWING_NUMBER_361 361
#define DRAWING_NUMBER_19937 19937

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeMatrixTestSetUp()
{
    std::cout << "DrawingNativeMatrixTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMatrixTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeMatrixTestTearDown()
{
    std::cout << "DrawingNativeMatrixTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMatrixTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testMatrixCreateDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_NUMBER_100
 * @tc.desc   Test for creating and destroying a matrix with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixCreateDestroyNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixDestroy
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateDestroyNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0101
 * @tc.desc   Test for creating and destroying a matrix with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateDestroyNULL()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixDestroy with nullptr parameter
    OH_Drawing_Matrix *matrix = nullptr;
    OH_Drawing_MatrixDestroy(nullptr);
    EXPECT_EQ(matrix, nullptr);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateDestroyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0102
 * @tc.desc   Test for multiple calls of creating and destroying a matrix.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateDestroyMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. Call OH_Drawing_MatrixCreate 10 times
    OH_Drawing_Matrix *matrices[DRAWING_NUMBER_10];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        matrices[i] = OH_Drawing_MatrixCreate();
        EXPECT_NE(matrices[i], nullptr);
    }
    // 2. Call OH_Drawing_MatrixDestroy 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_MatrixDestroy(matrices[i]);
    }
    // 3. Call OH_Drawing_MatrixCreate and OH_Drawing_MatrixDestroy alternately 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateRotationNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_NUMBER_200
 * @tc.desc   Test for creating a rotation matrix with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixCreateRotationNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateRotation, rotate angles deg traverse 0 degrees, 180 degrees, 360 degrees, -90 degrees,
    // -180 degrees, -360 degrees, 45.5 degrees, x\y cover decimals and integers
    float degs[] = {0, DRAWING_NUMBER_180, DRAWING_NUMBER_360, -DRAWING_NUMBER_90, -DRAWING_NUMBER_180,
        -DRAWING_NUMBER_360, 45.5f};
    float x[] = {0, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, DRAWING_NUMBER_20, DRAWING_NUMBER_30,
        DRAWING_NUMBER_30};
    float y[] = {0, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, DRAWING_NUMBER_20, DRAWING_NUMBER_30,
        DRAWING_NUMBER_30};
    for (int i = 0; i < DRAWING_NUMBER_7; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(degs[i], x[i], y[i]);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateRotationNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0201
 * @tc.desc   Test for creating a rotation matrix with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateRotationNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateRotation with the first parameter as null
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(0, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateRotation with the second parameter as null
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_180, 0, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateRotation with the third parameter as null
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_360, DRAWING_NUMBER_10, 0);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateRotationAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0202
 * @tc.desc   Test for creating a rotation matrix with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateRotationAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateRotation with an input angle greater than 360 degrees
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_361, DRAWING_NUMBER_10,
        DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateRotation with a negative value for the x parameter
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_180, -DRAWING_NUMBER_10,
        DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateRotation with a negative value for the y parameter
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_180, DRAWING_NUMBER_10,
        -DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateRotationMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0203
 * @tc.desc   Test for creating a rotation matrix with maximum values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateRotationMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateRotation with the maximum value of the rotation angle parameter deg
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateRotation with the maximum value of the x parameter
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_180, FLT_MAX, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateRotation with the maximum value of the y parameter
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_180, DRAWING_NUMBER_10, FLT_MAX);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateRotationMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0205
 * @tc.desc   Test for multiple calls of creating a rotation matrix.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateRotationMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. Call OH_Drawing_MatrixCreateRotation 10 times, each time with different rotation angles and coordinate points
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> deg_dist(-DRAWING_NUMBER_360, DRAWING_NUMBER_360);
    std::uniform_real_distribution<float> x_dist(0.0f, DRAWING_NUMBER_100);
    std::uniform_real_distribution<float> y_dist(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float deg = deg_dist(gen);
        float x = x_dist(gen);
        float y = y_dist(gen);
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(deg, x, y);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateTranslationNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0300
 * @tc.desc   Test for creating a translation matrix with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixCreateTranslationNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateTranslation, passing in a decimal number
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation, passing in an integer
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateTranslationNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0301
 * @tc.desc   Test for creating a translation matrix with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateTranslationNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as null
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(0, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as null
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(DRAWING_NUMBER_10, 0);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateTranslationAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0302
 * @tc.desc   Test for creating a translation matrix with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateTranslationAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as a negative number
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(-DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as a negative number
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateTranslationMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0303
 * @tc.desc   Test for creating a translation matrix with maximum values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateTranslationMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as the maximum value
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(FLT_MAX, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as the maximum value
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(DRAWING_NUMBER_10, FLT_MAX);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateTranslationMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0304
 * @tc.desc   Test for multiple calls of creating a translation matrix.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateTranslationMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    // 1. Call OH_Drawing_MatrixCreateTranslation 10 times, each time with different random values for dx and dy
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float dx = dis(gen);
        float dy = dis(gen);
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(dx, dy);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMatrixSetGetMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0400
 * @tc.desc   Test for setting and getting matrix values with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixMatrixSetGetMatrixNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with integer parameters, calling OH_Drawing_MatrixGetAll and
    // OH_Drawing_MatrixGetValue interfaces
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    float value[DRAWING_NUMBER_9];
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), DRAWING_NUMBER_1);
    // 3. OH_Drawing_MatrixSetMatrix with floating-point parameters, calling OH_Drawing_MatrixGetAll and
    // OH_Drawing_MatrixGetValue interfaces
    OH_Drawing_MatrixSetMatrix(matrix, 1.1f, 0, 0, 0, -1.1f, 0, 0, 0, 1.1f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code2, OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_1), 0);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMatrixSetGetMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0401
 * @tc.desc   Test for setting and getting matrix values with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMatrixSetGetMatrixNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixSetMatrix(nullptr, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as null
    OH_Drawing_MatrixSetMatrix(matrix, 0, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0);
    // 4. OH_Drawing_MatrixGetAll with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    float value[DRAWING_NUMBER_9];
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(nullptr, value);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_MatrixGetAll with the second parameter as an empty array, check the error code with
    // OH_Drawing_ErrorCodeGet
    float value2[0];
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value2);
    EXPECT_EQ(code2, OH_DRAWING_SUCCESS);
    // 6. OH_Drawing_MatrixGetAll with the second parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_ErrorCode code3 = OH_Drawing_MatrixGetAll(matrix, nullptr);
    EXPECT_EQ(code3, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. OH_Drawing_MatrixGetValue with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixGetValue(nullptr, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 8. OH_Drawing_MatrixGetValue with the second parameter as null
    OH_Drawing_MatrixGetValue(matrix, 0);
    // 9. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMatrixSetGetMatrixAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0402
 * @tc.desc   Test for setting and getting matrix values with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMatrixSetGetMatrixAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as negative numbers
    OH_Drawing_MatrixSetMatrix(matrix, -DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, -DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, -DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, -DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        -DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, -DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, -DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, -DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, -DRAWING_NUMBER_1);
    // 3. OH_Drawing_MatrixGetAll with an array 'value' of length less than 9
    float value2[DRAWING_NUMBER_9];
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value2);
    EXPECT_EQ(code2, OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_MatrixGetValue with the parameter 'index' as -1, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixGetValue(matrix, -DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 5. OH_Drawing_MatrixGetValue with the parameter 'index' as 9, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_9);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMatrixSetGetMatrixMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0403
 * @tc.desc   Test for setting and getting matrix values with maximum values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMatrixSetGetMatrixMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as maximum values
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, FLT_MAX, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, FLT_MAX, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, FLT_MAX, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, FLT_MAX, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, FLT_MAX,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, FLT_MAX, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, FLT_MAX, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, FLT_MAX, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, FLT_MAX);
    // 2. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMatrixSetGetMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0404
 * @tc.desc   Test for multiple calls of setting and getting matrix values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMatrixSetGetMatrixMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with random parameters, calling the interface 10 times, corresponding to calling
    // OH_Drawing_MatrixGetAll and OH_Drawing_MatrixGetValue interfaces
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float value[DRAWING_NUMBER_9];
        float val0 = dis(gen);
        float val1 = dis(gen);
        float val2 = dis(gen);
        float val3 = dis(gen);
        float val4 = dis(gen);
        float val5 = dis(gen);
        float val6 = dis(gen);
        float val7 = dis(gen);
        float val8 = dis(gen);
        OH_Drawing_MatrixSetMatrix(matrix, val0, val1, val2, val3,
            val4, val5, val6, val7, val8);
        OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(matrix, value);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), val0);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_1), val1);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_2), val2);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_3), val3);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_4), val4);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_5), val5);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_6), val6);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_7), val7);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_8), val8);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixTranslateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0500
 * @tc.desc   Test for translating a matrix with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixTranslateNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate, passing in floating point numbers
    OH_Drawing_MatrixTranslate(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixTranslate, passing in integers
    OH_Drawing_MatrixTranslate(matrix, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixTranslateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0501
 * @tc.desc   Test for translating a matrix with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixTranslateNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixTranslate(nullptr, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixTranslate with the second parameter as null
    OH_Drawing_MatrixTranslate(matrix, 0, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixTranslate with the third parameter as null
    OH_Drawing_MatrixTranslate(matrix, DRAWING_NUMBER_10, 0);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixTranslateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0502
 * @tc.desc   Test for translating a matrix with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixTranslateAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the second parameter as a negative number
    OH_Drawing_MatrixTranslate(matrix, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixTranslate with the third parameter as a negative number
    OH_Drawing_MatrixTranslate(matrix, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixTranslateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0503
 * @tc.desc   Test for translating a matrix with maximum values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixTranslateMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the second parameter as the maximum value
    OH_Drawing_MatrixTranslate(matrix, FLT_MAX, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixTranslate with the third parameter as the maximum value
    OH_Drawing_MatrixTranslate(matrix, DRAWING_NUMBER_10, FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixTranslateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0504
 * @tc.desc   Test for multiple calls of translating a matrix.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixTranslateMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate, passing in random numbers for dx and dy
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float dx = dis(gen);
        float dy = dis(gen);
        OH_Drawing_MatrixTranslate(matrix, dx, dy);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixRotateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0600
 * @tc.desc   test for testMatrixRotateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixRotateNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate, rotate angles include 0 degrees, 180 degrees, 360 degrees, -90 degrees, -180 degrees,
    // -360 degrees, and 45.5 degrees, px and py cover both decimals and integers
    OH_Drawing_MatrixRotate(matrix, 0, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, DRAWING_NUMBER_360, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, -DRAWING_NUMBER_90, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, -DRAWING_NUMBER_180, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, -DRAWING_NUMBER_360, DRAWING_NUMBER_30, DRAWING_NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, 45.5f, DRAWING_NUMBER_30, DRAWING_NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixRotateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0601
 * @tc.desc   test for testMatrixRotateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixRotateNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixRotate(nullptr, DRAWING_NUMBER_180, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixRotate with the second parameter as null
    OH_Drawing_MatrixRotate(matrix, 0, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixRotate with the third parameter as null
    OH_Drawing_MatrixRotate(matrix, DRAWING_NUMBER_180, 0, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixRotate with the fourth parameter as null
    OH_Drawing_MatrixRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, 0);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixRotateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0602
 * @tc.desc   test for testMatrixRotateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixRotateAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate with the third parameter as a negative number
    OH_Drawing_MatrixRotate(matrix, DRAWING_NUMBER_180, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixRotate with the fourth parameter as a negative number
    OH_Drawing_MatrixRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixRotateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0603
 * @tc.desc   test for testMatrixRotateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixRotateMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate with the second parameter as the maximum value
    OH_Drawing_MatrixRotate(matrix, FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixRotate with the third parameter as the maximum value
    OH_Drawing_MatrixRotate(matrix, DRAWING_NUMBER_180, FLT_MAX, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixRotate with the fourth parameter as the maximum value
    OH_Drawing_MatrixRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, FLT_MAX);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixRotateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0604
 * @tc.desc   test for testMatrixRotateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixRotateMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate, passing in random numbers for degree, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float degree = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixRotate(matrix, degree, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateScaleNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0700
 * @tc.desc   test for testMatrixCreateScaleNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixCreateScaleNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateScale, passing in decimals
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10,
        DRAWING_NUMBER_10);
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale, passing in integers
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_20, DRAWING_NUMBER_20, DRAWING_NUMBER_20,
        DRAWING_NUMBER_20);
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateScaleNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0701
 * @tc.desc   test for testMatrixCreateScaleNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateScaleNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateScale with the first parameter as null
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(0, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10)
        ;
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale with the second parameter as null
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, 0, DRAWING_NUMBER_10,
        DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateScale with the third parameter as null
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, DRAWING_NUMBER_10, 0,
        DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. OH_Drawing_MatrixCreateScale with the fourth parameter as null
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10,
        0);
    // add assert
    EXPECT_NE(matrix4, nullptr);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateScaleAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0702
 * @tc.desc   test for testMatrixCreateScaleAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateScaleAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateScale with the first parameter as a negative number
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(-DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10,
        DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale with the second parameter as a negative number
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, -DRAWING_NUMBER_10, DRAWING_NUMBER_10,
        DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateScale with the third parameter as a negative number
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, DRAWING_NUMBER_10, -DRAWING_NUMBER_10,
        DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. OH_Drawing_MatrixCreateScale with the fourth parameter as a negative number
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10,
        -DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix4, nullptr);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateScaleMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0703
 * @tc.desc   test for testMatrixCreateScaleMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateScaleMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateScale with the first parameter as the maximum value
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10,
        DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale with the second parameter as the maximum value
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_10,
        DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateScale with the third parameter as the maximum value
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, DRAWING_NUMBER_10, FLT_MAX,
        DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. OH_Drawing_MatrixCreateScale with the fourth parameter as the maximum value
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10,
        FLT_MAX);
    // add assert
    EXPECT_NE(matrix4, nullptr);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCreateScaleMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0704
 * @tc.desc   test for testMatrixCreateScaleMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCreateScaleMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. Call OH_Drawing_MatrixCreateScale 10 times with random numbers for sx, sy, px, and py, and ensure successful
    // execution
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float sx = dis(gen);
        float sy = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(sx, sy, px, py);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixScaleNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0800
 * @tc.desc   test for testMatrixScaleNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixScaleNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale, passing in decimals
    OH_Drawing_MatrixScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixScale, passing in integers
    OH_Drawing_MatrixScale(matrix, DRAWING_NUMBER_20, DRAWING_NUMBER_20, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixScaleNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0801
 * @tc.desc   test for testMatrixScaleNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixScaleNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale with the first parameter as null, check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixScale(nullptr, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixScale with the second parameter as null
    OH_Drawing_MatrixScale(matrix, 0, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixScale with the third parameter as null
    OH_Drawing_MatrixScale(matrix, DRAWING_NUMBER_10, 0, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixScale with the fourth parameter as null
    OH_Drawing_MatrixScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, 0, DRAWING_NUMBER_10);
    // 6. OH_Drawing_MatrixScale with the fifth parameter as null
    OH_Drawing_MatrixScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, 0);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixScaleAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0802
 * @tc.desc   test for testMatrixScaleAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixScaleAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale with the second parameter as a negative number
    OH_Drawing_MatrixScale(matrix, -DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixScale with the third parameter as a negative number
    OH_Drawing_MatrixScale(matrix, DRAWING_NUMBER_10, -DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixScale with the fourth parameter as a negative number
    OH_Drawing_MatrixScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixScale with the fifth parameter as a negative number
    OH_Drawing_MatrixScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixScaleMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0803
 * @tc.desc   test for testMatrixScaleMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixScaleMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale with the second parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixScale with the third parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixScale with the fourth parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixScale with the fifth parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, FLT_MAX);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixScaleMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0804
 * @tc.desc   test for testMatrixScaleMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixScaleMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixCreateScale 10 times with random numbers for sx, sy, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float sx = dis(gen);
        float sy = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixScale(matrix, sx, sy, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetRectToRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0900
 * @tc.desc   test for testMatrixSetRectToRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixSetRectToRectNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Enumerate OH_Drawing_ScaleToFit values in OH_Drawing_MatrixSetRectToRect
    OH_Drawing_Rect *rectSrc = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_Rect *rectDst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_ScaleToFit fitList[] = {
        SCALE_TO_FIT_FILL,
        SCALE_TO_FIT_START,
        SCALE_TO_FIT_CENTER,
        SCALE_TO_FIT_END,
    };
    for (OH_Drawing_ScaleToFit fit : fitList) {
        bool isSuccess = OH_Drawing_MatrixSetRectToRect(matrix, rectSrc, rectDst, fit);
        EXPECT_EQ(isSuccess, true);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_RectDestroy(rectSrc);
    OH_Drawing_RectDestroy(rectDst);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetRectToRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0901
 * @tc.desc   test for testMatrixSetRectToRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetRectToRectNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Rect *rectSrc = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(rectSrc, nullptr);
    OH_Drawing_Rect *rectDst = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(rectDst, nullptr);
    // 2. OH_Drawing_MatrixSetRectToRect, the first parameter is null, check the error code using
    // OH_Drawing_ErrorCodeGet
    bool isSuccess = OH_Drawing_MatrixSetRectToRect(nullptr, rectSrc, rectDst, SCALE_TO_FIT_FILL);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(isSuccess, false);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixSetRectToRect, the second parameter is null, check the error code using
    // OH_Drawing_ErrorCodeGet
    isSuccess = OH_Drawing_MatrixSetRectToRect(matrix, nullptr, rectDst, SCALE_TO_FIT_FILL);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(isSuccess, false);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_MatrixSetRectToRect, the third parameter is null, check the error code using
    // OH_Drawing_ErrorCodeGet
    isSuccess = OH_Drawing_MatrixSetRectToRect(matrix, rectSrc, nullptr, SCALE_TO_FIT_FILL);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(isSuccess, false);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_RectDestroy(rectSrc);
    OH_Drawing_RectDestroy(rectDst);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetRectToRectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0902
 * @tc.desc   test for testMatrixSetRectToRectMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetRectToRectMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixSetRectToRect 10 times with random enum values and different rect sizes
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    OH_Drawing_ScaleToFit fitList[] = {
        SCALE_TO_FIT_FILL,
        SCALE_TO_FIT_START,
        SCALE_TO_FIT_CENTER,
        SCALE_TO_FIT_END,
    };
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Rect *rectSrc = OH_Drawing_RectCreate(dis(gen), dis(gen), dis(gen) + DRAWING_NUMBER_100, dis(gen) +
            DRAWING_NUMBER_100);
        OH_Drawing_Rect *rectDst = OH_Drawing_RectCreate(dis(gen), dis(gen), dis(gen) + DRAWING_NUMBER_200, dis(gen) +
            DRAWING_NUMBER_200);
        OH_Drawing_ScaleToFit fit = fitList[i % DRAWING_NUMBER_4];
        bool isSuccess = OH_Drawing_MatrixSetRectToRect(matrix, rectSrc, rectDst, fit);
        EXPECT_EQ(isSuccess, true);
        OH_Drawing_RectDestroy(rectSrc);
        OH_Drawing_RectDestroy(rectDst);
    }
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreRotateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1000
 * @tc.desc   test for testMatrixPreRotateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPreRotateNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate, rotate angles include 0 degrees, 180 degrees, 360 degrees, -90 degrees, -180
    // degrees, -360 degrees, and 45.5 degrees, px and py cover both decimals and integers
    OH_Drawing_MatrixPreRotate(matrix, 0, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, DRAWING_NUMBER_360, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, -DRAWING_NUMBER_90, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, -DRAWING_NUMBER_180, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, -DRAWING_NUMBER_360, DRAWING_NUMBER_30, DRAWING_NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, 45.5f, DRAWING_NUMBER_30, DRAWING_NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreRotateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1001
 * @tc.desc   test for testMatrixPreRotateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreRotateNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate with the first parameter as null, check the error code using
    // OH_Drawing_ErrorCodeGet, no crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixPreRotate(nullptr, DRAWING_NUMBER_180, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPreRotate with the second parameter as null
    OH_Drawing_MatrixPreRotate(matrix, 0, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixPreRotate with the third parameter as null
    OH_Drawing_MatrixPreRotate(matrix, DRAWING_NUMBER_180, 0, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixPreRotate with the fourth parameter as null
    OH_Drawing_MatrixPreRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, 0);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreRotateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1002
 * @tc.desc   test for testMatrixPreRotateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreRotateAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate with a negative value for the third parameter
    OH_Drawing_MatrixPreRotate(matrix, DRAWING_NUMBER_180, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixPreRotate with a negative value for the fourth parameter
    OH_Drawing_MatrixPreRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreRotateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1003
 * @tc.desc   test for testMatrixPreRotateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreRotateMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate with the second parameter as the maximum value
    OH_Drawing_MatrixPreRotate(matrix, FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixPreRotate with the third parameter as the maximum value
    OH_Drawing_MatrixPreRotate(matrix, DRAWING_NUMBER_180, FLT_MAX, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixPreRotate with the fourth parameter as the maximum value
    OH_Drawing_MatrixPreRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, FLT_MAX);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreRotateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1004
 * @tc.desc   test for testMatrixPreRotateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreRotateMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate, pass in random numbers for degree, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float degree = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixPreRotate(matrix, degree, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreScaleNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1100
 * @tc.desc   test for testMatrixPreScaleNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPreScaleNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale, pass in decimals
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPreScale, pass in integers
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_20, DRAWING_NUMBER_20, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreScaleNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1101
 * @tc.desc   test for testMatrixPreScaleNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreScaleNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale, the first parameter is null, check the error code using OH_Drawing_ErrorCodeGet, no
    // crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixPreScale(nullptr, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPreScale, the second parameter is null
    OH_Drawing_MatrixPreScale(matrix, 0, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixPreScale, the third parameter is null
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_10, 0, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixPreScale, the fourth parameter is null
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, 0, DRAWING_NUMBER_10);
    // 6. OH_Drawing_MatrixPreScale, the fifth parameter is null
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, 0);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreScaleAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1102
 * @tc.desc   test for testMatrixPreScaleAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreScaleAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale, the second parameter is negative
    OH_Drawing_MatrixPreScale(matrix, -DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixPreScale, the third parameter is negative
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_10, -DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixPreScale, the fourth parameter is negative
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixPreScale, the fifth parameter is negative
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreScaleMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1103
 * @tc.desc   test for testMatrixPreScaleMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreScaleMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale with the second parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixPreScale with the third parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixPreScale with the fourth parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixPreScale with the fifth parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, FLT_MAX);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreScaleMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1104
 * @tc.desc   test for testMatrixPreScaleMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreScaleMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixCreateScale 10 times, passing in random numbers for sx, sy, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float sx = dis(gen);
        float sy = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixPreScale(matrix, sx, sy, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreTranslateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1200
 * @tc.desc   test for testMatrixPreTranslateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPreTranslateNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate, pass in decimals
    OH_Drawing_MatrixPreTranslate(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPreTranslate, pass in integers
    OH_Drawing_MatrixPreTranslate(matrix, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreTranslateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1201
 * @tc.desc   test for testMatrixPreTranslateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreTranslateNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate, the first parameter is null, check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixPreTranslate(nullptr, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPreTranslate, the second parameter is null
    OH_Drawing_MatrixPreTranslate(matrix, 0, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixPreTranslate, the third parameter is null
    OH_Drawing_MatrixPreTranslate(matrix, DRAWING_NUMBER_10, 0);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreTranslateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1202
 * @tc.desc   test for testMatrixPreTranslateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreTranslateAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate, the second parameter is negative
    OH_Drawing_MatrixPreTranslate(matrix, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixPreTranslate, the third parameter is negative
    OH_Drawing_MatrixPreTranslate(matrix, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreTranslateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1203
 * @tc.desc   test for testMatrixPreTranslateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreTranslateMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate with the second parameter as the maximum value
    OH_Drawing_MatrixPreTranslate(matrix, FLT_MAX, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixPreTranslate with the third parameter as the maximum value
    OH_Drawing_MatrixPreTranslate(matrix, DRAWING_NUMBER_10, FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreTranslateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1204
 * @tc.desc   test for testMatrixPreTranslateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreTranslateMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate, pass in random numbers for dx and dy
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float dx = dis(gen);
        float dy = dis(gen);
        OH_Drawing_MatrixPreTranslate(matrix, dx, dy);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostRotateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1300
 * @tc.desc   test for testMatrixPostRotateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPostRotateNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate, rotate angles include 0 degrees, 180 degrees, 360 degrees, -90 degrees, -180
    // degrees, -360 degrees, and 45.5 degrees, px and py cover decimals and integers
    OH_Drawing_MatrixPostRotate(matrix, 0, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, DRAWING_NUMBER_360, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, -DRAWING_NUMBER_90, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, -DRAWING_NUMBER_180, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, -DRAWING_NUMBER_360, DRAWING_NUMBER_30, DRAWING_NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, 45.5f, DRAWING_NUMBER_30, DRAWING_NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostRotateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1301
 * @tc.desc   test for testMatrixPostRotateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostRotateNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate with the first parameter as null, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixPostRotate(nullptr, DRAWING_NUMBER_180, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPostRotate with the second parameter as null
    OH_Drawing_MatrixPostRotate(matrix, 0, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixPostRotate with the third parameter as null
    OH_Drawing_MatrixPostRotate(matrix, DRAWING_NUMBER_180, 0, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixPostRotate with the fourth parameter as null
    OH_Drawing_MatrixPostRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, 0);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostRotateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1302
 * @tc.desc   test for testMatrixPostRotateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostRotateAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate, the third parameter is negative
    OH_Drawing_MatrixPostRotate(matrix, DRAWING_NUMBER_180, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixPostRotate, the fourth parameter is negative
    OH_Drawing_MatrixPostRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostRotateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1303
 * @tc.desc   test for testMatrixPostRotateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostRotateMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate with the second parameter as the maximum value
    OH_Drawing_MatrixPostRotate(matrix, FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixPostRotate with the third parameter as the maximum value
    OH_Drawing_MatrixPostRotate(matrix, DRAWING_NUMBER_180, FLT_MAX, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixPostRotate with the fourth parameter as the maximum value
    OH_Drawing_MatrixPostRotate(matrix, DRAWING_NUMBER_180, DRAWING_NUMBER_10, FLT_MAX);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostRotateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1304
 * @tc.desc   test for testMatrixPostRotateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostRotateMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate, pass in random numbers for degree, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float degree = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixPostRotate(matrix, degree, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostScaleNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1400
 * @tc.desc   test for testMatrixPostScaleNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPostScaleNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, pass in decimals
    OH_Drawing_MatrixPostScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPostScale, pass in integers
    OH_Drawing_MatrixPostScale(matrix, DRAWING_NUMBER_20, DRAWING_NUMBER_20, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostScaleNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1401
 * @tc.desc   test for testMatrixPostScaleNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostScaleNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the first parameter is null, check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixPostScale(nullptr, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPostScale, the second parameter is null
    OH_Drawing_MatrixPostScale(matrix, 0, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixPostScale, the third parameter is null
    OH_Drawing_MatrixPostScale(matrix, DRAWING_NUMBER_10, 0, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixPostScale, the fourth parameter is null
    OH_Drawing_MatrixPostScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, 0, DRAWING_NUMBER_10);
    // 6. OH_Drawing_MatrixPostScale, the fifth parameter is null
    OH_Drawing_MatrixPostScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, 0);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostScaleAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1402
 * @tc.desc   test for testMatrixPostScaleAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostScaleAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the second parameter is negative
    OH_Drawing_MatrixPostScale(matrix, -DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixPostScale, the third parameter is negative
    OH_Drawing_MatrixPostScale(matrix, DRAWING_NUMBER_10, -DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixPostScale, the fourth parameter is negative
    OH_Drawing_MatrixPostScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixPostScale, the fifth parameter is negative
    OH_Drawing_MatrixPostScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostScaleMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1403
 * @tc.desc   test for testMatrixPostScaleMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostScaleMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the second parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_MatrixPostScale, the third parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_MatrixPostScale, the fourth parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_10);
    // 5. OH_Drawing_MatrixPostScale, the fifth parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, FLT_MAX);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostScaleMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1404
 * @tc.desc   test for testMatrixPostScaleMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostScaleMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixCreateScale 10 times, passing in random numbers for sx, sy, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float sx = dis(gen);
        float sy = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixPostScale(matrix, sx, sy, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS