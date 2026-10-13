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

#include "include/DrawingCanvasDrawRecordCmdTest.h"
#include <iomanip>
#include <random>
#include <sstream>
#include <thread>
#include "include/OhosCommonTest.h"
#include "log_common.h"

#define NUMBER_10 10
#define NUMBER_255 255
#define NUMBER_256 256

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int CIRCLE_X_OFFSET = 10;
constexpr int CIRCLE_RADIUS = 200;
constexpr int32_t TEST_CANVAS_WIDTH = 100;
constexpr int32_t TEST_CANVAS_HEIGHT = 100;
constexpr int32_t THREAD_TEST_WIDTH = 2;
constexpr int32_t THREAD_TEST_HEIGHT = 5;
constexpr float PEN_WIDTH = 1.0f;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingCanvasDrawRecordCmdTestSetUp()
{
    std::cout << "DrawingCanvasDrawRecordCmdTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingCanvasDrawRecordCmdTest errorCodeReset before each test case." << std::endl;
}

void DrawingCanvasDrawRecordCmdTestTearDown()
{
    std::cout << "DrawingCanvasDrawRecordCmdTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingCanvasDrawRecordCmdTest errorCodeReset after each test case." << std::endl;
}

void drawCircle1(OH_Drawing_Canvas* canvas, int position)
{
    int x = CIRCLE_X_OFFSET;
    int radius = CIRCLE_RADIUS;
    OH_Drawing_Point* point = OH_Drawing_PointCreate(x * position + radius, x + radius);
    OH_Drawing_CanvasDrawCircle(canvas, point, radius);
    OH_Drawing_PointDestroy(point);
}

OH_Drawing_RecordCmd* threadFunctionTest6()
{
    int32_t width = THREAD_TEST_WIDTH;
    int32_t height = THREAD_TEST_HEIGHT;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    // 创建一个画笔Pen对象，Pen对象用于形状的边框线绘制
    OH_Drawing_Pen* cPen = OH_Drawing_PenCreate();
    OH_Drawing_PenSetAntiAlias(cPen, true);
    OH_Drawing_PenSetColor(cPen, OH_Drawing_ColorSetArgb(NUMBER_255, NUMBER_255, 0, 0));
    OH_Drawing_PenSetWidth(cPen, PEN_WIDTH);
    OH_Drawing_PenSetJoin(cPen, LINE_ROUND_JOIN);
    // 将Pen画笔设置到canvas中
    OH_Drawing_CanvasAttachPen(canvas, cPen);
    // 创建一个画刷Brush对象，Brush对象用于形状的填充
    OH_Drawing_Brush* cBrush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(cBrush,
                             OH_Drawing_ColorSetArgb(NUMBER_255, 0, NUMBER_255, 0));
    // 将Brush画刷设置到canvas中
    OH_Drawing_CanvasAttachBrush(canvas, cBrush);
    drawCircle1(canvas, width);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_BrushDestroy(cBrush);
    OH_Drawing_PenDestroy(cPen);
    cBrush = nullptr;
    cPen = nullptr;
    return recordCmd;
}

