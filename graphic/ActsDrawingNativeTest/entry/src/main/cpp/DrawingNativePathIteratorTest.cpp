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

#include "include/DrawingNativePathIteratorTest.h"
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_7 7
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_50 50
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_150 150
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_250 250
#define DRAWING_NUMBER_350 350
#define DRAWING_NUMBER_450 450
#define DRAWING_NUMBER_550 550
#define DRAWING_NUMBER_650 650

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativePathIteratorTestSetUp()
{
    std::cout << "DrawingNativePathIteratorTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathIteratorTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativePathIteratorTestTearDown()
{
    std::cout << "DrawingNativePathIteratorTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathIteratorTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testPathIteratorCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATORITERATOR_0100
 * @tc.desc   test for testPathIteratorCreateNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIteratorCreateNormal() {
    DrawingNativePathIteratorTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_150, DRAWING_NUMBER_200, DRAWING_NUMBER_250, DRAWING_NUMBER_350, 0.5);
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_350, DRAWING_NUMBER_450, DRAWING_NUMBER_450, DRAWING_NUMBER_550,
        DRAWING_NUMBER_550, DRAWING_NUMBER_650);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathIterator *pathIterator = nullptr;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIteratorCreate(path, &pathIterator);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_NE(pathIterator, nullptr);
    OH_Drawing_PathIteratorDestroy(pathIterator);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathIteratorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIteratorCreateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0101
 * @tc.desc   test for testPathIteratorCreateNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIteratorCreateNull() {
    DrawingNativePathIteratorTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_150, DRAWING_NUMBER_200, DRAWING_NUMBER_250, DRAWING_NUMBER_350, 0.5);
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_350, DRAWING_NUMBER_450, DRAWING_NUMBER_450, DRAWING_NUMBER_550,
        DRAWING_NUMBER_550, DRAWING_NUMBER_650);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathIterator *pathIterator = nullptr;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIteratorCreate(nullptr, &pathIterator);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(pathIterator, nullptr);
    errorCode = OH_Drawing_PathIteratorCreate(path, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(pathIterator, nullptr);
    OH_Drawing_PathIteratorDestroy(pathIterator);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathIteratorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIteratorCreateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0102
 * @tc.desc   test for testPathIteratorCreateMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIteratorCreateMultipleCalls() {
    DrawingNativePathIteratorTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_150, DRAWING_NUMBER_200, DRAWING_NUMBER_250, DRAWING_NUMBER_350, 0.5);
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_350, DRAWING_NUMBER_450, DRAWING_NUMBER_450, DRAWING_NUMBER_550,
        DRAWING_NUMBER_550, DRAWING_NUMBER_650);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathIterator *pathIterator = nullptr;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIteratorCreate(path, &pathIterator);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_NE(pathIterator, nullptr);
        errorCode = OH_Drawing_PathIteratorDestroy(pathIterator);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_PathDestroy(path);
    DrawingNativePathIteratorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIteratorDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0200
 * @tc.desc   test for testPathIteratorDestroyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIteratorDestroyNormal() {
    DrawingNativePathIteratorTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_PathQuadTo(path, 10, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathConicTo(path, 150, DRAWING_NUMBER_200, 250, 350, 0.5);
    OH_Drawing_PathCubicTo(path, 350, 450, 450, 550, 550, 650);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathIterator *pathIterator = nullptr;
    OH_Drawing_PathIteratorCreate(path, &pathIterator);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIteratorDestroy(pathIterator);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathIteratorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIteratorDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0201
 * @tc.desc   test for testPathIteratorDestroyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIteratorDestroyNull() {
    DrawingNativePathIteratorTestSetUp();
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIteratorDestroy(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    DrawingNativePathIteratorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIteratorHasNextNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0300
 * @tc.desc   test for testPathIteratorHasNextNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIteratorHasNextNormal() {
    DrawingNativePathIteratorTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_PathQuadTo(path, 10, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathConicTo(path, 150, DRAWING_NUMBER_200, 250, 350, 0.5);
    OH_Drawing_PathCubicTo(path, 350, 450, 450, 550, 550, 650);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathIterator *pathIterator = nullptr;
    OH_Drawing_PathIteratorCreate(path, &pathIterator);
    OH_Drawing_PathIteratorVerb verb = OH_Drawing_PathIteratorVerb::MOVE;
    bool hasNext = false;
    const int verbSize = DRAWING_NUMBER_7;
    const int offsetSize = DRAWING_NUMBER_4;
    const int pointSize = verbSize * offsetSize;
    OH_Drawing_Point2D point2d[pointSize] = {{0, 0}};
    for (int i = 0; i < verbSize; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIteratorHasNext(pathIterator, &hasNext);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        OH_Drawing_PathIteratorNext(pathIterator, point2d, pointSize, i * offsetSize, &verb);
        EXPECT_EQ(hasNext, verb == OH_Drawing_PathIteratorVerb::DONE ? false : true);
    }
    OH_Drawing_PathIteratorDestroy(pathIterator);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathIteratorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIteratorHasNextNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0301
 * @tc.desc   test for testPathIteratorHasNextNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIteratorHasNextNull() {
    DrawingNativePathIteratorTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_PathQuadTo(path, 10, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathConicTo(path, 150, DRAWING_NUMBER_200, 250, 350, 0.5);
    OH_Drawing_PathCubicTo(path, 350, 450, 450, 550, 550, 650);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathIterator *pathIterator = nullptr;
    OH_Drawing_PathIteratorCreate(path, &pathIterator);
    bool hasNext = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIteratorHasNext(nullptr, &hasNext);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(hasNext, false);
    errorCode = OH_Drawing_PathIteratorHasNext(pathIterator, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(hasNext, false);
    OH_Drawing_PathIteratorDestroy(pathIterator);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathIteratorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIteratorNextNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0400
 * @tc.desc   test for testPathIteratorNextNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIteratorNextNormal() {
    DrawingNativePathIteratorTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_PathQuadTo(path, 10, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathConicTo(path, 150, DRAWING_NUMBER_200, 250, 350, 0.5);
    OH_Drawing_PathCubicTo(path, 350, 450, 450, 550, 550, 650);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathIterator *pathIterator = nullptr;
    OH_Drawing_PathIteratorCreate(path, &pathIterator);
    OH_Drawing_PathIteratorVerb verb = OH_Drawing_PathIteratorVerb::MOVE;
    const int verbSize = DRAWING_NUMBER_7;
    const int offset = DRAWING_NUMBER_4;
    const int count = verbSize * offset;
    OH_Drawing_Point2D point2d[count] = {{0, 0}};
    for (int i = 0; i < verbSize; i++) {
        OH_Drawing_ErrorCode errorCode =
            OH_Drawing_PathIteratorNext(pathIterator, point2d, count, i * offset, &verb);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(verb, static_cast<OH_Drawing_PathIteratorVerb>(i));
    }
    OH_Drawing_PathIteratorDestroy(pathIterator);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathIteratorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIteratorNextNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0401
 * @tc.desc   test for testPathIteratorNextNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIteratorNextNull() {
    DrawingNativePathIteratorTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_PathQuadTo(path, 10, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathConicTo(path, 150, DRAWING_NUMBER_200, 250, 350, 0.5);
    OH_Drawing_PathCubicTo(path, 350, 450, 450, 550, 550, 650);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathIterator *pathIterator = nullptr;
    OH_Drawing_PathIteratorCreate(path, &pathIterator);
    OH_Drawing_PathIteratorVerb verb = OH_Drawing_PathIteratorVerb::MOVE;
    const int verbSize = DRAWING_NUMBER_7;
    const int offset = DRAWING_NUMBER_4;
    const int count = verbSize * offset;
    OH_Drawing_Point2D point2d[count] = {{0, 0}};
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIteratorNext(nullptr, point2d, count, offset, &verb);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(verb, OH_Drawing_PathIteratorVerb::MOVE);
    errorCode = OH_Drawing_PathIteratorNext(pathIterator, nullptr, count, offset, &verb);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(verb, OH_Drawing_PathIteratorVerb::MOVE);
    errorCode = OH_Drawing_PathIteratorNext(pathIterator, point2d, 0, offset, &verb);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(verb, OH_Drawing_PathIteratorVerb::MOVE);
    errorCode = OH_Drawing_PathIteratorNext(pathIterator, point2d, count, 0, &verb);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(verb, OH_Drawing_PathIteratorVerb::MOVE);
    errorCode = OH_Drawing_PathIteratorNext(pathIterator, point2d, count, offset, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(verb, OH_Drawing_PathIteratorVerb::MOVE);
    OH_Drawing_PathIteratorDestroy(pathIterator);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathIteratorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIteratorPeekNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0500
 * @tc.desc   test for testPathIteratorPeekNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIteratorPeekNormal() {
    DrawingNativePathIteratorTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_150, DRAWING_NUMBER_200, DRAWING_NUMBER_250, DRAWING_NUMBER_350, 0.5);
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_350, DRAWING_NUMBER_450, DRAWING_NUMBER_450, DRAWING_NUMBER_550,
        DRAWING_NUMBER_550, DRAWING_NUMBER_650);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathIterator *pathIterator = nullptr;
    OH_Drawing_PathIteratorCreate(path, &pathIterator);
    OH_Drawing_PathIteratorVerb verb = OH_Drawing_PathIteratorVerb::MOVE;
    const int verbSize = DRAWING_NUMBER_7;
    const int offsetSize = DRAWING_NUMBER_4;
    const int pointSize = verbSize * offsetSize;
    OH_Drawing_Point2D point2d[pointSize] = {{0, 0}};
    for (int i = 0; i < verbSize; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIteratorPeek(pathIterator, &verb);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(verb, static_cast<OH_Drawing_PathIteratorVerb>(i));
        OH_Drawing_PathIteratorNext(pathIterator, point2d, pointSize, i * offsetSize, &verb);
    }
    OH_Drawing_PathIteratorDestroy(pathIterator);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathIteratorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIteratorPeekNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0501
 * @tc.desc   test for testPathIteratorPeekNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIteratorPeekNull() {
    DrawingNativePathIteratorTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_PathQuadTo(path, DRAWING_NUMBER_10, DRAWING_NUMBER_50, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathConicTo(path, DRAWING_NUMBER_150, DRAWING_NUMBER_200, DRAWING_NUMBER_250, DRAWING_NUMBER_350, 0.5);
    OH_Drawing_PathCubicTo(path, DRAWING_NUMBER_350, DRAWING_NUMBER_450, DRAWING_NUMBER_450, DRAWING_NUMBER_550,
        DRAWING_NUMBER_550, DRAWING_NUMBER_650);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathIterator *pathIterator = nullptr;
    OH_Drawing_PathIteratorCreate(path, &pathIterator);
    OH_Drawing_PathIteratorVerb verb = OH_Drawing_PathIteratorVerb::MOVE;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIteratorPeek(nullptr, &verb);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(verb, OH_Drawing_PathIteratorVerb::MOVE);
    errorCode = OH_Drawing_PathIteratorPeek(pathIterator, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(verb, OH_Drawing_PathIteratorVerb::MOVE);
    OH_Drawing_PathIteratorDestroy(pathIterator);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathIteratorTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS