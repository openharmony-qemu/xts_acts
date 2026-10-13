/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "include/DrawingNativeLatticeTest.h"
#include "include/DrawingNativeScalarCommonTest.h"
#include "include/OhosCommonTest.h"
#include <native_drawing/drawing_error_code.h>

#define NUMBER_2 2
#define NUMBER_3 3
#define NUMBER_5 5
#define NUMBER_9 9
#define NUMBER_10 10
#define NUMBER_20 20
#define NUMBER_30 30
#define NUMBER_33 33
#define NUMBER_40 40
#define NUMBER_50 50
#define NUMBER_60 60
#define NUMBER_70 70
#define NUMBER_80 80
#define NUMBER_90 90
#define NUMBER_100 100
#define NUMBER_0XFFFF0000 0xFFFF0000

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeLatticeTestSetUp()
{
    std::cout << "DrawingNativeLatticeTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeLatticeTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeLatticeTestTearDown()
{
    std::cout << "DrawingNativeLatticeTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeLatticeTest errorCodeReset after each test case." << std::endl;
}

int TestLatticeCreateNormal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[NUMBER_2] = {NUMBER_10, NUMBER_20};
    int yDivs[NUMBER_2] = {NUMBER_10, NUMBER_20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, NUMBER_100, NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[NUMBER_9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[NUMBER_9] = {NUMBER_0XFFFF0000};
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_LatticeCreate(xDivs, yDivs, NUMBER_2, NUMBER_2, rect, rectTypes, NUMBER_9,
            colors, NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestLatticeCreateNull()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[NUMBER_2] = {NUMBER_10, NUMBER_20};
    int yDivs[NUMBER_2] = {NUMBER_10, NUMBER_20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, NUMBER_100, NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[NUMBER_9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[NUMBER_9] = {NUMBER_0XFFFF0000};
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_LatticeCreate(nullptr, yDivs, NUMBER_2, NUMBER_2, rect, rectTypes, NUMBER_9,
            colors, NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, nullptr, NUMBER_2, NUMBER_2, rect, rectTypes,
        NUMBER_9, colors, NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, 0, NUMBER_2, rect, rectTypes, NUMBER_9, colors,
        NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, NUMBER_2, 0, rect, rectTypes, NUMBER_9, colors,
        NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, NUMBER_2, NUMBER_2, nullptr, rectTypes,
        NUMBER_9, colors, NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, NUMBER_2, NUMBER_2, rect, nullptr,
        NUMBER_9, colors, NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, NUMBER_2, NUMBER_2, rect, rectTypes, 0, colors,
        NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, NUMBER_2, NUMBER_2, rect, rectTypes,
        NUMBER_9, nullptr, NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, NUMBER_2, NUMBER_2, rect, rectTypes,
        NUMBER_9, colors, 0, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, NUMBER_2, NUMBER_2, rect, rectTypes,
        NUMBER_9, colors, NUMBER_9, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestLatticeCreateAbnormal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs1[NUMBER_2] = {NUMBER_10, NUMBER_20};
    int yDivs1[NUMBER_2] = {NUMBER_10, NUMBER_20};
    int xDivs2[NUMBER_10] = {NUMBER_10, NUMBER_20, NUMBER_30, NUMBER_40,
        NUMBER_50, NUMBER_60, NUMBER_70, NUMBER_80, NUMBER_90,
        NUMBER_100};
    int yDivs2[NUMBER_10] = {NUMBER_10, NUMBER_20, NUMBER_30, NUMBER_40,
        NUMBER_50, NUMBER_60, NUMBER_70, NUMBER_80, NUMBER_90,
        NUMBER_100};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, NUMBER_100, NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes1[NUMBER_9] = {OH_Drawing_LatticeRectType::DEFAULT};
    OH_Drawing_LatticeRectType rectTypes2[33] = {OH_Drawing_LatticeRectType::DEFAULT};
    OH_Drawing_LatticeRectType rectTypes3[9] = {static_cast<OH_Drawing_LatticeRectType>(NUMBER_5)};
    uint32_t colors1[NUMBER_9] = {NUMBER_0XFFFF0000};
    uint32_t colors2[NUMBER_33] = {NUMBER_0XFFFF0000};
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeCreate(xDivs2, yDivs1, NUMBER_10, NUMBER_2, rect,
        rectTypes2, NUMBER_33, colors2, NUMBER_33, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs2, NUMBER_2, NUMBER_10, rect, rectTypes2,
        NUMBER_33, colors2, NUMBER_33, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs1, NUMBER_2, NUMBER_2, rect, rectTypes1,
        NUMBER_5, colors1, NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs1, NUMBER_2, NUMBER_2, rect, rectTypes1,
        NUMBER_9, colors1, NUMBER_5, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs1, NUMBER_2, NUMBER_2, rect, rectTypes3,
        NUMBER_9, colors1, NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestLatticeCreateEnumTraversal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[NUMBER_2] = {NUMBER_10, NUMBER_20};
    int yDivs[NUMBER_2] = {NUMBER_10, NUMBER_20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, NUMBER_100, NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[NUMBER_9] = {
        OH_Drawing_LatticeRectType::DEFAULT,
        OH_Drawing_LatticeRectType::TRANSPARENT,
        OH_Drawing_LatticeRectType::FIXED_COLOR
    };
    uint32_t colors[9] = {NUMBER_0XFFFF0000};
    for (int i = 0; i < NUMBER_3; i++) {
        OH_Drawing_ErrorCode errorCode =
            OH_Drawing_LatticeCreate(xDivs, yDivs, NUMBER_2, NUMBER_2, rect, rectTypes,
                NUMBER_9, colors, NUMBER_9, &lattice);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestLatticeCreateMultipleCalls()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[NUMBER_2] = {NUMBER_10, NUMBER_20};
    int yDivs[NUMBER_2] = {NUMBER_10, NUMBER_20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, NUMBER_100, NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[NUMBER_9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[NUMBER_9] = {NUMBER_0XFFFF0000};
    for (int i = 0; i < NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode =
            OH_Drawing_LatticeCreate(xDivs, yDivs, NUMBER_2, NUMBER_2, rect, rectTypes,
                NUMBER_9, colors, NUMBER_9, &lattice);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestLatticeDestroyNormal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[NUMBER_2] = {NUMBER_10, NUMBER_20};
    int yDivs[NUMBER_2] = {NUMBER_10, NUMBER_20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, NUMBER_100, NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[NUMBER_9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[NUMBER_9] = {NUMBER_0XFFFF0000};
    OH_Drawing_LatticeCreate(xDivs, yDivs, NUMBER_2, NUMBER_2, rect, rectTypes, NUMBER_9,
        colors, NUMBER_9, &lattice);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeDestroy(lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestLatticeDestroyNull()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeDestroy(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS