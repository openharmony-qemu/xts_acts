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


export default function DrawingNativeFontTest() {
  describe('DrawingNativeFontTest', () => {
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
     * @tc.name   testFontCreateDestroyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0100
     * @tc.desc   Test for creating and destroying a font object with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontCreateDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontCreateDestroyNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0101
     * @tc.desc   test for testFontCreateDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCreateDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontCreateDestroyMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0102
     * @tc.desc   test for testFontCreateDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0102', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCreateDestroy(2);
      expect(result).assertEqual(0);
    })

    // Font SetBaselineSnap related test cases
    /**
     * @tc.name   testFontSetBaselineSnapNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0200
     * @tc.desc   test for testFontSetBaselineSnapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetBaselineSnapNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0201
     * @tc.desc   test for testFontSetBaselineSnapNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetBaselineSnapMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0202
     * @tc.desc   test for testFontSetBaselineSnapMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0202', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsBaselineSnapWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0203
     * @tc.desc   test for testFontIsBaselineSnapWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0203', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(3);
      expect(result).assertEqual(0);
    })

    // Font SetSubpixel related test cases
    /**
     * @tc.name   testFontSetSubpixelNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0300
     * @tc.desc   test for testFontSetSubpixelNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetSubpixelNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0301
     * @tc.desc   test for testFontSetSubpixelNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetSubpixelMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0302
     * @tc.desc   test for testFontSetSubpixelMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0302', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsSubpixelWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0303
     * @tc.desc   test for testFontIsSubpixelWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0303', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(3);
      expect(result).assertEqual(0);
    })

    // Font SetForceAutoHinting related test cases
    /**
     * @tc.name   testFontSetForceAutoHintingNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0400
     * @tc.desc   test for testFontSetForceAutoHintingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetForceAutoHintingNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0401
     * @tc.desc   test for testFontSetForceAutoHintingNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetForceAutoHintingMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0402
     * @tc.desc   test for testFontSetForceAutoHintingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0402', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsForceAutoHintingWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0403
     * @tc.desc   test for testFontIsForceAutoHintingWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0403', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(3);
      expect(result).assertEqual(0);
    })

    // Font SetTypeface related test cases
    /**
     * @tc.name   testFontSetTypefaceNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0500
     * @tc.desc   test for testFontSetTypefaceNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTypefaceNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0501
     * @tc.desc   test for testFontSetTypefaceNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTypefaceMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0502
     * @tc.desc   test for testFontSetTypefaceMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetTypefaceWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0503
     * @tc.desc   test for testFontGetTypefaceWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0503', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSizeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0600
     * @tc.desc   test for testFontSetTextSizeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSizeNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0601
     * @tc.desc   test for testFontSetTextSizeNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSizeMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0602
     * @tc.desc   test for testFontSetTextSizeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0602', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetTextSizeWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0603
     * @tc.desc   test for testFontGetTextSizeWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0603', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSizeAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0604
     * @tc.desc   test for testFontSetTextSizeAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0604', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(4);
      expect(result).assertEqual(0);
    })

    // Font CountText related test cases
    /**
     * @tc.name   testFontCountTextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0700
     * @tc.desc   test for testFontCountTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontCountText(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontCountTextNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0701
     * @tc.desc   test for testFontCountTextNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0701', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCountText(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontCountTextMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0702
     * @tc.desc   test for testFontCountTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0702', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCountText(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontCountTextAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0703
     * @tc.desc   test for testFontCountTextAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0703', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCountText(3);
      expect(result).assertEqual(0);
    })

    // Font TextToGlyphs related test cases
    /**
     * @tc.name   testFontTextToGlyphsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0800
     * @tc.desc   test for testFontTextToGlyphsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontTextToGlyphsNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0801
     * @tc.desc   test for testFontTextToGlyphsNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0801', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontTextToGlyphsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0802
     * @tc.desc   test for testFontTextToGlyphsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0802', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontTextToGlyphsAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0803
     * @tc.desc   test for testFontTextToGlyphsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0803', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontTextToGlyphsMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0804
     * @tc.desc   test for testFontTextToGlyphsMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0804', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(4);
      expect(result).assertEqual(0);
    })

    // Font GetWidths related test cases
    /**
     * @tc.name   testFontGetWidthsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0900
     * @tc.desc   test for testFontGetWidthsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetWidths(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0901
     * @tc.desc   test for testFontGetWidthsNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0901', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0902
     * @tc.desc   test for testFontGetWidthsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0902', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0903
     * @tc.desc   test for testFontGetWidthsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0903', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0904
     * @tc.desc   test for testFontGetWidthsMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0904', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(4);
      expect(result).assertEqual(0);
    })

    // Font SetLinearText related test cases
    /**
     * @tc.name   testFontSetLinearTextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1000
     * @tc.desc   test for testFontSetLinearTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetLinearTextNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1001
     * @tc.desc   test for testFontSetLinearTextNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1001', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetLinearTextMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1002
     * @tc.desc   test for testFontSetLinearTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsLinearTextWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1003
     * @tc.desc   test for testFontIsLinearTextWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1003', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(3);
      expect(result).assertEqual(0);
    })

    // Font SetTextSkewX related test cases
    /**
     * @tc.name   testFontSetTextSkewXNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1100
     * @tc.desc   test for testFontSetTextSkewXNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSkewXNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1101
     * @tc.desc   test for testFontSetTextSkewXNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSkewXMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1102
     * @tc.desc   test for testFontSetTextSkewXMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1102', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetTextSkewXWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1103
     * @tc.desc   test for testFontGetTextSkewXWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1103', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSkewXAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1104
     * @tc.desc   test for testFontSetTextSkewXAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1104', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSkewXMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1105
     * @tc.desc   test for testFontSetTextSkewXMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1105', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(5);
      expect(result).assertEqual(0);
    })

    // Font SetFakeBoldText related test cases
    /**
     * @tc.name   testFontSetFakeBoldTextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1200
     * @tc.desc   test for testFontSetFakeBoldTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetFakeBoldTextNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1201
     * @tc.desc   test for testFontSetFakeBoldTextNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetFakeBoldTextMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1202
     * @tc.desc   test for testFontSetFakeBoldTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1202', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsFakeBoldTextWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1203
     * @tc.desc   test for testFontIsFakeBoldTextWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1203', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(3);
      expect(result).assertEqual(0);
    })

    // Font SetScaleX related test cases
    /**
     * @tc.name   testFontSetScaleXNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1300
     * @tc.desc   test for testFontSetScaleXNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetScaleXNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1301
     * @tc.desc   test for testFontSetScaleXNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetScaleXMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1302
     * @tc.desc   test for testFontSetScaleXMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1302', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetScaleXWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1303
     * @tc.desc   test for testFontGetScaleXWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1303', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetScaleXAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1304
     * @tc.desc   test for testFontSetScaleXAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1304', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetScaleXMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1305
     * @tc.desc   test for testFontSetScaleXMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1305', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(5);
      expect(result).assertEqual(0);
    })

    // Font SetHinting related test cases
    /**
     * @tc.name   testFontSetHintingNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1400
     * @tc.desc   test for testFontSetHintingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetHinting(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetHintingNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1401
     * @tc.desc   test for testFontSetHintingNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetHinting(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetHintingMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1402
     * @tc.desc   test for testFontSetHintingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1402', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetHinting(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetHintingWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1403
     * @tc.desc   test for testFontGetHintingWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1403', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetHinting(3);
      expect(result).assertEqual(0);
    })

    // Font SetEmbeddedBitmaps related test cases
    /**
     * @tc.name   testFontSetEmbeddedBitmapsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1500
     * @tc.desc   test for testFontSetEmbeddedBitmapsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetEmbeddedBitmapsNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1501
     * @tc.desc   test for testFontSetEmbeddedBitmapsNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetEmbeddedBitmapsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1502
     * @tc.desc   test for testFontSetEmbeddedBitmapsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsEmbeddedBitmapsWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1503
     * @tc.desc   test for testFontIsEmbeddedBitmapsWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1503', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(3);
      expect(result).assertEqual(0);
    })

    // Font SetEdging related test cases
    /**
     * @tc.name   testFontSetEdgingNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1600
     * @tc.desc   test for testFontSetEdgingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetEdging(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetEdgingNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1601
     * @tc.desc   test for testFontSetEdgingNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEdging(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetEdgingMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1602
     * @tc.desc   test for testFontSetEdgingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1602', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEdging(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetEdgingWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1603
     * @tc.desc   test for testFontGetEdgingWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1603', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEdging(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetMetricsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1700
     * @tc.desc   test for testFontGetMetricsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetMetrics(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetMetricsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1701
     * @tc.desc   test for testFontGetMetricsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1701', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetMetrics(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TestFontGetMetricsMultiplies
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1702
     * @tc.desc   test for TestFontGetMetricsMultiplies.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1702', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetMetrics(2);
      expect(result).assertEqual(0);
    })

    // Font MeasureSingleCharacter related test cases
    /**
     * @tc.name   testFontMeasureSingleCharacterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1800
     * @tc.desc   test for testFontMeasureSingleCharacterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureSingleCharacterNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1801
     * @tc.desc   test for testFontMeasureSingleCharacterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1801', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureSingleCharacterMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1802
     * @tc.desc   test for testFontMeasureSingleCharacterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1802', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureSingleCharacterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1803
     * @tc.desc   test for testFontMeasureSingleCharacterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1803', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(3);
      expect(result).assertEqual(0);
    })

    // Font Measuretext related test cases
    /**
     * @tc.name   testFontMeasuretextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1900
     * @tc.desc   test for testFontMeasuretextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasuretext(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasuretextNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1901
     * @tc.desc   test for testFontMeasuretextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1901', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasuretext(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasuretextMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1902
     * @tc.desc   test for testFontMeasuretextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1902', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasuretext(2);
      expect(result).assertEqual(0);
    })

    // FontArguments Create related test cases
    /**
     * @tc.name   testFontArgumentsCreateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2000
     * @tc.desc   Test for testFontArgumentsCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsCreate(0);
      expect(result).assertEqual(0);
    })

    // FontArguments AddVariation related test cases
    /**
     * @tc.name   testFontArgumentsAddVariationNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2100
     * @tc.desc   test for testFontArgumentsAddVariationNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontArgumentsAddVariationNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2101
     * @tc.desc   test for testFontArgumentsAddVariationNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontArgumentsAddVariationAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2102
     * @tc.desc   test for testFontArgumentsAddVariationAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2102', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontArgumentsAddVariationMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2103
     * @tc.desc   test for testFontArgumentsAddVariationMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2103', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(3);
      expect(result).assertEqual(0);
    })

    // FontArguments Destroy related test cases
    /**
     * @tc.name   testFontArgumentsDestoryNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2200
     * @tc.desc   test for testFontArgumentsDestoryNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontArgumentsDestoryNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2201
     * @tc.desc   test for testFontArgumentsDestoryNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2201', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontArgumentsDestoryMultiplieCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2202
     * @tc.desc   test for testFontArgumentsDestoryMultiplieCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2202', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsDestroy(2);
      expect(result).assertEqual(0);
    })

    // Font SetThemeFontFollowed related test cases
    /**
     * @tc.name   testFontSetThemeFontFollowedNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2300
     * @tc.desc   test for testFontSetThemeFontFollowedNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetThemeFontFollowed(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetThemeFontFollowedMuitipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2301
     * @tc.desc   test for testFontSetThemeFontFollowedMuitipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2301', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetThemeFontFollowed(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetThemeFontFollowedNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2302
     * @tc.desc   test for testFontSetThemeFontFollowedNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2302', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetThemeFontFollowed(2);
      expect(result).assertEqual(0);
    })

    // Font IsThemeFontFollowed related test cases
    /**
     * @tc.name   testFontIsThemeFontFollowedNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2400
     * @tc.desc   test for testFontIsThemeFontFollowedNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontIsThemeFontFollowed(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsThemeFontFollowedMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2402
     * @tc.desc   test for testFontIsThemeFontFollowedMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2402', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontIsThemeFontFollowed(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsThemeFontFollowedNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2401
     * @tc.desc   test for testFontIsThemeFontFollowedNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2401', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontIsThemeFontFollowed(2);
      expect(result).assertEqual(0);
    })

    // Font MeasureTextWithBrushOrPen related test cases
    /**
     * @tc.name   testFontMeasureTextWithBrushOrPenNormal1
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2600
     * @tc.desc   test for testFontMeasureTextWithBrushOrPenNormal1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureTextWithBrushOrPenNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2601
     * @tc.desc   test for testFontMeasureTextWithBrushOrPenNormal2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2601', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureTextWithBrushOrPenNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2602
     * @tc.desc   test for testFontMeasureTextWithBrushOrPenNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2602', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureTextWithBrushOrPenAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2603
     * @tc.desc   test for testFontMeasureTextWithBrushOrPenAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2603', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureTextWithBrushOrPenMultiCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2604
     * @tc.desc   test for testFontMeasureTextWithBrushOrPenMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2604', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(4);
      expect(result).assertEqual(0);
    })

    // Font GetWidthsBounds related test cases
    /**
     * @tc.name   testFontGetWidthsBoundsNormal1
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2700
     * @tc.desc   test for testFontGetWidthsBoundsNormal1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsBoundsNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2701
     * @tc.desc   test for testFontGetWidthsBoundsNormal2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2701', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsBoundsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2702
     * @tc.desc   test for testFontGetWidthsBoundsNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2702', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsBoundsAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2703
     * @tc.desc   test for testFontGetWidthsBoundsAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2703', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsBoundsMultiCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2704
     * @tc.desc   test for testFontGetWidthsBoundsMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2704', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(4);
      expect(result).assertEqual(0);
    })

    // Font GetPos related test cases
    /**
     * @tc.name   testFontGePosNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2800
     * @tc.desc   test for testFontGePosNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetPos(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetPosNormal1
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2801
     * @tc.desc   test for testFontGetPosNormal1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2801', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetPos(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGePosNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2802
     * @tc.desc   test for testFontGePosNormal2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2802', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetPos(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGePosNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2803
     * @tc.desc   test for testFontGePosNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2803', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetPos(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGePosMultiplieCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2804
     * @tc.desc   test for testFontGePosMultiplieCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2804', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetPos(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGePosAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2805
     * @tc.desc   test for testFontGePosAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2805', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetPos(5);
      expect(result).assertEqual(0);
    })

    // Font GetSpacing related test cases
    /**
     * @tc.name   testFontGeSpacingNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2900
     * @tc.desc   test for testFontGeSpacingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetSpacing(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGeSpacingMultiplieCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2901
     * @tc.desc   test for testFontGeSpacingMultiplieCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2901', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetSpacing(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGeSpacingNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2902
     * @tc.desc   test for testFontGeSpacingNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2902', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetSpacing(2);
      expect(result).assertEqual(0);
    })

    // Font MeasureSingleChaWithFeatures related test cases
    /**
     * @tc.name   testFontMeasureSingleChaWithFeaturesNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3000
     * @tc.desc   test for testFontMeasureSingleChaWithFeaturesNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleChaWithFeatures(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureSingleChaWithFeaturesAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3001
     * @tc.desc   test for testFontMeasureSingleChaWithFeaturesAbNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3001', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleChaWithFeatures(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureSingleChaWithFeaturesCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3002
     * @tc.desc   test for testFontMeasureSingleChaWithFeaturesCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3002', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleChaWithFeatures(2);
      expect(result).assertEqual(0);
    })

    // Font Features related test cases
    /**
     * @tc.name   testFontFeaturesAddFeatureNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3100
     * @tc.desc   test for testFontFeaturesAddFeatureNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3100', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontFeatures(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontFeaturesAddFeatureAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3101
     * @tc.desc   test for testFontFeaturesAddFeatureAbNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontFeatures(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontFeaturesandFeatureDestroyNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3200
     * @tc.desc   test for testFontFeaturesandFeatureDestroyNULL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontFeatures(2);
      expect(result).assertEqual(0);
    })
  })
}