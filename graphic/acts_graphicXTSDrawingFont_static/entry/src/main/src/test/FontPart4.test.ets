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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';
import buffer from '@ohos.buffer';

export default function FontPart4(): void {

  describe('FontPart4', () => {
    beforeAll(() => {
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100
     * @tc.desc   test for FontMetricsFlags EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100==== "
        try {
          console.info(msg + ' Succeeded in FontMetricsFlags.');
          expect(drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID !== undefined).assertTrue()
          expect(drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID !== undefined).assertTrue()
          expect(drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID !== undefined).assertTrue()
          expect(drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID !== undefined).assertTrue()
          expect(drawing.FontMetricsFlags.BOUNDS_INVALID !== undefined).assertTrue()
          console.info(msg + ' drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID: '
            + drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID);
          console.info(msg + ' drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID: '
            + drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID);
          console.info(msg + ' drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID: '
            + drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID);
          console.info(msg + ' drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID: '
            + drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID);
          console.info(msg + ' drawing.FontMetricsFlags.BOUNDS_INVALID: '
            + drawing.FontMetricsFlags.BOUNDS_INVALID);
          done()
        } catch (err) {
          console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100 "
            + JSON.stringify(err))
          console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100 " + err)
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200
     * @tc.desc   test for FontMetricsFlags EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200==== "
        try {
          let font = new drawing.Font();
          let fontMetrics = font.getMetrics() as drawing.FontMetrics;
          console.info(msg + ' ' + fontMetrics.maxCharWidth);
          console.info(msg + ' ' + fontMetrics.flags);
          expect(fontMetrics.maxCharWidth != undefined).assertTrue();
          expect(fontMetrics.flags != undefined).assertTrue();
          done()
        } catch (err) {
          console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200 "
            + JSON.stringify(err))
          console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200 " + err)
          expect().assertFail()
          done()
        }
      })
    /**
     * @tc.name   testGetTextPathWithFallbackNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_0100
     * @tc.desc   testGetTextPathWithFallbackNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextPathWithFallbackNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let msg = 'testGetTextPathWithFallbackNormalStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackChineseTextStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_0200
     * @tc.desc   testGetTextPathWithFallbackChineseTextStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextPathWithFallbackChineseTextStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let msg = 'testGetTextPathWithFallbackChineseTextStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "你好世界";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 76.05) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 153.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 92.39) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackMixedTextStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_0300
     * @tc.desc   testGetTextPathWithFallbackMixedTextStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextPathWithFallbackMixedTextStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let msg = 'testGetTextPathWithFallbackMixedTextStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello你好World世界";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 410.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 92.39) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackByteLengthZeroStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_0400
     * @tc.desc   testGetTextPathWithFallbackByteLengthZeroStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackByteLengthZeroStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthZeroStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      try {
        let path = font.getTextPathWithFallback(myString, 0, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(pathLength).assertEqual(0);
          let lastPoint = path.getLastPoint();
          expect(lastPoint== undefined).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackByteLengthBoundaryStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_0500
     * @tc.desc   testGetTextPathWithFallbackByteLengthBoundaryStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackByteLengthBoundaryStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthBoundaryStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackByteLengthExceedStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_0600
     * @tc.desc   testGetTextPathWithFallbackByteLengthExceedStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackByteLengthExceedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthExceedStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length + 100, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackByteLengthNegativeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_0700
     * @tc.desc   testGetTextPathWithFallbackByteLengthNegativeStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackByteLengthNegativeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthNegativeStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      try {
        let path = font.getTextPathWithFallback(myString, -1, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackXCoordinateIntegerStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_0800
     * @tc.desc   testGetTextPathWithFallbackXCoordinateIntegerStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackXCoordinateIntegerStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateIntegerStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 100, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 194.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackXCoordinateFloatStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_0900
     * @tc.desc   testGetTextPathWithFallbackXCoordinateFloatStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackXCoordinateFloatStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateFloatStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 100.5, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 195.34) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackXCoordinateZeroStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_1000
     * @tc.desc   testGetTextPathWithFallbackXCoordinateZeroStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackXCoordinateZeroStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateZeroStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackXCoordinateNegativeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_1100
     * @tc.desc   testGetTextPathWithFallbackXCoordinateNegativeStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackXCoordinateNegativeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateNegativeStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, -100, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x + 5.15) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackXCoordinateMaxStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_1200
     * @tc.desc   testGetTextPathWithFallbackXCoordinateMaxStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackXCoordinateMaxStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateMaxStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 99999999.99, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 186.40) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 100000096) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackYCoordinateIntegerStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_1300
     * @tc.desc   testGetTextPathWithFallbackYCoordinateIntegerStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackYCoordinateIntegerStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateIntegerStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 200);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 186.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackYCoordinateFloatStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_1400
     * @tc.desc   testGetTextPathWithFallbackYCoordinateFloatStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackYCoordinateFloatStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateFloatStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100.5);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 87.49) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackYCoordinateZeroStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_1500
     * @tc.desc   testGetTextPathWithFallbackYCoordinateZeroStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackYCoordinateZeroStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateZeroStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 0);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y + 13.00) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackYCoordinateNegativeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_1600
     * @tc.desc   testGetTextPathWithFallbackYCoordinateNegativeStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackYCoordinateNegativeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateNegativeStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, -100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y + 113.00) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackYCoordinateMaxStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_1700
     * @tc.desc   testGetTextPathWithFallbackYCoordinateMaxStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackYCoordinateMaxStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateMaxStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 99999999.99);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 201.10) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 99999984) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackEmptyTextStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_1800
     * @tc.desc   testGetTextPathWithFallbackEmptyTextStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackEmptyTextStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackEmptyTextStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(pathLength).assertEqual(0);
          let lastPoint = path.getLastPoint();
          expect(lastPoint== undefined).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetTextPathWithFallbackMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_2700
     * @tc.desc   testGetTextPathWithFallbackMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackMultipleCallsStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path1 = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path1 == undefined){
          expect().assertFail();
          console.info(msg + ' getTextPathWithFallback path1 failed');
        } else {
          console.info(msg + ' getTextPathWithFallback path1 success');
          expect(path1 !== null && path1 !== undefined).assertTrue();
          let pathLength = path1.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path1.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
        let path2 = font.getTextPathWithFallback(myString, length, 0, 200);
        if(path2 == undefined){
          expect().assertFail();
          console.info(msg + ' getTextPathWithFallback path2 failed');
        } else {
          console.info(msg + ' getTextPathWithFallback path2 success');
          expect(path2 !== null && path2 !== undefined).assertTrue();
          let pathLength = path2.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path2.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 186.99) < 0.01).assertTrue();
          }
        }
        let path3 = font.getTextPathWithFallback(myString, length, 100, 100);
        if(path3 == undefined){
          expect().assertFail();
          console.info(msg + ' getTextPathWithFallback path3 failed');
        } else {
          console.info(msg + ' getTextPathWithFallback path3 success');
          expect(path3 !== null && path3 !== undefined).assertTrue();
          let pathLength = path3.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path3.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 194.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
        console.info(msg + ' getTextPathWithFallback multiple calls success');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackPathBoundsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_2800
     * @tc.desc   testGetTextPathWithFallbackPathBoundsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackPathBoundsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackPathBoundsStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          let bounds = path.getBounds();
          expect(bounds !== null && bounds !== undefined).assertTrue();
          if(bounds) {
            console.info(msg + ' getTextPathWithFallback success, bounds left:' + bounds.left + ' top:' + bounds.top
              + ' right:' + bounds.right + ' bottom:' + bounds.bottom);
            expect(Math.abs(bounds.left - 4.34) < 0.01).assertTrue();
            expect(Math.abs(bounds.top - 61.95) < 0.01).assertTrue();
            expect(Math.abs(bounds.right - 115.19) < 0.01).assertTrue();
            expect(Math.abs(bounds.bottom - 100.54) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackPathIsEmptyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_2900
     * @tc.desc   testGetTextPathWithFallbackPathIsEmptyStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackPathIsEmptyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackPathIsEmptyStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          let isEmpty: boolean = path.isEmpty();
          expect(typeof isEmpty === 'boolean').assertTrue();
          expect(isEmpty).assertFalse();
          console.info(msg + ' getTextPathWithFallback success, path isEmpty:' + isEmpty);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackSpecialCharactersStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_3000
     * @tc.desc   testGetTextPathWithFallbackSpecialCharactersStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackSpecialCharactersStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackSpecialCharactersStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "!@#$%^&*()";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 17.44) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 272.74) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 82.39) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackByteLengthFloatStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_3100
     * @tc.desc   testGetTextPathWithFallbackByteLengthFloatStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackByteLengthFloatStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthFloatStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      try {
        let path = font.getTextPathWithFallback(myString, 5, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackByteLengthMinStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_3200
     * @tc.desc   testGetTextPathWithFallbackByteLengthMinStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackByteLengthMinStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthMinStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      try {
        let path = font.getTextPathWithFallback(myString, 1, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 4.34) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 63.40) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackXCoordinateMinStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_3300
     * @tc.desc   testGetTextPathWithFallbackXCoordinateMinStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackXCoordinateMinStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateMinStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 1, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 95.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackYCoordinateMinStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_3400
     * @tc.desc   testGetTextPathWithFallbackYCoordinateMinStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackYCoordinateMinStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateMinStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 1);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y + 12.00) < 0.01).assertTrue();

          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackLongTextStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_3500
     * @tc.desc   testGetTextPathWithFallbackLongTextStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackLongTextStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackLongTextStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "This is a very long text string for testing getTextPathWithFallback functionality";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 127.58) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 1775.95) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 102.35) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackEmojiStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_3600
     * @tc.desc   testGetTextPathWithFallbackEmojiStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackEmojiStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackEmojiStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello🌍世界";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 234.23) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 92.39) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackXFloatPrecisionStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_3700
     * @tc.desc   testGetTextPathWithFallbackXFloatPrecisionStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackXFloatPrecisionStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackXFloatPrecisionStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0.000001, 100);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackYFloatPrecisionStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_STATIC_3800
     * @tc.desc   testGetTextPathWithFallbackYFloatPrecisionStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackYFloatPrecisionStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackYFloatPrecisionStatic';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, 100.000001);
        if(path == undefined){
          console.info(msg + ' getTextPathWithFallback failed');
          expect().assertFail();
        } else {
          expect(path !== null && path !== undefined).assertTrue();
          console.info(msg + ' getTextPathWithFallback success');
          let pathLength = path.getLength(false);
          console.info(msg + ' getLength success, pathLength:' + pathLength);
          expect(Math.abs(pathLength - 195.50) < 0.01).assertTrue();
          let lastPoint = path.getLastPoint();
          expect(lastPoint !== null && lastPoint !== undefined).assertTrue();
          if (lastPoint) {
            console.info(msg + ' getLastPoint success, lastPoint.x:' + lastPoint.x + ' lastPoint.y:' + lastPoint.y);
            expect(Math.abs(lastPoint.x - 94.84) < 0.01).assertTrue();
            expect(Math.abs(lastPoint.y - 86.99) < 0.01).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}
