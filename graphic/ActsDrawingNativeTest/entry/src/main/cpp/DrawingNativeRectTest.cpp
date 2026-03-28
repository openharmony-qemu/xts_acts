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

#include "include/DrawingNativeRectTest.h"
#include "include/DrawingNativeScalarCommonTest.h"
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_30 30
#define DRAWING_NUMBER_40 40
#define DRAWING_NUMBER_440 40
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_300 300
#define DRAWING_NUMBER_400 400
#define DRAWING_NUMBER_500 500
#define DRAWING_NUMBER_600 600
#define DRAWING_NUMBER_700 700
#define DRAWING_NUMBER_800 800
#define DRAWING_NUMBER_4096 4096
#define DRAWING_NUMBER_2160 2160
#define DRAWING_NUMBER_2139095040 2139095040
#define DRAWING_NUMBER_2139095170 2139095170

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeRectTestSetUp()
{
    std::cout << "DrawingNativeRectTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRectTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeRectTestTearDown()
{
    std::cout << "DrawingNativeRectTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRectTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testRectCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0100
 * @tc.desc   Test for creating and destroying a rectangle object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectCreateNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, DRAWING_NUMBER_500, 600);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectIntersectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0200
 * @tc.desc   Test for intersecting two rectangles with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectIntersectNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, DRAWING_NUMBER_500, 600);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_300, DRAWING_NUMBER_400, 700, 800);
    // add assert
    EXPECT_NE(other, nullptr);
    // 3. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Repeat steps 3-6 to set the coordinates of the other rectangle object
    OH_Drawing_RectSetLeft(other, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetTop(other, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetRight(other, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetBottom(other, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Call OH_Drawing_RectIntersect to check if the two rectangles intersect, Returns true if they intersect,
    // false otherwise
    bool ret = OH_Drawing_RectIntersect(rect, other);
    EXPECT_EQ(ret, true);
    // 9. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectIntersectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0201
 * @tc.desc   Test for intersecting rectangles with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectIntersectNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, DRAWING_NUMBER_500, 600);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_300, DRAWING_NUMBER_400, 700, 800);
    // add assert
    EXPECT_NE(other, nullptr);
    // 3. Call OH_Drawing_RectIntersect with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    bool ret = OH_Drawing_RectIntersect(nullptr, other);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_RectIntersect with the second parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    ret = OH_Drawing_RectIntersect(rect, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectJoinNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0300
 * @tc.desc   Test for joining two rectangles with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectJoinNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    // add assert
    EXPECT_NE(other, nullptr);
    // 3. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Repeat steps 3-6 to set the coordinates of the other rectangle object
    OH_Drawing_RectSetLeft(other, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetTop(other, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetRight(other, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetBottom(other, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Call OH_Drawing_RectJoin to take the union of the two rectangles
    bool ret = OH_Drawing_RectJoin(rect, other);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 9. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectJoinNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0301
 * @tc.desc   Test for joining rectangles with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectJoinNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    // add assert
    EXPECT_NE(other, nullptr);
    // 3. Call OH_Drawing_RectJoin with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    bool ret = OH_Drawing_RectJoin(nullptr, other);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_RectJoin with the second parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    ret = OH_Drawing_RectJoin(rect, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetLeftNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0400
 * @tc.desc   Test for setting and getting the left coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSetLeftNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect, Returns the value set
    // in step 2
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetLeftNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0401
 * @tc.desc   Test for setting the left coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetLeftNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetLeft(nullptr, 0.00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetLeft with the second parameter as 0.00, Call fails without crashing
    OH_Drawing_RectSetLeft(rect, 0.00);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetLeftAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0402
 * @tc.desc   Test for setting the left coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetLeftAbnormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft with the second parameter as an integer or character data
    OH_Drawing_RectSetLeft(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect, Returns the value set
    // in step 2 (the passed parameter is forcibly converted)
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetLeftMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0403
 * @tc.desc   Test for repeatedly setting and getting the left coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetLeftMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetLeft(rect, i * DRAWING_NUMBER_10);
        float left = OH_Drawing_RectGetLeft(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(left, i * DRAWING_NUMBER_10));
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetTopNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0500
 * @tc.desc   Test for setting and getting the top coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSetTopNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect, Returns the value set in
    // step 2
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetTopNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0501
 * @tc.desc   Test for setting the top coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetTopNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetTop(nullptr, 0.00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetTop with the second parameter as 0.00, Call fails without crashing
    OH_Drawing_RectSetTop(rect, 0.00);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetTopAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0502
 * @tc.desc   Test for setting the top coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetTopAbnormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop with the second parameter as an integer or character data
    OH_Drawing_RectSetTop(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect, Returns the value set in
    // step 2 (the passed parameter is forcibly converted)
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetTopMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0503
 * @tc.desc   Test for repeatedly setting and getting the top coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetTopMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Loop to call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect 10 times (each time
    // with a different value)
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetTop(rect, i * DRAWING_NUMBER_10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each
        // time the returned value is consistent with the set value
        float top = OH_Drawing_RectGetTop(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(top, i * DRAWING_NUMBER_10));
    }
    // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each time
    // the returned value is consistent with the set value
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetTop(rect, DRAWING_NUMBER_10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each
        // time the returned value is consistent with the set value
        float top = OH_Drawing_RectGetTop(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(top, DRAWING_NUMBER_10));
    }
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetRightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0600
 * @tc.desc   Test for setting and getting the right coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSetRightNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect, Returns the value set
    // in step 2
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, DRAWING_NUMBER_300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetRightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0601
 * @tc.desc   Test for setting the right coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetRightNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetRight(nullptr, 0.00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetRight with the second parameter as 0.00, 3. Call fails without crashing
    OH_Drawing_RectSetRight(rect, 0.00);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetRightAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0602
 * @tc.desc   Test for setting the right coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetRightAbnormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight with the second parameter as an integer or character data
    OH_Drawing_RectSetRight(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect, Returns the value set
    // in step 2 (the passed parameter is forcibly converted)
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetRightMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0603
 * @tc.desc   Test for repeatedly setting and getting the right coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetRightMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Loop to call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect 10 times (each
    // time with a different value)
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetRight(rect, i * DRAWING_NUMBER_10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times,
        // Each time the returned value is consistent with the set value
        float right = OH_Drawing_RectGetRight(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(right, i * DRAWING_NUMBER_10));
    }
    // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times, Each
    // time the returned value is consistent with the set value
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times,
        // Each time the returned value is consistent with the set value
        float right = OH_Drawing_RectGetRight(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(right, DRAWING_NUMBER_10));
    }
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetBottomNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0700
 * @tc.desc   Test for setting and getting the bottom coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSetBottomNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect, 3. Returns the value
    // set in step 2
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, DRAWING_NUMBER_300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetBottomNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0701
 * @tc.desc   Test for setting the bottom coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetBottomNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom with the first parameter as nullptr, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetBottom(nullptr, 0.00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetBottom with the second parameter as 0.00, the call fails without crashing
    OH_Drawing_RectSetBottom(rect, 0.00);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetBottomAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0702
 * @tc.desc   Test for setting the bottom coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetBottomAbnormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom with the second parameter as an integer or character data
    OH_Drawing_RectSetBottom(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetBottomMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0703
 * @tc.desc   Test for repeatedly setting and getting the bottom coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetBottomMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);

    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetBottom(rect, i * DRAWING_NUMBER_10);
        float bottom = OH_Drawing_RectGetBottom(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(bottom, i * DRAWING_NUMBER_10));
    }

    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetLeftNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0800
 * @tc.desc   Test for setting and getting the left coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetLeftNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, 100);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetLeftNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0801
 * @tc.desc   Test for getting the left coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetLeftNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetLeft with nullptr as the parameter
    OH_Drawing_RectGetLeft(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetTopNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0900
 * @tc.desc   Test for setting and getting the top coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetTopNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, 100);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetTopNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0901
 * @tc.desc   Test for getting the top coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetTopNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetTop with nullptr as the parameter
    OH_Drawing_RectGetTop(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetRightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1000
 * @tc.desc   Test for setting and getting the right coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetRightNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_300);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, DRAWING_NUMBER_300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetRightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1001
 * @tc.desc   Test for getting the right coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetRightNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetRight with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetRight(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetBottomNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1100
 * @tc.desc   Test for setting and getting the bottom coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetBottomNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_300);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect, the return value
    // should be the same as the set value
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, DRAWING_NUMBER_300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetBottomNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1101
 * @tc.desc   Test for getting the bottom coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetBottomNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetBottom with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetBottom(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetHeightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1200
 * @tc.desc   Test for setting coordinates and getting the height of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetHeightNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, 0);
    // 3. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, 0);
    // 4. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_200);
    // 5. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_200);
    // 6. Call OH_Drawing_RectGetHeight to get the height of the rectangle, which is the difference between the
    // y-coordinate of the bottom-right corner and the y-coordinate of the top-left corner
    float height = OH_Drawing_RectGetHeight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(height, DRAWING_NUMBER_200 - 0));
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetHeightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1201
 * @tc.desc   Test for getting the height of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetHeightNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetHeight with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetHeight(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetWidthNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1300
 * @tc.desc   Test for setting coordinates and getting the width of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetWidthNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner
    OH_Drawing_RectSetLeft(rect, 0);
    // 3. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner
    OH_Drawing_RectSetTop(rect, 0);
    // 4. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_200);
    // 5. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_200);
    // 6. Call OH_Drawing_RectGetWidth to get the width of the rectangle, which is the difference between the
    // x-coordinate of the bottom-right corner and the x-coordinate of the top-left corner
    float width = OH_Drawing_RectGetWidth(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(width, DRAWING_NUMBER_200 - 0));
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetWidthNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1301
 * @tc.desc   Test for getting the width of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetWidthNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetWidth with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetWidth(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetWidthBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1302
 * @tc.desc   Test for setting coordinates and getting the width of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetWidthBoundary()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    uint32_t width = DRAWING_NUMBER_4096;
    uint32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner
    OH_Drawing_RectSetLeft(rect, 0);
    // 3. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner
    OH_Drawing_RectSetTop(rect, 0);
    // 4. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner
    OH_Drawing_RectSetRight(rect, width);
    // 5. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner
    OH_Drawing_RectSetBottom(rect, height);
    // 6. Call OH_Drawing_RectGetWidth to get the width of the rectangle, which is the difference between the
    // x-coordinate of the bottom-right corner and the x-coordinate of the top-left corner
    float getWidth = OH_Drawing_RectGetWidth(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(getWidth, width - 0));
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1400
 * @tc.desc   Test for copying a rectangle with normal parameters and checking the copied values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectCopyNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object src
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Call OH_Drawing_RectCreate to create a rectangle object dst
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(dst, nullptr);
    // 3. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of src
    OH_Drawing_RectSetLeft(src, 100);
    // 4. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of src
    OH_Drawing_RectSetTop(src, 100);
    // 5. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of src
    OH_Drawing_RectSetRight(src, DRAWING_NUMBER_300);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of src
    OH_Drawing_RectSetBottom(src, DRAWING_NUMBER_300);
    // 7. Call OH_Drawing_RectCopy to copy the source rectangle object src to the destination rectangle object dst
    OH_Drawing_RectCopy(src, dst);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of dst, which should be the same as
    // the value set in src
    float left = OH_Drawing_RectGetLeft(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 100));
    // 9. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of dst, which should be the same as
    // the value set in src
    float top = OH_Drawing_RectGetTop(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 100));
    // 10. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of dst, which should be the
    // same as the value set in src
    float right = OH_Drawing_RectGetRight(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(right, DRAWING_NUMBER_300));
    // 11. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of dst, which should be the
    // same as the value set in src
    float bottom = OH_Drawing_RectGetBottom(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, DRAWING_NUMBER_300));
    // 12. Call OH_Drawing_RectSetLeft to modify the x-coordinate of the top-left corner of src
    OH_Drawing_RectSetLeft(src, DRAWING_NUMBER_200);
    // 13. Call OH_Drawing_RectSetTop to modify the y-coordinate of the top-left corner of src
    OH_Drawing_RectSetTop(src, DRAWING_NUMBER_200);
    // 14. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of dst, which should be the same
    // as the previous value (indicating that the modification in src does not affect the result in dst)
    left = OH_Drawing_RectGetLeft(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 100));
    // 15. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of dst, which should be the same as
    // the previous value (indicating that the modification in src does not affect the result in dst)
    top = OH_Drawing_RectGetTop(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 100));
    // 16. Free memory
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1401
 * @tc.desc   Test for copying a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectCopyNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object src
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Call OH_Drawing_RectCreate to create a rectangle object dst
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(dst, nullptr);
    // 3. Call OH_Drawing_RectCopy with nullptr as the first parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectCopy(nullptr, dst);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_RectCopy with nullptr as the second parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectCopy(src, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1500
 * @tc.desc   Test for creating and destroying a rectangle object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectDestroyNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1501
 * @tc.desc   Test for destroying a rectangle object with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectDestroyNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectDestroy with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectDestroy(nullptr);
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectInsetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1600
 * @tc.desc   Test for testRectInsetNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectInsetNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    float left = DRAWING_NUMBER_10;
    float top = -DRAWING_NUMBER_20;
    float right = DRAWING_NUMBER_30;
    float bottom = -DRAWING_NUMBER_40;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 110.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 180.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 370.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 340.0);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectInsetAbNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1601
 * @tc.desc   Test for testRectInsetAbNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectInsetAbNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    float left = DRAWING_NUMBER_100;
    float top = 0;
    float right = DRAWING_NUMBER_200;
    float bottom = DRAWING_NUMBER_100;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectInsetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1602
 * @tc.desc   Test for testRectInsetNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectInsetNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    float left = DRAWING_NUMBER_100;
    float top = 0;
    float right = DRAWING_NUMBER_200;
    float bottom = DRAWING_NUMBER_100;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(nullptr, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 400.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 300.0);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectInsetCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1603
 * @tc.desc   Test for testRectInsetCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectInsetCalls()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    float left = DRAWING_NUMBER_10;
    float top = -DRAWING_NUMBER_20;
    float right = DRAWING_NUMBER_30;
    float bottom = -DRAWING_NUMBER_40;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 700.0);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectContainsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1700
 * @tc.desc   Test for testRectContainsNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectContainsNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_500,
        DRAWING_NUMBER_500);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    EXPECT_NE(other, nullptr);
    bool isContains;
    OH_Drawing_ErrorCode code = OH_Drawing_RectContains(rect, other, &isContains);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, true);
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectContainsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1701
 * @tc.desc   Test for testRectContainsNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectContainsNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_500,
        DRAWING_NUMBER_500);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    EXPECT_NE(other, nullptr);
    bool isContains = false;
    OH_Drawing_ErrorCode code = OH_Drawing_RectContains(nullptr, other, &isContains);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);

    code = OH_Drawing_RectContains(rect, nullptr, &isContains);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);

    code = OH_Drawing_RectContains(rect, other, nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectContainsCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1703
 * @tc.desc   Test for testRectContainsCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectContainsCalls()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_500,
        DRAWING_NUMBER_500);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    EXPECT_NE(other, nullptr);
    bool isContains;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_RectContains(rect, other, &isContains);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isContains, true);
    }
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1800
 * @tc.desc   Test for testRectSetEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSetEmptyNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1801
 * @tc.desc   Test for testRectSetEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetEmptyNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1802
 * @tc.desc   Test for testRectSetEmptyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetEmptyMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(rect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectIsEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1900
 * @tc.desc   Test for testRectIsEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectIsEmptyNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = true;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectIsEmpty(rect, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmpty, false);
    OH_Drawing_RectSetEmpty(rect);
    errorCode = OH_Drawing_RectIsEmpty(rect, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmpty, true);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectIsEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1901
 * @tc.desc   Test for testRectIsEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectIsEmptyNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectIsEmpty(nullptr, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    errorCode = OH_Drawing_RectIsEmpty(rect, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectIsEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1902
 * @tc.desc   Test for testRectIsEmptyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectIsEmptyMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = true;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectIsEmpty(rect, &isEmpty);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isEmpty, false);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2000
 * @tc.desc   Test for testRectOffsetNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectOffsetNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    errorCode = OH_Drawing_RectOffset(rect, -100, -100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2001
 * @tc.desc   Test for testRectOffsetNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    errorCode = OH_Drawing_RectOffset(rect, 0, 100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    errorCode = OH_Drawing_RectOffset(rect, 100, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2002
 * @tc.desc   Test for testRectOffsetAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetAbnormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, 0x7F7FFFFF, 0x7F7FFFFF);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DRAWING_NUMBER_2139095040);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DRAWING_NUMBER_2139095040);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DRAWING_NUMBER_2139095170);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DRAWING_NUMBER_2139095170);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2003
 * @tc.desc   Test for testRectOffsetMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    for (float i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 10.0 + i * 10.0);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 10.0 + i * 10.0);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 110.0 + i * 10.0);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 110.0 + i * 10.0);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2100
 * @tc.desc   Test for testRectOffsetToNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectOffsetToNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2101
 * @tc.desc   Test for testRectOffsetToNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetToNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    errorCode = OH_Drawing_RectOffsetTo(rect, 0, 100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    errorCode = OH_Drawing_RectOffsetTo(rect, 100, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2102
 * @tc.desc   Test for testRectOffsetToAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetToAbnormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, 0x7F7FFFFF, 0x7F7FFFFF);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DRAWING_NUMBER_2139095040);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DRAWING_NUMBER_2139095040);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DRAWING_NUMBER_2139095170);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DRAWING_NUMBER_2139095170);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetToMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2103
 * @tc.desc   Test for testRectOffsetToMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetToMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSortNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2200
 * @tc.desc   Test for testRectSortNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSortNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0, 0);
    errorCode = OH_Drawing_RectSort(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSortNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2201
 * @tc.desc   Test for testRectSortNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSortNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSortMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2202
 * @tc.desc   Test for testRectSortMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSortMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(rect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectUnionNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2300
 * @tc.desc   Test for testRectUnionNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectUnionNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(rect, other);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectUnionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2301
 * @tc.desc   Test for testRectUnionNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectUnionNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(nullptr, other);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_RectUnion(rect, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectUnionMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2302
 * @tc.desc   Test for testRectUnionMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectUnionMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(rect, other);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS