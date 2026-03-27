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


export default function DrawingNativePathTest() {
  describe('DrawingNativePathTest', () => {
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

    /**
     * @tc.name   testPathCreateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0100
     * @tc.desc   Test for creating a path object with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCopyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0200
     * @tc.desc   Test for copying a path with normal parameters and checking the copied path length.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCopyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0201
     * @tc.desc   Test for copying a path with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCopyInputDestroyed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0202
     * @tc.desc   Test for copying a path and checking if the copied path is affected after the original path is destroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0202', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathDestroyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0300
     * @tc.desc   Test for creating and destroying a path object with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathDestroyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0301
     * @tc.desc   Test for destroying a path object with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathMoveToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0400
     * @tc.desc   Test for moving a path to a normal position with valid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathMoveToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0401
     * @tc.desc   Test for moving a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathMoveToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0402
     * @tc.desc   Test for moving a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0402', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathMoveToMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0403
     * @tc.desc   Test for moving a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0403', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathLineToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0500
     * @tc.desc   Test for adding a line to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathLineToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0501
     * @tc.desc   Test for adding a line to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathLineToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0502
     * @tc.desc   Test for moving a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathLineToMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0503
     * @tc.desc   Test for moving a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0503', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathArcToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0600
     * @tc.desc   Test for adding an arc to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathArcToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0601
     * @tc.desc   Test for adding an arc to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathArcToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0602
     * @tc.desc   Test for adding an arc to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0602', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathArcToMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0603
     * @tc.desc   Test for adding an arc to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0603', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathQuadToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0700
     * @tc.desc   Test for adding a quadratic Bezier curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathQuadToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0701
     * @tc.desc   Test for adding a quadratic Bezier curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0701', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathQuadToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0702
     * @tc.desc   Test for adding a quadratic Bezier curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0702', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathQuadToMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0703
     * @tc.desc   Test for adding a quadratic Bezier curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0703', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConicToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0800
     * @tc.desc   Test for adding a conic curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConicToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0801
     * @tc.desc   Test for adding a conic curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0801', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConicToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0802
     * @tc.desc   Test for adding a conic curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0802', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConicToMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0803
     * @tc.desc   Test for adding a conic curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0803', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCubicToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0900
     * @tc.desc   Test for adding a cubic Bezier curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(26);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCubicToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0901
     * @tc.desc   Test for adding a cubic Bezier curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0901', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(27);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCubicToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0902
     * @tc.desc   Test for adding a cubic Bezier curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0902', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(28);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCubicToMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0903
     * @tc.desc   Test for adding a cubic Bezier curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0903', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(29);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRMoveToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1000
     * @tc.desc   Test for setting a relative move to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRMoveToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1001
     * @tc.desc   Test for setting a relative move to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1001', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRMoveToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1002
     * @tc.desc   Test for setting a relative move to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRMoveToMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1003
     * @tc.desc   Test for setting a relative move to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1003', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRLineToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1100
     * @tc.desc   Test for adding a relative line to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRLineToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1101
     * @tc.desc   Test for adding a relative line to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRLineToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1102
     * @tc.desc   Test for adding a relative line to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1102', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRLineToMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1103
     * @tc.desc   Test for adding a relative line to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1103', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRQuadToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1200
     * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRQuadToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1201
     * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRQuadToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1202
     * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1202', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRQuadToMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1203
     * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1203', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRConicToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1300
     * @tc.desc   Test for adding a relative conic curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRConicToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1301
     * @tc.desc   Test for adding a relative conic curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRConicToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1302
     * @tc.desc   Test for adding a relative conic curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1302', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRConicToMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1303
     * @tc.desc   Test for adding a relative conic curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1303', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRCubicToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1400
     * @tc.desc   Test for adding a relative cubic Bezier curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRCubicToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1401
     * @tc.desc   Test for adding a relative cubic Bezier curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRCubicToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1402
     * @tc.desc   Test for adding a relative cubic Bezier curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1402', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRCubicToMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1403
     * @tc.desc   Test for adding a relative cubic Bezier curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1403', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(19);
      expect(result).assertEqual(0);
    })

    // Path Add Shape related test cases (14 cases)
    /**
     * @tc.name   testPathAddRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1500
     * @tc.desc   Test for adding a rectangle to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1501
     * @tc.desc   Test for adding a rectangle to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1502
     * @tc.desc   Test for adding a rectangle to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1503
     * @tc.desc   Test for adding a rectangle to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1503', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectWithInitialCornerNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1600
     * @tc.desc   Test for adding a rectangle to a path with initial corner and normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectWithInitialCornerNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1601
     * @tc.desc   Test for adding a rectangle to a path with initial corner and NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectWithInitialCornerAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1602
     * @tc.desc   Test for adding a rectangle to a path with initial corner and abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1602', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectWithInitialCornerMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1603
     * @tc.desc   Test for adding a rectangle to a path with initial corner and maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1603', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRoundRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1700
     * @tc.desc   Test for adding a round rectangle to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRoundRectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1701
     * @tc.desc   Test for adding a round rectangle to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1701', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalWithInitialPointNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1800
     * @tc.desc   Test for adding an oval to a path with initial point and normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalWithInitialPointNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1801
     * @tc.desc   Test for adding an oval to a path with initial point and NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1801', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalWithInitialPointAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1802
     * @tc.desc   Test for adding an oval to a path with initial point and abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1802', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalWithInitialPointMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1803
     * @tc.desc   Test for adding an oval to a path with initial point and maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1803', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(13);
      expect(result).assertEqual(0);
    })

    // Path Part2 Add related test cases (25 cases)
    /**
     * @tc.name   testPathAddArcNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1900
     * @tc.desc   Test for adding an arc to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddArcNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1901
     * @tc.desc   Test for adding an arc to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1901', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddArcAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1902
     * @tc.desc   Test for adding an arc to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1902', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddArcMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1903
     * @tc.desc   Test for adding an arc to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1903', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2000
     * @tc.desc   Test for adding a path to another path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2001
     * @tc.desc   Test for adding a path to another path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2001', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithMatrixAndModeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2100
     * @tc.desc   Test for adding a path to another path with matrix and mode transformations using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithMatrixAndModeNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2101
     * @tc.desc   Test for adding a path to another path with matrix and mode transformations using NULL or invalid
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithModeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2200
     * @tc.desc   Test for adding a path to another path with mode transformations using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithModeNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2201
     * @tc.desc   Test for adding a path to another path with mode transformations using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithOffsetAndModeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2300
     * @tc.desc   Test for adding a path to another path with offset and mode transformations using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithOffsetAndModeNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2301
     * @tc.desc   Test for adding a path to another path with offset and mode transformations using NULL or invalid
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithOffsetAndModeAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2302
     * @tc.desc   Test for adding a path to another path with offset and mode transformations using abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2302', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithOffsetAndModeMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2303
     * @tc.desc   Test for adding a path to another path with offset and mode transformations using maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2303', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2400
     * @tc.desc   Test for adding an oval to a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2401
     * @tc.desc   Test for adding an oval to a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPolygonNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2500
     * @tc.desc   Test for adding a polygon to a path with the fourth parameter set to true.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPolygonNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2501
     * @tc.desc   Test for adding a polygon to a path with the fourth parameter set to false.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2501', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPolygonNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2502
     * @tc.desc   Test for adding a polygon to a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPolygonAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2503
     * @tc.desc   Test for adding a polygon to a path using abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2503', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPolygonMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2504
     * @tc.desc   Test for adding a polygon to a path using maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2504', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddCircleNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2600
     * @tc.desc   Test for adding a circle to a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddCircleNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2601
     * @tc.desc   Test for adding a circle to a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddCircleAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2602
     * @tc.desc   Test for adding a circle to a path using abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2602', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddCircleMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2603
     * @tc.desc   Test for adding a circle to a path using maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2603', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(24);
      expect(result).assertEqual(0);
    })

    // Path Part2 Transform related test cases (11 cases)
    /**
     * @tc.name   testPathBuildFromSvgStringNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2700
     * @tc.desc   Test for building a path from an SVG string using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathBuildFromSvgStringNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2701
     * @tc.desc   Test for building a path from an SVG string using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2701', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathContainsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2800
     * @tc.desc   Test for checking if a path contains a specified point using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathContainsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2801
     * @tc.desc   Test for checking if a path contains a specified point using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2801', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathContainsAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2802
     * @tc.desc   Test for checking if a path contains a specified point using abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2802', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathContainsMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2803
     * @tc.desc   Test for checking if a path contains a specified point using maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2803', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathTransformNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2900
     * @tc.desc   Test for transforming a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathTransformNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2901
     * @tc.desc   Test for transforming a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2901', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathTransformWithPerspectiveClipNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3000
     * @tc.desc   Test for transforming a path with perspective clip using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathTransformWithPerspectiveClipNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3001
     * @tc.desc   Test for transforming a path with perspective clip using normal parameters with false perspective clip.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3001', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathTransformWithPerspectiveClipNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3002
     * @tc.desc   Test for transforming a path with perspective clip using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(10);
      expect(result).assertEqual(0);
    })

    // Path Part2 Get/Set related test cases (17 cases)
    /**
     * @tc.name   testPathSetFillTypeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3100
     * @tc.desc   Test for setting fill type of a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathSetFillTypeNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3101
     * @tc.desc   Test for setting fill type of a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathSetFillTypeMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3102
     * @tc.desc   Test for setting fill type of a path with multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3102', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetLengthNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3200
     * @tc.desc   Test for getting the length of a path using normal parameters with detailed length.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetLengthNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3201
     * @tc.desc   Test for getting the length of a path using normal parameters without detailed length.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3201', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetLengthNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3202
     * @tc.desc   Test for getting the length of a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3202', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetBoundsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3300
     * @tc.desc   Test for getting the bounds of a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetBoundsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3301
     * @tc.desc   Test for getting the bounds of a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCloseNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3400
     * @tc.desc   test for testPathCloseNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCloseNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3401
     * @tc.desc   Test for closing a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOffsetNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3500
     * @tc.desc   Test for offsetting a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOffsetNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3501
     * @tc.desc   Test for offsetting a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOffsetAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3502
     * @tc.desc   Test for offsetting a path with abnormal parameters (non-float values).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOffsetMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3503
     * @tc.desc   Test for offsetting a path with maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3503', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathResetNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3600
     * @tc.desc   Test for resetting a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathResetNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3601
     * @tc.desc   Test for resetting a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathResetMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3602
     * @tc.desc   Test for resetting a path with multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3602', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(16);
      expect(result).assertEqual(0);
    })

    // Path Part3 Query related test cases (12 cases)
    /**
     * @tc.name   testPathIsClosedNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3700
     * @tc.desc   Test for checking if a path is closed using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsClosedNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3701
     * @tc.desc   Test for checking if a path is closed without closing it.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3701', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsClosedNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3702
     * @tc.desc   Test for checking if a path is closed with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3702', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPositionTangentNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3800
     * @tc.desc   Test for getting position and tangent of a path using normal parameters with tangent flag set to true.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPositionTangentNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3801
     * @tc.desc   Test for getting position and tangent of a path using normal parameters with tangent flag set to false.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3801', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPositionTangentNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3802
     * @tc.desc   Test for getting position and tangent of a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3802', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPositionTangentAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3803
     * @tc.desc   Test for getting position and tangent of a path with abnormal parameters (non-float values).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3803', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPositionTangentMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3804
     * @tc.desc   Test for getting position and tangent of a path with maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3804', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOpNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3900
     * @tc.desc   Test for performing path operations using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOpNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3901
     * @tc.desc   Test for performing path operations with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3901', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4000
     * @tc.desc   Test for getting transformation matrix of a path using normal parameters with matrix flag set to true.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetMatrixNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4001
     * @tc.desc   Test for getting transformation matrix of a path using normal parameters with matrix flag set to false.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4001', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetMatrixNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4002
     * @tc.desc   Test for getting transformation matrix of a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetMatrixAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4003
     * @tc.desc   Test for getting transformation matrix of a path with abnormal parameters (non-float values).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4003', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetMatrixMaximal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4004
     * @tc.desc   Test for getting transformation matrix of a path with maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4004', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetSegmentNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4100
     * @tc.desc   Testing the enumeration traversal of the interface for extracting path segments and appending them to the
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetSegmentNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4101
     * @tc.desc   Tests when an interface that intercepts a path fragment and appends it to the target path passes a null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetSegmentAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4102
     * @tc.desc   Test cases where the function intercepts a path fragment and appends it to the destination path with an
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4102', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetSegmentMultiplies
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4103
     * @tc.desc   The test function intercepts the path fragment and appends it to the target path loop several times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4103', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(15);
      expect(result).assertEqual(0);
    })

    // Path Part3 Advanced related test cases (14 cases)
    /**
     * @tc.name   testPathSetPathNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4200
     * @tc.desc   test for testPathSetPathNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathSetPathNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4201
     * @tc.desc   test for testPathSetPathNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathSetPathMulptiCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4202
     * @tc.desc   test for testPathSetPathMulptiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4202', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsEmptyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4300
     * @tc.desc   test for testPathIsEmptyNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsEmptyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4301
     * @tc.desc   test for testPathIsEmptyNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsEmptyMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4302
     * @tc.desc   test for testPathIsEmptyMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4302', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4400
     * @tc.desc   test for testPathIsRectNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsRectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4401
     * @tc.desc   test for testPathIsRectNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsRectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4402
     * @tc.desc   test for testPathIsRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4402', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetFillTypeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4500
     * @tc.desc   test for testPathGetFillTypeNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetFillTypeNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4501
     * @tc.desc   test for testPathGetFillTypeNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetFillTypeMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4502
     * @tc.desc   test for testPathGetFillTypeMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(11);
      expect(result).assertEqual(0);
    })
  })
}