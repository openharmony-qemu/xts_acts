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
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import image from '@ohos.multimedia.image';

export default function DrawingTsFontPart6Test() {
  describe('DrawingTsFontPart6Test', () => {
    let pixelMap: image.PixelMap;

    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: 100, width: 100 }
      }
      pixelMap = await image.createPixelMap(color, opts);
    })
    /**
     * @tc.name   testMeasureTextWithFallbackNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_0100
     * @tc.desc   test measureTextWithFallback with normal English text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMeasureTextWithFallbackNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMeasureTextWithFallbackNormal';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let width = font.measureTextWithFallback('drawing', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureTextWithFallback succeeded, width:' + width);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        expect(Math.abs(width - 186) < 0.01).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackChineseText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_0200
     * @tc.desc   test measureTextWithFallback with Chinese text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMeasureTextWithFallbackChineseText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMeasureTextWithFallbackChineseText';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let width = font.measureTextWithFallback('你好世界', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureTextWithFallback with Chinese text succeeded, width:' + width);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        expect(Math.abs(width - 200) < 0.01).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackMixedText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_0300
     * @tc.desc   test measureTextWithFallback with mixed Chinese and English text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMeasureTextWithFallbackMixedText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMeasureTextWithFallbackMixedText';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let width = font.measureTextWithFallback('Hello你好', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureTextWithFallback with mixed text succeeded, width:' + width);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        expect(Math.abs(width - 218) < 0.5).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackReturnType
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_0400
     * @tc.desc   test measureTextWithFallback return type validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMeasureTextWithFallbackReturnType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMeasureTextWithFallbackReturnType';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let width = font.measureTextWithFallback('drawing', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureTextWithFallback succeeded, width:' + width);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        expect(Math.abs(width - 186) < 0.01).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackEmptyText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_0500
     * @tc.desc   test measureTextWithFallback with empty text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMeasureTextWithFallbackEmptyText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMeasureTextWithFallbackEmptyText';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let width = font.measureTextWithFallback('', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureTextWithFallback with empty text succeeded, width:' + width);
        expect(typeof width === 'number').assertTrue();
        expect(width === 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackLongText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_0600
     * @tc.desc   test measureTextWithFallback with text length about 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMeasureTextWithFallbackLongText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMeasureTextWithFallbackLongText';
      let font = new drawing.Font();
      font.setSize(50);
      let text = 'drawing'.repeat(15);
      console.info(msg + ` text length: ${text.length}`);
      try {
        let width = font.measureTextWithFallback(text, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureTextWithFallback with long text succeeded, width:' + width);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        expect(Math.abs(width - 2790) < 0.5).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackAllEncodings
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_0700
     * @tc.desc   test measureTextWithFallback with all TextEncoding enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMeasureTextWithFallbackAllEncodings', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMeasureTextWithFallbackAllEncodings';
      let font = new drawing.Font();
      font.setSize(50);
      const encodings = [
        drawing.TextEncoding.TEXT_ENCODING_UTF8,
        drawing.TextEncoding.TEXT_ENCODING_UTF16,
        drawing.TextEncoding.TEXT_ENCODING_UTF32,
        drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID
      ];
      for (let encoding of encodings) {
        try {
          let width = font.measureTextWithFallback('drawing', encoding);
          console.info(msg + ` measureTextWithFallback with encoding(${encoding}) succeeded, width: ${width}`);
          expect(typeof width === 'number').assertTrue();
          expect(width >= 0).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackKoreanText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_0800
     * @tc.desc   test measureTextWithFallback with Korean text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMeasureTextWithFallbackKoreanText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMeasureTextWithFallbackKoreanText';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let width = font.measureTextWithFallback('안녕하세요', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureTextWithFallback with Korean text succeeded, width:' + width);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        expect(Math.abs(width - 230) < 1.0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackSpecialCharacters
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_0900
     * @tc.desc   test measureTextWithFallback with special characters and emoji.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMeasureTextWithFallbackSpecialCharacters', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMeasureTextWithFallbackSpecialCharacters';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let width = font.measureTextWithFallback('Hello🌍世界', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureTextWithFallback with special characters succeeded, width:' + width);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        expect(Math.abs(width - 280.39) < 1.0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackTextNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_1000
     * @tc.desc   test measureTextWithFallback with text null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMeasureTextWithFallbackTextNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMeasureTextWithFallbackTextNull';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        font.measureTextWithFallback(null, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureTextWithFallback with null text succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackEncodingNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_1100
     * @tc.desc   test measureTextWithFallback with encoding null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMeasureTextWithFallbackEncodingNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMeasureTextWithFallbackEncodingNull';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        font.measureTextWithFallback('drawing', null);
        console.info(msg + ' measureTextWithFallback with null encoding succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackTextUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_1200
     * @tc.desc   test measureTextWithFallback with text undefined. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMeasureTextWithFallbackTextUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMeasureTextWithFallbackTextUndefined';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        font.measureTextWithFallback(undefined, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureTextWithFallback with undefined text succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackEncodingUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_1300
     * @tc.desc   test measureTextWithFallback with encoding undefined. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMeasureTextWithFallbackEncodingUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMeasureTextWithFallbackEncodingUndefined';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        font.measureTextWithFallback('drawing', undefined);
        console.info(msg + ' measureTextWithFallback with undefined encoding succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackEncodingOutOfRange
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_1400
     * @tc.desc   test measureTextWithFallback with encoding out of range. error code 25900001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMeasureTextWithFallbackEncodingOutOfRange', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMeasureTextWithFallbackEncodingOutOfRange';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        font.measureTextWithFallback('drawing', -1);
        console.info(msg + ' measureTextWithFallback with encoding -1 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackEncodingExceedMax
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_1500
     * @tc.desc   test measureTextWithFallback with encoding exceeding max value. error code 25900001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMeasureTextWithFallbackEncodingExceedMax', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMeasureTextWithFallbackEncodingExceedMax';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        font.measureTextWithFallback('drawing', 8888);
        console.info(msg + ' measureTextWithFallback with encoding 8888 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackDifferentFontSize
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_1600
     * @tc.desc   test measureTextWithFallback with different font sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMeasureTextWithFallbackDifferentFontSize', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMeasureTextWithFallbackDifferentFontSize';
      let font = new drawing.Font();
      try {
        font.setSize(10);
        let width1 = font.measureTextWithFallback('drawing', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ` measureTextWithFallback with size 10 succeeded, width: ${width1}`);
        expect(typeof width1 === 'number').assertTrue();
        expect(width1 >= 0).assertTrue();
        expect(Math.abs(width1 - 37) < 0.5).assertTrue();

        font.setSize(50);
        let width2 = font.measureTextWithFallback('drawing', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ` measureTextWithFallback with size 50 succeeded, width: ${width2}`);
        expect(typeof width2 === 'number').assertTrue();
        expect(width2 >= 0).assertTrue();
        expect(Math.abs(width2 - 186) < 0.01).assertTrue();

        font.setSize(100);
        let width3 = font.measureTextWithFallback('drawing', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ` measureTextWithFallback with size 100 succeeded, width: ${width3}`);
        expect(typeof width3 === 'number').assertTrue();
        expect(width3 >= 0).assertTrue();
        expect(Math.abs(width3 - 374) < 0.5).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_1700
     * @tc.desc   test measureTextWithFallback multiple calls return consistent value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMeasureTextWithFallbackMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMeasureTextWithFallbackMultipleCalls';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let width1 = font.measureTextWithFallback('drawing', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        let width2 = font.measureTextWithFallback('drawing', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        let width3 = font.measureTextWithFallback('drawing', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ` width1: ${width1}, width2: ${width2}, width3: ${width3}`);
        expect(typeof width1 === 'number').assertTrue();
        expect(typeof width2 === 'number').assertTrue();
        expect(typeof width3 === 'number').assertTrue();
        expect(width1 >= 0).assertTrue();
        expect(Math.abs(width1 - 186) < 0.01).assertTrue();
        expect(width1 === width2).assertTrue();
        expect(width2 === width3).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMeasureTextWithFallbackWithTextBlob
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_1800
     * @tc.desc   test measureTextWithFallback with makeFromStringWithFallback joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMeasureTextWithFallbackWithTextBlob', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMeasureTextWithFallbackWithTextBlob';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let width = font.measureTextWithFallback('drawing', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ` measureTextWithFallback succeeded, width: ${width}`);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        expect(Math.abs(width - 186) < 0.01).assertTrue();
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromStringWithFallback('drawing', font);
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
        for (let blob of textBlobs) {
          expect(blob != null && blob != undefined).assertTrue();
          expect(blob.uniqueID() > 0).assertTrue();
        }
        console.info(msg + ' joint call with makeFromStringWithFallback succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_1900
     * @tc.desc   test textToGlyphsWithFallback with normal English text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextToGlyphsWithFallbackNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testTextToGlyphsWithFallbackNormal';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('drawing');
        console.info(msg + ' textToGlyphsWithFallback succeeded, infos length:' + infos.length);
        expect(Array.isArray(infos)).assertTrue();
        expect(infos.length > 0).assertTrue();
        for (let info of infos) {
          expect(info != null && info != undefined).assertTrue();
          expect(info.typeface != null && info.typeface != undefined).assertTrue();
          expect(Array.isArray(info.glyphIds)).assertTrue();
          expect(info.glyphIds.length > 0).assertTrue();
          for (let glyphId of info.glyphIds) {
            expect(typeof glyphId === 'number').assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackChineseText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_2000
     * @tc.desc   test textToGlyphsWithFallback with Chinese text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextToGlyphsWithFallbackChineseText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testTextToGlyphsWithFallbackChineseText';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('你好世界');
        console.info(msg + ' textToGlyphsWithFallback with Chinese text succeeded, infos length:' + infos.length);
        expect(Array.isArray(infos)).assertTrue();
        expect(infos.length > 0).assertTrue();
        for (let info of infos) {
          expect(info != null && info != undefined).assertTrue();
          expect(info.typeface != null && info.typeface != undefined).assertTrue();
          expect(Array.isArray(info.glyphIds)).assertTrue();
          expect(info.glyphIds.length > 0).assertTrue();
          for (let glyphId of info.glyphIds) {
            expect(typeof glyphId === 'number').assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackMixedText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_2100
     * @tc.desc   test textToGlyphsWithFallback with mixed Chinese and English text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextToGlyphsWithFallbackMixedText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testTextToGlyphsWithFallbackMixedText';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('Hello你好World世界');
        console.info(msg + ' textToGlyphsWithFallback with mixed text succeeded, infos length:' + infos.length);
        expect(Array.isArray(infos)).assertTrue();
        expect(infos.length > 0).assertTrue();
        for (let info of infos) {
          expect(info != null && info != undefined).assertTrue();
          expect(info.typeface != null && info.typeface != undefined).assertTrue();
          expect(Array.isArray(info.glyphIds)).assertTrue();
          expect(info.glyphIds.length > 0).assertTrue();
          for (let glyphId of info.glyphIds) {
            expect(typeof glyphId === 'number').assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackReturnType
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_2200
     * @tc.desc   test textToGlyphsWithFallback return type validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextToGlyphsWithFallbackReturnType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTextToGlyphsWithFallbackReturnType';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('drawing');
        console.info(msg + ' textToGlyphsWithFallback succeeded, infos length:' + infos.length);
        expect(Array.isArray(infos)).assertTrue();
        expect(infos.length > 0).assertTrue();
        for (let info of infos) {
          expect(info != null && info != undefined).assertTrue();
          expect(info.typeface != null && info.typeface != undefined).assertTrue();
          expect(Array.isArray(info.glyphIds)).assertTrue();
          expect(info.glyphIds.length > 0).assertTrue();
          for (let glyphId of info.glyphIds) {
            expect(typeof glyphId === 'number').assertTrue();
            expect(glyphId >= 0).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackEmptyText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_2300
     * @tc.desc   test textToGlyphsWithFallback with empty text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextToGlyphsWithFallbackEmptyText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTextToGlyphsWithFallbackEmptyText';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('');
        console.info(msg + ' textToGlyphsWithFallback with empty text succeeded, infos length:' + infos.length);
        expect(Array.isArray(infos)).assertTrue();
        expect(infos.length === 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackLongText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_2400
     * @tc.desc   test textToGlyphsWithFallback with text length about 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextToGlyphsWithFallbackLongText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTextToGlyphsWithFallbackLongText';
      let font = new drawing.Font();
      font.setSize(50);
      let text = 'drawing'.repeat(15);
      console.info(msg + ` text length: ${text.length}`);
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback(text);
        console.info(msg + ' textToGlyphsWithFallback with long text succeeded, infos length:' + infos.length);
        expect(Array.isArray(infos)).assertTrue();
        expect(infos.length > 0).assertTrue();
        for (let info of infos) {
          expect(info != null && info != undefined).assertTrue();
          expect(info.typeface != null && info.typeface != undefined).assertTrue();
          expect(Array.isArray(info.glyphIds)).assertTrue();
          expect(info.glyphIds.length > 0).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackGlyphCountMatch
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_2500
     * @tc.desc   test textToGlyphsWithFallback with glyphCount matching countText.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextToGlyphsWithFallbackGlyphCountMatch', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTextToGlyphsWithFallbackGlyphCountMatch';
      let font = new drawing.Font();
      font.setSize(50);
      let text = 'drawing';
      let glyphCount = font.countText(text);
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback(text, glyphCount);
        console.info(msg + ' textToGlyphsWithFallback with matching glyphCount succeeded, infos length:' + infos.length);
        expect(Array.isArray(infos)).assertTrue();
        expect(infos.length > 0).assertTrue();
        let totalGlyphs = 0;
        for (let info of infos) {
          expect(info.typeface != null && info.typeface != undefined).assertTrue();
          expect(Array.isArray(info.glyphIds)).assertTrue();
          totalGlyphs += info.glyphIds.length;
        }
        expect(totalGlyphs === glyphCount).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackGlyphCountFloat
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_2600
     * @tc.desc   test textToGlyphsWithFallback with float glyphCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextToGlyphsWithFallbackGlyphCountFloat', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTextToGlyphsWithFallbackGlyphCountFloat';
      let font = new drawing.Font();
      font.setSize(50);
      let text = 'drawing';
      let glyphCount = font.countText(text);
      let floatGlyphCount = glyphCount + 0.9;
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback(text, floatGlyphCount);
        console.info(msg + ' textToGlyphsWithFallback with float glyphCount succeeded, infos length:' + infos.length);
        expect(Array.isArray(infos)).assertTrue();
        expect(infos.length > 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackGlyphCountZero
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_2700
     * @tc.desc   test textToGlyphsWithFallback with zero glyphCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextToGlyphsWithFallbackGlyphCountZero', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testTextToGlyphsWithFallbackGlyphCountZero';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('drawing', 0);
        console.info(msg + ' textToGlyphsWithFallback with zero glyphCount succeeded, infos length:' + infos.length);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackGlyphCountNegative
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_2800
     * @tc.desc   test textToGlyphsWithFallback with negative glyphCount. error code 25900001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextToGlyphsWithFallbackGlyphCountNegative', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testTextToGlyphsWithFallbackGlyphCountNegative';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        font.textToGlyphsWithFallback('drawing', -1);
        console.info(msg + ' textToGlyphsWithFallback with negative glyphCount succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackGlyphCountExceed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_2900
     * @tc.desc   test textToGlyphsWithFallback with glyphCount exceeding text length. error code 25900001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextToGlyphsWithFallbackGlyphCountExceed', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testTextToGlyphsWithFallbackGlyphCountExceed';
      let font = new drawing.Font();
      font.setSize(50);
      let text = 'drawing';
      let glyphCount = font.countText(text);
      try {
        font.textToGlyphsWithFallback(text, glyphCount + 100);
        console.info(msg + ' textToGlyphsWithFallback with exceeding glyphCount succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackKoreanText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_3000
     * @tc.desc   test textToGlyphsWithFallback with Korean text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextToGlyphsWithFallbackKoreanText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTextToGlyphsWithFallbackKoreanText';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('안녕하세요');
        console.info(msg + ' textToGlyphsWithFallback with Korean text succeeded, infos length:' + infos.length);
        expect(Array.isArray(infos)).assertTrue();
        expect(infos.length > 0).assertTrue();
        for (let info of infos) {
          expect(info.typeface != null && info.typeface != undefined).assertTrue();
          expect(Array.isArray(info.glyphIds)).assertTrue();
          expect(info.glyphIds.length > 0).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackSpecialCharacters
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_3100
     * @tc.desc   test textToGlyphsWithFallback with special characters and emoji.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextToGlyphsWithFallbackSpecialCharacters', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTextToGlyphsWithFallbackSpecialCharacters';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('Hello🌍世界');
        console.info(msg + ' textToGlyphsWithFallback with special characters succeeded, infos length:' + infos.length);
        expect(Array.isArray(infos)).assertTrue();
        expect(infos.length > 0).assertTrue();
        for (let info of infos) {
          expect(info.typeface != null && info.typeface != undefined).assertTrue();
          expect(Array.isArray(info.glyphIds)).assertTrue();
          expect(info.glyphIds.length > 0).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackTextNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_3200
     * @tc.desc   test textToGlyphsWithFallback with text null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextToGlyphsWithFallbackTextNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testTextToGlyphsWithFallbackTextNull';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        font.textToGlyphsWithFallback(null);
        console.info(msg + ' textToGlyphsWithFallback with null text succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackGlyphCountNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_3300
     * @tc.desc   test textToGlyphsWithFallback with glyphCount null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextToGlyphsWithFallbackGlyphCountNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testTextToGlyphsWithFallbackGlyphCountNull';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        font.textToGlyphsWithFallback('drawing', null);
        console.info(msg + ' textToGlyphsWithFallback with null glyphCount succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackTextUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_3400
     * @tc.desc   test textToGlyphsWithFallback with text undefined. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextToGlyphsWithFallbackTextUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testTextToGlyphsWithFallbackTextUndefined';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        font.textToGlyphsWithFallback(undefined);
        console.info(msg + ' textToGlyphsWithFallback with undefined text succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackGlyphCountUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_3500
     * @tc.desc   test textToGlyphsWithFallback with glyphCount undefined (optional param not passed).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTextToGlyphsWithFallbackGlyphCountUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testTextToGlyphsWithFallbackGlyphCountUndefined';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('drawing', undefined);
        console.info(msg + ' textToGlyphsWithFallback with undefined glyphCount succeeded, infos length:' + infos.length);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackDifferentFontSize
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_3600
     * @tc.desc   test textToGlyphsWithFallback with different font sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextToGlyphsWithFallbackDifferentFontSize', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testTextToGlyphsWithFallbackDifferentFontSize';
      let font = new drawing.Font();
      try {
        font.setSize(10);
        let infos1: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('drawing');
        expect(Array.isArray(infos1)).assertTrue();
        expect(infos1.length > 0).assertTrue();
        font.setSize(50);
        let infos2: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('drawing');
        expect(Array.isArray(infos2)).assertTrue();
        expect(infos2.length > 0).assertTrue();
        font.setSize(100);
        let infos3: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('drawing');
        expect(Array.isArray(infos3)).assertTrue();
        expect(infos3.length > 0).assertTrue();
        console.info(msg + ' textToGlyphsWithFallback with different font sizes succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_3700
     * @tc.desc   test textToGlyphsWithFallback multiple calls return consistent result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextToGlyphsWithFallbackMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTextToGlyphsWithFallbackMultipleCalls';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let infos1: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('drawing');
        let infos2: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('drawing');
        let infos3: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback('drawing');
        console.info(msg + ` infos1.length: ${infos1.length}, infos2.length: ${infos2.length}, infos3.length: ${infos3.length}`);
        expect(Array.isArray(infos1)).assertTrue();
        expect(Array.isArray(infos2)).assertTrue();
        expect(Array.isArray(infos3)).assertTrue();
        expect(infos1.length > 0).assertTrue();
        expect(infos1.length === infos2.length).assertTrue();
        expect(infos2.length === infos3.length).assertTrue();
        for (let i = 0; i < infos1.length; i++) {
          expect(infos1[i].glyphIds.length === infos2[i].glyphIds.length).assertTrue();
          expect(infos2[i].glyphIds.length === infos3[i].glyphIds.length).assertTrue();
          for (let j = 0; j < infos1[i].glyphIds.length; j++) {
            expect(infos1[i].glyphIds[j] === infos2[i].glyphIds[j]).assertTrue();
            expect(infos2[i].glyphIds[j] === infos3[i].glyphIds[j]).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTextToGlyphsWithFallbackWithDrawGlyphs
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_FONT_FALLBACK_3800
     * @tc.desc   test textToGlyphsWithFallback with Canvas drawGlyphs joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextToGlyphsWithFallbackWithDrawGlyphs', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTextToGlyphsWithFallbackWithDrawGlyphs';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let canvas = new drawing.Canvas(pixelMap);
        let text = 'hello world';
        let infos: Array<drawing.TypefaceFallbackInfo> = font.textToGlyphsWithFallback(text);
        console.info(msg + ' textToGlyphsWithFallback succeeded, infos length:' + infos.length);
        expect(Array.isArray(infos)).assertTrue();
        expect(infos.length > 0).assertTrue();
        let offset = 0;
        for (let run of infos) {
          expect(run.typeface != null && run.typeface != undefined).assertTrue();
          expect(Array.isArray(run.glyphIds)).assertTrue();
          expect(run.glyphIds.length > 0).assertTrue();
          font.setTypeface(run.typeface);
          let positions: Array<common2D.Point> = [];
          let glyphWidths = font.getWidths(run.glyphIds);
          for (let j = 0; j < run.glyphIds.length; j++) {
            positions.push({x: offset, y: 80});
            offset += glyphWidths[j];
          }
          canvas.drawGlyphs(run.glyphIds, 0, positions, 0, run.glyphIds.length, font);
        }
        console.info(msg + ' joint call with drawGlyphs succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

  })
}
