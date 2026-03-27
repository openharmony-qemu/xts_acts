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


export default function DrawingNativeBitmapTest() {
  describe('DrawingNativeBitmapTest', () => {
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
     * @tc.name   testBitmapDestroyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0100
     * @tc.desc   test for testBitmapDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapDestroyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0101
     * @tc.desc   test for testBitmapDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapCreateFromPixelsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0200
     * @tc.desc   test for testBitmapCreateFromPixelsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapCreateFromPixelsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0201
     * @tc.desc   test for testBitmapCreateFromPixelsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapCreateFromPixelsMismatch
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0202
     * @tc.desc   test for testBitmapCreateFromPixelsMismatch.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0202', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapCreateFromPixelsAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0203
     * @tc.desc   test for testBitmapCreateFromPixelsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0203', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapCreateFromPixelsVeryBig
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0204
     * @tc.desc   test for testBitmapCreateFromPixelsVeryBig.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0204', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapCreateFromPixelsBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0205
     * @tc.desc   test for testBitmapCreateFromPixelsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0205', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapBuildNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0300
     * @tc.desc   test for testBitmapBuildNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapBuildNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0301
     * @tc.desc   test for testBitmapBuildNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapBuildMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0302
     * @tc.desc   test for testBitmapBuildMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0302', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapBuildBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0303
     * @tc.desc   test for testBitmapBuildBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0303', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapGetXXNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0400
     * @tc.desc   test for testBitmapGetXXNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapGetXXNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0401
     * @tc.desc   test for testBitmapGetXXNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapGetXXInputDestroyed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0402
     * @tc.desc   test for testBitmapGetXXInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0402', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapGetXXBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0403
     * @tc.desc   test for testBitmapGetXXBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0403', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapReadPixelsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0500
     * @tc.desc   test for OH_Drawing_BitmapBuild.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapReadPixelsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0501
     * @tc.desc   test for testBitmapReadPixelsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapReadPixelsInputDestroyed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0502
     * @tc.desc   test for testBitmapReadPixelsInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapReadPixelsMismatch
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0503
     * @tc.desc   test for testBitmapReadPixelsMismatch.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0503', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBitmap(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapReadPixelsBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0504
     * @tc.desc   test for OH_Drawing_BitmapBuild.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0504', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBitmapBuildMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0600
     * @tc.desc   test for testBitmapBuildMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(21);
      expect(result).assertEqual(0);
    })
  })
}