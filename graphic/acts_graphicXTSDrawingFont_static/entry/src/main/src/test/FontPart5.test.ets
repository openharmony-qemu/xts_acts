'use static';
/*
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';
import buffer from '@ohos.buffer';

export default function DrawingTsFontPart5Test(): void {
  describe('DrawingTsFontPart5Test', () => {
    let FontGetWidthsGlyphs: Array<int> = [];
    let FontGetWidthsLimit = 3000 * 3000;
    beforeAll(() => {
      let font = new drawing.Font();
      font.setSize(20);
      let sampleText = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      let baseGlyphs: int[] | undefined = font.textToGlyphs(sampleText);
      console.info(' beforeAll FontGetWidthsGlyphs array create begin ');
      if (baseGlyphs && baseGlyphs.length > 0) {
        let baseLength = baseGlyphs.length;
        console.info(' beforeAll baseLength: ' + baseLength);
        for (let i = 0; i < FontGetWidthsLimit; i++) {
          FontGetWidthsGlyphs.push(baseGlyphs[i % baseLength]);
        }
        console.info(' beforeAll FontGetWidthsGlyphs array created via textToGlyphs, length: ' + FontGetWidthsGlyphs.length);
      } else {
        for (let i = 0; i < 1000; i++) {
          FontGetWidthsGlyphs.push(i);
        }
        console.info(' beforeAll FontGetWidthsGlyphs array created with fallback, length: ' + FontGetWidthsGlyphs.length);
      }
      console.info(' beforeAll FontGetWidthsGlyphs array create end ');
    })
    /**
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesNormal2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_0100
     * @tc.desc   Test measureSingleCharacterWithFeatures with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureSingleCharacterWithFeaturesNormal2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesNormal2Static';
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
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesEmptyArrayStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_0200
     * @tc.desc   Test measureSingleCharacterWithFeatures with empty FontFeature array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureSingleCharacterWithFeaturesEmptyArrayStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesEmptyArrayStatic';
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
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesMultipleFeaturesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_0300
     * @tc.desc   Test measureSingleCharacterWithFeatures with multiple FontFeatures.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontMeasureSingleCharacterWithFeaturesMultipleFeaturesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesMultipleFeaturesStatic';
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
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesInvalidTextStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_0400
     * @tc.desc   Test measureSingleCharacterWithFeatures with invalid text (length > 1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontMeasureSingleCharacterWithFeaturesInvalidTextStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesInvalidTextStatic';
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
     * @tc.name   testFontSetEdgingAllEnumsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_0600
     * @tc.desc   Test setEdging with all FontEdging enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetEdgingAllEnumsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontSetEdgingAllEnumsStatic';
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
     * @tc.name   testFontSetHintingAllEnumsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_0700
     * @tc.desc   Test setHinting with all FontHinting enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetHintingAllEnumsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontSetHintingAllEnumsStatic';
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
     * @tc.name   testFontSetSizeBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_0800
     * @tc.desc   Test setSize with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontSetSizeBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontSetSizeBoundaryValueStatic';
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
     * @tc.name   testFontSetScaleXBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_0900
     * @tc.desc   Test setScaleX with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontSetScaleXBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontSetScaleXBoundaryValueStatic';
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
     * @tc.name   testFontSetSkewXBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_1000
     * @tc.desc   Test setSkewX with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontSetSkewXBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontSetSkewXBoundaryValueStatic';
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
     * @tc.name   testFontBooleanPropertiesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_1100
     * @tc.desc   Test Font boolean properties enable/disable and get methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontBooleanPropertiesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontBooleanPropertiesStatic';
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
     * @tc.name   testFontGetWidthsNormal2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_1200
     * @tc.desc   Test getWidths with normal glyphs array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetWidthsNormal2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontGetWidthsNormal2Static';
      let font = new drawing.Font();
      font.setSize(20);
      let text = 'hello';

      try {
        let glyphs: int[] | undefined = font.textToGlyphs(text);
        if (glyphs) {
          let widths: number[] | undefined = font.getWidths(glyphs);
          if (widths) {
            expect(widths.length === glyphs.length).assertTrue();
            expect(widths.length > 0).assertTrue();
            for (let i = 0; i < widths.length; i++) {
              expect(typeof widths[i] === 'number').assertTrue();
              expect(widths[i] >= 0).assertTrue();
            }
            console.info(msg + ' getWidths succeeded, widths length: ' + widths.length);
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontCreatePathForGlyphInvalidIndexStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_1700
     * @tc.desc   Test createPathForGlyph with invalid glyph index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontCreatePathForGlyphInvalidIndexStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontCreatePathForGlyphInvalidIndexStatic';
      let font = new drawing.Font();
      font.setSize(50);

      try {
        let path: drawing.Path | undefined = font.createPathForGlyph(-1);
        console.info(msg + ' createPathForGlyph with -1 succeeded');
        expect(path == undefined).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
      try {
        let path: drawing.Path | undefined = font.createPathForGlyph(-10);
        console.info(msg + ' createPathForGlyph with -10 succeeded');
        expect(path == undefined).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_1800
     * @tc.desc   Test getTextPath with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontGetTextPathNormalStatic';
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
     * @tc.name   testFontGetTextPathEmptyTextStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_1900
     * @tc.desc   Test getTextPath with empty text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontGetTextPathEmptyTextStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontGetTextPathEmptyTextStatic';
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
     * @tc.name   testFontCountTextNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_2200
     * @tc.desc   Test countText with normal text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontCountTextNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontCountTextNormalStatic';
      let font = new drawing.Font();
      let text = 'ABCDE';

      try {
        let count = font.countText(text);
        console.info(msg + ' countText succeeded, count: ' + count);
        console.info(msg + ' countText succeeded, typeof count: ' + typeof count);
        expect(typeof count === 'int').assertTrue();
        expect(count === 5).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontCountTextEmptyTextStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_2300
     * @tc.desc   Test countText with empty text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontCountTextEmptyTextStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontCountTextEmptyTextStatic';
      let font = new drawing.Font();
      let text = '';

      try {
        let count = font.countText(text);
        console.info(msg + ' countText with empty text succeeded, count: ' + count);
        console.info(msg + ' countText with empty text succeeded, typeof count: ' + typeof count);
        expect(typeof count === 'int').assertTrue();
        expect(count === 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontMeasureTextAllEncodingsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_2400
     * @tc.desc   Test measureText with all TextEncoding enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureTextAllEncodingsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontMeasureTextAllEncodingsStatic';
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
     * @tc.name   testFontMeasureTextEmptyStringStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_2500
     * @tc.desc   Test measureText with empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontMeasureTextEmptyStringStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontMeasureTextEmptyStringStatic';
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
     * @tc.name   testFontCombinedOperationsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_2600
     * @tc.desc   Test combined Font operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFontCombinedOperationsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testFontCombinedOperationsStatic';
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

    /**
     * @tc.name   testFontGetWidthsBelowLimitStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_2700
     * @tc.desc   Test getWidths with glyphs array length below the limit (3000*3000).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetWidthsBelowLimitStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontGetWidthsBelowLimitStatic';
      let font = new drawing.Font();
      font.setSize(20);
      let testLength = 1000;

      try {
        let sampleText = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        let baseGlyphs: int[] | undefined = font.textToGlyphs(sampleText);
        let glyphs: Array<int> = [];
        if (baseGlyphs && baseGlyphs.length > 0) {
          let baseLength = baseGlyphs.length;
          console.info(msg + ' baseLength: ' + baseLength);
          for (let i = 0; i < testLength; i++) {
            glyphs.push(baseGlyphs[i % baseLength]);
          }
          console.info(msg + ' glyphs array created via textToGlyphs, length: ' + glyphs.length);
        } else {
          for (let i = 0; i < testLength; i++) {
            glyphs.push(i);
          }
          console.info(msg + ' glyphs array created with fallback, length: ' + glyphs.length);
        }

        let widths: Array<number> | undefined = font.getWidths(glyphs);
        if (widths) {
          expect(widths.length === testLength).assertTrue();
          console.info(msg + ' getWidths succeeded, widths length: ' + widths.length);
        } else {
          console.info(msg + ' getWidths returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontGetBoundsBelowLimitStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_3000
     * @tc.desc   Test getBounds with glyphs array length below the limit (3000*3000).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetBoundsBelowLimitStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontGetBoundsBelowLimitStatic';
      let font = new drawing.Font();
      font.setSize(20);
      let testLength = 1000;

      try {
        let sampleText = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        let baseGlyphs: int[] | undefined = font.textToGlyphs(sampleText);
        let glyphs: Array<int> = [];
        if (baseGlyphs && baseGlyphs.length > 0) {
          let baseLength = baseGlyphs.length;
          console.info(msg + ' baseLength: ' + baseLength);
          for (let i = 0; i < testLength; i++) {
            glyphs.push(baseGlyphs[i % baseLength]);
          }
          console.info(msg + ' glyphs array created via textToGlyphs, length: ' + glyphs.length);
        } else {
          for (let i = 0; i < testLength; i++) {
            glyphs.push(i);
          }
          console.info(msg + ' glyphs array created with fallback, length: ' + glyphs.length);
        }

        let bounds: Array<common2D.Rect> | undefined = font.getBounds(glyphs);
        if (bounds) {
          expect(bounds.length === testLength).assertTrue();
          console.info(msg + ' getBounds succeeded, bounds length: ' + bounds.length);
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetWidthsAtLimitStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_2800
     * @tc.desc   Test getWidths with glyphs array length equal to the limit (3000*3000).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetWidthsAtLimitStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontGetWidthsAtLimitStatic';
      let font = new drawing.Font();
      font.setSize(20);
      let limit = 3000 * 3000;
      try {
        console.info(msg + ' getWidths begin ');
        console.info(msg + ' FontGetWidthsGlyphs array created, length: ' + FontGetWidthsGlyphs.length);
        let widths: Array<number> | undefined = font.getWidths(FontGetWidthsGlyphs);
        console.info(msg + ' getWidths end ');
        if (widths) {
          expect(widths.length === limit).assertTrue();
          console.info(msg + ' getWidths succeeded, widths length: ' + widths.length);
        } else {
          console.info(msg + ' getWidths returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontGetBoundsAtLimitStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_3100
     * @tc.desc   Test getBounds with glyphs array length equal to the limit (3000*3000).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetBoundsAtLimitStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontGetBoundsAtLimitStatic';
      let font = new drawing.Font();
      font.setSize(20);
      let limit = 3000 * 3000;

      try {
        console.info(msg + ' glyphs array created, length: ' + FontGetWidthsGlyphs.length);
        let bounds: Array<common2D.Rect> | undefined = font.getBounds(FontGetWidthsGlyphs);
        if (bounds) {
          expect(bounds.length === limit).assertTrue();
          console.info(msg + ' getBounds succeeded, bounds length: ' + bounds.length);
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetWidthsOverLimitStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_2900
     * @tc.desc   Test getWidths with glyphs array length over the limit (3000*3000+1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontGetWidthsOverLimitStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontGetWidthsOverLimitStatic';
      let font = new drawing.Font();
      font.setSize(20);
      let sampleText = 'abcd';
      let baseGlyphs: int[] | undefined = font.textToGlyphs(sampleText);
      if (baseGlyphs && baseGlyphs.length > 0) {
        FontGetWidthsGlyphs.push(baseGlyphs[0]);
      }
      try {
        console.info(msg + ' FontGetWidthsGlyphs array created, length: ' + FontGetWidthsGlyphs.length);
        let widths: Array<number> | undefined = font.getWidths(FontGetWidthsGlyphs);
        if (widths == undefined) {
          console.info(msg + ' getWidths returned undefined as expected for over limit');
        } else {
          console.info(msg + ' getWidths returned non-undefined, but expected undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetBoundsOverLimitStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_3200
     * @tc.desc   Test getBounds with glyphs array length over the limit (3000*3000+1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontGetBoundsOverLimitStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontGetBoundsOverLimitStatic';
      let font = new drawing.Font();
      font.setSize(20);
      try {
        console.info(msg + ' FontGetWidthsGlyphs array created, length: ' + FontGetWidthsGlyphs.length);
        let bounds: Array<common2D.Rect> | undefined = font.getBounds(FontGetWidthsGlyphs);
        if (bounds == undefined) {
          console.info(msg + ' getBounds returned undefined as expected for over limit');
        } else {
          console.info(msg + ' getBounds returned non-undefined, but expected undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontGetWidthsLessLimitStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_3300
     * @tc.desc   Test getWidths with glyphs array length over the limit (3000*3000-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontGetWidthsLessLimitStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontGetWidthsLessLimitStatic';
      let font = new drawing.Font();
      font.setSize(20);
      FontGetWidthsGlyphs.splice(0, 2);
      try {
        console.info(msg + ' FontGetWidthsGlyphs array created, length: ' + FontGetWidthsGlyphs.length);
        let widths: Array<number> | undefined = font.getWidths(FontGetWidthsGlyphs);
        if (widths) {
          expect(widths.length === FontGetWidthsGlyphs.length).assertTrue();
          console.info(msg + ' getWidths returned undefined as expected for less limit');
        } else {
          console.info(msg + ' getWidths returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontGetBoundsLessLimitStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_Font_STATIC_3400
     * @tc.desc   Test getBounds with glyphs array length over the limit (3000*3000-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontGetBoundsLessLimitStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontGetBoundsLessLimitStatic';
      let font = new drawing.Font();
      font.setSize(20);
      try {
        console.info(msg + ' FontGetWidthsGlyphs array created, length: ' + FontGetWidthsGlyphs.length);
        let bounds: Array<common2D.Rect> | undefined = font.getBounds(FontGetWidthsGlyphs);
        if (bounds) {
          console.info(msg + ' getBounds returned undefined as expected for less limit');
          expect(bounds.length === FontGetWidthsGlyphs.length).assertTrue();
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
  });
}