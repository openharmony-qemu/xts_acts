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
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4600
     * @tc.desc   test for testPathApproximateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathApproximateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4601
     * @tc.desc   test for testPathApproximateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathApproximateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4602
     * @tc.desc   test for testPathApproximateAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4602', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathApproximateMultiCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4603
     * @tc.desc   test for testPathApproximateMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4603', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4700
     * @tc.desc   test for testPathInterpolateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4701
     * @tc.desc   test for testPathInterpolateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4701', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4702
     * @tc.desc   test for testPathInterpolateAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4702', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateMultiCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4703
     * @tc.desc   test for testPathInterpolateMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4703', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInterpolateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4800
     * @tc.desc   test for testPathIsInterpolateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInterpolateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4801
     * @tc.desc   test for testPathIsInterpolateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4801', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInterpolateMultiCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4802
     * @tc.desc   test for testPathIsInterpolateMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4802', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalOne
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4900
     * @tc.desc   test for testPathIsInverseFillTypeNormalOne
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalTwo
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4901
     * @tc.desc   test for testPathIsInverseFillTypeNormalTwo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4901', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalThree
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4902
     * @tc.desc   test for testPathIsInverseFillTypeNormalThree
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4902', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalFour
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4903
     * @tc.desc   test for testPathIsInverseFillTypeNormalFour
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4903', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4904
     * @tc.desc   test for testPathIsInverseFillTypeNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4904', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathToggleInverseFillTypeNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4905
     * @tc.desc   test for testPathToggleInverseFillTypeNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4905', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4906
     * @tc.desc   test for testPathIsInverseFillTypeCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4906', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathToggleInverseFillTypeCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4907
     * @tc.desc   test for testPathToggleInverseFillTypeCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4907', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(7);
      expect(result).assertEqual(0);
    })
  })
}