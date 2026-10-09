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

export default function ycTest() {
  describe('YcTextBlobMakeFromPosTextTest', () => {
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
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testMakeFromPosTextNormalEnglish
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_0100
     * @tc.desc   test makeFromPosText with normal English text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromPosTextNormalEnglish', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromPosTextNormalEnglish';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        let textBlob = drawing.TextBlob.makeFromPosText(text, len, points, font);
        console.info(msg + ' makeFromPosText with normal English text succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextChinese
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_0200
     * @tc.desc   test makeFromPosText with Chinese text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextChinese', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromPosTextChinese';
      try {
        let font = new drawing.Font();
        font.setSize(30);
        let points: common2D.Point[] = [{x: 100, y: 100}];
        let textBlob = drawing.TextBlob.makeFromPosText('你好', points.length, points, font);
        console.info(msg + ' makeFromPosText with Chinese text succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_0300
     * @tc.desc   test makeFromPosText return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextReturnValidation';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let points: common2D.Point[] = [{x: 100, y: 100}];
        let textBlob = drawing.TextBlob.makeFromPosText('drawing', points.length, points, font);
        console.info(msg + ' makeFromPosText succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextMultiplePoints
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_0400
     * @tc.desc   test makeFromPosText with multiple points.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextMultiplePoints', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextMultiplePoints';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        let textBlob = drawing.TextBlob.makeFromPosText(text, len, points, font);
        console.info(msg + ' makeFromPosText with multiple points succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextExtremeCoordinates
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_0500
     * @tc.desc   test makeFromPosText with extreme coordinate values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromPosTextExtremeCoordinates', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testMakeFromPosTextExtremeCoordinates';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let pointsMax: common2D.Point[] = [{x: Number.MAX_VALUE, y: Number.MAX_VALUE}];
        let textBlobMax = drawing.TextBlob.makeFromPosText('A', pointsMax.length, pointsMax, font);
        console.info(msg + ' makeFromPosText with MAX_VALUE coordinates succeeded');
        expect(textBlobMax != null && textBlobMax != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let pointsMin: common2D.Point[] = [{x: Number.MIN_VALUE, y: Number.MIN_VALUE}];
        let textBlobMin = drawing.TextBlob.makeFromPosText('A', pointsMin.length, pointsMin, font);
        console.info(msg + ' makeFromPosText with MIN_VALUE coordinates succeeded');
        expect(textBlobMin != null && textBlobMin != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextNegativeCoordinates
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_0600
     * @tc.desc   test makeFromPosText with negative coordinate values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromPosTextNegativeCoordinates', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromPosTextNegativeCoordinates';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let points: common2D.Point[] = [{x: -100, y: -100}];
        let textBlob = drawing.TextBlob.makeFromPosText('A', points.length, points, font);
        console.info(msg + ' makeFromPosText with negative coordinates succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextFloatCoordinates
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_0700
     * @tc.desc   test makeFromPosText with float coordinate values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextFloatCoordinates', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromPosTextFloatCoordinates';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let points: common2D.Point[] = [{x: 100.5, y: 200.3}];
        let textBlob = drawing.TextBlob.makeFromPosText('A', points.length, points, font);
        console.info(msg + ' makeFromPosText with float coordinates succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextDifferentFontSize
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_0800
     * @tc.desc   test makeFromPosText with different font sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextDifferentFontSize', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextDifferentFontSize';
      try {
        let font = new drawing.Font();
        let points: common2D.Point[] = [{x: 100, y: 100}];
        font.setSize(10);
        let textBlob1 = drawing.TextBlob.makeFromPosText('A', points.length, points, font);
        expect(textBlob1 != null && textBlob1 != undefined).assertTrue();
        font.setSize(50);
        let textBlob2 = drawing.TextBlob.makeFromPosText('A', points.length, points, font);
        expect(textBlob2 != null && textBlob2 != undefined).assertTrue();
        font.setSize(100);
        let textBlob3 = drawing.TextBlob.makeFromPosText('A', points.length, points, font);
        expect(textBlob3 != null && textBlob3 != undefined).assertTrue();
        console.info(msg + ' makeFromPosText with different font sizes succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_0900
     * @tc.desc   test makeFromPosText multiple calls return different objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextMultipleCalls';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let points: common2D.Point[] = [{x: 100, y: 100}];
        let textBlob1 = drawing.TextBlob.makeFromPosText('A', points.length, points, font);
        let textBlob2 = drawing.TextBlob.makeFromPosText('A', points.length, points, font);
        let id1 = textBlob1.uniqueID();
        let id2 = textBlob2.uniqueID();
        console.info(msg + ` makeFromPosText multiple calls succeeded, id1: ${id1}, id2: ${id2}`);
        expect(id1 != id2).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithCanvas
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_1000
     * @tc.desc   test makeFromPosText with Canvas drawTextBlob joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromPosTextWithCanvas', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testMakeFromPosTextWithCanvas';
      try {
        let canvas = new drawing.Canvas(pixelMap);
        let font = new drawing.Font();
        font.setSize(20);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        let textBlob = drawing.TextBlob.makeFromPosText(text, len, points, font);
        canvas.drawTextBlob(textBlob, 10, 10);
        console.info(msg + ' makeFromPosText with Canvas succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextZeroLength
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_1100
     * @tc.desc   test makeFromPosText with zero len. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromPosTextZeroLength', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromPosTextZeroLength';
      try {
        let font = new drawing.Font();
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosText('drawing', 0, points, font);
        console.info(msg + ' makeFromPosText with zero len succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextNegativeLength
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_1200
     * @tc.desc   test makeFromPosText with negative len. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextNegativeLength', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromPosTextNegativeLength';
      try {
        let font = new drawing.Font();
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosText('drawing', -1, points, font);
        console.info(msg + ' makeFromPosText with negative len succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextPointsMismatch
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_1300
     * @tc.desc   test makeFromPosText with points length mismatch. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextPointsMismatch', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextPointsMismatch';
      try {
        let font = new drawing.Font();
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosText('drawing', 10, points, font);
        console.info(msg + ' makeFromPosText with length mismatch succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextEmptyPoints
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_1400
     * @tc.desc   test makeFromPosText with empty points array but non-empty text. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextEmptyPoints', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextEmptyPoints';
      try {
        let font = new drawing.Font();
        let points: common2D.Point[] = [];
        drawing.TextBlob.makeFromPosText('drawing', 1, points, font);
        console.info(msg + ' makeFromPosText with empty points succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextNullText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_1500
     * @tc.desc   test makeFromPosText with text null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromPosTextNullText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testMakeFromPosTextNullText';
      try {
        let font = new drawing.Font();
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosText(null, points.length, points, font);
        console.info(msg + ' makeFromPosText with null text succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextNullLen
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_1600
     * @tc.desc   test makeFromPosText with len null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromPosTextNullLen', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromPosTextNullLen';
      try {
        let font = new drawing.Font();
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosText('A', null, points, font);
        console.info(msg + ' makeFromPosText with null len succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextNullPoints
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_1700
     * @tc.desc   test makeFromPosText with points null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextNullPoints', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromPosTextNullPoints';
      try {
        let font = new drawing.Font();
        drawing.TextBlob.makeFromPosText('A', 1, null, font);
        console.info(msg + ' makeFromPosText with null points succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextNullFont
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_1800
     * @tc.desc   test makeFromPosText with font null. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextNullFont', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextNullFont';
      try {
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosText('A', points.length, points, null);
        console.info(msg + ' makeFromPosText with null font succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextUndefinedText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_1900
     * @tc.desc   test makeFromPosText with text undefined. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextUndefinedText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextUndefinedText';
      try {
        let font = new drawing.Font();
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosText(undefined, points.length, points, font);
        console.info(msg + ' makeFromPosText with undefined text succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextUndefinedLen
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_2000
     * @tc.desc   test makeFromPosText with len undefined. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromPosTextUndefinedLen', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testMakeFromPosTextUndefinedLen';
      try {
        let font = new drawing.Font();
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosText('A', undefined, points, font);
        console.info(msg + ' makeFromPosText with undefined len succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextUndefinedPoints
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_2100
     * @tc.desc   test makeFromPosText with points undefined. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromPosTextUndefinedPoints', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromPosTextUndefinedPoints';
      try {
        let font = new drawing.Font();
        drawing.TextBlob.makeFromPosText('A', 1, undefined, font);
        console.info(msg + ' makeFromPosText with undefined points succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextUndefinedFont
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_2200
     * @tc.desc   test makeFromPosText with font undefined. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextUndefinedFont', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromPosTextUndefinedFont';
      try {
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosText('A', points.length, points, undefined);
        console.info(msg + ' makeFromPosText with undefined font succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMakeFromPosTextEmptyString
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_YC_TEXTBLOB_2300
     * @tc.desc   test makeFromPosText with empty string but non-empty points. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextEmptyString', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextEmptyString';
      try {
        let font = new drawing.Font();
        let points: common2D.Point[] = [{x: 100, y: 100}];
        drawing.TextBlob.makeFromPosText('', points.length, points, font);
        console.info(msg + ' makeFromPosText with empty string succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

  })
}
