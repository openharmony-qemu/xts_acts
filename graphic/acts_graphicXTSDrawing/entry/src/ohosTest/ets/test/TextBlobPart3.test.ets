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

export default function DrawingTsTextBlobPart3Test() {
  describe('DrawingTsTextBlobPart3Test', () => {
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
     * @tc.name   testMakeFromStringLongText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_0200
     * @tc.desc   test makeFromString with long text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromStringLongText', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromStringLongText';
      try {
        let font = new drawing.Font();
        let longText = 'drawing'.repeat(100);
        let textBlob = drawing.TextBlob.makeFromString(longText, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' makeFromString with long text succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromStringReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_0300
     * @tc.desc   test makeFromString return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromStringReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromStringReturnValidation';
      try {
        let font = new drawing.Font();
        let textBlob = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' makeFromString succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromStringWithCanvas
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_0400
     * @tc.desc   test makeFromString with Canvas drawTextBlob joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromStringWithCanvas', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromStringWithCanvas';
      try {
        let canvas = new drawing.Canvas(pixelMap);
        let font = new drawing.Font();
        font.setSize(20);
        let textBlob = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.drawTextBlob(textBlob, 20, 20);
        console.info(msg + ' makeFromString with Canvas succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testMakeFromPosTextExtremeCoordinates
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_0600
     * @tc.desc   test makeFromPosText with extreme coordinate values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextExtremeCoordinates', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
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
     * @tc.name   testMakeFromPosTextReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_0700
     * @tc.desc   test makeFromPosText return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromPosTextReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
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
     * @tc.name   testMakeFromPosTextWithCanvas
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_0900
     * @tc.desc   test makeFromPosText with Canvas drawTextBlob joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromPosTextWithCanvas', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
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
     * @tc.name   testMakeFromPosTextNegativeCoordinates
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_1000
     * @tc.desc   test makeFromPosText with negative coordinate values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextNegativeCoordinates', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
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
     * @tc.name   testMakeFromPosTextZeroLength
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_1100
     * @tc.desc   test makeFromPosText with zero len. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextZeroLength', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
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
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_1200
     * @tc.desc   test makeFromPosText with negative len. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextNegativeLength', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
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
     * @tc.name   testMakeFromRunBufferExtremeValues
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_1400
     * @tc.desc   test makeFromRunBuffer with extreme glyph and position values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromRunBufferExtremeValues', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testMakeFromRunBufferExtremeValues';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let runBufferMax: drawing.TextBlobRunBuffer[] = [
          {glyph: 65535, positionX: Number.MAX_VALUE, positionY: Number.MAX_VALUE}
        ];
        let textBlobMax = drawing.TextBlob.makeFromRunBuffer(runBufferMax, font);
        console.info(msg + ' makeFromRunBuffer with MAX_VALUE succeeded');
        expect(textBlobMax != null && textBlobMax != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let runBufferMin: drawing.TextBlobRunBuffer[] = [
          {glyph: 0, positionX: Number.MIN_VALUE, positionY: Number.MIN_VALUE}
        ];
        let textBlobMin = drawing.TextBlob.makeFromRunBuffer(runBufferMin, font);
        console.info(msg + ' makeFromRunBuffer with MIN_VALUE succeeded');
        expect(textBlobMin != null && textBlobMin != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromRunBufferReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_1500
     * @tc.desc   test makeFromRunBuffer return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromRunBufferReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromRunBufferReturnValidation';
      try {
        let font = new drawing.Font();
        let runBuffer: drawing.TextBlobRunBuffer[] = [
          {glyph: 65, positionX: 0, positionY: 0}
        ];
        let textBlob = drawing.TextBlob.makeFromRunBuffer(runBuffer, font);
        console.info(msg + ' makeFromRunBuffer succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromRunBufferWithCanvas
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_1600
     * @tc.desc   test makeFromRunBuffer with Canvas drawTextBlob joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromRunBufferWithCanvas', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromRunBufferWithCanvas';
      try {
        let canvas = new drawing.Canvas(pixelMap);
        let font = new drawing.Font();
        font.setSize(20);
        let runBuffer: drawing.TextBlobRunBuffer[] = [
          {glyph: 65, positionX: 0, positionY: 0},
          {glyph: 66, positionX: 15, positionY: 0},
          {glyph: 67, positionX: 30, positionY: 0}
        ];
        let textBlob = drawing.TextBlob.makeFromRunBuffer(runBuffer, font);
        canvas.drawTextBlob(textBlob, 20, 20);
        console.info(msg + ' makeFromRunBuffer with Canvas succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testMakeFromRunBufferNegativePosition
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_1800
     * @tc.desc   test makeFromRunBuffer with negative position values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromRunBufferNegativePosition', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromRunBufferNegativePosition';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let runBuffer: drawing.TextBlobRunBuffer[] = [
          {glyph: 65, positionX: -100, positionY: -100}
        ];
        let textBlob = drawing.TextBlob.makeFromRunBuffer(runBuffer, font);
        console.info(msg + ' makeFromRunBuffer with negative position succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUniqueIDReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_1900
     * @tc.desc   test uniqueID return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUniqueIDReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testUniqueIDReturnValidation';
      try {
        let font = new drawing.Font();
        let textBlob = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        let id = textBlob.uniqueID();
        console.info(msg + ` uniqueID succeeded, id: ${id}`);
        expect(id != null && id != undefined).assertTrue();
        expect(id > 0).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUniqueIDUniqueness
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_2000
     * @tc.desc   test uniqueID uniqueness between different TextBlob objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testUniqueIDUniqueness', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testUniqueIDUniqueness';
      try {
        let font = new drawing.Font();
        let textBlob1 = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        let id1 = textBlob1.uniqueID();
        let textBlob2 = drawing.TextBlob.makeFromString('text', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        let id2 = textBlob2.uniqueID();
        console.info(msg + ` uniqueID1: ${id1}, uniqueID2: ${id2}`);
        expect(id1 != id2).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUniqueIDMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_2100
     * @tc.desc   test uniqueID multiple calls on same object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUniqueIDMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testUniqueIDMultipleCalls';
      try {
        let font = new drawing.Font();
        let textBlob = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        let id1 = textBlob.uniqueID();
        let id2 = textBlob.uniqueID();
        let id3 = textBlob.uniqueID();
        console.info(msg + ` uniqueID1: ${id1}, uniqueID2: ${id2}, uniqueID3: ${id3}`);
        expect(id1 == id2 && id2 == id3).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBoundsReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_2200
     * @tc.desc   test bounds return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBoundsReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testBoundsReturnValidation';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let textBlob = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        let bounds = textBlob.bounds();
        console.info(msg + ` bounds succeeded, left: ${bounds.left}, top: ${bounds.top}, right: ${bounds.right}, bottom: ${bounds.bottom}`);
        expect(bounds != null && bounds != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBoundsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_2300
     * @tc.desc   test bounds multiple calls on same object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundsMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testBoundsMultipleCalls';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let textBlob = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        let bounds1 = textBlob.bounds();
        let bounds2 = textBlob.bounds();
        console.info(msg + ` bounds1: left=${bounds1.left}, bounds2: left=${bounds2.left}`);
        expect(bounds1.left == bounds2.left).assertTrue();
        expect(bounds1.top == bounds2.top).assertTrue();
        expect(bounds1.right == bounds2.right).assertTrue();
        expect(bounds1.bottom == bounds2.bottom).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromRunBufferMultipleGlyphs
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_2400
     * @tc.desc   test makeFromRunBuffer with multiple glyph entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromRunBufferMultipleGlyphs', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromRunBufferMultipleGlyphs';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let runBuffer: drawing.TextBlobRunBuffer[] = [
          {glyph: 65, positionX: 0, positionY: 0},
          {glyph: 66, positionX: 15, positionY: 0},
          {glyph: 67, positionX: 30, positionY: 0},
          {glyph: 68, positionX: 45, positionY: 0},
          {glyph: 69, positionX: 60, positionY: 0}
        ];
        let textBlob = drawing.TextBlob.makeFromRunBuffer(runBuffer, font);
        console.info(msg + ' makeFromRunBuffer with 5 glyphs succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextMultiplePoints
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_2500
     * @tc.desc   test makeFromPosText with multiple points.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromPosTextMultiplePoints', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
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
     * @tc.name   testMakeFromStringWithDifferentFontSize
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_2600
     * @tc.desc   test makeFromString with different font sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromStringWithDifferentFontSize', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromStringWithDifferentFontSize';
      try {
        let font = new drawing.Font();
        font.setSize(10);
        let textBlob1 = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(textBlob1 != null && textBlob1 != undefined).assertTrue();
        font.setSize(50);
        let textBlob2 = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(textBlob2 != null && textBlob2 != undefined).assertTrue();
        font.setSize(100);
        let textBlob3 = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(textBlob3 != null && textBlob3 != undefined).assertTrue();
        console.info(msg + ' makeFromString with different font sizes succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromRunBufferWithDifferentFontSize
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_2700
     * @tc.desc   test makeFromRunBuffer with different font sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromRunBufferWithDifferentFontSize', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromRunBufferWithDifferentFontSize';
      try {
        let font = new drawing.Font();
        let runBuffer: drawing.TextBlobRunBuffer[] = [
          {glyph: 65, positionX: 0, positionY: 0}
        ];
        font.setSize(10);
        let textBlob1 = drawing.TextBlob.makeFromRunBuffer(runBuffer, font);
        expect(textBlob1 != null && textBlob1 != undefined).assertTrue();
        font.setSize(50);
        let textBlob2 = drawing.TextBlob.makeFromRunBuffer(runBuffer, font);
        expect(textBlob2 != null && textBlob2 != undefined).assertTrue();
        font.setSize(100);
        let textBlob3 = drawing.TextBlob.makeFromRunBuffer(runBuffer, font);
        expect(textBlob3 != null && textBlob3 != undefined).assertTrue();
        console.info(msg + ' makeFromRunBuffer with different font sizes succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextWithDifferentFontSize
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_2800
     * @tc.desc   test makeFromPosText with different font sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithDifferentFontSize', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithDifferentFontSize';
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

  })
}