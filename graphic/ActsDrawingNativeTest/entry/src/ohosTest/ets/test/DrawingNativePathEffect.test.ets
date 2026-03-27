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


export default function DrawingNativePathEffectTest() {
  describe('DrawingNativePathEffectTest', () => {
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
     * @tc.name   testCreateDashPathEffectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0100
     * @tc.desc   test for testCreateDashPathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateDashPathEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0101
     * @tc.desc   test for testCreateDashPathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateDashPathEffectAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0102
     * @tc.desc   test for testCreateDashPathEffectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0102', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateDashPathEffectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0103
     * @tc.desc   test for testCreateDashPathEffectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0103', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathEffectDestroyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0200
     * @tc.desc   test for testPathEffectDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathEffectDestroyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0201
     * @tc.desc   test for testPathEffectDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateCornerPathEffectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0300
     * @tc.desc   test for testCreateCornerPathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateCornerPathEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0301
     * @tc.desc   test for testCreateCornerPathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateCornerPathEffectAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0302
     * @tc.desc   test for testCreateCornerPathEffectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0302', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateDiscreatePathEffectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0400
     * @tc.desc   test for testCreateDiscreatePathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateDiscreatePathEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0401
     * @tc.desc   test for testCreateDiscreatePathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateDiscreatePathEffectAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0402
     * @tc.desc   test for testCreateDiscreatePathEffectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0402', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateComposePathEffectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0500
     * @tc.desc   test for testCreateComposePathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateComposePathEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0501
     * @tc.desc   test for testCreateComposePathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreatePathDashEffectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0600
     * @tc.desc   test for testCreatePathDashEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreatePathDashEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0601
     * @tc.desc   test for testCreatePathDashEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreatePathDashEffectAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0602
     * @tc.desc   test for testCreatePathDashEffectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0602', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateSumPathEffectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0700
     * @tc.desc   test for testCreateSumPathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCreateSumPathEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0701
     * @tc.desc   test for testCreateSumPathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0701', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(18);
      expect(result).assertEqual(0);
    })
  })
}