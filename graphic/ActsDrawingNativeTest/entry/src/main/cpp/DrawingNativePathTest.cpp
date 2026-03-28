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

#include "include/DrawingNativePathTest.h"
#include "include/DrawingNativeScalarCommonTest.h"
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_50 50
#define DRAWING_NUMBER_90 90
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_300 300

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativePathTestSetUp()
{
    std::cout << "DrawingNativePathTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativePathTestTearDown()
{
    std::cout << "DrawingNativePathTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathTest errorCodeReset after each test case." << std::endl;
}
/**
 * @tc.name   testPathCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0100
 * @tc.desc   Test for creating a path object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathCreateNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Call OH_Drawing_PathCreate to create a path object
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0200
 * @tc.desc   Test for copying a path with normal parameters and checking the copied path length.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathCopyNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object 1 by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path1 = OH_Drawing_PathCreate();
    EXPECT_NE(path1, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path1, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 5. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 6. Close the path by calling OH_Drawing_PathClose
    OH_Drawing_PathClose(path1);
    // 7. Copy path 1 to path 2 by calling OH_Drawing_PathCopy
    OH_Drawing_Path *path2 = OH_Drawing_PathCopy(path1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(path2, nullptr);
    // 8. Get the length of path 2 by calling OH_Drawing_PathGetLength
    bool isEqual = IsScalarAlmostEqual(OH_Drawing_PathGetLength(path1, false), OH_Drawing_PathGetLength(path2, false));
    EXPECT_TRUE(isEqual);
    // 9. Free memory
    OH_Drawing_PathDestroy(path1);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0201
 * @tc.desc   Test for copying a path with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathCopyNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Copy a path with nullptr as the parameter
    OH_Drawing_Path *path2 = OH_Drawing_PathCopy(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCopyInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0202
 * @tc.desc   Test for copying a path and checking if the copied path is affected after the original path is destroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathCopyInputDestroyed()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object 1 by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path1 = OH_Drawing_PathCreate();
    EXPECT_NE(path1, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path1, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 5. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 6. Close the path by calling OH_Drawing_PathClose
    OH_Drawing_PathClose(path1);
    // 7. Copy path 1 to path 2 by calling OH_Drawing_PathCopy
    OH_Drawing_Path *path2 = OH_Drawing_PathCopy(path1);
    // add assert
    EXPECT_NE(path2, nullptr);
    // 8. Destroy path 1 by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path1);
    // 9. Get the length of path 2 by calling OH_Drawing_PathGetLength, if the return value is not 0, it means
    // destroying path 1 does not affect path 2
    EXPECT_NE(OH_Drawing_PathGetLength(path2, false), 0);
    // 10. Free memory
    OH_Drawing_PathDestroy(path2);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0300
 * @tc.desc   Test for creating and destroying a path object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathDestroyNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Call OH_Drawing_PathCreate to create a path object
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0301
 * @tc.desc   Test for destroying a path object with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathDestroyNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path *path = nullptr;
    OH_Drawing_PathDestroy(nullptr);
    EXPECT_EQ(path, nullptr);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathMoveToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0400
 * @tc.desc   Test for moving a path to a normal position with valid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathMoveToNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathMoveToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0401
 * @tc.desc   Test for moving a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathMoveToNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathMoveTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathMoveTo(nullptr, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathMoveTo with 0.00 as the second parameter
    OH_Drawing_PathMoveTo(path, 0.00f, DRAWING_NUMBER_1);
    // 4. Call OH_Drawing_PathMoveTo with 0.00 as the third parameter
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_1, 0.00f);
    // 5. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathMoveToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0402
 * @tc.desc   Test for moving a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathMoveToAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo with an integer or character type as the
    // second parameter
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_2, 1.0f);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo with an integer or character type as the
    // third parameter
    OH_Drawing_PathMoveTo(path, 1.0f, DRAWING_NUMBER_2);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathMoveToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0403
 * @tc.desc   Test for moving a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathMoveToMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo with the second parameter as the maximum
    // value of FLT_MAX + 1, no crash
    OH_Drawing_PathMoveTo(path, FLT_MAX + DRAWING_NUMBER_1, 1.0f);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo with the third parameter as the maximum
    // value of FLT_MAX + 1, no crash
    OH_Drawing_PathMoveTo(path, 1.0f, FLT_MAX + DRAWING_NUMBER_1);
    // 4. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathLineToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0500
 * @tc.desc   Test for adding a line to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathLineToNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathLineToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0501
 * @tc.desc   Test for adding a line to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathLineToNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathLineTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathLineTo(nullptr, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathLineTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathLineTo(path, 0.00f, DRAWING_NUMBER_1);
    // 4. Call OH_Drawing_PathLineTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_1, 0.00f);
    // 5. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathLineToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0502
 * @tc.desc   Test for moving a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathLineToAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    // with an integer or character type as the second parameter
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_2, 1.0f);
    // 4. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    // with an integer or character type as the third parameter
    OH_Drawing_PathLineTo(path, 1.0f, DRAWING_NUMBER_2);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathLineToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0503
 * @tc.desc   Test for moving a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathLineToMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    // with the second parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathLineTo(path, FLT_MAX + DRAWING_NUMBER_1, 1.0f);
    // 4. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    // with the third parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathLineTo(path, 1.0f, FLT_MAX + DRAWING_NUMBER_1);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathArcToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0600
 * @tc.desc   Test for adding an arc to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathArcToNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 5. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 6. Close the path by calling OH_Drawing_PathClose
    OH_Drawing_PathClose(path);
    // 7. Add an arc to the path by calling OH_Drawing_PathArcTo
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, 0, 0, DRAWING_NUMBER_90);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathArcToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0601
 * @tc.desc   Test for adding an arc to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathArcToNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathArcTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathArcTo(nullptr, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, 0, 0, DRAWING_NUMBER_90);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathArcTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathArcTo(path, 0.00f, DRAWING_NUMBER_10, DRAWING_NUMBER_20, 0, 0, DRAWING_NUMBER_90);
    // 4. Call OH_Drawing_PathArcTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, 0.00f, DRAWING_NUMBER_20, 0, 0, DRAWING_NUMBER_90);
    // 5. Call OH_Drawing_PathArcTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, 0.00f, 0, 0, DRAWING_NUMBER_90);
    // 6. Call OH_Drawing_PathArcTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, 0.00f, 0, DRAWING_NUMBER_90);
    // 7. Call OH_Drawing_PathArcTo with 0.00 as the sixth parameter, no crash
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, 0, 0.00f, DRAWING_NUMBER_90);
    // 8. Call OH_Drawing_PathArcTo with 0.00 as the seventh parameter, no crash
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, 0, 0, 0.00f);
    // 9. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathArcToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0602
 * @tc.desc   Test for adding an arc to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathArcToAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 5. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 6. Close the path by calling OH_Drawing_PathClose
    OH_Drawing_PathClose(path);
    // 7. Add an arc to the path by calling OH_Drawing_PathArcTo with integer parameters
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, DRAWING_NUMBER_20,
        DRAWING_NUMBER_20, DRAWING_NUMBER_90);
    // 8. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathArcToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0603
 * @tc.desc   Test for adding an arc to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathArcToMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 5. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 6. Close the path by calling OH_Drawing_PathClose
    OH_Drawing_PathClose(path);
    // 7. Add an arc to the path by calling OH_Drawing_PathArcTo with the second parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_10, DRAWING_NUMBER_20, 0, 0,
        DRAWING_NUMBER_90);
    // 8. Add an arc to the path by calling OH_Drawing_PathArcTo with the third parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_20, 0, 0,
        DRAWING_NUMBER_90);
    // 9. Add an arc to the path by calling OH_Drawing_PathArcTo with the fourth parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, FLT_MAX + DRAWING_NUMBER_1, 0, 0,
        DRAWING_NUMBER_90);
    // 10. Add an arc to the path by calling OH_Drawing_PathArcTo with the fifth parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, FLT_MAX + DRAWING_NUMBER_1, 0,
        DRAWING_NUMBER_90);
    // 11. Add an arc to the path by calling OH_Drawing_PathArcTo with the sixth parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, 0, FLT_MAX + DRAWING_NUMBER_1,
        DRAWING_NUMBER_90);
    // 12. Add an arc to the path by calling OH_Drawing_PathArcTo with the seventh parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, 0, 0, FLT_MAX +
        DRAWING_NUMBER_1);
    // 13. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathQuadToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0700
 * @tc.desc   Test for adding a quadratic Bezier curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathQuadToNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Add a quadratic Bezier curve from the last point of the path to the target point by calling
    // OH_Drawing_PathQuadTo
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathQuadToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0701
 * @tc.desc   Test for adding a quadratic Bezier curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathQuadToNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathQuadTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathQuadTo(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathQuadTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathQuadTo(path, 0.00f, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Call OH_Drawing_PathQuadTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_100, 0.00f, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 5. Call OH_Drawing_PathQuadTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.00f, DRAWING_NUMBER_200);
    // 6. Call OH_Drawing_PathQuadTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, 0.00f);
    // 7. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathQuadToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0702
 * @tc.desc   Test for adding a quadratic Bezier curve to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathQuadToAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a quadratic Bezier curve to the path with the second parameter as an integer
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_100, 100.0f, 200.0f, 200.0f);
    // 4. Add a quadratic Bezier curve to the path with the third parameter as an integer
    OH_Drawing_PathQuadTo(path, 100.0f, DRAWING_NUMBER_100, 200.0f, 200.0f);
    // 5. Add a quadratic Bezier curve to the path with the fourth parameter as an integer
    OH_Drawing_PathQuadTo(path, 100.0f, 100.0f, DRAWING_NUMBER_200, 200.0f);
    // 6. Add a quadratic Bezier curve to the path with the fifth parameter as an integer
    OH_Drawing_PathQuadTo(path, 100.0f, 100.0f, 200.0f, DRAWING_NUMBER_200);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathQuadToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0703
 * @tc.desc   Test for adding a quadratic Bezier curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathQuadToMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Call OH_Drawing_PathQuadTo with the second parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathQuadTo(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Call OH_Drawing_PathQuadTo with the third parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 5. Call OH_Drawing_PathQuadTo with the fourth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_200);
    // 6. Call OH_Drawing_PathQuadTo with the fifth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, FLT_MAX + DRAWING_NUMBER_1);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathConicToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0800
 * @tc.desc   Test for adding a conic curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathConicToNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a quadratic Bezier curve to the path by calling OH_Drawing_PathConicTo
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.5f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathConicToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0801
 * @tc.desc   Test for adding a conic curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathConicToNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathConicTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathConicTo(nullptr, DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.5f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathConicTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathConicTo(path, 0.00f, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.5f);
    // 4. Call OH_Drawing_PathConicTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_50, 0.00f, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.5f);
    // 5. Call OH_Drawing_PathConicTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50, 0.00f, DRAWING_NUMBER_100, 0.5f);
    // 6. Call OH_Drawing_PathConicTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_100, 0.00f, 0.5f);
    // 7. Call OH_Drawing_PathConicTo with 0.00 as the sixth parameter, no crash
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.00f);
    // 8. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathConicToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0802
 * @tc.desc   Test for adding a conic curve to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathConicToAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Add a conic curve to the path with the second parameter as an integer or character type
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_50, 50.0f, 100.0f, 100.0f, 0.5f);
    // 5. Add a conic curve to the path with the third parameter as an integer or character type
    OH_Drawing_PathConicTo(path, 50.0f, DRAWING_NUMBER_50, 100.0f, 100.0f, 0.5f);
    // 6. Add a conic curve to the path with the fourth parameter as an integer or character type
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, DRAWING_NUMBER_100, 100.0f, 0.5f);
    // 7. Add a conic curve to the path with the fifth parameter as an integer or character type
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, DRAWING_NUMBER_100, 0.5f);
    // 8. Add a conic curve to the path with the sixth parameter as an integer or character type
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100.0f, DRAWING_NUMBER_1);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathConicToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0803
 * @tc.desc   Test for adding a conic curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathConicToMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Call OH_Drawing_PathConicTo with the second parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathConicTo(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100,
        0.5f);
    // 5. Call OH_Drawing_PathConicTo with the third parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_50, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100, DRAWING_NUMBER_100,
        0.5f);
    // 6. Call OH_Drawing_PathConicTo with the fourth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100,
        0.5f);
    // 7. Call OH_Drawing_PathConicTo with the fifth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1,
        0.5f);
    // 8. Call OH_Drawing_PathConicTo with the sixth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100, FLT_MAX +
        DRAWING_NUMBER_1);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCubicToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0900
 * @tc.desc   Test for adding a cubic Bezier curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathCubicToNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a cubic Bezier curve from the last point of the path to the target point by calling OH_Drawing_PathCubicTo
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCubicToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0901
 * @tc.desc   Test for adding a cubic Bezier curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathCubicToNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathCubicTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathCubicTo(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathCubicTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathCubicTo(path, 0.00f, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    // 4. Call OH_Drawing_PathCubicTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, 0.00f, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    // 5. Call OH_Drawing_PathCubicTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.00f, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    // 6. Call OH_Drawing_PathCubicTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, 0.00f, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    // 7. Call OH_Drawing_PathCubicTo with 0.00 as the sixth parameter, no crash
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200, 0.00f,
        DRAWING_NUMBER_300);
    // 8. Call OH_Drawing_PathCubicTo with 0.00 as the seventh parameter, no crash
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300, 0.00f);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCubicToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0902
 * @tc.desc   Test for adding a cubic Bezier curve to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathCubicToAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a cubic Bezier curve to the path with the second parameter as an integer
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, 100.0f, 200.0f, 200.0f, 300.0f, 300.0f);
    // 4. Add a cubic Bezier curve to the path with the third parameter as an integer
    OH_Drawing_PathCubicTo(path, 100.0f, DRAWING_NUMBER_100, 200.0f, 200.0f, 300.0f, 300.0f);
    // 5. Add a cubic Bezier curve to the path with the fourth parameter as an integer
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, DRAWING_NUMBER_200, 200.0f, 300.0f, 300.0f);
    // 6. Add a cubic Bezier curve to the path with the fifth parameter as an integer
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, DRAWING_NUMBER_200, 300.0f, 300.0f);
    // 7. Add a cubic Bezier curve to the path with the sixth parameter as an integer
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, DRAWING_NUMBER_300, 300.0f);
    // 8. Add a cubic Bezier curve to the path with the seventh parameter as an integer
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300.0f, DRAWING_NUMBER_300);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCubicToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0903
 * @tc.desc   Test for adding a cubic Bezier curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathCubicToMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Call OH_Drawing_PathCubicTo with the second parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 4. Call OH_Drawing_PathCubicTo with the third parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 5. Call OH_Drawing_PathCubicTo with the fourth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 6. Call OH_Drawing_PathCubicTo with the fifth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, FLT_MAX + DRAWING_NUMBER_1,
        DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 7. Call OH_Drawing_PathCubicTo with the sixth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_300);
    // 8. Call OH_Drawing_PathCubicTo with the seventh parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300, FLT_MAX + DRAWING_NUMBER_1);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRMoveToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1000
 * @tc.desc   Test for setting a relative move to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathRMoveToNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRMoveToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1001
 * @tc.desc   Test for setting a relative move to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRMoveToNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathRMoveTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathRMoveTo(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathRMoveTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathRMoveTo(path, 0.00f, DRAWING_NUMBER_100);
    // 4. Call OH_Drawing_PathRMoveTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, 0.00f);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRMoveToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1002
 * @tc.desc   Test for setting a relative move to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRMoveToAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, 100.0f);
    // 5. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100.0f, DRAWING_NUMBER_100);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRMoveToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1003
 * @tc.desc   Test for setting a relative move to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRMoveToMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100);
    // 5. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRLineToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1100
 * @tc.desc   Test for adding a relative line to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathRLineToNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Add a relative line to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRLineTo
    OH_Drawing_PathRLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRLineToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1101
 * @tc.desc   Test for adding a relative line to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRLineToNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathRLineTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathRLineTo(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathRLineTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathRLineTo(path, 0.00f, DRAWING_NUMBER_100);
    // 4. Call OH_Drawing_PathRLineTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathRLineTo(path, DRAWING_NUMBER_100, 0.00f);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRLineToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1102
 * @tc.desc   Test for adding a relative line to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRLineToAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add a relative line to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRLineTo
    OH_Drawing_PathRLineTo(path, 100.0f, DRAWING_NUMBER_100);
    // 6. Add a relative line to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRLineTo
    OH_Drawing_PathRLineTo(path, DRAWING_NUMBER_100, 100.0f);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRLineToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1103
 * @tc.desc   Test for adding a relative line to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRLineToMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add a relative line to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRLineTo
    OH_Drawing_PathRLineTo(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100);
    // 6. Add a relative line to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRLineTo
    OH_Drawing_PathRLineTo(path, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRQuadToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1200
 * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathRQuadToNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Add a relative quadratic Bezier curve to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRQuadTo
    OH_Drawing_PathRQuadTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRQuadToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1201
 * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRQuadToNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathRQuadTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathRQuadTo(nullptr, 0, 0, 0, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathRQuadTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathRQuadTo(path, 0.00f, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300);
    // 4. Call OH_Drawing_PathRQuadTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathRQuadTo(path, DRAWING_NUMBER_100, 0.00f, DRAWING_NUMBER_100, DRAWING_NUMBER_300);
    // 5. Call OH_Drawing_PathRQuadTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathRQuadTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.00f, DRAWING_NUMBER_300);
    // 6. Call OH_Drawing_PathRQuadTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathRQuadTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.00f);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRQuadToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1202
 * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRQuadToAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathRQuadTo with an integer or character type as the second parameter
    OH_Drawing_PathRQuadTo(path, DRAWING_NUMBER_100, 100.0f, 100.0f, 300.0f);
    // 6. Call OH_Drawing_PathRQuadTo with an integer or character type as the third parameter
    OH_Drawing_PathRQuadTo(path, 100.0f, DRAWING_NUMBER_100, 100.0f, 300.0f);
    // 7. Call OH_Drawing_PathRQuadTo with an integer or character type as the fourth parameter
    OH_Drawing_PathRQuadTo(path, 100.0f, 100.0f, DRAWING_NUMBER_100, 300.0f);
    // 8. Call OH_Drawing_PathRQuadTo with an integer or character type as the fifth parameter
    OH_Drawing_PathRQuadTo(path, 100.0f, 100.0f, 100.0f, DRAWING_NUMBER_300);
    // 9. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRQuadToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1203
 * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRQuadToMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathRQuadTo with a second parameter of FLT_MAX + 1
    OH_Drawing_PathRQuadTo(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100, DRAWING_NUMBER_100,
        DRAWING_NUMBER_300);
    // 6. Call OH_Drawing_PathRQuadTo with a third parameter of FLT_MAX + 1
    OH_Drawing_PathRQuadTo(path, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100,
        DRAWING_NUMBER_300);
    // 7. Call OH_Drawing_PathRQuadTo with a fourth parameter of FLT_MAX + 1
    OH_Drawing_PathRQuadTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1,
        DRAWING_NUMBER_300);
    // 8. Call OH_Drawing_PathRQuadTo with a fifth parameter of FLT_MAX + 1
    OH_Drawing_PathRQuadTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, FLT_MAX +
        DRAWING_NUMBER_1);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRConicToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1300
 * @tc.desc   Test for adding a relative conic curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathRConicToNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Add a relative conic curve to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRConicTo
    OH_Drawing_PathRConicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_5);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRConicToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1301
 * @tc.desc   Test for adding a relative conic curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRConicToNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathRConicTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathRConicTo(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathRConicTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathRConicTo(path, 0.0f, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300, DRAWING_NUMBER_5);
    // 4. Call OH_Drawing_PathRConicTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathRConicTo(path, DRAWING_NUMBER_100, 0.0f, DRAWING_NUMBER_100, DRAWING_NUMBER_300, DRAWING_NUMBER_5);
    // 5. Call OH_Drawing_PathRConicTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathRConicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.0f, DRAWING_NUMBER_300, DRAWING_NUMBER_5);
    // 6. Call OH_Drawing_PathRConicTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathRConicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.0f, DRAWING_NUMBER_5);
    // 7. Call OH_Drawing_PathRConicTo with 0.00 as the sixth parameter, no crash
    OH_Drawing_PathRConicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300, 0.0f);
    // 8. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRConicToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1302
 * @tc.desc   Test for adding a relative conic curve to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRConicToAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathRConicTo with an integer as the second parameter
    OH_Drawing_PathRConicTo(path, DRAWING_NUMBER_100, 100.0f, 100.0f, 300.0f, 5.0f);
    // 6. Call OH_Drawing_PathRConicTo with an integer as the third parameter
    OH_Drawing_PathRConicTo(path, 100.0f, DRAWING_NUMBER_100, 100.0f, 300.0f, 5.0f);
    // 7. Call OH_Drawing_PathRConicTo with an integer as the fourth parameter
    OH_Drawing_PathRConicTo(path, 100.0f, 100.0f, DRAWING_NUMBER_100, 300.0f, 5.0f);
    // 8. Call OH_Drawing_PathRConicTo with an integer as the fifth parameter
    OH_Drawing_PathRConicTo(path, 100.0f, 100.0f, 100.0f, DRAWING_NUMBER_300, 5.0f);
    // 9. Call OH_Drawing_PathRConicTo with an integer as the sixth parameter
    OH_Drawing_PathRConicTo(path, 100.0f, 100.0f, 100.0f, 300.0f, DRAWING_NUMBER_5);
    // 10. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRConicToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1303
 * @tc.desc   Test for adding a relative conic curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRConicToMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathRConicTo with a second parameter of FLT_MAX + 1, no crash
    OH_Drawing_PathRConicTo(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100, DRAWING_NUMBER_100,
        DRAWING_NUMBER_300, DRAWING_NUMBER_5);
    // 6. Call OH_Drawing_PathRConicTo with a third parameter of FLT_MAX + 1, no crash
    OH_Drawing_PathRConicTo(path, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100,
        DRAWING_NUMBER_300, DRAWING_NUMBER_5);
    // 7. Call OH_Drawing_PathRConicTo with a fourth parameter of FLT_MAX + 1, no crash
    OH_Drawing_PathRConicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1,
        DRAWING_NUMBER_300, DRAWING_NUMBER_5);
    // 8. Call OH_Drawing_PathRConicTo with a fifth parameter of FLT_MAX + 1, no crash
    OH_Drawing_PathRConicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, FLT_MAX +
        DRAWING_NUMBER_1, DRAWING_NUMBER_5);
    // 9. Call OH_Drawing_PathRConicTo with a sixth parameter of FLT_MAX + 1, no crash
    OH_Drawing_PathRConicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        FLT_MAX + DRAWING_NUMBER_1);
    // 10. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRCubicToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1400
 * @tc.desc   Test for adding a relative cubic Bezier curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathRCubicToNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Add a relative cubic Bezier curve to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRCubicTo
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRCubicToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1401
 * @tc.desc   Test for adding a relative cubic Bezier curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRCubicToNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathRCubicTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathRCubicTo(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathRCubicTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathRCubicTo(path, 0.00f, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    // 4. Call OH_Drawing_PathRCubicTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, 0.00f, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    // 5. Call OH_Drawing_PathRCubicTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.00f, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    // 6. Call OH_Drawing_PathRCubicTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, 0.00f, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    // 7. Call OH_Drawing_PathRCubicTo with 0.00 as the sixth parameter, no crash
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200, 0.00f,
        DRAWING_NUMBER_300);
    // 8. Call OH_Drawing_PathRCubicTo with 0.00 as the seventh parameter, no crash
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300, 0.00f);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRCubicToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1402
 * @tc.desc   Test for adding a relative cubic Bezier curve to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRCubicToAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathRCubicTo with an integer as the second parameter
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, 100.0f, 200.0f, 200.0f, 300.0f, 300.0f);
    // 6. Call OH_Drawing_PathRCubicTo with an integer as the third parameter
    OH_Drawing_PathRCubicTo(path, 100.0f, DRAWING_NUMBER_100, 200.0f, 200.0f, 300.0f, 300.0f);
    // 7. Call OH_Drawing_PathRCubicTo with an integer as the fourth parameter
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, DRAWING_NUMBER_200, 200.0f, 300.0f, 300.0f);
    // 8. Call OH_Drawing_PathRCubicTo with an integer as the fifth parameter
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, 200.0f, DRAWING_NUMBER_200, 300.0f, 300.0f);
    // 9. Call OH_Drawing_PathRCubicTo with an integer as the sixth parameter
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, DRAWING_NUMBER_300, 300.0f);
    // 10. Call OH_Drawing_PathRCubicTo with an integer as the seventh parameter
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300.0f, DRAWING_NUMBER_300);
    // 11. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRCubicToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1403
 * @tc.desc   Test for adding a relative cubic Bezier curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRCubicToMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathRCubicTo with the second parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200, DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 6. Call OH_Drawing_PathRCubicTo with the third parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200, DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 7. Call OH_Drawing_PathRCubicTo with the fourth parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1,
        DRAWING_NUMBER_200, DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 8. Call OH_Drawing_PathRCubicTo with the fifth parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, FLT_MAX +
        DRAWING_NUMBER_1, DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    // 9. Call OH_Drawing_PathRCubicTo with the sixth parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_300);
    // 10. Call OH_Drawing_PathRCubicTo with the seventh parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300, FLT_MAX + DRAWING_NUMBER_1);
    // 11. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1500
 * @tc.desc   Test for adding a rectangle to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddRectNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a rectangle outline to the path with the specified direction by calling OH_Drawing_PathAddRect. Iterate
    // through the enum to call this interface.
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1501
 * @tc.desc   Test for adding a rectangle to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathAddRect with the first parameter as nullptr, expect OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddRect(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathAddRect with 0.00 as the second parameter, no crash
    OH_Drawing_PathAddRect(path, 0.00f, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 4. Call OH_Drawing_PathAddRect with 0.00 as the third parameter, no crash
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_100, 0.00f, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. Call OH_Drawing_PathAddRect with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0.00f, DRAWING_NUMBER_200,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Call OH_Drawing_PathAddRect with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, 0.00f,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 7. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1502
 * @tc.desc   Test for adding a rectangle to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Call OH_Drawing_PathAddRect with an integer as the second parameter
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_100, 100.0f, 200.0f, 200.0f,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. Call OH_Drawing_PathAddRect with an integer as the third parameter
    OH_Drawing_PathAddRect(path, 100.0f, DRAWING_NUMBER_100, 200.0f, 200.0f,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Call OH_Drawing_PathAddRect with an integer as the fourth parameter
    OH_Drawing_PathAddRect(path, 100.0f, 100.0f, DRAWING_NUMBER_200, 200.0f,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 7. Call OH_Drawing_PathAddRect with an integer as the fifth parameter
    OH_Drawing_PathAddRect(path, 100.0f, 100.0f, 200.0f, DRAWING_NUMBER_200,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1503
 * @tc.desc   Test for adding a rectangle to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Call OH_Drawing_PathAddRect with the second parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathAddRect(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. Call OH_Drawing_PathAddRect with the third parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Call OH_Drawing_PathAddRect with the fourth parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_200,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 7. Call OH_Drawing_PathAddRect with the fifth parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, FLT_MAX + DRAWING_NUMBER_1,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectWithInitialCornerNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1600
 * @tc.desc   Test for adding a rectangle to a path with initial corner and normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddRectWithInitialCornerNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add a rectangle outline to the path with the specified direction by calling
    // OH_Drawing_PathAddRectWithInitialCorner. Iterate through the enum to call this interface.
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectWithInitialCornerNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1601
 * @tc.desc   Test for adding a rectangle to a path with initial corner and NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectWithInitialCornerNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Call OH_Drawing_PathAddRectWithInitialCorner with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddRectWithInitialCorner(nullptr, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddRectWithInitialCorner with the second parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddRectWithInitialCorner(path, nullptr, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddRectWithInitialCorner with the fourth parameter as 0
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 0);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectWithInitialCornerAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1602
 * @tc.desc   Test for adding a rectangle to a path with initial corner and abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectWithInitialCornerAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 5. Call OH_Drawing_PathAddRectWithInitialCorner with the fourth parameter as a float or a character
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 5.0f);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectWithInitialCornerMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1603
 * @tc.desc   Test for adding a rectangle to a path with initial corner and maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectWithInitialCornerMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathAddRectWithInitialCorner with the fourth parameter as the maximum value INT32_MAX, no
    // crash
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, INT32_MAX);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRoundRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1700
 * @tc.desc   Test for adding a round rectangle to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddRoundRectNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rounded rectangle object by calling OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add the rounded rectangle outline to the path with the specified direction by calling
    // OH_Drawing_PathAddRoundRect. Iterate through the enum to call this interface.
    OH_Drawing_PathDirection directions[] = {
        PATH_DIRECTION_CW,
        PATH_DIRECTION_CCW,
    };
    for (int i = 0; i < sizeof(directions) / sizeof(directions[0]); i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_PathAddRoundRect(path, roundRect, directions[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRoundRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1701
 * @tc.desc   Test for adding a round rectangle to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRoundRectNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rounded rectangle object by calling OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 3. Call OH_Drawing_PathAddRoundRect with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddRoundRect(nullptr, roundRect, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddRoundRect with the second parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddRoundRect(path, nullptr, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddOvalWithInitialPointNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1800
 * @tc.desc   Test for adding an oval to a path with initial point and normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddOvalWithInitialPointNormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add an oval to the path, where the rectangle object is the bounding rectangle of the oval. Iterate through the
    // enum to call this interface.
    OH_Drawing_PathDirection directions[] = {
        PATH_DIRECTION_CW,
        PATH_DIRECTION_CCW,
    };
    for (int i = 0; i < sizeof(directions) / sizeof(directions[0]); i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_PathAddOvalWithInitialPoint(path, rect, DRAWING_NUMBER_10, directions[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddOvalWithInitialPointNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1801
 * @tc.desc   Test for adding an oval to a path with initial point and NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddOvalWithInitialPointNull()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Call OH_Drawing_PathAddOvalWithInitialPoint with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddOvalWithInitialPoint(nullptr, rect, DRAWING_NUMBER_10,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddOvalWithInitialPoint with the second parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddOvalWithInitialPoint(path, nullptr, DRAWING_NUMBER_10,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddOvalWithInitialPoint with the third parameter as 0, no crash
    OH_Drawing_PathAddOvalWithInitialPoint(path, rect, 0, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddOvalWithInitialPointAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1802
 * @tc.desc   Test for adding an oval to a path with initial point and abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddOvalWithInitialPointAbnormal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 5. Call OH_Drawing_PathAddOvalWithInitialPoint with the third parameter as a float or a character
    OH_Drawing_PathAddOvalWithInitialPoint(path, rect, 5.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddOvalWithInitialPointMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1803
 * @tc.desc   Test for adding an oval to a path with initial point and maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddOvalWithInitialPointMaximal()
{
    DrawingNativePathTestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathAddOvalWithInitialPoint with the third parameter as the maximum value UINT32_MAX + 1, no
    // crash
    OH_Drawing_PathAddOvalWithInitialPoint(path, rect, UINT32_MAX + DRAWING_NUMBER_1,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
