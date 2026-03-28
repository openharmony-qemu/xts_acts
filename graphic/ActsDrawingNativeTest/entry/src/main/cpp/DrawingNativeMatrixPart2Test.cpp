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
#include <cfloat> // For FLT_MAX

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
#define DRAWING_NUMBER_12 12
#define DRAWING_NUMBER_14 14
#define DRAWING_NUMBER_18 18
#define DRAWING_NUMBER_30 30
#define DRAWING_NUMBER_32 32
#define DRAWING_NUMBER_38 38
#define DRAWING_NUMBER_40 40
#define DRAWING_NUMBER_45 45
#define DRAWING_NUMBER_50 50
#define DRAWING_NUMBER_52 52
#define DRAWING_NUMBER_70 70
#define DRAWING_NUMBER_90 90
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_19937 19937

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeMatrixPart2TestSetUp()
{
    std::cout << "DrawingNativeMatrixPart2Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMatrixPart2Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeMatrixPart2TestTearDown()
{
    std::cout << "DrawingNativeMatrixPart2Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMatrixPart2Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testMatrixPostTranslateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1500
 * @tc.desc   test for testMatrixPostTranslateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPostTranslateNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate, passing decimal numbers
    OH_Drawing_MatrixPostTranslate(matrix, 1.5f, 2.5f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPostTranslate, passing integers
    OH_Drawing_MatrixPostTranslate(matrix, DRAWING_NUMBER_3, DRAWING_NUMBER_4);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostTranslateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1501
 * @tc.desc   test for testMatrixPostTranslateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostTranslateNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate, passing nullptr as the first parameter, check the error code with
    // OH_Drawing_ErrorCodeGet, no crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixPostTranslate(nullptr, 1.5f, 2.5f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPostTranslate, passing 0 as the second parameter
    OH_Drawing_MatrixPostTranslate(matrix, 0, 2.5f);
    // 4. OH_Drawing_MatrixPostTranslate, passing 0 as the third parameter
    OH_Drawing_MatrixPostTranslate(matrix, 1.5f, 0);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostTranslateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1502
 * @tc.desc   test for testMatrixPostTranslateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostTranslateAbnormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate with a negative value as the second parameter
    OH_Drawing_MatrixPostTranslate(matrix, -1.5f, 2.5f);
    // 3. OH_Drawing_MatrixPostTranslate with a negative value as the third parameter
    OH_Drawing_MatrixPostTranslate(matrix, 1.5f, -2.5f);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostTranslateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1503
 * @tc.desc   test for testMatrixPostTranslateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostTranslateMaximum()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate with the second parameter as the maximum value
    OH_Drawing_MatrixPostTranslate(matrix, FLT_MAX, 2.5f);
    // 3. OH_Drawing_MatrixPostTranslate with the third parameter as the maximum value
    OH_Drawing_MatrixPostTranslate(matrix, 1.5f, FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostTranslateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1504
 * @tc.desc   test for testMatrixPostTranslateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostTranslateMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixPostTranslate 10 times, with dx and dy as random numbers
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(-DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_MatrixPostTranslate(matrix, dis(gen), dis(gen));
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixResetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1600
 * @tc.desc   test for testMatrixResetNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixResetNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixReset with the identity matrix
    OH_Drawing_MatrixReset(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixReset with a non-identity matrix
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_1, DRAWING_NUMBER_3, DRAWING_NUMBER_1,
        DRAWING_NUMBER_2, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    OH_Drawing_MatrixReset(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixResetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1601
 * @tc.desc   test for testMatrixResetNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixResetNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixReset with nullptr as the parameter, check the error code with OH_Drawing_ErrorCodeGet, no
    // crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixReset(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixResetMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1602
 * @tc.desc   test for testMatrixResetMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixResetMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixSetMatrix 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_1, DRAWING_NUMBER_3, DRAWING_NUMBER_1,
            DRAWING_NUMBER_2, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    }
    // 3. Call OH_Drawing_MatrixReset 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_MatrixReset(matrix);
    }
    // 4. Call OH_Drawing_MatrixSetMatrix and OH_Drawing_MatrixReset alternately 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_1, DRAWING_NUMBER_3, DRAWING_NUMBER_1,
            DRAWING_NUMBER_2, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
        OH_Drawing_MatrixReset(matrix);
    }
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixConcatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1700
 * @tc.desc   test for testMatrixConcatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixConcatNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // Define matrices a and b
    OH_Drawing_Matrix *a = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(a, nullptr);
    OH_Drawing_MatrixSetMatrix(a, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    OH_Drawing_Matrix *b = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(b, nullptr);
    OH_Drawing_MatrixSetMatrix(b, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    OH_Drawing_Matrix *c = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(c, nullptr);
    // 1. Call OH_Drawing_MatrixConcat with matrices a and b of different sizes,
    // and use OH_Drawing_MatrixGetAll to get the result of matrix a multiplied by matrix b
    OH_Drawing_MatrixConcat(c, b, a);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    float values[DRAWING_NUMBER_9];
    OH_Drawing_MatrixGetAll(c, values);
    EXPECT_EQ(values[0], DRAWING_NUMBER_1);
    // 2. Free memory
    OH_Drawing_MatrixDestroy(a);
    OH_Drawing_MatrixDestroy(b);
    OH_Drawing_MatrixDestroy(c);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixConcatNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1701
 * @tc.desc   test for testMatrixConcatNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixConcatNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixConcat, passing nullptr as the first parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixConcat(nullptr, matrix, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixConcat, passing nullptr as the second parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixConcat(matrix, nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_MatrixConcat, passing nullptr as the third parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixConcat(matrix, matrix, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixConcatMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1702
 * @tc.desc   test for testMatrixConcatMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixConcatMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Call OH_Drawing_MatrixConcat 10 times with matrices a and b of different sizes,
    // and use OH_Drawing_MatrixGetAll to get the result of matrix a multiplied by matrix b
    OH_Drawing_Matrix *a = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(a, nullptr);
    OH_Drawing_MatrixSetMatrix(a, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    OH_Drawing_Matrix *b = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(b, nullptr);
    OH_Drawing_MatrixSetMatrix(b, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    OH_Drawing_Matrix *c = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(c, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_MatrixConcat(c, b, a);
        float values[DRAWING_NUMBER_9];
        OH_Drawing_MatrixGetAll(c, values);
        EXPECT_EQ(values[0], DRAWING_NUMBER_1);
        EXPECT_EQ(values[DRAWING_NUMBER_1], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_2], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_3], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_4], -DRAWING_NUMBER_1);
        EXPECT_EQ(values[DRAWING_NUMBER_5], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_6], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_7], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_8], DRAWING_NUMBER_1);
    }
    // 2. Free memory
    OH_Drawing_MatrixDestroy(a);
    OH_Drawing_MatrixDestroy(b);
    OH_Drawing_MatrixDestroy(c);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixInvertNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1800
 * @tc.desc   test for testMatrixInvertNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixInvertNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *inverse = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(inverse, nullptr);
    bool ret = OH_Drawing_MatrixInvert(matrix, inverse);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    ret = OH_Drawing_MatrixInvert(inverse, matrix);
    EXPECT_EQ(ret, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(inverse);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixInvertNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1801
 * @tc.desc   test for testMatrixInvertNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixInvertNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixInvert with the first parameter as nullptr, check the error code with OH_Drawing_ErrorCodeGet
    bool ret = OH_Drawing_MatrixInvert(nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixInvert with the second parameter as nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_MatrixInvert(matrix, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixInvertMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1802
 * @tc.desc   test for testMatrixInvertMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixInvertMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Call OH_Drawing_MatrixInvert 10 times with matrices of different sizes
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *inverse = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(inverse, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_MatrixInvert(matrix, inverse);
        OH_Drawing_MatrixInvert(inverse, matrix);
        float values[DRAWING_NUMBER_9];
        OH_Drawing_MatrixGetAll(matrix, values);
        EXPECT_EQ(values[0], DRAWING_NUMBER_1);
        EXPECT_EQ(values[DRAWING_NUMBER_1], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_2], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_3], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_4], -DRAWING_NUMBER_1);
        EXPECT_EQ(values[DRAWING_NUMBER_5], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_6], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_7], 0);
        EXPECT_EQ(values[DRAWING_NUMBER_8], DRAWING_NUMBER_1);
    }
    // 2. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(inverse);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetPolyToPolyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1900
 * @tc.desc   test for testMatrixSetPolyToPolyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixSetPolyToPolyNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetPolyToPoly
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    OH_Drawing_Point2D src[] = {{0, 0}, {DRAWING_NUMBER_100, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_100}, {0,
        DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_30}, {DRAWING_NUMBER_100, DRAWING_NUMBER_70}
        , {0, DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    bool ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, DRAWING_NUMBER_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);

    // 3. OH_Drawing_MatrixSetPolyToPoly, iterate count from 0 to 4, keeping the length of the array consistent with
    // count
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_5; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_Point2D src[i];
        OH_Drawing_Point2D dst[i];
        for (int j = 0; j < i; j++) {
            // Generate random numbers
            src[j] = {dis(gen), dis(gen)};
            dst[j] = {dis(gen), dis(gen)};
        }
        ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, i);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(ret, true);
    }
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetPolyToPolyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1901
 * @tc.desc   test for testMatrixSetPolyToPolyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetPolyToPolyNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetPolyToPoly, the first parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Point2D src[] = {{0, 0}, {DRAWING_NUMBER_100, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_100}, {0,
        DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_30}, {DRAWING_NUMBER_100, DRAWING_NUMBER_70}
        , {0, DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    bool ret = OH_Drawing_MatrixSetPolyToPoly(nullptr, src, dst, DRAWING_NUMBER_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 3. OH_Drawing_MatrixSetPolyToPoly, the second parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_MatrixSetPolyToPoly(matrix, nullptr, dst, DRAWING_NUMBER_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 4. OH_Drawing_MatrixSetPolyToPoly, the third parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, nullptr, DRAWING_NUMBER_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetPolyToPolyAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1902
 * @tc.desc   test for testMatrixSetPolyToPolyAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetPolyToPolyAbnormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetPolyToPoly, pass -1 as count, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_Point2D src[] = {{0, 0}, {DRAWING_NUMBER_100, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_100}, {0,
        DRAWING_NUMBER_100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_30}, {DRAWING_NUMBER_100, DRAWING_NUMBER_70}
        , {0, DRAWING_NUMBER_100}};
    bool ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, -DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 3. OH_Drawing_MatrixSetPolyToPoly, pass 5 as count, check the error code with OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, DRAWING_NUMBER_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetPolyToPolyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1904
 * @tc.desc   test for testMatrixSetPolyToPolyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetPolyToPolyMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixSetPolyToPoly 10 times
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Point2D src[DRAWING_NUMBER_2] = {{dis(gen), dis(gen)}, {dis(gen), dis(gen)}};
        OH_Drawing_Point2D dst[DRAWING_NUMBER_2] = {{dis(gen), dis(gen)}, {dis(gen), dis(gen)}};
        bool ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, DRAWING_NUMBER_2);
        EXPECT_EQ(ret, true);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapPointsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2000
 * @tc.desc   test for testMatrixMapPointsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixMapPointsNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = {{0, 0}, {DRAWING_NUMBER_100, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_100}, {0,
        DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_30}, {DRAWING_NUMBER_100, DRAWING_NUMBER_70}
        , {0, DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    // 2. OH_Drawing_MatrixMapPoints, pass the float value 1.52 as count
    double value = 1.52f;
    uint32_t count = static_cast<uint32_t>(value);
    OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, count);
    // 3. OH_Drawing_MatrixMapPoints, pass integer 5 as count
    OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, DRAWING_NUMBER_5);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapPointsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2001
 * @tc.desc   test for testMatrixMapPointsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMapPointsNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = {{0, 0}, {DRAWING_NUMBER_100, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_100}, {0,
        DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_30}, {DRAWING_NUMBER_100, DRAWING_NUMBER_70}
        , {0, DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    // 2. OH_Drawing_MatrixMapPoints, the first parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(nullptr, src, dst, DRAWING_NUMBER_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixMapPoints, the second parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, nullptr, dst, DRAWING_NUMBER_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_MatrixMapPoints, the third parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, nullptr, DRAWING_NUMBER_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. OH_Drawing_MatrixMapPoints, the fourth parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, dst, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapPointsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2002
 * @tc.desc   test for testMatrixMapPointsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMapPointsAbnormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = {{0, 0}, {DRAWING_NUMBER_100, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_100}, {0,
        DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_30}, {DRAWING_NUMBER_100, DRAWING_NUMBER_70}
        , {0, DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    // 2. OH_Drawing_MatrixMapPoints, pass -1 as count, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, dst, -DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapPointsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2003
 * @tc.desc   test for testMatrixMapPointsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMapPointsMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = {{0, 0}, {DRAWING_NUMBER_100, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_100}, {0,
        DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {DRAWING_NUMBER_100, DRAWING_NUMBER_30}, {DRAWING_NUMBER_100, DRAWING_NUMBER_70}
        , {0, DRAWING_NUMBER_100}, {0, DRAWING_NUMBER_100}};
    // 2. Call OH_Drawing_MatrixMapPoints 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_MatrixMapPoints(matrix, src, dst, DRAWING_NUMBER_5);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2100
 * @tc.desc   test for testMatrixMapRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixMapRectNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixMapRect, src and dst are the same
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(dst, nullptr);
    bool ret = OH_Drawing_MatrixMapRect(matrix, src, dst);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 3. OH_Drawing_MatrixMapRect, src and dst are different
    OH_Drawing_Rect *srcDRAWING_NUMBER_2 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(srcDRAWING_NUMBER_2, nullptr);
    OH_Drawing_Rect *dstDRAWING_NUMBER_2 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(dstDRAWING_NUMBER_2, nullptr);
    ret = OH_Drawing_MatrixMapRect(matrix, srcDRAWING_NUMBER_2, dstDRAWING_NUMBER_2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_RectDestroy(srcDRAWING_NUMBER_2);
    OH_Drawing_RectDestroy(dstDRAWING_NUMBER_2);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2101
 * @tc.desc   test for testMatrixMapRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMapRectNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixMapRect, the first parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(dst, nullptr);
    bool ret = OH_Drawing_MatrixMapRect(nullptr, src, dst);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixMapRect, the second parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapRect(matrix, nullptr, dst);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_MatrixMapRect, the third parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapRect(matrix, src, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapRectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2103
 * @tc.desc   test for testMatrixMapRectMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMapRectMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixMapRect 10 times with different src and dst
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, dis(gen), dis(gen));
        // add assert
        EXPECT_NE(src, nullptr);
        OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, dis(gen), dis(gen));
        // add assert
        EXPECT_NE(dst, nullptr);
        bool ret = OH_Drawing_MatrixMapRect(matrix, src, dst);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(ret, true);
        OH_Drawing_RectDestroy(src);
        OH_Drawing_RectDestroy(dst);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsEqualNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2200
 * @tc.desc   test for testMatrixIsEqualNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixIsEqualNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixIsEqual with the same matrix
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
        DRAWING_NUMBER_5, DRAWING_NUMBER_6, DRAWING_NUMBER_7, DRAWING_NUMBER_8, DRAWING_NUMBER_9);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix2, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix2, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
        DRAWING_NUMBER_5, DRAWING_NUMBER_6, DRAWING_NUMBER_7, DRAWING_NUMBER_8, DRAWING_NUMBER_9);
    bool ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 2. OH_Drawing_MatrixIsEqual with different matrices
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix3, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix3, DRAWING_NUMBER_2, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
        DRAWING_NUMBER_5, DRAWING_NUMBER_6, DRAWING_NUMBER_7, DRAWING_NUMBER_8, DRAWING_NUMBER_9);
    ret = OH_Drawing_MatrixIsEqual(matrix, matrix3);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, false);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsEqualNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2201
 * @tc.desc   test for testMatrixIsEqualNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsEqualNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
        DRAWING_NUMBER_5, DRAWING_NUMBER_6, DRAWING_NUMBER_7, DRAWING_NUMBER_8, DRAWING_NUMBER_9);
    // 2. OH_Drawing_MatrixIsEqual, the first parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixIsEqual(nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixIsEqual, the second parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixIsEqual(matrix, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsEqualMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2202
 * @tc.desc   test for testMatrixIsEqualMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsEqualMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 2. Call OH_Drawing_MatrixIsEqual 10 times with alternating different or same matrices
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        if (i % DRAWING_NUMBER_2 == 0) {
            OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
                DRAWING_NUMBER_5, DRAWING_NUMBER_6, DRAWING_NUMBER_7, DRAWING_NUMBER_8, DRAWING_NUMBER_9);
            OH_Drawing_MatrixSetMatrix(matrix2, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
                DRAWING_NUMBER_5, DRAWING_NUMBER_6, DRAWING_NUMBER_7, DRAWING_NUMBER_8, DRAWING_NUMBER_9);
            bool ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
            EXPECT_EQ(ret, true);
        } else {
            OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
                DRAWING_NUMBER_5, DRAWING_NUMBER_6, DRAWING_NUMBER_7, DRAWING_NUMBER_8, DRAWING_NUMBER_9);
            OH_Drawing_MatrixSetMatrix(matrix2, DRAWING_NUMBER_2, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
                DRAWING_NUMBER_5, DRAWING_NUMBER_6, DRAWING_NUMBER_7, DRAWING_NUMBER_8, DRAWING_NUMBER_9);
            bool ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
            EXPECT_EQ(ret, false);
        }
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsIdentityNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2300
 * @tc.desc   test for testMatrixIsIdentityNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixIsIdentityNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixIsIdentity with an identity matrix
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    bool ret = OH_Drawing_MatrixIsIdentity(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 2. OH_Drawing_MatrixIsIdentity with a non-identity matrix
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
        DRAWING_NUMBER_5, DRAWING_NUMBER_6, DRAWING_NUMBER_7, DRAWING_NUMBER_8, DRAWING_NUMBER_9);
    ret = OH_Drawing_MatrixIsIdentity(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, false);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsIdentityNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2301
 * @tc.desc   test for testMatrixIsIdentityNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsIdentityNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixIsIdentity with nullptr as parameter, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixIsIdentity(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsIdentityMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2302
 * @tc.desc   test for testMatrixIsIdentityMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsIdentityMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // Call OH_Drawing_MatrixIsIdentity 10 times with alternating identity or non-identity matrices
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        if (i % DRAWING_NUMBER_2 == 0) {
            OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
            // add assert
            EXPECT_NE(matrix, nullptr);
            bool ret = OH_Drawing_MatrixIsIdentity(matrix);
            EXPECT_EQ(ret, true);
            OH_Drawing_MatrixDestroy(matrix);
        } else {
            OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
            // add assert
            EXPECT_NE(matrix, nullptr);
            OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
                DRAWING_NUMBER_5, DRAWING_NUMBER_6, DRAWING_NUMBER_7, DRAWING_NUMBER_8, DRAWING_NUMBER_9);
            bool ret = OH_Drawing_MatrixIsIdentity(matrix);
            EXPECT_EQ(ret, false);
            OH_Drawing_MatrixDestroy(matrix);
        }
    }
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2400
 * @tc.desc   test for testMatrixCopyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixCopyNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix1, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    // 3. Using the function OH_Drawing_MatrixCopy copy another matrix.
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCopy(matrix1);
    EXPECT_NE(matrix2, nullptr);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, 0), DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, DRAWING_NUMBER_1), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, DRAWING_NUMBER_2), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, DRAWING_NUMBER_3), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, DRAWING_NUMBER_4), DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, DRAWING_NUMBER_5), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, DRAWING_NUMBER_6), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, DRAWING_NUMBER_7), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, DRAWING_NUMBER_8), DRAWING_NUMBER_1);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2401
 * @tc.desc   test for testMatrixCopyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCopyNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix1, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    // 3. The function OH_Drawing_MatrixCopy passes to nullptr.
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCopy(nullptr);
    EXPECT_EQ(matrix2, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCopyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2402
 * @tc.desc   test for testMatrixCopyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCopyMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix1, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    // 3. Using the function OH_Drawing_MatrixCopy copy another matrix.
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    // 4. The function OH_Drawing_MatrixCopy is called 10 times.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_MatrixCopy(matrix1);
        EXPECT_NE(matrix2, nullptr);
    }
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPerConcatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2500
 * @tc.desc   test for testMatrixPerConcatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPerConcatNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix *other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1, 0, -DRAWING_NUMBER_2, 0, 0,
        DRAWING_NUMBER_3, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(other, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, -DRAWING_NUMBER_1, 0,
        -DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1);
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(matrix, other);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_1), 1.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_2), DRAWING_NUMBER_2);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_3), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_4), DRAWING_NUMBER_2);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_5), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_6), -1.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_7), -DRAWING_NUMBER_3);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_8), 1.0f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPerConcatNull1
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2501
 * @tc.desc   test for testMatrixPerConcatNull1.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPerConcatNull1()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix *other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1, 0, -DRAWING_NUMBER_2, 0, 0,
        DRAWING_NUMBER_3, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(other, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, -DRAWING_NUMBER_1, 0,
        -DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1);
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(nullptr, other);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), 1.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_1), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_2), 1.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_3), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_4), -DRAWING_NUMBER_2);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_5), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_6), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_7), DRAWING_NUMBER_3);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_8), 1.0f);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPerConcatNull2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2502
 * @tc.desc   test for testMatrixPerConcatNull2.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPerConcatNull2()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix *other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    EXPECT_NE(other, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1,  0, -DRAWING_NUMBER_2, 0, 0,
        DRAWING_NUMBER_3, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(other, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, -DRAWING_NUMBER_1, 0,
        -DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1);
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(matrix, nullptr);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), 1.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_1), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_2), 1.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_3), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_4), -DRAWING_NUMBER_2);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_5), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_6), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_7), DRAWING_NUMBER_3);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_8), 1.0f);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
/**
 * @tc.name   testMatrixPerConcatCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2503
 * @tc.desc   test for testMatrixPerConcatCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPerConcatCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix *other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1, 0, -DRAWING_NUMBER_2, 0, 0,
        DRAWING_NUMBER_3, DRAWING_NUMBER_1);
    OH_Drawing_MatrixSetMatrix(other, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, -DRAWING_NUMBER_1, 0,
        -DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(matrix, other);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), -DRAWING_NUMBER_32);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_1), -DRAWING_NUMBER_7);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_2), DRAWING_NUMBER_32);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_3), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_4), -DRAWING_NUMBER_2);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_5), 0.0f);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_6), -DRAWING_NUMBER_32);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_7), -DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, DRAWING_NUMBER_8), 0.0f);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsAffineNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2600
 * @tc.desc   test for testMatrixIsAffineNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixIsAffineNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isAffine = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    matrix = OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_45, 0, 0);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    matrix = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    matrix = OH_Drawing_MatrixCreateTranslation(DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
        DRAWING_NUMBER_5, DRAWING_NUMBER_6, -DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, false);

    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
        DRAWING_NUMBER_5, DRAWING_NUMBER_6, 0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsAffineNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2601
 * @tc.desc   test for testMatrixIsAffineNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsAffineNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isAffine = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixIsAffine(nullptr, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isAffine, false);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isAffine, false);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsAffineMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2602
 * @tc.desc   test for testMatrixIsAffineMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsAffineMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isAffine = false;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isAffine, true);
    }
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreSkewNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2700
 * @tc.desc   test for testMatrixPreSkewNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPreSkewNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);

    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_1, DRAWING_NUMBER_2, -DRAWING_NUMBER_10, DRAWING_NUMBER_3,
        DRAWING_NUMBER_1, -DRAWING_NUMBER_12, 0, 0, DRAWING_NUMBER_1);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixPreSkew(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_3,
        DRAWING_NUMBER_4, DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    bool ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_90, 0, 0);
    OH_Drawing_MatrixSetMatrix(result, -DRAWING_NUMBER_3, -DRAWING_NUMBER_1, DRAWING_NUMBER_12, DRAWING_NUMBER_1,
        DRAWING_NUMBER_2, -DRAWING_NUMBER_10, 0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4, DRAWING_NUMBER_5)
        ;
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, 0);
    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_1, DRAWING_NUMBER_2, -DRAWING_NUMBER_10, DRAWING_NUMBER_3,
        DRAWING_NUMBER_1, -DRAWING_NUMBER_12, 0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4, DRAWING_NUMBER_5)
        ;
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateTranslation(DRAWING_NUMBER_50, DRAWING_NUMBER_50);
    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_40, DRAWING_NUMBER_3,
        DRAWING_NUMBER_1, DRAWING_NUMBER_38, 0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4, DRAWING_NUMBER_5)
        ;
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreSkewNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2701
 * @tc.desc   test for testMatrixPreSkewNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreSkewNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix2, nullptr);
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix3, nullptr);
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix4, nullptr);
    OH_Drawing_Matrix *matrix5 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix5, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);

    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixPreSkew(nullptr, DRAWING_NUMBER_2, DRAWING_NUMBER_3,
        DRAWING_NUMBER_4, DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    bool ret = OH_Drawing_MatrixIsEqual(matrix1, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_1, 0, 0, DRAWING_NUMBER_3, DRAWING_NUMBER_1, -DRAWING_NUMBER_12,
        0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix2, 0, DRAWING_NUMBER_3, DRAWING_NUMBER_4, DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix2, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_1, DRAWING_NUMBER_2, -DRAWING_NUMBER_10, 0, DRAWING_NUMBER_1, 0,
        0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix3, DRAWING_NUMBER_2, 0, DRAWING_NUMBER_4, DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix3, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_1, DRAWING_NUMBER_2, -DRAWING_NUMBER_10, DRAWING_NUMBER_3,
        DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix4, DRAWING_NUMBER_2, DRAWING_NUMBER_3, 0, DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix4, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_1, DRAWING_NUMBER_2, 0, DRAWING_NUMBER_3, DRAWING_NUMBER_1,
        -DRAWING_NUMBER_12, 0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix5, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix5, result);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
    OH_Drawing_MatrixDestroy(matrix5);
    OH_Drawing_MatrixDestroy(result);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreSkewMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2702
 * @tc.desc   test for testMatrixPreSkewMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreSkewMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);
    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixPreSkew(matrix, 0, 0, 0, 0);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        bool ret = OH_Drawing_MatrixIsEqual(matrix, result);
        EXPECT_EQ(ret, true);
    }
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixRectStaysRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2800
 * @tc.desc   test for testMatrixRectStaysRectNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixRectStaysRectNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixPreScale(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4, DRAWING_NUMBER_5);
    bool isRectStaysRect = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);

    OH_Drawing_MatrixPreSkew(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4, DRAWING_NUMBER_5);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, false);

    matrix = OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_90, 0, 0);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);

    matrix = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, 0);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);

    matrix = OH_Drawing_MatrixCreateTranslation(DRAWING_NUMBER_50, DRAWING_NUMBER_50);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixRectStaysRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2801
 * @tc.desc   test for testMatrixRectStaysRectNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixRectStaysRectNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isRectStaysRect = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixRectStaysRect(nullptr, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isRectStaysRect, false);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isRectStaysRect, false);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixRectStaysRectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2802
 * @tc.desc   test for testMatrixRectStaysRectMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixRectStaysRectMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isRectStaysRect = false;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isRectStaysRect, true);
    }
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetSinCosNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2900
 * @tc.desc   test for testMatrixSetSinCosNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixSetSinCosNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);

    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_3, -DRAWING_NUMBER_2, DRAWING_NUMBER_2, DRAWING_NUMBER_2,
        DRAWING_NUMBER_3, -DRAWING_NUMBER_18, 0, 0, DRAWING_NUMBER_1);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixSetSinCos(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_3,
        DRAWING_NUMBER_4, DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    bool ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_90, 0, 0);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
        DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, 0);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
        DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateTranslation(DRAWING_NUMBER_50, DRAWING_NUMBER_50);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
        DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetSinCosNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2901
 * @tc.desc   test for testMatrixSetSinCosNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetSinCosNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix2, nullptr);
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix3, nullptr);
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix4, nullptr);
    OH_Drawing_Matrix *matrix5 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix5, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);

    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixSetSinCos(nullptr, DRAWING_NUMBER_2, DRAWING_NUMBER_3,
        DRAWING_NUMBER_4, DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    bool ret = OH_Drawing_MatrixIsEqual(matrix1, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_3, 0, -DRAWING_NUMBER_8, 0, DRAWING_NUMBER_3, -DRAWING_NUMBER_10,
        0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix2, 0, DRAWING_NUMBER_3, DRAWING_NUMBER_4, DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix2, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, 0, -DRAWING_NUMBER_2, DRAWING_NUMBER_14, DRAWING_NUMBER_2, 0, -DRAWING_NUMBER_3,
        0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix3, DRAWING_NUMBER_2, 0, DRAWING_NUMBER_4, DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix3, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_3, -DRAWING_NUMBER_2, DRAWING_NUMBER_10, DRAWING_NUMBER_2,
        DRAWING_NUMBER_3, -DRAWING_NUMBER_10, 0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix4, DRAWING_NUMBER_2, DRAWING_NUMBER_3, 0, DRAWING_NUMBER_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix4, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, DRAWING_NUMBER_3, -DRAWING_NUMBER_2, -DRAWING_NUMBER_8, DRAWING_NUMBER_2,
        DRAWING_NUMBER_3, -DRAWING_NUMBER_8, 0, 0, DRAWING_NUMBER_1);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix5, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix5, result);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
    OH_Drawing_MatrixDestroy(matrix5);
    OH_Drawing_MatrixDestroy(result);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetSinCosMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2902
 * @tc.desc   test for testMatrixSetSinCosMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetSinCosMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixSetSinCos(matrix, 0, 0, 0, 0);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
