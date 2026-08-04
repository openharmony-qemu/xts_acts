'use static';
/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import image from '@ohos.multimedia.image';

export default function DrawingTsTextBlobPart3Test(): void {
  describe('DrawingTsTextBlobPart3Test', () => {
    let pixelMap: image.PixelMap | undefined;

    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 100, width: 100 }
      }
      pixelMap = await image.createPixelMap(color, opts);
    })

    /**
     * @tc.name   testMakeFromStringLongTextStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_0200
     * @tc.desc   test makeFromString with long text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromStringLongTextStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromStringLongTextStatic';
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
     * @tc.name   testMakeFromStringReturnValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_0300
     * @tc.desc   test makeFromString return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromStringReturnValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromStringReturnValidationStatic';
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
     * @tc.name   testMakeFromStringWithCanvasStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_0400
     * @tc.desc   test makeFromString with Canvas drawTextBlob joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromStringWithCanvasStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromStringWithCanvasStatic';
      try {
        let canvas = new drawing.Canvas(pixelMap!);
        let font = new drawing.Font();
        font.setSize(20);
        let textBlob = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        if (textBlob) {
          canvas.drawTextBlob(textBlob, 20, 20);
        }
        console.info(msg + ' makeFromString with Canvas succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testMakeFromPosTextExtremeCoordinatesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_0600
     * @tc.desc   test makeFromPosText with extreme coordinate values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextExtremeCoordinatesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextExtremeCoordinatesStatic';
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
     * @tc.name   testMakeFromPosTextReturnValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_0700
     * @tc.desc   test makeFromPosText return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromPosTextReturnValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testMakeFromPosTextReturnValidationStatic';
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
     * @tc.name   testMakeFromPosTextWithCanvasStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_0900
     * @tc.desc   test makeFromPosText with Canvas drawTextBlob joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromPosTextWithCanvasStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromPosTextWithCanvasStatic';
      try {
        let canvas = new drawing.Canvas(pixelMap!);
        let font = new drawing.Font();
        font.setSize(20);
        let text = 'drawing';
        let len = font.countText(text);
        let points: common2D.Point[] = [];
        for (let i = 0; i < len; i++) {
          points.push({x: i * 20, y: 50});
        }
        let textBlob = drawing.TextBlob.makeFromPosText(text, len, points, font);
        if (textBlob) {
          canvas.drawTextBlob(textBlob, 10, 10);
        }
        console.info(msg + ' makeFromPosText with Canvas succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromPosTextNegativeCoordinatesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_1000
     * @tc.desc   test makeFromPosText with negative coordinate values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromPosTextNegativeCoordinatesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromPosTextNegativeCoordinatesStatic';
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
     * @tc.name   testMakeFromPosTextZeroLengthStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_1100
     * @tc.desc   test makeFromPosText with zero len. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextZeroLengthStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextZeroLengthStatic';
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
     * @tc.name   testMakeFromPosTextNegativeLengthStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_1200
     * @tc.desc   test makeFromPosText with negative len. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromPosTextNegativeLengthStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromPosTextNegativeLengthStatic';
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
     * @tc.name   testMakeFromRunBufferExtremeValuesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_1400
     * @tc.desc   test makeFromRunBuffer with extreme glyph and position values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromRunBufferExtremeValuesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testMakeFromRunBufferExtremeValuesStatic';
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
     * @tc.name   testMakeFromRunBufferReturnValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_1500
     * @tc.desc   test makeFromRunBuffer return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromRunBufferReturnValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromRunBufferReturnValidationStatic';
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
     * @tc.name   testMakeFromRunBufferWithCanvasStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_1600
     * @tc.desc   test makeFromRunBuffer with Canvas drawTextBlob joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromRunBufferWithCanvasStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromRunBufferWithCanvasStatic';
      try {
        let canvas = new drawing.Canvas(pixelMap!);
        let font = new drawing.Font();
        font.setSize(20);
        let runBuffer: drawing.TextBlobRunBuffer[] = [
          {glyph: 65, positionX: 0, positionY: 0},
          {glyph: 66, positionX: 15, positionY: 0},
          {glyph: 67, positionX: 30, positionY: 0}
        ];
        let textBlob = drawing.TextBlob.makeFromRunBuffer(runBuffer, font);
        if (textBlob) {
          canvas.drawTextBlob(textBlob, 20, 20);
        }
        console.info(msg + ' makeFromRunBuffer with Canvas succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testMakeFromRunBufferNegativePositionStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_1800
     * @tc.desc   test makeFromRunBuffer with negative position values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromRunBufferNegativePositionStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromRunBufferNegativePositionStatic';
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
     * @tc.name   testUniqueIDReturnValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_1900
     * @tc.desc   test uniqueID return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUniqueIDReturnValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testUniqueIDReturnValidationStatic';
      try {
        let font = new drawing.Font();
        let textBlob = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        if (textBlob) {
          let id = textBlob.uniqueID();
          console.info(msg + ` uniqueID succeeded, id: ${id}`);
          expect(id != null && id != undefined).assertTrue();
          expect(id > 0).assertTrue();
        }
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUniqueIDUniquenessStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_2000
     * @tc.desc   test uniqueID uniqueness between different TextBlob objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testUniqueIDUniquenessStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testUniqueIDUniquenessStatic';
      try {
        let font = new drawing.Font();
        let textBlob1 = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        if (textBlob1) {
          let id1 = textBlob1.uniqueID();
          let textBlob2 = drawing.TextBlob.makeFromString('text', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
          if (textBlob2) {
            let id2 = textBlob2.uniqueID();
            console.info(msg + ` uniqueID1: ${id1}, uniqueID2: ${id2}`);
            expect(id1 != id2).assertTrue();
          }
        }
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testUniqueIDMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_2100
     * @tc.desc   test uniqueID multiple calls on same object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUniqueIDMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testUniqueIDMultipleCallsStatic';
      try {
        let font = new drawing.Font();
        let textBlob = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        if (textBlob) {
          let id1 = textBlob.uniqueID();
          let id2 = textBlob.uniqueID();
          let id3 = textBlob.uniqueID();
          console.info(msg + ` uniqueID1: ${id1}, uniqueID2: ${id2}, uniqueID3: ${id3}`);
          expect(id1 == id2 && id2 == id3).assertTrue();
        }
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBoundsReturnValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_2200
     * @tc.desc   test bounds return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBoundsReturnValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testBoundsReturnValidationStatic';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let textBlob = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        if (textBlob) {
          let bounds = textBlob.bounds();
          if (bounds) {
            console.info(msg + ` bounds succeeded, left: ${bounds.left}, top: ${bounds.top}, right: ${bounds.right}, bottom: ${bounds.bottom}`);
            expect(bounds != null && bounds != undefined).assertTrue();
          }
        }
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBoundsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_2300
     * @tc.desc   test bounds multiple calls on same object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundsMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testBoundsMultipleCallsStatic';
      try {
        let font = new drawing.Font();
        font.setSize(20);
        let textBlob = drawing.TextBlob.makeFromString('drawing', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        if (textBlob) {
          let bounds1 = textBlob.bounds();
          let bounds2 = textBlob.bounds();
          if (bounds1 && bounds2) {
            console.info(msg + ` bounds1: left=${bounds1.left}, bounds2: left=${bounds2.left}`);
            expect(bounds1.left == bounds2.left).assertTrue();
            expect(bounds1.top == bounds2.top).assertTrue();
            expect(bounds1.right == bounds2.right).assertTrue();
            expect(bounds1.bottom == bounds2.bottom).assertTrue();
          }
        }
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromRunBufferMultipleGlyphsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_2400
     * @tc.desc   test makeFromRunBuffer with multiple glyph entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromRunBufferMultipleGlyphsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeFromRunBufferMultipleGlyphsStatic';
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
     * @tc.name   testMakeFromPosTextMultiplePointsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_2500
     * @tc.desc   test makeFromPosText with multiple points.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromPosTextMultiplePointsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testMakeFromPosTextMultiplePointsStatic';
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
     * @tc.name   testMakeFromStringWithDifferentFontSizeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_2600
     * @tc.desc   test makeFromString with different font sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromStringWithDifferentFontSizeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeFromStringWithDifferentFontSizeStatic';
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
     * @tc.name   testMakeFromRunBufferWithDifferentFontSizeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_2700
     * @tc.desc   test makeFromRunBuffer with different font sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromRunBufferWithDifferentFontSizeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeFromRunBufferWithDifferentFontSizeStatic';
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
     * @tc.name   testMakeFromPosTextWithDifferentFontSizeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TEXTBLOB_STATIC_2800
     * @tc.desc   test makeFromPosText with different font sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromPosTextWithDifferentFontSizeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeFromPosTextWithDifferentFontSizeStatic';
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