int TestCanvasDrawRecordCmdNormal()
{
    DrawingCanvasDrawRecordCmdTestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_RecordCmd* picture = nullptr;
    std::thread thread([&picture]() { picture = threadFunctionTest6(); });
    thread.join();
    if (picture != nullptr) {
        OH_Drawing_ErrorCode result = OH_Drawing_CanvasDrawRecordCmd(canvas, picture);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRecordCmdABNormal()
{
    DrawingCanvasDrawRecordCmdTestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_RecordCmd* picture = nullptr;
    std::thread thread([&picture]() { picture = threadFunctionTest6(); });
    thread.join();
    OH_Drawing_ErrorCode result1 = OH_Drawing_CanvasDrawRecordCmd(canvas, nullptr);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    std::thread thread1([&picture]() { picture = threadFunctionTest6(); });
    thread1.join();
    if (picture != nullptr) {
        OH_Drawing_ErrorCode result = OH_Drawing_CanvasDrawRecordCmd(nullptr, picture);
        EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }

    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}

// Helper function to create a RecordCmd, to reduce code duplication
OH_Drawing_RecordCmd* CreateRecordCmd(int32_t width, int32_t height)
{
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);

    drawCircle1(canvas, width);

    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    canvas = nullptr; // Canvas is managed by RecordCmdUtils
    return recordCmd;
}

int TestCanvasDrawRecordCmdNestingNormal()
{
    DrawingCanvasDrawRecordCmdTestSetUp();
    OH_Drawing_Canvas* canvas0 = OH_Drawing_CanvasCreate();
    int32_t width = TEST_CANVAS_WIDTH;
    int32_t height = TEST_CANVAS_HEIGHT;
    // beginRecording-draw-finishRecording
    OH_Drawing_RecordCmd* recordCmd = CreateRecordCmd(width, height);
    OH_Drawing_ErrorCode result1 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas0, recordCmd);
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);
    // beginRecording-finishRecording
    OH_Drawing_RecordCmd* recordCmd1 = CreateRecordCmd(width, height);
    OH_Drawing_ErrorCode result2 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas0, recordCmd1);
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);
    // beginRecording-draw-nesting-draw-finishRecording
    OH_Drawing_RecordCmd* recordCmd2 = nullptr;
    OH_Drawing_Canvas* canvas2 = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils2 = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils2, width, height, &canvas2);
    drawCircle1(canvas2, width);
    OH_Drawing_ErrorCode result3 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas2, recordCmd1);
    drawCircle1(canvas2, width);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils2, &recordCmd2);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils2);
    canvas2 = nullptr;
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);
    // beginRecording-nesting-nesting-finishRecording
    OH_Drawing_RecordCmd* recordCmd3 = nullptr;
    OH_Drawing_Canvas* canvas3 = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils3 = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils3, width, height, &canvas3);
    OH_Drawing_ErrorCode result4 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas3, recordCmd2);
    OH_Drawing_ErrorCode result5 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas3, recordCmd1);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils3, &recordCmd3);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils3);
    canvas3 = nullptr;
    EXPECT_EQ(result4, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result5, OH_DRAWING_SUCCESS);
    OH_Drawing_RecordCmdDestroy(recordCmd);
    OH_Drawing_RecordCmdDestroy(recordCmd1);
    OH_Drawing_RecordCmdDestroy(recordCmd2);
    OH_Drawing_RecordCmdDestroy(recordCmd3);
    DrawingCanvasDrawRecordCmdTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRecordCmdNestingAbNormal()
{
    DrawingCanvasDrawRecordCmdTestSetUp();

    OH_Drawing_Canvas* canvas0 = OH_Drawing_CanvasCreate();
    int32_t width = TEST_CANVAS_WIDTH;
    int32_t height = TEST_CANVAS_HEIGHT;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_ErrorCode result = OH_Drawing_CanvasDrawRecordCmdNesting(canvas, recordCmd);
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    drawCircle1(canvas, width);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    canvas = nullptr;
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_ErrorCode result1 = OH_Drawing_CanvasDrawRecordCmdNesting(nullptr, recordCmd);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCode result2 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas0, nullptr);
    EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RecordCmdDestroy(recordCmd);

    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRecordCmdNestingAbNormal1()
{
    DrawingCanvasDrawRecordCmdTestSetUp();

    OH_Drawing_Canvas* canvas0 = OH_Drawing_CanvasCreate();
    int32_t width = TEST_CANVAS_WIDTH;
    int32_t height = TEST_CANVAS_HEIGHT;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    OH_Drawing_ErrorCode result = OH_Drawing_CanvasDrawRecordCmdNesting(canvas, recordCmd);
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    OH_Drawing_ErrorCode result1 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas, recordCmd);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    canvas = nullptr;
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_RecordCmd* recordCmd1 = nullptr;
    OH_Drawing_Canvas* canvas1 = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils1 = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils1, width, height, &canvas);
    OH_Drawing_ErrorCode result2 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas1, recordCmd1);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils1, &recordCmd1);
    OH_Drawing_ErrorCode result3 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas0, recordCmd1);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils1, &recordCmd1);
    canvas1 = nullptr;
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils1);
    EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);
    OH_Drawing_RecordCmdDestroy(recordCmd);
    OH_Drawing_RecordCmdDestroy(recordCmd1);

    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestRecordCmdUtilsGetHeightNormal()
{
    DrawingCanvasDrawRecordCmdTestSetUp();
    
    int32_t width = NUMBER_256;
    int32_t height = NUMBER_256;
    int32_t dstHeight = 0;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RecordCmdUtilsGetHeight(recordCmdUtils, &dstHeight);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(dstHeight, 0);
    
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    errorCode = OH_Drawing_RecordCmdUtilsGetHeight(recordCmdUtils, &dstHeight);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(dstHeight, height);
    
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_RecordCmdDestroy(recordCmd);
    
    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestRecordCmdUtilsGetHeightNull()
{
    DrawingCanvasDrawRecordCmdTestSetUp();

    int32_t width = NUMBER_256;
    int32_t height = NUMBER_256;
    int32_t dstHeight = 0;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    // 1. recordCmdUtils is nullptr
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RecordCmdUtilsGetHeight(nullptr, &dstHeight);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(dstHeight, 0);
    // 2. height pointer is nullptr
    errorCode = OH_Drawing_RecordCmdUtilsGetHeight(recordCmdUtils, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    
    height = 0;
    errorCode = OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_RecordCmdUtilsGetHeight(recordCmdUtils, &dstHeight);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(dstHeight, 0);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_RecordCmdDestroy(recordCmd);

    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestRecordCmdUtilsGetHeightAbnormal()
{
    DrawingCanvasDrawRecordCmdTestSetUp();

    // BeginRecording with extremely large height value
    int32_t width = NUMBER_256;
    int32_t height = INT32_MAX;
    int32_t dstHeight = 0;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    // Extremely large height may cause allocation failure, verify GetHeight only when BeginRecording succeeds
    OH_Drawing_ErrorCode errorCode2 = OH_Drawing_RecordCmdUtilsGetHeight(recordCmdUtils, &dstHeight);
    EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
    EXPECT_EQ(dstHeight, height);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_RecordCmdDestroy(recordCmd);

    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestRecordCmdUtilsGetHeightMultipleCalls()
{
    DrawingCanvasDrawRecordCmdTestSetUp();

    int32_t width = NUMBER_256;
    int32_t height = NUMBER_256;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    // Call OH_Drawing_RecordCmdUtilsGetHeight 10 times
    for (int i = 0; i < NUMBER_10; i++) {
        int32_t dstWidth = 0;
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RecordCmdUtilsGetHeight(recordCmdUtils, &dstWidth);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(dstWidth, width);
    }
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_RecordCmdDestroy(recordCmd);

    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestRecordCmdUtilsGetWidthNormal()
{
    DrawingCanvasDrawRecordCmdTestSetUp();

    int32_t width = NUMBER_256;
    int32_t height = NUMBER_256;
    int32_t dstWidth = 0;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RecordCmdUtilsGetWidth(recordCmdUtils, &dstWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(dstWidth, 0);
    
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    errorCode = OH_Drawing_RecordCmdUtilsGetWidth(recordCmdUtils, &dstWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(dstWidth, NUMBER_256);
    
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_RecordCmdDestroy(recordCmd);

    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestRecordCmdUtilsGetWidthNull()
{
    DrawingCanvasDrawRecordCmdTestSetUp();

    int32_t width = NUMBER_256;
    int32_t height = NUMBER_256;
    int32_t dstWidth = 0;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    // 1. recordCmdUtils is nullptr
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RecordCmdUtilsGetWidth(nullptr, &dstWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(dstWidth, 0);
    // 2. width pointer is nullptr
    errorCode = OH_Drawing_RecordCmdUtilsGetWidth(recordCmdUtils, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    
    width = 0;
    errorCode = OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_RecordCmdUtilsGetWidth(recordCmdUtils, &dstWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(dstWidth, 0);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_RecordCmdDestroy(recordCmd);

    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestRecordCmdUtilsGetWidthAbnormal()
{
    DrawingCanvasDrawRecordCmdTestSetUp();

    // BeginRecording with extremely large width value
    int32_t width = INT32_MAX;
    int32_t height = NUMBER_256;
    int32_t dstWidth = 0;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    // Extremely large width may cause allocation failure, verify GetWidth only when BeginRecording succeeds
    OH_Drawing_ErrorCode errorCode2 = OH_Drawing_RecordCmdUtilsGetWidth(recordCmdUtils, &dstWidth);
    EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
    EXPECT_EQ(dstWidth, width);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_RecordCmdDestroy(recordCmd);

    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestRecordCmdUtilsGetWidthMultipleCalls()
{
    DrawingCanvasDrawRecordCmdTestSetUp();

    int32_t width = NUMBER_256;
    int32_t height = NUMBER_256;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    // Call OH_Drawing_RecordCmdUtilsGetWidth 10 times
    for (int i = 0; i < NUMBER_10; i++) {
        int32_t outWidth = 0;
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RecordCmdUtilsGetWidth(recordCmdUtils, &outWidth);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(outWidth, NUMBER_256);
    }
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_RecordCmdDestroy(recordCmd);

    DrawingCanvasDrawRecordCmdTestTearDown();

    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS