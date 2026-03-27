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


export default function DrawingNativeBrushTest() {
  describe('DrawingNativeBrushTest', () => {
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
     * @tc.name   testBrushCreateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0100
     * @tc.desc   test for testBrushCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushCopyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0200
     * @tc.desc   test for testBrushCopyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushCopyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0201
     * @tc.desc   test for testBrushCopyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushCopyInputDestroyed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0202
     * @tc.desc   test for testBrushCopyInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0202', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushCopyMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0203
     * @tc.desc   test for testBrushCopyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0203', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushDestroyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0300
     * @tc.desc   test for testBrushDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushDestroyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0301
     * @tc.desc   test for testBrushDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushIsAntiAliasNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0400
     * @tc.desc   test for testBrushIsAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushAntiAlias(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushIsAntiAliasNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0401
     * @tc.desc   test for testBrushIsAntiAliasNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAntiAlias(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAntiAliasNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0500
     * @tc.desc   test for testBrushSetAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushAntiAlias(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAntiAliasNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0501
     * @tc.desc   test for testBrushSetAntiAliasNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAntiAlias(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetColorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0600
     * @tc.desc   Test for testBrushGetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushColor(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetColorNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0601
     * @tc.desc   Test for testBrushGetColorNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushColor(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0700
     * @tc.desc   Test for testBrushSetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushColor(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColorNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0701
     * @tc.desc   Test for testBrushSetColorNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0701', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushColor(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColorAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0702
     * @tc.desc   Test for testBrushSetColorAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0702', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushColor(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColorMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0703
     * @tc.desc   Test for testBrushSetColorMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0703', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushColor(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetAlphaNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0800
     * @tc.desc   Test for testBrushGetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushAlpha(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetAlphaNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0801
     * @tc.desc   Test for testBrushGetAlphaNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0801', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAlpha(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAlphaNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0900
     * @tc.desc   Test for testBrushSetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushAlpha(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAlphaNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0901
     * @tc.desc   Test for testBrushSetAlphaNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0901', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAlpha(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAlphaAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0902
     * @tc.desc   Test for testBrushSetAlphaAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0902', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAlpha(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAlphaMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0903
     * @tc.desc   Test for testBrushSetAlphaMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0903', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAlpha(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetShaderEffectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1000
     * @tc.desc   Test for testBrushSetShaderEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushShaderEffect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetShaderEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1001
     * @tc.desc   Test for testBrushSetShaderEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1001', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushShaderEffect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetShadowLayerNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1100
     * @tc.desc   Test for testBrushSetShadowLayerNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushShadowLayer(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetShadowLayerNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1101
     * @tc.desc   Test for testBrushSetShadowLayerNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushShadowLayer(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetFilterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1200
     * @tc.desc   Test for testBrushSetFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetFilterNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1201
     * @tc.desc   Test for testBrushSetFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetFilterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1300
     * @tc.desc   Test for testBrushGetFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushFilter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetFilterNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1301
     * @tc.desc   Test for testBrushGetFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushFilter(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetBlendModeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1400
     * @tc.desc   Test for testBrushSetBlendModeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushBlendMode(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetBlendModeNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1401
     * @tc.desc   Test for testBrushSetBlendModeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushBlendMode(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushResetNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1500
     * @tc.desc   Test for testBrushResetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushReset(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushResetNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1501
     * @tc.desc   Test for testBrushResetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushReset(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetAlphaFloatNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1600
     * @tc.desc   Test for testBrushGetAlphaFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1600', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetAlphaFloatAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1601
     * @tc.desc   Test for testBrushGetAlphaFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetRedFloatNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1700
     * @tc.desc   Test for testBrushGetRedFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1700', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetRedFloatAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1701
     * @tc.desc   Test for testBrushGetRedFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1701', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetGreenFloatNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1800
     * @tc.desc   Test for testBrushGetGreenFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1800', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetGreenFloatAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1801
     * @tc.desc   Test for testBrushGetGreenFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1801', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetBlueFloatNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1900
     * @tc.desc   Test for testBrushGetBlueFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1900', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetBlueFloatAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1901
     * @tc.desc   Test for testBrushGetBlueFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1901', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColor4fNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_2000
     * @tc.desc   Test for testBrushSetColor4fNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_2000', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingBrushSetColor4f(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColor4fNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_2001
     * @tc.desc   Test for testBrushSetColor4fNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_2001', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushSetColor4f(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColor4fAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_2002
     * @tc.desc   Test for testBrushSetColor4fAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_2002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushSetColor4f(2);
      expect(result).assertEqual(0);
    })
  })
}