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

export default function DrawingTsToolPart2Test() {
  describe('DrawingTsToolPart2Test', () => {
    /**
     * @tc.name   testMakeColorFromResourceColorReturnValueValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_0100
     * @tc.desc   test makeColorFromResourceColor return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorReturnValueValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeColorFromResourceColorReturnValueValidation';
      try {
        let color: common2D.Color = drawing.Tool.makeColorFromResourceColor(0xFFFF0000);
        console.info(msg + ' makeColorFromResourceColor 0xFFFF0000 succeeded');
        expect(color != null && color != undefined).assertTrue();
        expect(color.alpha).assertEqual(255);
        expect(color.red).assertEqual(255);
        expect(color.green).assertEqual(0);
        expect(color.blue).assertEqual(0);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color: common2D.Color = drawing.Tool.makeColorFromResourceColor('#00FF00');
        console.info(msg + ' makeColorFromResourceColor #00FF00 succeeded');
        expect(color != null && color != undefined).assertTrue();
        expect(color.alpha).assertEqual(255);
        expect(color.red).assertEqual(0);
        expect(color.green).assertEqual(255);
        expect(color.blue).assertEqual(0);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgb(0, 0, 255)');
        console.info(msg + ' makeColorFromResourceColor rgb(0, 0, 255) succeeded');
        expect(color != null && color != undefined).assertTrue();
        expect(color.alpha).assertEqual(255);
        expect(color.red).assertEqual(0);
        expect(color.green).assertEqual(0);
        expect(color.blue).assertEqual(255);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorWithBrush
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_0300
     * @tc.desc   test makeColorFromResourceColor with Brush setColor joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeColorFromResourceColorWithBrush', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeColorFromResourceColorWithBrush';
      try {
        let color: common2D.Color = drawing.Tool.makeColorFromResourceColor(0xFFFF0000);
        let brush = new drawing.Brush();
        brush.setColor(color);
        console.info(msg + ' makeColorFromResourceColor with Brush succeeded');
        expect(brush != null && brush != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorWithPen
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_0400
     * @tc.desc   test makeColorFromResourceColor with Pen setColor joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeColorFromResourceColorWithPen', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeColorFromResourceColorWithPen';
      try {
        let color: common2D.Color = drawing.Tool.makeColorFromResourceColor(0xFFFF0000);
        let pen = new drawing.Pen();
        pen.setColor(color);
        console.info(msg + ' makeColorFromResourceColor with Pen succeeded');
        expect(pen != null && pen != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorColorEnums
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_0500
     * @tc.desc   test makeColorFromResourceColor with all Color enums.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeColorFromResourceColorColorEnums', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeColorFromResourceColorColorEnums';
      try {
        let colorBlue = drawing.Tool.makeColorFromResourceColor(Color.Blue);
        expect(colorBlue != null && colorBlue != undefined).assertTrue();
        let colorGreen = drawing.Tool.makeColorFromResourceColor(Color.Green);
        expect(colorGreen != null && colorGreen != undefined).assertTrue();
        let colorRed = drawing.Tool.makeColorFromResourceColor(Color.Red);
        expect(colorRed != null && colorRed != undefined).assertTrue();
        let colorBlack = drawing.Tool.makeColorFromResourceColor(Color.Black);
        expect(colorBlack != null && colorBlack != undefined).assertTrue();
        let colorWhite = drawing.Tool.makeColorFromResourceColor(Color.White);
        expect(colorWhite != null && colorWhite != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor with Color enums succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorBoundaryAlpha
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_0600
     * @tc.desc   test makeColorFromResourceColor with boundary alpha values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeColorFromResourceColorBoundaryAlpha', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testMakeColorFromResourceColorBoundaryAlpha';
      try {
        let colorMin = drawing.Tool.makeColorFromResourceColor('rgba(255, 0, 0, 0.0)');
        console.info(msg + ' makeColorFromResourceColor with alpha 0 succeeded');
        expect(colorMin != null && colorMin != undefined).assertTrue();
        expect(colorMin.alpha).assertEqual(0);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorMax = drawing.Tool.makeColorFromResourceColor(0xFFFF0000);
        console.info(msg + ' makeColorFromResourceColor with alpha 255 succeeded');
        expect(colorMax != null && colorMax != undefined).assertTrue();
        expect(colorMax.alpha).assertEqual(255);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorBoundaryRGB
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_0700
     * @tc.desc   test makeColorFromResourceColor with boundary RGB values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorBoundaryRGB', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeColorFromResourceColorBoundaryRGB';
      try {
        let colorMin = drawing.Tool.makeColorFromResourceColor('rgb(0, 0, 0)');
        console.info(msg + ' makeColorFromResourceColor with RGB 0 succeeded');
        expect(colorMin != null && colorMin != undefined).assertTrue();
        expect(colorMin.red).assertEqual(0);
        expect(colorMin.green).assertEqual(0);
        expect(colorMin.blue).assertEqual(0);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorMax = drawing.Tool.makeColorFromResourceColor('rgb(255, 255, 255)');
        console.info(msg + ' makeColorFromResourceColor with RGB 255 succeeded');
        expect(colorMax != null && colorMax != undefined).assertTrue();
        expect(colorMax.red).assertEqual(255);
        expect(colorMax.green).assertEqual(255);
        expect(colorMax.blue).assertEqual(255);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorHexFormats
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_0800
     * @tc.desc   test makeColorFromResourceColor with different hex formats.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeColorFromResourceColorHexFormats', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeColorFromResourceColorHexFormats';
      try {
        let color3Digit = drawing.Tool.makeColorFromResourceColor('#F00');
        expect(color3Digit != null && color3Digit != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor #F00 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color4Digit = drawing.Tool.makeColorFromResourceColor('#FF00');
        expect(color4Digit != null && color4Digit != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor #FF00 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color6Digit = drawing.Tool.makeColorFromResourceColor('#FF0000');
        expect(color6Digit != null && color6Digit != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor #FF0000 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color8Digit = drawing.Tool.makeColorFromResourceColor('#FFFF0000');
        expect(color8Digit != null && color8Digit != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor #FFFF0000 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorRgbaFormats
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_0900
     * @tc.desc   test makeColorFromResourceColor with rgba format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeColorFromResourceColorRgbaFormats', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeColorFromResourceColorRgbaFormats';
      try {
        let color0 = drawing.Tool.makeColorFromResourceColor('rgba(255, 0, 0, 0.0)');
        expect(color0 != null && color0 != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor rgba alpha 0.0 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color1 = drawing.Tool.makeColorFromResourceColor('rgba(255, 0, 0, 1.0)');
        expect(color1 != null && color1 != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor rgba alpha 1.0 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color05 = drawing.Tool.makeColorFromResourceColor('rgba(255, 0, 0, 0.5)');
        expect(color05 != null && color05 != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor rgba alpha 0.5 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorMinMaxValues
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_1000
     * @tc.desc   test makeColorFromResourceColor with min and max number values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeColorFromResourceColorMinMaxValues', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeColorFromResourceColorMinMaxValues';
      try {
        let color0 = drawing.Tool.makeColorFromResourceColor(0);
        console.info(msg + ' makeColorFromResourceColor 0 succeeded');
        expect(color0 != null && color0 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorMax = drawing.Tool.makeColorFromResourceColor(0xFFFFFFFF);
        console.info(msg + ' makeColorFromResourceColor 0xFFFFFFFF succeeded');
        expect(colorMax != null && colorMax != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorFloatValues
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_1100
     * @tc.desc   test makeColorFromResourceColor with float number values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeColorFromResourceColorFloatValues', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testMakeColorFromResourceColorFloatValues';
      try {
        let color1 = drawing.Tool.makeColorFromResourceColor(255.5);
        console.info(msg + ' makeColorFromResourceColor 255.5 succeeded');
        expect(color1 != null && color1 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color2 = drawing.Tool.makeColorFromResourceColor(255.99);
        console.info(msg + ' makeColorFromResourceColor 255.99 succeeded');
        expect(color2 != null && color2 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color3 = drawing.Tool.makeColorFromResourceColor(255.01);
        console.info(msg + ' makeColorFromResourceColor 255.01 succeeded');
        expect(color3 != null && color3 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorNegativeNumber
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_1200
     * @tc.desc   test makeColorFromResourceColor with negative number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorNegativeNumber', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeColorFromResourceColorNegativeNumber';
      try {
        let color = drawing.Tool.makeColorFromResourceColor(-1);
        console.info(msg + ' makeColorFromResourceColor -1 succeeded');
        expect(color != null && color != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color = drawing.Tool.makeColorFromResourceColor(-255);
        console.info(msg + ' makeColorFromResourceColor -255 succeeded');
        expect(color != null && color != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorMultipleTimes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_1300
     * @tc.desc   test makeColorFromResourceColor multiple times stability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeColorFromResourceColorMultipleTimes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeColorFromResourceColorMultipleTimes';
      try {
        for (let i = 0; i < 100; i++) {
          let color = drawing.Tool.makeColorFromResourceColor(0xFFFF0000);
          expect(color != null && color != undefined).assertTrue();
        }
        console.info(msg + ' 100 makeColorFromResourceColor calls succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorInvalidString
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_1400
     * @tc.desc   test makeColorFromResourceColor with invalid string formats.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeColorFromResourceColorInvalidString', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeColorFromResourceColorInvalidString';
      try {
        let color = drawing.Tool.makeColorFromResourceColor('invalid');
        console.info(msg + ' makeColorFromResourceColor invalid string result');
        expect(color == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color = drawing.Tool.makeColorFromResourceColor('rgb(abc, def, ghi)');
        console.info(msg + ' makeColorFromResourceColor invalid rgb string result');
        expect(color == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color = drawing.Tool.makeColorFromResourceColor('rgba(abc, def, ghi, 0.5)');
        console.info(msg + ' makeColorFromResourceColor invalid rgba string result');
        expect(color == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorSpecialCharacters
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_1500
     * @tc.desc   test makeColorFromResourceColor with special characters in string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeColorFromResourceColorSpecialCharacters', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeColorFromResourceColorSpecialCharacters';
      try {
        let color = drawing.Tool.makeColorFromResourceColor('#FF@000');
        console.info(msg + ' makeColorFromResourceColor #FF@000 result');
        expect(color == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color = drawing.Tool.makeColorFromResourceColor('#FF$000');
        console.info(msg + ' makeColorFromResourceColor #FF$000 result');
        expect(color == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color = drawing.Tool.makeColorFromResourceColor('#FF%000');
        console.info(msg + ' makeColorFromResourceColor #FF%000 result');
        expect(color == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorRgbOutOfRange
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_1600
     * @tc.desc   test makeColorFromResourceColor with rgb values out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeColorFromResourceColorRgbOutOfRange', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testMakeColorFromResourceColorRgbOutOfRange';
      try {
        let color = drawing.Tool.makeColorFromResourceColor('rgb(-1, 0, 0)');
        console.info(msg + ' makeColorFromResourceColor rgb(-1, 0, 0) result');
        expect(color == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color = drawing.Tool.makeColorFromResourceColor('rgb(256, 0, 0)');
        console.info(msg + ' makeColorFromResourceColor rgb(256, 0, 0) result');
        expect(color != null && color != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorRgbaOutOfRange
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_1700
     * @tc.desc   test makeColorFromResourceColor with rgba values out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorRgbaOutOfRange', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMakeColorFromResourceColorRgbaOutOfRange';
      try {
        let color = drawing.Tool.makeColorFromResourceColor('rgba(255, 0, 0, -0.1)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 0, 0, -0.1) result');
        expect(color == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color = drawing.Tool.makeColorFromResourceColor('rgba(255, 0, 0, 1.1)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 0, 0, 1.1) result');
        expect(color == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorDifferentCases
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_1800
     * @tc.desc   test makeColorFromResourceColor with different case strings.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
it('testMakeColorFromResourceColorDifferentCases', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMakeColorFromResourceColorDifferentCases';
      try {
        let colorLower = drawing.Tool.makeColorFromResourceColor('rgb(255, 0, 0)');
        console.info(msg + ' makeColorFromResourceColor rgb lower case succeeded');
        expect(colorLower != null && colorLower != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorUpper = drawing.Tool.makeColorFromResourceColor('RGB(255, 0, 0)');
        console.info(msg + ' makeColorFromResourceColor RGB upper case result');
        expect(colorUpper == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorMixed = drawing.Tool.makeColorFromResourceColor('Rgb(255, 0, 0)');
        console.info(msg + ' makeColorFromResourceColor Rgb mixed case result');
        expect(colorMixed == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorSpacesInString
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_1900
     * @tc.desc   test makeColorFromResourceColor with spaces in string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeColorFromResourceColorSpacesInString', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMakeColorFromResourceColorSpacesInString';
      try {
        let color1 = drawing.Tool.makeColorFromResourceColor('rgb(255,0,0)');
        expect(color1 != null && color1 != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor rgb(255,0,0) succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color2 = drawing.Tool.makeColorFromResourceColor('rgb( 255, 0, 0 )');
        expect(color2 != null && color2 != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor rgb( 255, 0, 0 ) succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color3 = drawing.Tool.makeColorFromResourceColor('  rgb(255, 0, 0)  ');
        expect(color3 != null && color3 != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor rgb with outer spaces succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorReturnNullPointer
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_2000
     * @tc.desc   test makeColorFromResourceColor return null pointer on failure.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeColorFromResourceColorReturnNullPointer', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMakeColorFromResourceColorReturnNullPointer';
      try {
        let color = drawing.Tool.makeColorFromResourceColor('not_a_color');
        console.info(msg + ' makeColorFromResourceColor invalid color result');
        expect(color == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
  })
}