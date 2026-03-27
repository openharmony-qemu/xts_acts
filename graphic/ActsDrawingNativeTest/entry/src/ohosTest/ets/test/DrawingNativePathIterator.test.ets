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


export default function DrawingNativePathIteratorTest() {
  describe('DrawingNativePathIteratorTest', () => {
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
     * @tc.name   testPathIteratorCreateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0100
     * @tc.desc   test for testPathIteratorCreateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIteratorCreateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0101
     * @tc.desc   test for testPathIteratorCreateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathIterator(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIteratorCreateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0102
     * @tc.desc   test for testPathIteratorCreateMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0102', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathIterator(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIteratorDestroyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0200
     * @tc.desc   test for testPathIteratorDestroyNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIteratorDestroyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0201
     * @tc.desc   test for testPathIteratorDestroyNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathIterator(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIteratorHasNextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0300
     * @tc.desc   test for testPathIteratorHasNextNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIteratorHasNextNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0301
     * @tc.desc   test for testPathIteratorHasNextNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathIterator(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIteratorNextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0400
     * @tc.desc   test for testPathIteratorNextNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIteratorNextNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0401
     * @tc.desc   test for testPathIteratorNextNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathIterator(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIteratorPeekNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0500
     * @tc.desc   test for testPathIteratorPeekNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIteratorPeekNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0501
     * @tc.desc   test for testPathIteratorPeekNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0501', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(10);
      expect(result).assertEqual(0);
    })
  })
}