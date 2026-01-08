/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libDrawingNative from 'libdrawingnative.so';
import Utils, { Log } from './Utils.test';


export default function ActsNewDrawingNativeTestPart10() {
  describe('ActsNewDrawingNativeTestPart10', () => {
    beforeAll(async () => {
    })

    beforeEach(async () => {
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    // Canvas Part5 DrawPixelMapMesh related test cases
    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapMesh_0001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5500
     * @tc.desc   test for TestCanvasDrawPixelMapMeshNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_Canvas_DrawPixelMapMesh_0001', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapMesh_0002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5501
     * @tc.desc   test for TestCanvasDrawPixelMapMeshNull01.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Canvas_DrawPixelMapMesh_0002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapMesh_0003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5502
     * @tc.desc   test for TestCanvasDrawPixelMapMeshNull02.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Canvas_DrawPixelMapMesh_0003', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapMesh_0004
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5503
     * @tc.desc   test for TestCanvasDrawPixelMapMeshNull03.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Canvas_DrawPixelMapMesh_0004', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapMesh_0005
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5504
     * @tc.desc   test for TestCanvasDrawPixelMapMeshNull04.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Canvas_DrawPixelMapMesh_0005', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapMesh_0006
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5505
     * @tc.desc   test for TestCanvasDrawPixelMapMeshBindAndUnbind.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Canvas_DrawPixelMapMesh_0006', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapMesh_0007
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5506
     * @tc.desc   test for TestCanvasDrawPixelMapMeshAbnormal01.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Canvas_DrawPixelMapMesh_0007', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapMesh_0008
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5507
     * @tc.desc   test for TestCanvasDrawPixelMapMeshAbnormal02.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Canvas_DrawPixelMapMesh_0008', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapMesh_0009
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5508
     * @tc.desc   test for TestCanvasDrawPixelMapMeshAbnormal03.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Canvas_DrawPixelMapMesh_0009', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapMesh_0010
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5509
     * @tc.desc   test for TestCanvasDrawPixelMapMeshAbnormal04.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Canvas_DrawPixelMapMesh_0010', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapMesh_0011
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5510
     * @tc.desc   test for TestCanvasDrawPixelMapMeshMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Canvas_DrawPixelMapMesh_0011', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(10);
      expect(result).assertEqual(0);
    })
    
    // Path Part4 InverseFillType related test cases (8 cases)
    /**
     * @tc.name   SUB_Drawing_PathPart4_InverseFillType_0001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4900
     * @tc.desc   test for TestPathIsInverseFillTypeNormalOne.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_PathPart4_InverseFillType_0001', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathPart4_InverseFillType_0002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4901
     * @tc.desc   test for TestPathIsInverseFillTypeNormalTwo.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_PathPart4_InverseFillType_0002', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathPart4_InverseFillType_0003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4902
     * @tc.desc   test for TestPathIsInverseFillTypeNormalThree.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_PathPart4_InverseFillType_0003', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathPart4_InverseFillType_0004
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4903
     * @tc.desc   test for TestPathIsInverseFillTypeNormalFour.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_PathPart4_InverseFillType_0004', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathPart4_InverseFillType_0005
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4904
     * @tc.desc   test for TestPathIsInverseFillTypeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_PathPart4_InverseFillType_0005', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathPart4_InverseFillType_0006
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4905
     * @tc.desc   test for TestPathToggleInverseFillTypeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_PathPart4_InverseFillType_0006', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathPart4_InverseFillType_0007
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4906
     * @tc.desc   test for TestPathIsInverseFillTypeCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_PathPart4_InverseFillType_0007', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathPart4_InverseFillType_0008
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4907
     * @tc.desc   test for TestPathToggleInverseFillTypeCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_PathPart4_InverseFillType_0008', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(7);
      expect(result).assertEqual(0);
    })
  //
  //   // Rect Part2 Inset/Contains/SetEmpty/IsEmpty/Offset/OffsetTo/Sort/Union related test cases (27 cases)
    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1600
     * @tc.desc   test for TestRectInsetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0001', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1601
     * @tc.desc   test for TestRectInsetAbNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1602
     * @tc.desc   test for TestRectInsetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0003', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0004
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1603
     * @tc.desc   test for TestRectInsetCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0004', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0005
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1700
     * @tc.desc   test for TestRectContainsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0005', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0006
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1701
     * @tc.desc   test for TestRectContainsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0006', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0007
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1703
     * @tc.desc   test for TestRectContainsCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0007', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0008
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1800
     * @tc.desc   test for TestRectSetEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0008', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0009
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1801
     * @tc.desc   test for TestRectSetEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0009', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0010
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1802
     * @tc.desc   test for TestRectSetEmptyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0010', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0011
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1900
     * @tc.desc   test for TestRectIsEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0011', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0012
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1901
     * @tc.desc   test for TestRectIsEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0012', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0013
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1902
     * @tc.desc   test for TestRectIsEmptyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0013', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0014
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2000
     * @tc.desc   test for TestRectOffsetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0014', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0015
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2001
     * @tc.desc   test for TestRectOffsetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0015', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0016
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2002
     * @tc.desc   test for TestRectOffsetAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0016', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0017
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2003
     * @tc.desc   test for TestRectOffsetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0017', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0018
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2100
     * @tc.desc   test for TestRectOffsetToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0018', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0019
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2101
     * @tc.desc   test for TestRectOffsetToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0019', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0020
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2102
     * @tc.desc   test for TestRectOffsetToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0020', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0021
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2103
     * @tc.desc   test for TestRectOffsetToMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0021', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0022
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2200
     * @tc.desc   test for TestRectSortNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0022', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0023
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2201
     * @tc.desc   test for TestRectSortNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0023', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0024
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2202
     * @tc.desc   test for TestRectSortMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0024', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0025
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2300
     * @tc.desc   test for TestRectUnionNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0025', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0026
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2301
     * @tc.desc   test for TestRectUnionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0026', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RectPart2_OtherOperations_0027
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2302
     * @tc.desc   test for TestRectUnionMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RectPart2_OtherOperations_0027', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(26);
      expect(result).assertEqual(0);
    })
  //
  //   // Region Part2 Empty/GetBoundary/GetBounds/IsComplex/IsEmpty/IsRect related test cases (18 cases)
    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0800
     * @tc.desc   test for testRegionEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0001', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0801
     * @tc.desc   test for testRegionEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0802
     * @tc.desc   test for testRegionEmptyCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0003', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0004
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0900
     * @tc.desc   test for testRegionGetBoundaryNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0004', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0005
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0901
     * @tc.desc   test for testRegionGetBoundaryNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0005', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0006
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0902
     * @tc.desc   test for testRegionGetBoundaryMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0006', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0007
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1000
     * @tc.desc   test for testRegionGetBoundsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0007', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0008
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1001
     * @tc.desc   test for testRegionGetBoundsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0008', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0009
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1002
     * @tc.desc   test for testRegionGetBoundsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0009', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0010
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1100
     * @tc.desc   test for testRegionIsComplexNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0010', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0011
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1101
     * @tc.desc   test for testRegionIsComplexNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0011', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0012
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1102
     * @tc.desc   test for testRegionIsComplexMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0012', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0013
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1200
     * @tc.desc   test for testRegionIsEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0013', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0014
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1201
     * @tc.desc   test for testRegionIsEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0014', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0015
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1202
     * @tc.desc   test for testRegionIsEmptyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0015', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0016
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1300
     * @tc.desc   test for testRegionIsRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0016', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0017
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1301
     * @tc.desc   test for testRegionIsRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0017', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_RegionPart2_QueryOperations_0018
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1302
     * @tc.desc   test for testRegionIsRectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_RegionPart2_QueryOperations_0018', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsBoldNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01600
     * @tc.desc   test for TestTypefaceIsBoldNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsBoldNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01700
     * @tc.desc   test for TestTypefaceIsBoldNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsBoldMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01800
     * @tc.desc   test for TestTypefaceIsBoldMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsItalicNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01900
     * @tc.desc   test for TestTypefaceIsItalicNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsItalicNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02000
     * @tc.desc   test for TestTypefaceIsItalicNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsItalicMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02100
     * @tc.desc   test for TestTypefaceIsItalicMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(5);
      expect(result).assertEqual(0);
    })

  // // Matrix Part3 related test cases
  /**
   * @tc.name   testMatrixPerConcatNormal
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10100
   * @tc.desc   test for TestMatrixPerConcatNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10100', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingMatrixPart3(0);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixPerConcatNull1
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10200
   * @tc.desc   test for TestMatrixPerConcatNull1.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('testMatrixPerConcatNull1', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(1);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixPerConcatNull2
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10300
   * @tc.desc   test for TestMatrixPerConcatNull2.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10300', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(2);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixPerConcatCalls
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10400
   * @tc.desc   test for TestMatrixPerConcatCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10400', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(3);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixIsAffineNormal
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10500
   * @tc.desc   test for TestMatrixIsAffineNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10500', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingMatrixPart3(4);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixIsAffineNull
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10600
   * @tc.desc   test for TestMatrixIsAffineNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10600', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(5);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixIsAffineMultipleCalls
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10700
   * @tc.desc   test for TestMatrixIsAffineMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10700', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(6);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixPreSkewNormal
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10800
   * @tc.desc   test for TestMatrixPreSkewNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10800', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingMatrixPart3(7);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixPreSkewNull
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10900
   * @tc.desc   test for TestMatrixPreSkewNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10900', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(8);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixPreSkewMultipleCalls
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11000
   * @tc.desc   test for TestMatrixPreSkewMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11000', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(9);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixRectStaysRectNormal
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11100
   * @tc.desc   test for TestMatrixRectStaysRectNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11100', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingMatrixPart3(10);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixRectStaysRectNull
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11200
   * @tc.desc   test for TestMatrixRectStaysRectNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11200', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(11);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixRectStaysRectMultipleCalls
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11300
   * @tc.desc   test for TestMatrixRectStaysRectMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11300', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(12);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixSetSinCosNormal
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11400
   * @tc.desc   test for TestMatrixSetSinCosNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11400', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingMatrixPart3(13);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixSetSinCosNull
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11500
   * @tc.desc   test for TestMatrixSetSinCosNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11500', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(14);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   testMatrixSetSinCosMultipleCalls
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11600
   * @tc.desc   test for TestMatrixSetSinCosMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11600', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(15);
    expect(result).assertEqual(0);
  })
  // // Region Basic Operations related test cases
  /**
   * @tc.name   SUB_Drawing_Region_BasicOperations_0019
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1600
   * @tc.desc   test for testRegionTranslateNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Drawing_Region_BasicOperations_0019', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(8);
    expect(result).assertEqual(0);
  })
  /**
   * @tc.name   SUB_Drawing_Region_BasicOperations_0020
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1601
   * @tc.desc   test for testRegionTranslateNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Drawing_Region_BasicOperations_0020', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(9);
    expect(result).assertEqual(0);
  })
  /**
   * @tc.name   SUB_Drawing_Region_BasicOperations_0021
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1602
   * @tc.desc   test for testRegionTranslateMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Drawing_Region_BasicOperations_0021', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(10);
    expect(result).assertEqual(0);
  })
  // Region Advanced Operations related test cases
  /**
   * @tc.name   SUB_Drawing_Region_AdvancedOperations_0001
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1400
   * @tc.desc   test for testRegionQuickContainsNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Drawing_Region_AdvancedOperations_0001', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(0);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_Drawing_Region_AdvancedOperations_0002
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1401
   * @tc.desc   test for testRegionQuickContainsNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Drawing_Region_AdvancedOperations_0002', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(1);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_Drawing_Region_AdvancedOperations_0003
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1402
   * @tc.desc   test for testRegionQuickContainsAbnormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Drawing_Region_AdvancedOperations_0003', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(2);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_Drawing_Region_AdvancedOperations_0004
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1403
   * @tc.desc   test for testRegionQuickContainsMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Drawing_Region_AdvancedOperations_0004', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(3);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_Drawing_Region_AdvancedOperations_0005
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1500
   * @tc.desc   test for testRegionQuickRejectNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Drawing_Region_AdvancedOperations_0005', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(4);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_Drawing_Region_AdvancedOperations_0006
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1501
   * @tc.desc   test for testRegionQuickRejectNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Drawing_Region_AdvancedOperations_0006', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(5);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_Drawing_Region_AdvancedOperations_0007
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1502
   * @tc.desc   test for testRegionQuickRejectAbnormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Drawing_Region_AdvancedOperations_0007', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(6);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_Drawing_Region_AdvancedOperations_0008
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1503
   * @tc.desc   test for testRegionQuickRejectMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Drawing_Region_AdvancedOperations_0008', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(7);
    expect(result).assertEqual(0);
  })
  })
}
