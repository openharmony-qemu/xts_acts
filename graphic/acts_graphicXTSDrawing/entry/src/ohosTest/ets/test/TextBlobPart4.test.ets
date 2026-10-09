/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

export default function DrawingTsTextBlobPart4Test() {
  describe('DrawingTsTextBlobPart4Test', () => {
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
     * @tc.name   testMakeFromPosTextWithFallbackNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_0100
     * @tc.desc   test makeFromPosTextWithFallback with normal English text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromPosTextWithFallbackNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromPosTextWithFallbackNormal';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
        for (let blob of textBlobs) {
          expect(blob != null && blob != undefined).assertTrue();
          expect(blob.uniqueID() > 0).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackChineseText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_0200
     * @tc.desc   test makeFromPosTextWithFallback with Chinese text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromPosTextWithFallbackChineseText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromPosTextWithFallbackChineseText';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = '你好世界';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 30, y: 50});
        }
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with Chinese text succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
        for (let blob of textBlobs) {
          expect(blob != null && blob != undefined).assertTrue();
          expect(blob.uniqueID() > 0).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackMixedText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_0300
     * @tc.desc   test makeFromPosTextWithFallback with mixed Chinese and English text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromPosTextWithFallbackMixedText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromPosTextWithFallbackMixedText';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'Hello你好World世界';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 25, y: 50});
        }
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with mixed text succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
        for (let blob of textBlobs) {
          expect(blob != null && blob != undefined).assertTrue();
          expect(blob.uniqueID() > 0).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackReturnType
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_0400
     * @tc.desc   test makeFromPosTextWithFallback return type validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextWithFallbackReturnType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromPosTextWithFallbackReturnType';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
        for (let blob of textBlobs) {
          expect(blob != null && blob != undefined).assertTrue();
          let id = blob.uniqueID();
          expect(id != null && id != undefined).assertTrue();
          expect(id > 0).assertTrue();
          let bounds = blob.bounds();
          expect(bounds != null && bounds != undefined).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackReturnEmptyArray
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_0500
     * @tc.desc   test makeFromPosTextWithFallback return empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextWithFallbackReturnEmptyArray', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromPosTextWithFallbackReturnEmptyArray';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = '';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback return empty array succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length === 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackLongText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_0600
     * @tc.desc   test makeFromPosTextWithFallback with text length about 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextWithFallbackLongText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromPosTextWithFallbackLongText';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing'.repeat(15);
        console.info(msg + ` text length: ${text.length}`);
        let len = font.countText(text);
        console.info(msg + ` glyph count: ${len}`);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with long text succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
        for (let blob of textBlobs) {
          expect(blob != null && blob != undefined).assertTrue();
          expect(blob.uniqueID() > 0).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackKoreanText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_0700
     * @tc.desc   test makeFromPosTextWithFallback with Korean text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextWithFallbackKoreanText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromPosTextWithFallbackKoreanText';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = '안녕하세요 세계';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 30, y: 50});
        }
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with Korean text succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
        for (let blob of textBlobs) {
          expect(blob != null && blob != undefined).assertTrue();
          expect(blob.uniqueID() > 0).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackSpecialCharacters
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_0800
     * @tc.desc   test makeFromPosTextWithFallback with special characters and emoji.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextWithFallbackSpecialCharacters', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromPosTextWithFallbackSpecialCharacters';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'Hello🌍世界';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 30, y: 50});
        }
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with special characters succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
        for (let blob of textBlobs) {
          expect(blob != null && blob != undefined).assertTrue();
          expect(blob.uniqueID() > 0).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackLenFloat
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_0900
     * @tc.desc   test makeFromPosTextWithFallback with float len.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackLenFloat', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackLenFloat';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        let floatLen = len + 0.9;
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, floatLen, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with float len succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackLenZero
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_1000
     * @tc.desc   test makeFromPosTextWithFallback with zero len.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackLenZero', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackLenZero';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing';
        let points: common2D.Point[] = [];
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, 0, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with zero len succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length === 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackLenNegative
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_1100
     * @tc.desc   test makeFromPosTextWithFallback with negative len. error code 25900001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackLenNegative', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackLenNegative';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing';
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosTextWithFallback(text, -1, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with negative len succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackLenExceed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_1200
     * @tc.desc   test makeFromPosTextWithFallback with len exceeding text length. error code 25900001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackLenExceed', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackLenExceed';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        drawing.TextBlob.makeFromPosTextWithFallback(text, len + 100, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with exceeding len succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackPointsEmpty
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_1300
     * @tc.desc   test makeFromPosTextWithFallback with empty points array but non-empty text. error code 25900001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackPointsEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackPointsEmpty';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with empty points succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackPointsLengthMismatch
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_1400
     * @tc.desc   test makeFromPosTextWithFallback with points length mismatch. error code 25900001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackPointsLengthMismatch', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackPointsLengthMismatch';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with length mismatch succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackPointsMaxValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_1500
     * @tc.desc   test makeFromPosTextWithFallback with points of MAX_VALUE coordinates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextWithFallbackPointsMaxValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextWithFallbackPointsMaxValue';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let points: common2D.Point[] = [{x: Number.MAX_VALUE, y: Number.MAX_VALUE}];
        let len = font.countText('A');
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback('A', len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with MAX_VALUE coordinates succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackPointsMinValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_1600
     * @tc.desc   test makeFromPosTextWithFallback with points of MIN_VALUE coordinates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextWithFallbackPointsMinValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextWithFallbackPointsMinValue';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let points: common2D.Point[] = [{x: Number.MIN_VALUE, y: Number.MIN_VALUE}];
        let len = font.countText('A');
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback('A', len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with MIN_VALUE coordinates succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackPointsNegative
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_1700
     * @tc.desc   test makeFromPosTextWithFallback with negative coordinate values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextWithFallbackPointsNegative', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextWithFallbackPointsNegative';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let points: common2D.Point[] = [{x: -100, y: -100}];
        let len = font.countText('A');
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback('A', len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with negative coordinates succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackPointsFloat
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_1800
     * @tc.desc   test makeFromPosTextWithFallback with float coordinate values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextWithFallbackPointsFloat', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextWithFallbackPointsFloat';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let points: common2D.Point[] = [{x: 10.5, y: 20.5}];
        let len = font.countText('A');
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback('A', len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with float coordinates succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackTextNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_1900
     * @tc.desc   test makeFromPosTextWithFallback with text null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackTextNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackTextNull';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let len = font.countText('A');
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosTextWithFallback(null, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with null text succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackLenNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_2000
     * @tc.desc   test makeFromPosTextWithFallback with len null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackLenNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackLenNull';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let len = font.countText('A');
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosTextWithFallback('A', null, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with null len succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackPointsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_2100
     * @tc.desc   test makeFromPosTextWithFallback with points null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackPointsNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackPointsNull';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let len = font.countText('A');
        drawing.TextBlob.makeFromPosTextWithFallback('A', len, null, font);
        console.info(msg + ' makeFromPosTextWithFallback with null points succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackFontNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_2200
     * @tc.desc   test makeFromPosTextWithFallback with font null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackFontNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackFontNull';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let len = font.countText('A');
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosTextWithFallback('A', len, points, null);
        console.info(msg + ' makeFromPosTextWithFallback with null font succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackTextUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_2300
     * @tc.desc   test makeFromPosTextWithFallback with text undefined. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackTextUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackTextUndefined';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let len = font.countText('A');
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosTextWithFallback(undefined, len, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with undefined text succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackLenUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_2400
     * @tc.desc   test makeFromPosTextWithFallback with len undefined. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackLenUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackLenUndefined';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let len = font.countText('A');
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosTextWithFallback('A', undefined, points, font);
        console.info(msg + ' makeFromPosTextWithFallback with undefined len succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackPointsUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_2500
     * @tc.desc   test makeFromPosTextWithFallback with points undefined. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackPointsUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackPointsUndefined';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let len = font.countText('A');
        drawing.TextBlob.makeFromPosTextWithFallback('A', len, undefined, font);
        console.info(msg + ' makeFromPosTextWithFallback with undefined points succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackFontUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_2600
     * @tc.desc   test makeFromPosTextWithFallback with font undefined. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithFallbackFontUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithFallbackFontUndefined';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let len = font.countText('A');
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosTextWithFallback('A', len, points, undefined);
        console.info(msg + ' makeFromPosTextWithFallback with undefined font succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackDifferentFontSize
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_2700
     * @tc.desc   test makeFromPosTextWithFallback with different font sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromPosTextWithFallbackDifferentFontSize', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromPosTextWithFallbackDifferentFontSize';
      try {
        let font = new drawing.Font();
        let points: common2D.Point[] = [{x: 100, y: 100}];
        font.setSize(10);
        let len1 = font.countText('A');
        let textBlobs1: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback('A', len1, points, font);
        expect(Array.isArray(textBlobs1)).assertTrue();
        expect(textBlobs1.length > 0).assertTrue();
        font.setSize(50);
        let len2 = font.countText('A');
        let textBlobs2: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback('A', len2, points, font);
        expect(Array.isArray(textBlobs2)).assertTrue();
        expect(textBlobs2.length > 0).assertTrue();
        font.setSize(100);
        let len3 = font.countText('A');
        let textBlobs3: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback('A', len3, points, font);
        expect(Array.isArray(textBlobs3)).assertTrue();
        expect(textBlobs3.length > 0).assertTrue();
        console.info(msg + ' makeFromPosTextWithFallback with different font sizes succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_2800
     * @tc.desc   test makeFromPosTextWithFallback multiple calls return different objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextWithFallbackMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextWithFallbackMultipleCalls';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        let textBlobs1: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        let textBlobs2: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' multiple calls succeeded');
        expect(Array.isArray(textBlobs1)).assertTrue();
        expect(Array.isArray(textBlobs2)).assertTrue();
        expect(textBlobs1.length > 0).assertTrue();
        expect(textBlobs2.length > 0).assertTrue();
        if (textBlobs1.length > 0 && textBlobs2.length > 0) {
          let id1 = textBlobs1[0].uniqueID();
          let id2 = textBlobs2[0].uniqueID();
          console.info(msg + ` id1: ${id1}, id2: ${id2}`);
          expect(id1 != id2).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackWithCanvas
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_2900
     * @tc.desc   test makeFromPosTextWithFallback with Canvas drawTextBlob joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextWithFallbackWithCanvas', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextWithFallbackWithCanvas';
      try {
        let canvas = new drawing.Canvas(pixelMap);
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        for (let blob of textBlobs) {
          canvas.drawTextBlob(blob, 10, 10);
        }
        console.info(msg + ' makeFromPosTextWithFallback with Canvas succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithFallbackWithMeasureText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_FALLBACK_3000
     * @tc.desc   test makeFromPosTextWithFallback with measureTextWithFallback joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextWithFallbackWithMeasureText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextWithFallbackWithMeasureText';
      try {
        let font = new drawing.Font();
        font.setSize(50);
        let text = 'drawing';
        let width = font.measureTextWithFallback(text, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ` measureTextWithFallback succeeded, width: ${width}`);
        expect(typeof width === 'number').assertTrue();
        expect(width >= 0).assertTrue();
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        let textBlobs: Array<drawing.TextBlob> = drawing.TextBlob.makeFromPosTextWithFallback(text, len, points, font);
        console.info(msg + ' joint call with measureTextWithFallback succeeded');
        expect(Array.isArray(textBlobs)).assertTrue();
        expect(textBlobs.length > 0).assertTrue();
        for (let blob of textBlobs) {
          expect(blob != null && blob != undefined).assertTrue();
          expect(blob.uniqueID() > 0).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

  })
}
