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

export default function FontPart4() {

  describe('FontPart4', () => {
    beforeAll(() => {
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0100
     * @tc.desc   test for FontMetricsFlags EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let msg = " ====SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0100==== "
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
          console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0100 "
            + JSON.stringify(err))
          console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0100 " + err)
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0200
     * @tc.desc   test for FontMetricsFlags EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let msg = " ====SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0200==== "
        try {
          let font = new drawing.Font();
          let fontMetrics = font.getMetrics();
          console.info(msg + ' ' + fontMetrics.maxCharWidth);
          console.info(msg + ' ' + fontMetrics.flags);
          expect(fontMetrics.maxCharWidth != undefined).assertTrue();
          expect(fontMetrics.flags != undefined).assertTrue();
          expect(fontMetrics.flags & drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID).assertEqual(1);
          expect(fontMetrics.flags & drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID).assertEqual(2);
          expect(fontMetrics.flags & drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID).assertEqual(4);
          expect(fontMetrics.flags & drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID).assertEqual(8);
          expect(fontMetrics.flags & drawing.FontMetricsFlags.BOUNDS_INVALID).assertEqual(16);
          done()
        } catch (err) {
          console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0200 "
            + JSON.stringify(err))
          console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_0200 " + err)
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   testGetTextPathWithFallbackNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_0100
     * @tc.desc   testGetTextPathWithFallbackNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextPathWithFallbackNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let msg = 'testGetTextPathWithFallbackNormal';
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
     * @tc.name   testGetTextPathWithFallbackChineseText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_0200
     * @tc.desc   testGetTextPathWithFallbackChineseText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextPathWithFallbackChineseText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let msg = 'testGetTextPathWithFallbackChineseText';
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
     * @tc.name   testGetTextPathWithFallbackMixedText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_0300
     * @tc.desc   testGetTextPathWithFallbackMixedText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextPathWithFallbackMixedText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let msg = 'testGetTextPathWithFallbackMixedText';
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
     * @tc.name   testGetTextPathWithFallbackByteLengthZero
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_0400
     * @tc.desc   testGetTextPathWithFallbackByteLengthZero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackByteLengthZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthZero';
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
     * @tc.name   testGetTextPathWithFallbackByteLengthBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_0500
     * @tc.desc   testGetTextPathWithFallbackByteLengthBoundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackByteLengthBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthBoundary';
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
     * @tc.name   testGetTextPathWithFallbackByteLengthExceed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_0600
     * @tc.desc   testGetTextPathWithFallbackByteLengthExceed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackByteLengthExceed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthExceed';
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
     * @tc.name   testGetTextPathWithFallbackByteLengthNegative
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_0700
     * @tc.desc   testGetTextPathWithFallbackByteLengthNegative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackByteLengthNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthNegative';
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
     * @tc.name   testGetTextPathWithFallbackXCoordinateInteger
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_0800
     * @tc.desc   testGetTextPathWithFallbackXCoordinateInteger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackXCoordinateInteger', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateInteger';
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
     * @tc.name   testGetTextPathWithFallbackXCoordinateFloat
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_0900
     * @tc.desc   testGetTextPathWithFallbackXCoordinateFloat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackXCoordinateFloat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateFloat';
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
     * @tc.name   testGetTextPathWithFallbackXCoordinateZero
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_1000
     * @tc.desc   testGetTextPathWithFallbackXCoordinateZero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackXCoordinateZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateZero';
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
     * @tc.name   testGetTextPathWithFallbackXCoordinateNegative
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_1100
     * @tc.desc   testGetTextPathWithFallbackXCoordinateNegative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackXCoordinateNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateNegative';
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
     * @tc.name   testGetTextPathWithFallbackXCoordinateMax
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_1200
     * @tc.desc   testGetTextPathWithFallbackXCoordinateMax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackXCoordinateMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateMax';
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
     * @tc.name   testGetTextPathWithFallbackYCoordinateInteger
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_1300
     * @tc.desc   testGetTextPathWithFallbackYCoordinateInteger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackYCoordinateInteger', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateInteger';
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
     * @tc.name   testGetTextPathWithFallbackYCoordinateFloat
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_1400
     * @tc.desc   testGetTextPathWithFallbackYCoordinateFloat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackYCoordinateFloat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateFloat';
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
     * @tc.name   testGetTextPathWithFallbackYCoordinateZero
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_1500
     * @tc.desc   testGetTextPathWithFallbackYCoordinateZero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackYCoordinateZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateZero';
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
     * @tc.name   testGetTextPathWithFallbackYCoordinateNegative
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_1600
     * @tc.desc   testGetTextPathWithFallbackYCoordinateNegative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackYCoordinateNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateNegative';
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
     * @tc.name   testGetTextPathWithFallbackYCoordinateMax
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_1700
     * @tc.desc   testGetTextPathWithFallbackYCoordinateMax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackYCoordinateMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateMax';
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
     * @tc.name   testGetTextPathWithFallbackEmptyText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_1800
     * @tc.desc   testGetTextPathWithFallbackEmptyText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextPathWithFallbackEmptyText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = 'testGetTextPathWithFallbackEmptyText';
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
     * @tc.name   testGetTextPathWithFallbackTextNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_1900
     * @tc.desc   testGetTextPathWithFallbackTextNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackTextNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackTextNull';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let path = font.getTextPathWithFallback(null, 5, 0, 100);
        console.info(msg + ' getTextPathWithFallback success');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackByteLengthNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_2000
     * @tc.desc   testGetTextPathWithFallbackByteLengthNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackByteLengthNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthNull';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      try {
        let path = font.getTextPathWithFallback(myString, null, 0, 100);
        console.info(msg + ' getTextPathWithFallback success');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackXNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_2100
     * @tc.desc   testGetTextPathWithFallbackXNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackXNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackXNull';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, null, 100);
        console.info(msg + ' getTextPathWithFallback success');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackYNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_2200
     * @tc.desc   testGetTextPathWithFallbackYNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackYNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackYNull';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, null);
        console.info(msg + ' getTextPathWithFallback success');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackTextUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_2300
     * @tc.desc   testGetTextPathWithFallbackTextUndefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackTextUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackTextUndefined';
      let font = new drawing.Font();
      font.setSize(50);
      try {
        let path = font.getTextPathWithFallback(undefined, 5, 0, 100);
        console.info(msg + ' getTextPathWithFallback success');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackByteLengthUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_2400
     * @tc.desc   testGetTextPathWithFallbackByteLengthUndefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackByteLengthUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthUndefined';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      try {
        let path = font.getTextPathWithFallback(myString, undefined, 0, 100);
        console.info(msg + ' getTextPathWithFallback success');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackXUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_2500
     * @tc.desc   testGetTextPathWithFallbackXUndefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackXUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackXUndefined';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, undefined, 100);
        console.info(msg + ' getTextPathWithFallback success');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackYUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_2600
     * @tc.desc   testGetTextPathWithFallbackYUndefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackYUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackYUndefined';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      let length = buffer.from(myString).length;
      try {
        let path = font.getTextPathWithFallback(myString, length, 0, undefined);
        console.info(msg + ' getTextPathWithFallback success');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testGetTextPathWithFallbackMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_2700
     * @tc.desc   testGetTextPathWithFallbackMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackMultipleCalls';
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
     * @tc.name   testGetTextPathWithFallbackPathBounds
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_2800
     * @tc.desc   testGetTextPathWithFallbackPathBounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackPathBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackPathBounds';
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
     * @tc.name   testGetTextPathWithFallbackPathIsEmpty
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_2900
     * @tc.desc   testGetTextPathWithFallbackPathIsEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackPathIsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackPathIsEmpty';
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
     * @tc.name   testGetTextPathWithFallbackSpecialCharacters
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_3000
     * @tc.desc   testGetTextPathWithFallbackSpecialCharacters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackSpecialCharacters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackSpecialCharacters';
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
     * @tc.name   testGetTextPathWithFallbackByteLengthFloat
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_3100
     * @tc.desc   testGetTextPathWithFallbackByteLengthFloat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackByteLengthFloat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthFloat';
      let font = new drawing.Font();
      font.setSize(50);
      let myString = "Hello";
      try {
        let path = font.getTextPathWithFallback(myString, 5.5, 0, 100);
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
     * @tc.name   testGetTextPathWithFallbackByteLengthMin
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_3200
     * @tc.desc   testGetTextPathWithFallbackByteLengthMin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackByteLengthMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackByteLengthMin';
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
     * @tc.name   testGetTextPathWithFallbackXCoordinateMin
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_3300
     * @tc.desc   testGetTextPathWithFallbackXCoordinateMin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackXCoordinateMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackXCoordinateMin';
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
     * @tc.name   testGetTextPathWithFallbackYCoordinateMin
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_3400
     * @tc.desc   testGetTextPathWithFallbackYCoordinateMin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackYCoordinateMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackYCoordinateMin';
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
     * @tc.name   testGetTextPathWithFallbackLongText
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_3500
     * @tc.desc   testGetTextPathWithFallbackLongText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackLongText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackLongText';
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
     * @tc.name   testGetTextPathWithFallbackEmoji
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_3600
     * @tc.desc   testGetTextPathWithFallbackEmoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTextPathWithFallbackEmoji', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let msg = 'testGetTextPathWithFallbackEmoji';
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
     * @tc.name   testGetTextPathWithFallbackXFloatPrecision
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_3700
     * @tc.desc   testGetTextPathWithFallbackXFloatPrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackXFloatPrecision', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackXFloatPrecision';
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
     * @tc.name   testGetTextPathWithFallbackYFloatPrecision
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_GETTEXTPATHWITHFALLBACK_3800
     * @tc.desc   testGetTextPathWithFallbackYFloatPrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTextPathWithFallbackYFloatPrecision', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let msg = 'testGetTextPathWithFallbackYFloatPrecision';
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