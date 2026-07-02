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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';
import buffer from '@ohos.buffer';

export default function DrawingTsFontPart5Test() {
  describe('DrawingTsFontPart5Test', () => {
    /**
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_0100
     * @tc.desc   Test measureSingleCharacterWithFeatures with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureSingleCharacterWithFeaturesNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesNormal2';
      let font = new drawing.Font();
      font.setSize(20);
      
      try {
        let fontFeatures: Array<drawing.FontFeature> = [];
        fontFeatures.push({name: 'calt', value: 0});
        let width = font.measureSingleCharacterWithFeatures("你", fontFeatures);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        console.info(msg + ' measureSingleCharacterWithFeatures succeeded, width:' + width);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesEmptyArray
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_0200
     * @tc.desc   Test measureSingleCharacterWithFeatures with empty FontFeature array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureSingleCharacterWithFeaturesEmptyArray', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesEmptyArray';
      let font = new drawing.Font();
      font.setSize(20);
      
      try {
        let fontFeatures: Array<drawing.FontFeature> = [];
        let width = font.measureSingleCharacterWithFeatures("A", fontFeatures);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        console.info(msg + ' measureSingleCharacterWithFeatures with empty array succeeded, width:' + width);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesMultipleFeatures
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_0300
     * @tc.desc   Test measureSingleCharacterWithFeatures with multiple FontFeatures.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontMeasureSingleCharacterWithFeaturesMultipleFeatures', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesMultipleFeatures';
      let font = new drawing.Font();
      font.setSize(20);
      
      try {
        let fontFeatures: Array<drawing.FontFeature> = [];
        fontFeatures.push({name: 'calt', value: 0});
        fontFeatures.push({name: 'liga', value: 1});
        fontFeatures.push({name: 'dlig', value: 0});
        let width = font.measureSingleCharacterWithFeatures("B", fontFeatures);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        console.info(msg + ' measureSingleCharacterWithFeatures with multiple features succeeded, width:' + width);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesInvalidText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_0400
     * @tc.desc   Test measureSingleCharacterWithFeatures with invalid text (length > 1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontMeasureSingleCharacterWithFeaturesInvalidText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesInvalidText';
      let font = new drawing.Font();
      font.setSize(20);
      
      try {
        let fontFeatures: Array<drawing.FontFeature> = [];
        fontFeatures.push({name: 'calt', value: 0});
        font.measureSingleCharacterWithFeatures("Hello", fontFeatures);
        console.info(msg + ' measureSingleCharacterWithFeatures with invalid text succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    });
    /**
     * @tc.name   testFontSetEdgingAllEnums
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_0600
     * @tc.desc   Test setEdging with all FontEdging enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetEdgingAllEnums', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontSetEdgingAllEnums';
      let font = new drawing.Font();
      
      const edgingValues = [
        drawing.FontEdging.ALIAS,
        drawing.FontEdging.ANTI_ALIAS,
        drawing.FontEdging.SUBPIXEL_ANTI_ALIAS
      ];

      for (let edging of edgingValues) {
        try {
          font.setEdging(edging);
          let result = font.getEdging();
          expect(result === edging).assertTrue();
          console.info(msg + ` setEdging(${edging}) succeeded, getEdging returned: ${result}`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetHintingAllEnums
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_0700
     * @tc.desc   Test setHinting with all FontHinting enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetHintingAllEnums', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontSetHintingAllEnums';
      let font = new drawing.Font();
      
      const hintingValues = [
        drawing.FontHinting.NONE,
        drawing.FontHinting.SLIGHT,
        drawing.FontHinting.NORMAL,
        drawing.FontHinting.FULL
      ];

      for (let hinting of hintingValues) {
        try {
          font.setHinting(hinting);
          let result = font.getHinting();
          expect(result === hinting).assertTrue();
          console.info(msg + ` setHinting(${hinting}) succeeded, getHinting returned: ${result}`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetSizeBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_0800
     * @tc.desc   Test setSize with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontSetSizeBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontSetSizeBoundaryValue';
      let font = new drawing.Font();
      
      try {
        font.setSize(0);
        let size = font.getSize();
        expect(size === 0).assertTrue();
        console.info(msg + ' setSize(0) succeeded, getSize returned: ' + size);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setSize(-1);
        let size = font.getSize();
        expect(size === 0).assertTrue();
        console.info(msg + ' setSize(-1) succeeded, getSize returned: ' + size);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setSize(Number.MAX_VALUE);
        let size = font.getSize();
        console.info(msg + ' setSize(MAX_VALUE) succeeded, getSize returned: ' + size);
        expect(size === Infinity).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setSize(Number.MIN_VALUE);
        let size = font.getSize();
        console.info(msg + ' setSize(MIN_VALUE) succeeded, getSize returned: ' + size);
        expect(size === 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontSetScaleXBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_0900
     * @tc.desc   Test setScaleX with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontSetScaleXBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontSetScaleXBoundaryValue';
      let font = new drawing.Font();
      
      try {
        font.setScaleX(0);
        let scaleX = font.getScaleX();
        expect(scaleX === 0).assertTrue();
        console.info(msg + ' setScaleX(0) succeeded, getScaleX returned: ' + scaleX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setScaleX(-1);
        let scaleX = font.getScaleX();
        expect(scaleX === -1).assertTrue();
        console.info(msg + ' setScaleX(-1) succeeded, getScaleX returned: ' + scaleX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setScaleX(Number.MAX_VALUE);
        let scaleX = font.getScaleX();
        console.info(msg + ' setScaleX(MAX_VALUE) succeeded, getScaleX returned: ' + scaleX);
        expect(scaleX === Infinity).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
      }
      try {
        font.setScaleX(Number.MIN_VALUE);
        let scaleX = font.getScaleX();
        console.info(msg + ' setScaleX(MIN_VALUE) succeeded, getScaleX returned: ' + scaleX);
        expect(scaleX === 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
      }

      try {
        font.setScaleX(100);
        let scaleX = font.getScaleX();
        expect(scaleX === 100).assertTrue();
        console.info(msg + ' setScaleX(100) succeeded, getScaleX returned: ' + scaleX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontSetSkewXBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_1000
     * @tc.desc   Test setSkewX with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontSetSkewXBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontSetSkewXBoundaryValue';
      let font = new drawing.Font();
      
      try {
        font.setSkewX(0);
        let skewX = font.getSkewX();
        expect(skewX === 0).assertTrue();
        console.info(msg + ' setSkewX(0) succeeded, getSkewX returned: ' + skewX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setSkewX(-1);
        let skewX = font.getSkewX();
        expect(skewX === -1).assertTrue();
        console.info(msg + ' setSkewX(-1) succeeded, getSkewX returned: ' + skewX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setSkewX(1);
        let skewX = font.getSkewX();
        expect(skewX === 1).assertTrue();
        console.info(msg + ' setSkewX(1) succeeded, getSkewX returned: ' + skewX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setSkewX(Number.MAX_VALUE);
        let skewX = font.getSkewX();
        console.info(msg + ' setSkewX(MAX_VALUE) succeeded, getSkewX returned: ' + skewX);
        expect(skewX === Infinity).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
      try {
        font.setSkewX(Number.MIN_VALUE);
        let skewX = font.getSkewX();
        console.info(msg + ' setSkewX(MIN_VALUE) succeeded, getSkewX returned: ' + skewX);
        expect(skewX === 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontBooleanProperties
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_1100
     * @tc.desc   Test Font boolean properties enable/disable and get methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontBooleanProperties', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontBooleanProperties';
      let font = new drawing.Font();
      
      try {
        font.enableSubpixel(true);
        expect(font.isSubpixel()).assertTrue();
        console.info(msg + ' enableSubpixel(true) succeeded');
        
        font.enableSubpixel(false);
        expect(font.isSubpixel()).assertFalse();
        console.info(msg + ' enableSubpixel(false) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.enableEmbolden(true);
        expect(font.isEmbolden()).assertTrue();
        console.info(msg + ' enableEmbolden(true) succeeded');
        
        font.enableEmbolden(false);
        expect(font.isEmbolden()).assertFalse();
        console.info(msg + ' enableEmbolden(false) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.enableLinearMetrics(true);
        expect(font.isLinearMetrics()).assertTrue();
        console.info(msg + ' enableLinearMetrics(true) succeeded');
        
        font.enableLinearMetrics(false);
        expect(font.isLinearMetrics()).assertFalse();
        console.info(msg + ' enableLinearMetrics(false) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setBaselineSnap(true);
        expect(font.isBaselineSnap()).assertTrue();
        console.info(msg + ' setBaselineSnap(true) succeeded');
        
        font.setBaselineSnap(false);
        expect(font.isBaselineSnap()).assertFalse();
        console.info(msg + ' setBaselineSnap(false) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setEmbeddedBitmaps(true);
        expect(font.isEmbeddedBitmaps()).assertTrue();
        console.info(msg + ' setEmbeddedBitmaps(true) succeeded');
        
        font.setEmbeddedBitmaps(false);
        expect(font.isEmbeddedBitmaps()).assertFalse();
        console.info(msg + ' setEmbeddedBitmaps(false) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setForceAutoHinting(true);
        expect(font.isForceAutoHinting()).assertTrue();
        console.info(msg + ' setForceAutoHinting(true) succeeded');
        
        font.setForceAutoHinting(false);
        expect(font.isForceAutoHinting()).assertFalse();
        console.info(msg + ' setForceAutoHinting(false) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setThemeFontFollowed(true);
        expect(font.isThemeFontFollowed()).assertTrue();
        console.info(msg + ' setThemeFontFollowed(true) succeeded');
        
        font.setThemeFontFollowed(false);
        expect(font.isThemeFontFollowed()).assertFalse();
        console.info(msg + ' setThemeFontFollowed(false) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetWidthsNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_1200
     * @tc.desc   Test getWidths with normal glyphs array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetWidthsNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontGetWidthsNormal2';
      let font = new drawing.Font();
      font.setSize(20);
      let text = 'hello';
      
      try {
        let glyphs = font.textToGlyphs(text);
        let widths = font.getWidths(glyphs);
        expect(widths.length === glyphs.length).assertTrue();
        expect(widths.length > 0).assertTrue();
        for (let i = 0; i < widths.length; i++) {
          expect(typeof widths[i] === 'number').assertTrue();
          expect(widths[i] >= 0).assertTrue();
        }
        console.info(msg + ' getWidths succeeded, widths length: ' + widths.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontCreatePathForGlyphInvalidIndex
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_1700
     * @tc.desc   Test createPathForGlyph with invalid glyph index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontCreatePathForGlyphInvalidIndex', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontCreatePathForGlyphInvalidIndex';
      let font = new drawing.Font();
      font.setSize(50);
      
      try {
        let path : drawing.Path =font.createPathForGlyph(-1);
        console.info(msg + ' createPathForGlyph with -1 succeeded');
        expect(path == undefined).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
      try {
        let path : drawing.Path =font.createPathForGlyph(-10);
        console.info(msg + ' createPathForGlyph with -10 succeeded');
        expect(path == undefined).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_1800
     * @tc.desc   Test getTextPath with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontGetTextPathNormal';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      
      try {
        let path = font.getTextPath(myString, length, 0, 100);
        expect(path !== null && path !== undefined).assertTrue();
        console.info(msg + ' getTextPath succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathEmptyText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_1900
     * @tc.desc   Test getTextPath with empty text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontGetTextPathEmptyText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontGetTextPathEmptyText';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "";
      let length = buffer.from(myString).length;
      
      try {
        let path = font.getTextPath(myString, length, 0, 100);
        expect(path !== null && path !== undefined).assertTrue();
        console.info(msg + ' getTextPath with empty text succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontCountTextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_2200
     * @tc.desc   Test countText with normal text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontCountTextNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontCountTextNormal';
      let font = new drawing.Font();
      let text = 'ABCDE';
      
      try {
        let count = font.countText(text);
        expect(typeof count === 'number').assertTrue();
        expect(count === 5).assertTrue();
        console.info(msg + ' countText succeeded, count: ' + count);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontCountTextEmptyText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_2300
     * @tc.desc   Test countText with empty text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontCountTextEmptyText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontCountTextEmptyText';
      let font = new drawing.Font();
      let text = '';
      
      try {
        let count = font.countText(text);
        expect(typeof count === 'number').assertTrue();
        expect(count === 0).assertTrue();
        console.info(msg + ' countText with empty text succeeded, count: ' + count);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontMeasureTextAllEncodings
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_2400
     * @tc.desc   Test measureText with all TextEncoding enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureTextAllEncodings', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontMeasureTextAllEncodings';
      let font = new drawing.Font();
      font.setSize(20);
      
      const encodings = [
        drawing.TextEncoding.TEXT_ENCODING_UTF8,
        drawing.TextEncoding.TEXT_ENCODING_UTF16,
        drawing.TextEncoding.TEXT_ENCODING_UTF32,
        drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID
      ];

      for (let encoding of encodings) {
        try {
          let width = font.measureText("drawing", encoding);
          expect(typeof width === 'number').assertTrue();
          expect(width >= 0).assertTrue();
          console.info(msg + ` measureText with encoding(${encoding}) succeeded, width: ${width}`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontMeasureTextEmptyString
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_2500
     * @tc.desc   Test measureText with empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontMeasureTextEmptyString', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontMeasureTextEmptyString';
      let font = new drawing.Font();
      font.setSize(20);
      
      try {
        let width = font.measureText("", drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(typeof width === 'number').assertTrue();
        expect(width === 0).assertTrue();
        console.info(msg + ' measureText with empty string succeeded, width: ' + width);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontCombinedOperations
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_2600
     * @tc.desc   Test combined Font operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontCombinedOperations', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontCombinedOperations';
      let font = new drawing.Font();
      
      try {
        font.setSize(30);
        font.setScaleX(2);
        font.setSkewX(0.5);
        font.enableSubpixel(true);
        font.enableEmbolden(true);
        font.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        font.setHinting(drawing.FontHinting.FULL);
        font.setBaselineSnap(true);
        font.setTypeface(new drawing.Typeface());
        
        let size = font.getSize();
        expect(size === 30).assertTrue();
        
        let scaleX = font.getScaleX();
        expect(scaleX === 2).assertTrue();
        
        let skewX = font.getSkewX();
        expect(skewX === 0.5).assertTrue();
        
        expect(font.isSubpixel()).assertTrue();
        expect(font.isEmbolden()).assertTrue();
        expect(font.getEdging()).assertEqual(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.FULL);
        expect(font.isBaselineSnap()).assertTrue();
        
        let metrics = font.getMetrics();
        expect(metrics !== null && metrics !== undefined).assertTrue();
        
        let typeface = font.getTypeface();
        expect(typeface !== null && typeface !== undefined).assertTrue();
        
        console.info(msg + ' combined operations succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
  });
}