/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import nativeFunc from 'libnativefunc.so'

export default function TextLayoutManagerWithEncodingTest() {
  describe('TextLayoutManagerWithEncodingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextLayoutManagerWithEncodingTest beforeEach start");
      done();
    })

    // ==================== GetGlyphRangeForCharacterRangeWithEncoding ====================

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_MANAGER_0100
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_MANAGER_0100
     * @tc.desc   Test GetGlyphRangeForCharacterRangeWithEncoding with null layoutManager
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_MANAGER_0100', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_MANAGER_0100 START');
      expect(nativeFunc.GetGlyphRangeForCharacterRangeWithEncodingTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_MANAGER_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_RANGE_0200
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_RANGE_0200
     * @tc.desc   Test GetGlyphRangeForCharacterRangeWithEncoding with null charRange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_RANGE_0200', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_RANGE_0200 START');
      expect(nativeFunc.GetGlyphRangeForCharacterRangeWithEncodingTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_RANGE_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_OUTGLYPH_0300
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_OUTGLYPH_0300
     * @tc.desc   Test GetGlyphRangeForCharacterRangeWithEncoding with null outGlyphRange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_OUTGLYPH_0300', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_OUTGLYPH_0300 START');
      expect(nativeFunc.GetGlyphRangeForCharacterRangeWithEncodingTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_OUTGLYPH_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_ACTUAL_0400
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_ACTUAL_0400
     * @tc.desc   Test GetGlyphRangeForCharacterRangeWithEncoding with null outActualCharRange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_ACTUAL_0400', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_ACTUAL_0400 START');
      expect(nativeFunc.GetGlyphRangeForCharacterRangeWithEncodingTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_ACTUAL_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_UTF8_0500
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_UTF8_0500
     * @tc.desc   Test GetGlyphRangeForCharacterRangeWithEncoding with UTF8 encoding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_UTF8_0500', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_UTF8_0500 START');
      expect(nativeFunc.GetGlyphRangeForCharacterRangeWithEncodingTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_UTF8_0500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_UTF16_0600
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_UTF16_0600
     * @tc.desc   Test GetGlyphRangeForCharacterRangeWithEncoding with UTF16 encoding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_UTF16_0600', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_UTF16_0600 START');
      expect(nativeFunc.GetGlyphRangeForCharacterRangeWithEncodingTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_UTF16_0600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_INVALID_0700
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_INVALID_0700
     * @tc.desc   Test GetGlyphRangeForCharacterRangeWithEncoding with invalid encoding value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_INVALID_0700', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_INVALID_0700 START');
      expect(nativeFunc.GetGlyphRangeForCharacterRangeWithEncodingTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_INVALID_0700 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_ALL_NULL_0800
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_ALL_NULL_0800
     * @tc.desc   Test GetGlyphRangeForCharacterRangeWithEncoding with all params null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_ALL_NULL_0800', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_ALL_NULL_0800 START');
      expect(nativeFunc.GetGlyphRangeForCharacterRangeWithEncodingTest_008()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_ALL_NULL_0800 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_RANGE_VALID_MGR_0900
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_RANGE_VALID_MGR_0900
     * @tc.desc   Test GetGlyphRangeForCharacterRangeWithEncoding with valid layoutManager but null charRange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_RANGE_VALID_MGR_0900', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_RANGE_VALID_MGR_0900 START');
      expect(nativeFunc.GetGlyphRangeForCharacterRangeWithEncodingTest_009()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_ENCODING_NULL_RANGE_VALID_MGR_0900 END');
    });

    // ==================== GetCharacterRangeForGlyphRangeWithEncoding ====================

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_MANAGER_1000
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_MANAGER_1000
     * @tc.desc   Test GetCharacterRangeForGlyphRangeWithEncoding with null layoutManager
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_MANAGER_1000', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_MANAGER_1000 START');
      expect(nativeFunc.GetCharacterRangeForGlyphRangeWithEncodingTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_MANAGER_1000 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_RANGE_1100
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_RANGE_1100
     * @tc.desc   Test GetCharacterRangeForGlyphRangeWithEncoding with null glyphRange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_RANGE_1100', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_RANGE_1100 START');
      expect(nativeFunc.GetCharacterRangeForGlyphRangeWithEncodingTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_RANGE_1100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_OUTCHAR_1200
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_OUTCHAR_1200
     * @tc.desc   Test GetCharacterRangeForGlyphRangeWithEncoding with null outCharRange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_OUTCHAR_1200', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_OUTCHAR_1200 START');
      expect(nativeFunc.GetCharacterRangeForGlyphRangeWithEncodingTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_OUTCHAR_1200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_ACTUAL_1300
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_ACTUAL_1300
     * @tc.desc   Test GetCharacterRangeForGlyphRangeWithEncoding with null outActualGlyphRange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_ACTUAL_1300', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_ACTUAL_1300 START');
      expect(nativeFunc.GetCharacterRangeForGlyphRangeWithEncodingTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_ACTUAL_1300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_UTF8_1400
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_UTF8_1400
     * @tc.desc   Test GetCharacterRangeForGlyphRangeWithEncoding with UTF8 encoding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_UTF8_1400', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_UTF8_1400 START');
      expect(nativeFunc.GetCharacterRangeForGlyphRangeWithEncodingTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_UTF8_1400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_UTF16_1500
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_UTF16_1500
     * @tc.desc   Test GetCharacterRangeForGlyphRangeWithEncoding with UTF16 encoding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_UTF16_1500', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_UTF16_1500 START');
      expect(nativeFunc.GetCharacterRangeForGlyphRangeWithEncodingTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_UTF16_1500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_INVALID_1600
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_INVALID_1600
     * @tc.desc   Test GetCharacterRangeForGlyphRangeWithEncoding with invalid encoding value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_INVALID_1600', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_INVALID_1600 START');
      expect(nativeFunc.GetCharacterRangeForGlyphRangeWithEncodingTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_INVALID_1600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_ALL_NULL_1700
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_ALL_NULL_1700
     * @tc.desc   Test GetCharacterRangeForGlyphRangeWithEncoding with all params null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_ALL_NULL_1700', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_ALL_NULL_1700 START');
      expect(nativeFunc.GetCharacterRangeForGlyphRangeWithEncodingTest_008()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_ALL_NULL_1700 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_RANGE_VALID_MGR_1800
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_RANGE_VALID_MGR_1800
     * @tc.desc   Test GetCharacterRangeForGlyphRangeWithEncoding with valid layoutManager but null glyphRange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_RANGE_VALID_MGR_1800', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_RANGE_VALID_MGR_1800 START');
      expect(nativeFunc.GetCharacterRangeForGlyphRangeWithEncodingTest_009()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_ENCODING_NULL_RANGE_VALID_MGR_1800 END');
    });

    // ==================== GetCharacterPositionAtCoordinateWithEncoding ====================

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_NULL_MANAGER_1900
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_NULL_MANAGER_1900
     * @tc.desc   Test GetCharacterPositionAtCoordinateWithEncoding with null layoutManager
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_NULL_MANAGER_1900', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_NULL_MANAGER_1900 START');
      expect(nativeFunc.GetCharacterPositionAtCoordinateWithEncodingTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_NULL_MANAGER_1900 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_UTF8_2100
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_UTF8_2100
     * @tc.desc   Test GetCharacterPositionAtCoordinateWithEncoding with UTF8 encoding at (0,0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_UTF8_2100', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_UTF8_2100 START');
      expect(nativeFunc.GetCharacterPositionAtCoordinateWithEncodingTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_UTF8_2100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_UTF16_2200
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_UTF16_2200
     * @tc.desc   Test GetCharacterPositionAtCoordinateWithEncoding with UTF16 encoding at (0,0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_UTF16_2200', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_UTF16_2200 START');
      expect(nativeFunc.GetCharacterPositionAtCoordinateWithEncodingTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_UTF16_2200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_INVALID_2300
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_INVALID_2300
     * @tc.desc   Test GetCharacterPositionAtCoordinateWithEncoding with invalid encoding value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_INVALID_2300', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_INVALID_2300 START');
      expect(nativeFunc.GetCharacterPositionAtCoordinateWithEncodingTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_INVALID_2300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_NEGATIVE_COORD_2400
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_NEGATIVE_COORD_2400
     * @tc.desc   Test GetCharacterPositionAtCoordinateWithEncoding with negative coordinates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_NEGATIVE_COORD_2400', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_NEGATIVE_COORD_2400 START');
      expect(nativeFunc.GetCharacterPositionAtCoordinateWithEncodingTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_NEGATIVE_COORD_2400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_LARGE_COORD_2500
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_LARGE_COORD_2500
     * @tc.desc   Test GetCharacterPositionAtCoordinateWithEncoding with large coordinates beyond text bounds
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_LARGE_COORD_2500', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_LARGE_COORD_2500 START');
      expect(nativeFunc.GetCharacterPositionAtCoordinateWithEncodingTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_LARGE_COORD_2500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_ALL_NULL_2600
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_ALL_NULL_2600
     * @tc.desc   Test GetCharacterPositionAtCoordinateWithEncoding with all params null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_ALL_NULL_2600', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_ALL_NULL_2600 START');
      expect(nativeFunc.GetCharacterPositionAtCoordinateWithEncodingTest_008()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_ALL_NULL_2600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_FRACTIONAL_COORD_2700
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_FRACTIONAL_COORD_2700
     * @tc.desc   Test GetCharacterPositionAtCoordinateWithEncoding with fractional coordinates for different DPI
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_FRACTIONAL_COORD_2700', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_FRACTIONAL_COORD_2700 START');
      expect(nativeFunc.GetCharacterPositionAtCoordinateWithEncodingTest_009()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_FRACTIONAL_COORD_2700 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_BOUNDARY_COORD_2800
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_BOUNDARY_COORD_2800
     * @tc.desc   Test GetCharacterPositionAtCoordinateWithEncoding with boundary coordinates for different screen sizes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_BOUNDARY_COORD_2800', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_BOUNDARY_COORD_2800 START');
      expect(nativeFunc.GetCharacterPositionAtCoordinateWithEncodingTest_010()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARPOS_ENCODING_BOUNDARY_COORD_2800 END');
    });
  });
}
