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

#define NUMBER_1 1
#define NUMBER_2 2
#define NUMBER_3 3
#define NUMBER_4 4
#define NUMBER_5 5
#define NUMBER_6 6
#define NUMBER_7 7
#define NUMBER_8 8
#define NUMBER_9 9
#define NUMBER_10 10
#define NUMBER_20 20
#define NUMBER_30 30
#define NUMBER_90 90
#define NUMBER_100 100
#define NUMBER_180 180
#define NUMBER_200 200
#define NUMBER_360 360
#define NUMBER_361 361
#define NUMBER_19937 19937

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

int TestMatrixCreateDestroyMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. Call OH_Drawing_MatrixCreate 10 times
    OH_Drawing_Matrix *matrices[NUMBER_10];
    for (int i = 0; i < NUMBER_10; i++) {
        matrices[i] = OH_Drawing_MatrixCreate();
        EXPECT_NE(matrices[i], nullptr);
    }
    // 2. Call OH_Drawing_MatrixDestroy 10 times
    for (int i = 0; i < NUMBER_10; i++) {
        OH_Drawing_MatrixDestroy(matrices[i]);
    }
    // 3. Call OH_Drawing_MatrixCreate and OH_Drawing_MatrixDestroy alternately 10 times
    for (int i = 0; i < NUMBER_10; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixCreateRotationNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateRotation, rotate angles deg traverse 0 degrees, 180 degrees, 360 degrees, -90 degrees,
    // -180 degrees, -360 degrees, 45.5 degrees, x\y cover decimals and integers
    float degs[] = {0, NUMBER_180, NUMBER_360, -NUMBER_90, -NUMBER_180,
        -NUMBER_360, 45.5f};
    float x[] = {0, NUMBER_10, NUMBER_10, NUMBER_20, NUMBER_20, NUMBER_30,
        NUMBER_30};
    float y[] = {0, NUMBER_10, NUMBER_10, NUMBER_20, NUMBER_20, NUMBER_30,
        NUMBER_30};
    for (int i = 0; i < NUMBER_7; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(degs[i], x[i], y[i]);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixCreateRotationNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateRotation with the first parameter as null
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(0, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateRotation with the second parameter as null
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(NUMBER_180, 0, NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateRotation with the third parameter as null
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(NUMBER_360, NUMBER_10, 0);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixCreateRotationAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateRotation with an input angle greater than 360 degrees
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(NUMBER_361, NUMBER_10,
        NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateRotation with a negative value for the x parameter
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(NUMBER_180, -NUMBER_10,
        NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateRotation with a negative value for the y parameter
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(NUMBER_180, NUMBER_10,
        -NUMBER_10);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreateRotation(-NUMBER_90, NUMBER_10,
        -NUMBER_10);
    EXPECT_NE(matrix4, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixCreateRotationMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateRotation with the maximum value of the rotation angle parameter deg
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(FLT_MAX, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateRotation with the maximum value of the x parameter
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(NUMBER_180, FLT_MAX, NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateRotation with the maximum value of the y parameter
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(NUMBER_180, NUMBER_10, FLT_MAX);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixCreateRotationMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. Call OH_Drawing_MatrixCreateRotation 10 times, each time with different rotation angles and coordinate points
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> deg_dist(-NUMBER_360, NUMBER_360);
    std::uniform_real_distribution<float> x_dist(0.0f, NUMBER_100);
    std::uniform_real_distribution<float> y_dist(0.0f, NUMBER_100);
    for (int i = 0; i < NUMBER_10; i++) {
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

int TestMatrixCreateTranslationNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateTranslation, passing in a decimal number
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation, passing in an integer
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixCreateTranslationNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as null
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(0, NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as null
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(NUMBER_10, 0);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixCreateTranslationAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as a negative number
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(-NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as a negative number
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(NUMBER_10, -NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixCreateTranslationMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as the maximum value
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(FLT_MAX, NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as the maximum value
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(NUMBER_10, FLT_MAX);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixCreateTranslationMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    // 1. Call OH_Drawing_MatrixCreateTranslation 10 times, each time with different random values for dx and dy
    for (int i = 0; i < NUMBER_10; i++) {
        float dx = dis(gen);
        float dy = dis(gen);
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(dx, dy);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixMatrixSetGetMatrixNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with integer parameters, calling OH_Drawing_MatrixGetAll and
    // OH_Drawing_MatrixGetValue interfaces
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, 0, 0, 0, -NUMBER_1, 0, 0, 0, NUMBER_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    float value[NUMBER_9];
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), NUMBER_1);
    // 3. OH_Drawing_MatrixSetMatrix with floating-point parameters, calling OH_Drawing_MatrixGetAll and
    // OH_Drawing_MatrixGetValue interfaces
    OH_Drawing_MatrixSetMatrix(matrix, 1.1f, 0, 0, 0, -1.1f, 0, 0, 0, 1.1f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code2, OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixGetValue(matrix, NUMBER_1);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, NUMBER_1), 0);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixMatrixSetGetMatrixNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixSetMatrix(nullptr, NUMBER_1, 0, 0, 0, -NUMBER_1, 0, 0, 0, NUMBER_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as null
    OH_Drawing_MatrixSetMatrix(matrix, 0, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, 0, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, 0, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, 0, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1, 0,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, 0, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, 0, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, 0, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1, 0);
    // 4. OH_Drawing_MatrixGetAll with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    float value[NUMBER_9];
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

int TestMatrixMatrixSetGetMatrixAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as negative numbers
    OH_Drawing_MatrixSetMatrix(matrix, -NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, -NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, -NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, -NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        -NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, -NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, -NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, -NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1, -NUMBER_1);
    // 3. OH_Drawing_MatrixGetAll with an array 'value' of length less than 9
    float value2[NUMBER_9];
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value2);
    EXPECT_EQ(code2, OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_MatrixGetValue with the parameter 'index' as -1, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixGetValue(matrix, -NUMBER_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 5. OH_Drawing_MatrixGetValue with the parameter 'index' as 9, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixGetValue(matrix, NUMBER_9);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixMatrixSetGetMatrixMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as maximum values
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, FLT_MAX, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, FLT_MAX, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, FLT_MAX, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, FLT_MAX, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1, FLT_MAX,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, FLT_MAX, NUMBER_1, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, FLT_MAX, NUMBER_1, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, FLT_MAX, NUMBER_1);
    OH_Drawing_MatrixSetMatrix(matrix, NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1,
        NUMBER_1, NUMBER_1, NUMBER_1, NUMBER_1, FLT_MAX);
    // 2. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    for (int i = 0; i < NUMBER_10; i++) {
        float value[NUMBER_9];
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
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, NUMBER_1), val1);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, NUMBER_2), val2);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, NUMBER_3), val3);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, NUMBER_4), val4);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, NUMBER_5), val5);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, NUMBER_6), val6);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, NUMBER_7), val7);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, NUMBER_8), val8);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixTranslateNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate, passing in floating point numbers
    OH_Drawing_MatrixTranslate(matrix, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixTranslate, passing in integers
    OH_Drawing_MatrixTranslate(matrix, NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixTranslateNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixTranslate(nullptr, NUMBER_10, NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixTranslate with the second parameter as null
    OH_Drawing_MatrixTranslate(matrix, 0, NUMBER_10);
    // 4. OH_Drawing_MatrixTranslate with the third parameter as null
    OH_Drawing_MatrixTranslate(matrix, NUMBER_10, 0);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixTranslateAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the second parameter as a negative number
    OH_Drawing_MatrixTranslate(matrix, -NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixTranslate with the third parameter as a negative number
    OH_Drawing_MatrixTranslate(matrix, NUMBER_10, -NUMBER_10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixTranslateMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the second parameter as the maximum value
    OH_Drawing_MatrixTranslate(matrix, FLT_MAX, NUMBER_10);
    // 3. OH_Drawing_MatrixTranslate with the third parameter as the maximum value
    OH_Drawing_MatrixTranslate(matrix, NUMBER_10, FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixTranslateMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate, passing in random numbers for dx and dy
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    for (int i = 0; i < NUMBER_10; i++) {
        float dx = dis(gen);
        float dy = dis(gen);
        OH_Drawing_MatrixTranslate(matrix, dx, dy);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    OH_Drawing_MatrixRotate(matrix, NUMBER_180, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, NUMBER_360, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, -NUMBER_90, NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, -NUMBER_180, NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, -NUMBER_360, NUMBER_30, NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, 45.5f, NUMBER_30, NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixRotateNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixRotate(nullptr, NUMBER_180, NUMBER_10, NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixRotate with the second parameter as null
    OH_Drawing_MatrixRotate(matrix, 0, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixRotate with the third parameter as null
    OH_Drawing_MatrixRotate(matrix, NUMBER_180, 0, NUMBER_10);
    // 5. OH_Drawing_MatrixRotate with the fourth parameter as null
    OH_Drawing_MatrixRotate(matrix, NUMBER_180, NUMBER_10, 0);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixRotateAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate with the third parameter as a negative number
    OH_Drawing_MatrixRotate(matrix, NUMBER_180, -NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixRotate with the fourth parameter as a negative number
    OH_Drawing_MatrixRotate(matrix, NUMBER_180, NUMBER_10, -NUMBER_10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixRotateMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate with the second parameter as the maximum value
    OH_Drawing_MatrixRotate(matrix, FLT_MAX, NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixRotate with the third parameter as the maximum value
    OH_Drawing_MatrixRotate(matrix, NUMBER_180, FLT_MAX, NUMBER_10);
    // 4. OH_Drawing_MatrixRotate with the fourth parameter as the maximum value
    OH_Drawing_MatrixRotate(matrix, NUMBER_180, NUMBER_10, FLT_MAX);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    for (int i = 0; i < NUMBER_10; i++) {
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

int TestMatrixCreateScaleNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateScale, passing in decimals
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(NUMBER_10, NUMBER_10, NUMBER_10,
        NUMBER_10);
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale, passing in integers
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(NUMBER_20, NUMBER_20, NUMBER_20,
        NUMBER_20);
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixCreateScaleNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateScale with the first parameter as null
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(0, NUMBER_10, NUMBER_10, NUMBER_10)
        ;
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale with the second parameter as null
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(NUMBER_10, 0, NUMBER_10,
        NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateScale with the third parameter as null
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateScale(NUMBER_10, NUMBER_10, 0,
        NUMBER_10);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. OH_Drawing_MatrixCreateScale with the fourth parameter as null
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreateScale(NUMBER_10, NUMBER_10, NUMBER_10,
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

int TestMatrixCreateScaleAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateScale with the first parameter as a negative number
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(-NUMBER_10, NUMBER_10, NUMBER_10,
        NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale with the second parameter as a negative number
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(NUMBER_10, -NUMBER_10, NUMBER_10,
        NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateScale with the third parameter as a negative number
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateScale(NUMBER_10, NUMBER_10, -NUMBER_10,
        NUMBER_10);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. OH_Drawing_MatrixCreateScale with the fourth parameter as a negative number
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreateScale(NUMBER_10, NUMBER_10, NUMBER_10,
        -NUMBER_10);
    // add assert
    EXPECT_NE(matrix4, nullptr);
    // sx和sy为负数测试（镜像翻转）
    OH_Drawing_Matrix *matrix5 = OH_Drawing_MatrixCreateScale(-NUMBER_10, -NUMBER_10, NUMBER_10,
        NUMBER_10);
    EXPECT_NE(matrix5, nullptr);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
    OH_Drawing_MatrixDestroy(matrix5);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixCreateScaleMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreateScale with the first parameter as the maximum value
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(FLT_MAX, NUMBER_10, NUMBER_10,
        NUMBER_10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale with the second parameter as the maximum value
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(NUMBER_10, FLT_MAX, NUMBER_10,
        NUMBER_10);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateScale with the third parameter as the maximum value
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateScale(NUMBER_10, NUMBER_10, FLT_MAX,
        NUMBER_10);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. OH_Drawing_MatrixCreateScale with the fourth parameter as the maximum value
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreateScale(NUMBER_10, NUMBER_10, NUMBER_10,
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

int TestMatrixCreateScaleMultipleCalls()
{
    DrawingNativeMatrixTestSetUp();
    // 1. Call OH_Drawing_MatrixCreateScale 10 times with random numbers for sx, sy, px, and py, and ensure successful
    // execution
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    for (int i = 0; i < NUMBER_10; i++) {
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

int TestMatrixScaleNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale, passing in decimals
    OH_Drawing_MatrixScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixScale, passing in integers
    OH_Drawing_MatrixScale(matrix, NUMBER_20, NUMBER_20, NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixScaleNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale with the first parameter as null, check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixScale(nullptr, NUMBER_10, NUMBER_10, NUMBER_10, NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixScale with the second parameter as null
    OH_Drawing_MatrixScale(matrix, 0, NUMBER_10, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixScale with the third parameter as null
    OH_Drawing_MatrixScale(matrix, NUMBER_10, 0, NUMBER_10, NUMBER_10);
    // 5. OH_Drawing_MatrixScale with the fourth parameter as null
    OH_Drawing_MatrixScale(matrix, NUMBER_10, NUMBER_10, 0, NUMBER_10);
    // 6. OH_Drawing_MatrixScale with the fifth parameter as null
    OH_Drawing_MatrixScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, 0);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixScaleAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale with the second parameter as a negative number
    OH_Drawing_MatrixScale(matrix, -NUMBER_10, NUMBER_10, NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixScale with the third parameter as a negative number
    OH_Drawing_MatrixScale(matrix, NUMBER_10, -NUMBER_10, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixScale with the fourth parameter as a negative number
    OH_Drawing_MatrixScale(matrix, NUMBER_10, NUMBER_10, -NUMBER_10, NUMBER_10);
    // 5. OH_Drawing_MatrixScale with the fifth parameter as a negative number
    OH_Drawing_MatrixScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, -NUMBER_10);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixScaleMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale with the second parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, FLT_MAX, NUMBER_10, NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixScale with the third parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, NUMBER_10, FLT_MAX, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixScale with the fourth parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, NUMBER_10, NUMBER_10, FLT_MAX, NUMBER_10);
    // 5. OH_Drawing_MatrixScale with the fifth parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, FLT_MAX);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    for (int i = 0; i < NUMBER_10; i++) {
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

int TestMatrixSetRectToRectNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Enumerate OH_Drawing_ScaleToFit values in OH_Drawing_MatrixSetRectToRect
    OH_Drawing_Rect *rectSrc = OH_Drawing_RectCreate(0, 0, NUMBER_100, NUMBER_100);
    OH_Drawing_Rect *rectDst = OH_Drawing_RectCreate(0, 0, NUMBER_200, NUMBER_200);
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
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    OH_Drawing_ScaleToFit fitList[] = {
        SCALE_TO_FIT_FILL,
        SCALE_TO_FIT_START,
        SCALE_TO_FIT_CENTER,
        SCALE_TO_FIT_END,
    };
    for (int i = 0; i < NUMBER_10; i++) {
        OH_Drawing_Rect *rectSrc = OH_Drawing_RectCreate(dis(gen), dis(gen), dis(gen) + NUMBER_100, dis(gen) +
            NUMBER_100);
        OH_Drawing_Rect *rectDst = OH_Drawing_RectCreate(dis(gen), dis(gen), dis(gen) + NUMBER_200, dis(gen) +
            NUMBER_200);
        OH_Drawing_ScaleToFit fit = fitList[i % NUMBER_4];
        bool isSuccess = OH_Drawing_MatrixSetRectToRect(matrix, rectSrc, rectDst, fit);
        EXPECT_EQ(isSuccess, true);
        OH_Drawing_RectDestroy(rectSrc);
        OH_Drawing_RectDestroy(rectDst);
    }
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    OH_Drawing_MatrixPreRotate(matrix, NUMBER_180, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, NUMBER_360, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, -NUMBER_90, NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, -NUMBER_180, NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, -NUMBER_360, NUMBER_30, NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, 45.5f, NUMBER_30, NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPreRotateNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate with the first parameter as null, check the error code using
    // OH_Drawing_ErrorCodeGet, no crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixPreRotate(nullptr, NUMBER_180, NUMBER_10, NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPreRotate with the second parameter as null
    OH_Drawing_MatrixPreRotate(matrix, 0, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixPreRotate with the third parameter as null
    OH_Drawing_MatrixPreRotate(matrix, NUMBER_180, 0, NUMBER_10);
    // 5. OH_Drawing_MatrixPreRotate with the fourth parameter as null
    OH_Drawing_MatrixPreRotate(matrix, NUMBER_180, NUMBER_10, 0);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPreRotateAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate with a negative value for the third parameter
    OH_Drawing_MatrixPreRotate(matrix, NUMBER_180, -NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixPreRotate with a negative value for the fourth parameter
    OH_Drawing_MatrixPreRotate(matrix, NUMBER_180, NUMBER_10, -NUMBER_10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPreRotateMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate with the second parameter as the maximum value
    OH_Drawing_MatrixPreRotate(matrix, FLT_MAX, NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixPreRotate with the third parameter as the maximum value
    OH_Drawing_MatrixPreRotate(matrix, NUMBER_180, FLT_MAX, NUMBER_10);
    // 4. OH_Drawing_MatrixPreRotate with the fourth parameter as the maximum value
    OH_Drawing_MatrixPreRotate(matrix, NUMBER_180, NUMBER_10, FLT_MAX);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    for (int i = 0; i < NUMBER_10; i++) {
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

int TestMatrixPreScaleNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale, pass in decimals
    OH_Drawing_MatrixPreScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPreScale, pass in integers
    OH_Drawing_MatrixPreScale(matrix, NUMBER_20, NUMBER_20, NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPreScaleNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale, the first parameter is null, check the error code using OH_Drawing_ErrorCodeGet, no
    // crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixPreScale(nullptr, NUMBER_10, NUMBER_10, NUMBER_10, NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPreScale, the second parameter is null
    OH_Drawing_MatrixPreScale(matrix, 0, NUMBER_10, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixPreScale, the third parameter is null
    OH_Drawing_MatrixPreScale(matrix, NUMBER_10, 0, NUMBER_10, NUMBER_10);
    // 5. OH_Drawing_MatrixPreScale, the fourth parameter is null
    OH_Drawing_MatrixPreScale(matrix, NUMBER_10, NUMBER_10, 0, NUMBER_10);
    // 6. OH_Drawing_MatrixPreScale, the fifth parameter is null
    OH_Drawing_MatrixPreScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, 0);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPreScaleAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale, the second parameter is negative
    OH_Drawing_MatrixPreScale(matrix, -NUMBER_10, NUMBER_10, NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixPreScale, the third parameter is negative
    OH_Drawing_MatrixPreScale(matrix, NUMBER_10, -NUMBER_10, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixPreScale, the fourth parameter is negative
    OH_Drawing_MatrixPreScale(matrix, NUMBER_10, NUMBER_10, -NUMBER_10, NUMBER_10);
    // 5. OH_Drawing_MatrixPreScale, the fifth parameter is negative
    OH_Drawing_MatrixPreScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, -NUMBER_10);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPreScaleMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale with the second parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, FLT_MAX, NUMBER_10, NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixPreScale with the third parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, NUMBER_10, FLT_MAX, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixPreScale with the fourth parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, NUMBER_10, NUMBER_10, FLT_MAX, NUMBER_10);
    // 5. OH_Drawing_MatrixPreScale with the fifth parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, FLT_MAX);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    for (int i = 0; i < NUMBER_10; i++) {
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

int TestMatrixPreTranslateNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate, pass in decimals
    OH_Drawing_MatrixPreTranslate(matrix, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPreTranslate, pass in integers
    OH_Drawing_MatrixPreTranslate(matrix, NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPreTranslateNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate, the first parameter is null, check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixPreTranslate(nullptr, NUMBER_10, NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPreTranslate, the second parameter is null
    OH_Drawing_MatrixPreTranslate(matrix, 0, NUMBER_10);
    // 4. OH_Drawing_MatrixPreTranslate, the third parameter is null
    OH_Drawing_MatrixPreTranslate(matrix, NUMBER_10, 0);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPreTranslateAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate, the second parameter is negative
    OH_Drawing_MatrixPreTranslate(matrix, -NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixPreTranslate, the third parameter is negative
    OH_Drawing_MatrixPreTranslate(matrix, NUMBER_10, -NUMBER_10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPreTranslateMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate with the second parameter as the maximum value
    OH_Drawing_MatrixPreTranslate(matrix, FLT_MAX, NUMBER_10);
    // 3. OH_Drawing_MatrixPreTranslate with the third parameter as the maximum value
    OH_Drawing_MatrixPreTranslate(matrix, NUMBER_10, FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    for (int i = 0; i < NUMBER_10; i++) {
        float dx = dis(gen);
        float dy = dis(gen);
        OH_Drawing_MatrixPreTranslate(matrix, dx, dy);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    OH_Drawing_MatrixPostRotate(matrix, NUMBER_180, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, NUMBER_360, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, -NUMBER_90, NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, -NUMBER_180, NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, -NUMBER_360, NUMBER_30, NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, 45.5f, NUMBER_30, NUMBER_30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPostRotateNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate with the first parameter as null, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixPostRotate(nullptr, NUMBER_180, NUMBER_10, NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPostRotate with the second parameter as null
    OH_Drawing_MatrixPostRotate(matrix, 0, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixPostRotate with the third parameter as null
    OH_Drawing_MatrixPostRotate(matrix, NUMBER_180, 0, NUMBER_10);
    // 5. OH_Drawing_MatrixPostRotate with the fourth parameter as null
    OH_Drawing_MatrixPostRotate(matrix, NUMBER_180, NUMBER_10, 0);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPostRotateAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate, the third parameter is negative
    OH_Drawing_MatrixPostRotate(matrix, NUMBER_180, -NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixPostRotate, the fourth parameter is negative
    OH_Drawing_MatrixPostRotate(matrix, NUMBER_180, NUMBER_10, -NUMBER_10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPostRotateMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate with the second parameter as the maximum value
    OH_Drawing_MatrixPostRotate(matrix, FLT_MAX, NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixPostRotate with the third parameter as the maximum value
    OH_Drawing_MatrixPostRotate(matrix, NUMBER_180, FLT_MAX, NUMBER_10);
    // 4. OH_Drawing_MatrixPostRotate with the fourth parameter as the maximum value
    OH_Drawing_MatrixPostRotate(matrix, NUMBER_180, NUMBER_10, FLT_MAX);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    for (int i = 0; i < NUMBER_10; i++) {
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

int TestMatrixPostScaleNormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, pass in decimals
    OH_Drawing_MatrixPostScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPostScale, pass in integers
    OH_Drawing_MatrixPostScale(matrix, NUMBER_20, NUMBER_20, NUMBER_20, NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPostScaleNull()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the first parameter is null, check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixPostScale(nullptr, NUMBER_10, NUMBER_10, NUMBER_10, NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPostScale, the second parameter is null
    OH_Drawing_MatrixPostScale(matrix, 0, NUMBER_10, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixPostScale, the third parameter is null
    OH_Drawing_MatrixPostScale(matrix, NUMBER_10, 0, NUMBER_10, NUMBER_10);
    // 5. OH_Drawing_MatrixPostScale, the fourth parameter is null
    OH_Drawing_MatrixPostScale(matrix, NUMBER_10, NUMBER_10, 0, NUMBER_10);
    // 6. OH_Drawing_MatrixPostScale, the fifth parameter is null
    OH_Drawing_MatrixPostScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, 0);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPostScaleAbnormal()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the second parameter is negative
    OH_Drawing_MatrixPostScale(matrix, -NUMBER_10, NUMBER_10, NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixPostScale, the third parameter is negative
    OH_Drawing_MatrixPostScale(matrix, NUMBER_10, -NUMBER_10, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixPostScale, the fourth parameter is negative
    OH_Drawing_MatrixPostScale(matrix, NUMBER_10, NUMBER_10, -NUMBER_10, NUMBER_10);
    // 5. OH_Drawing_MatrixPostScale, the fifth parameter is negative
    OH_Drawing_MatrixPostScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, -NUMBER_10);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMatrixPostScaleMaximum()
{
    DrawingNativeMatrixTestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the second parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, FLT_MAX, NUMBER_10, NUMBER_10, NUMBER_10);
    // 3. OH_Drawing_MatrixPostScale, the third parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, NUMBER_10, FLT_MAX, NUMBER_10, NUMBER_10);
    // 4. OH_Drawing_MatrixPostScale, the fourth parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, NUMBER_10, NUMBER_10, FLT_MAX, NUMBER_10);
    // 5. OH_Drawing_MatrixPostScale, the fifth parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, NUMBER_10, NUMBER_10, NUMBER_10, FLT_MAX);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    std::uniform_real_distribution<float> dis(0.0f, NUMBER_100);
    for (int i = 0; i < NUMBER_10; i++) {
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