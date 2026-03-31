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


export default function DrawingNativePath2Test() {
  describe('DrawingNativePath2Test', () => {
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
     * @tc.name   testPathApproximateNormal
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0100
     * @tc.desc   test for testPathApproximateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathApproximateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathApproximateNull
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0200
     * @tc.desc   test for testPathApproximateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathApproximateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathApproximateAbnormal
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0300
     * @tc.desc   test for testPathApproximateAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathApproximateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathApproximateMultiCalls
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0400
     * @tc.desc   test for testPathApproximateMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathApproximateMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateNormal
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0500
     * @tc.desc   test for testPathInterpolateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathInterpolateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateNull
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0600
     * @tc.desc   test for testPathInterpolateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathInterpolateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateAbnormal
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0700
     * @tc.desc   test for testPathInterpolateAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathInterpolateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateMultiCalls
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0800
     * @tc.desc   test for testPathInterpolateMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathInterpolateMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInterpolateNormal
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0900
     * @tc.desc   test for testPathIsInterpolateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsInterpolateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInterpolateNull
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_1000
     * @tc.desc   test for testPathIsInterpolateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsInterpolateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInterpolateMultiCalls
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_1100
     * @tc.desc   test for testPathIsInterpolateMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsInterpolateMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalOne
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0100
     * @tc.desc   test for testPathIsInverseFillTypeNormalOne
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsInverseFillTypeNormalOne', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalTwo
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0200
     * @tc.desc   test for testPathIsInverseFillTypeNormalTwo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsInverseFillTypeNormalTwo', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalThree
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0300
     * @tc.desc   test for testPathIsInverseFillTypeNormalThree
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsInverseFillTypeNormalThree', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalFour
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0400
     * @tc.desc   test for testPathIsInverseFillTypeNormalFour
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsInverseFillTypeNormalFour', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNull
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0500
     * @tc.desc   test for testPathIsInverseFillTypeNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsInverseFillTypeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathToggleInverseFillTypeNull
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0600
     * @tc.desc   test for testPathToggleInverseFillTypeNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathToggleInverseFillTypeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeCalls
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0700
     * @tc.desc   test for testPathIsInverseFillTypeCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsInverseFillTypeCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathToggleInverseFillTypeCalls
     * @tc.number   SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0800
     * @tc.desc   test for testPathToggleInverseFillTypeCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathToggleInverseFillTypeCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(7);
      expect(result).assertEqual(0);
    })
  })
}