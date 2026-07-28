'use static';
/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';

export default function DrawingTsToolPart2Test(): void {
  describe('DrawingTsToolPart2Test', (): void => {
    /**
     * @tc.name   testMakeColorFromResourceColorReturnValueValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_0100
     * @tc.desc   test makeColorFromResourceColor return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorReturnValueValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testMakeColorFromResourceColorReturnValueValidationStatic';
      try {
        let color = drawing.Tool.makeColorFromResourceColor(0xFFFF0000.toInt());
        console.info(msg + ' makeColorFromResourceColor 0xFFFF0000 succeeded');
        expect(color != null && color != undefined).assertTrue();
        expect(color!.alpha).assertEqual(255);
        expect(color!.red).assertEqual(255);
        expect(color!.green).assertEqual(0);
        expect(color!.blue).assertEqual(0);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color = drawing.Tool.makeColorFromResourceColor('#00FF00');
        console.info(msg + ' makeColorFromResourceColor #00FF00 succeeded');
        expect(color != null && color != undefined).assertTrue();
        expect(color!.alpha).assertEqual(255);
        expect(color!.red).assertEqual(0);
        expect(color!.green).assertEqual(255);
        expect(color!.blue).assertEqual(0);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color = drawing.Tool.makeColorFromResourceColor('rgb(0, 0, 255)');
        console.info(msg + ' makeColorFromResourceColor rgb(0, 0, 255) succeeded');
        expect(color != null && color != undefined).assertTrue();
        expect(color!.alpha).assertEqual(255);
        expect(color!.red).assertEqual(0);
        expect(color!.green).assertEqual(0);
        expect(color!.blue).assertEqual(255);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorWithBrushStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_0300
     * @tc.desc   test makeColorFromResourceColor with Brush setColor joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeColorFromResourceColorWithBrushStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testMakeColorFromResourceColorWithBrushStatic';
      try {
        let color = drawing.Tool.makeColorFromResourceColor(0xFFFF0000.toInt());
        let brush = new drawing.Brush();
        brush.setColor(color!);
        console.info(msg + ' makeColorFromResourceColor with Brush succeeded');
        expect(brush != null && brush != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorWithPenStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_0400
     * @tc.desc   test makeColorFromResourceColor with Pen setColor joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeColorFromResourceColorWithPenStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testMakeColorFromResourceColorWithPenStatic';
      try {
        let color = drawing.Tool.makeColorFromResourceColor(0xFFFF0000.toInt());
        let pen = new drawing.Pen();
        pen.setColor(color!);
        console.info(msg + ' makeColorFromResourceColor with Pen succeeded');
        expect(pen != null && pen != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorColorEnumsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_0500
     * @tc.desc   test makeColorFromResourceColor with all Color enums.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeColorFromResourceColorColorEnumsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testMakeColorFromResourceColorColorEnumsStatic';
      try {
        let colorBlue = drawing.Tool.makeColorFromResourceColor(0xFF0000FF.toInt());
        expect(colorBlue != null && colorBlue != undefined).assertTrue();
        let colorGreen = drawing.Tool.makeColorFromResourceColor(0xFF00FF00.toInt());
        expect(colorGreen != null && colorGreen != undefined).assertTrue();
        let colorRed = drawing.Tool.makeColorFromResourceColor(0xFFFF0000.toInt());
        expect(colorRed != null && colorRed != undefined).assertTrue();
        let colorBlack = drawing.Tool.makeColorFromResourceColor(0xFF000000.toInt());
        expect(colorBlack != null && colorBlack != undefined).assertTrue();
        let colorWhite = drawing.Tool.makeColorFromResourceColor(0xFFFFFFFF.toInt());
        expect(colorWhite != null && colorWhite != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor with Color enums succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorBoundaryAlphaStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_0600
     * @tc.desc   test makeColorFromResourceColor with boundary alpha values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeColorFromResourceColorBoundaryAlphaStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testMakeColorFromResourceColorBoundaryAlphaStatic';
      try {
        let colorMin = drawing.Tool.makeColorFromResourceColor('rgba(255, 0, 0, 0.0)');
        console.info(msg + ' makeColorFromResourceColor with alpha 0 succeeded colorMin：' + JSON.stringify(colorMin));
        expect(colorMin != null && colorMin != undefined).assertTrue();
        expect(colorMin!.alpha).assertEqual(0);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorMax = drawing.Tool.makeColorFromResourceColor(0xFFFF0000.toInt());
        console.info(msg + ' makeColorFromResourceColor with alpha 255 succeeded colorMax: '  + JSON.stringify(colorMax));
        expect(colorMax != null && colorMax != undefined).assertTrue();
        expect(colorMax!.alpha).assertEqual(255);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorBoundaryRGBStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_0700
     * @tc.desc   test makeColorFromResourceColor with boundary RGB values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorBoundaryRGBStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testMakeColorFromResourceColorBoundaryRGBStatic';
      try {
        let colorMin = drawing.Tool.makeColorFromResourceColor('rgb(0, 0, 0)');
        console.info(msg + ' makeColorFromResourceColor with RGB 0 succeeded colorMin ' + JSON.stringify(colorMin));
        expect(colorMin != null && colorMin != undefined).assertTrue();
        expect(colorMin!.red).assertEqual(0);
        expect(colorMin!.green).assertEqual(0);
        expect(colorMin!.blue).assertEqual(0);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorMax = drawing.Tool.makeColorFromResourceColor('rgb(255, 255, 255)');
        console.info(msg + ' makeColorFromResourceColor with RGB 255 succeeded colorMax: ' + JSON.stringify(colorMax));
        expect(colorMax != null && colorMax != undefined).assertTrue();
        expect(colorMax!.red).assertEqual(255);
        expect(colorMax!.green).assertEqual(255);
        expect(colorMax!.blue).assertEqual(255);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorHexFormatsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_0800
     * @tc.desc   test makeColorFromResourceColor with different hex formats.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeColorFromResourceColorHexFormatsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testMakeColorFromResourceColorHexFormatsStatic';
      try {
        let color3Digit = drawing.Tool.makeColorFromResourceColor('#F00')!;
        expect(color3Digit != null && color3Digit != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor #F00 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color4Digit = drawing.Tool.makeColorFromResourceColor('#FF00')!;
        expect(color4Digit != null && color4Digit != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor #FF00 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color6Digit = drawing.Tool.makeColorFromResourceColor('#FF0000')!;
        expect(color6Digit != null && color6Digit != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor #FF0000 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color8Digit = drawing.Tool.makeColorFromResourceColor('#FFFF0000')!;
        expect(color8Digit != null && color8Digit != undefined).assertTrue();
        console.info(msg + ' makeColorFromResourceColor #FFFF0000 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorRgbaFormatsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_0900
     * @tc.desc   test makeColorFromResourceColor with rgba format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeColorFromResourceColorRgbaFormatsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testMakeColorFromResourceColorRgbaFormatsStatic';
      try {
        let color0 = drawing.Tool.makeColorFromResourceColor('rgba(255, 0, 0, 0.0)');
        console.info(msg + ' makeColorFromResourceColor rgba alpha 0.0 succeeded color0: ' + JSON.stringify(color0));
        expect(color0 != null && color0 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color1 = drawing.Tool.makeColorFromResourceColor('rgba(255, 0, 0, 1.0)');
        console.info(msg + ' makeColorFromResourceColor rgba alpha 1.0 succeeded color1: ' + JSON.stringify(color1));
        expect(color1 != null && color1 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color05 = drawing.Tool.makeColorFromResourceColor('rgba(255, 0, 0, 0.5)');
        console.info(msg + ' makeColorFromResourceColor rgba alpha 0.5 succeeded color05: ' + JSON.stringify(color05));
        expect(color05 != null && color05 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorMinMaxValuesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_1000
     * @tc.desc   test makeColorFromResourceColor with min and max number values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeColorFromResourceColorMinMaxValuesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testMakeColorFromResourceColorMinMaxValuesStatic';
      try {
        let color0 = drawing.Tool.makeColorFromResourceColor(0)!;
        console.info(msg + ' makeColorFromResourceColor 0 succeeded');
        expect(color0 != null && color0 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorMax = drawing.Tool.makeColorFromResourceColor(0xFFFFFFFF.toInt());
        console.info(msg + ' makeColorFromResourceColor 0xFFFFFFFF succeeded');
        expect(colorMax != null && colorMax != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorNegativeNumberStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_1200
     * @tc.desc   test makeColorFromResourceColor with negative number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorNegativeNumberStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testMakeColorFromResourceColorNegativeNumberStatic';
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
     * @tc.name   testMakeColorFromResourceColorMultipleTimesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_1300
     * @tc.desc   test makeColorFromResourceColor multiple times stability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeColorFromResourceColorMultipleTimesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testMakeColorFromResourceColorMultipleTimesStatic';
      try {
        for (let i = 0; i < 100; i++) {
          let color = drawing.Tool.makeColorFromResourceColor(0xFFFF0000.toInt());
          expect(color != null && color != undefined).assertTrue();
        }
        console.info(msg + ' 100 makeColorFromResourceColor calls succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorInvalidStringStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_1400
     * @tc.desc   test makeColorFromResourceColor with invalid string formats.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeColorFromResourceColorInvalidStringStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testMakeColorFromResourceColorInvalidStringStatic';
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
     * @tc.name   testMakeColorFromResourceColorSpecialCharactersStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_1500
     * @tc.desc   test makeColorFromResourceColor with special characters in string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeColorFromResourceColorSpecialCharactersStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testMakeColorFromResourceColorSpecialCharactersStatic';
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
     * @tc.name   testMakeColorFromResourceColorRgbOutOfRangeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_1600
     * @tc.desc   test makeColorFromResourceColor with rgb values out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeColorFromResourceColorRgbOutOfRangeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testMakeColorFromResourceColorRgbOutOfRangeStatic';
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
     * @tc.name   testMakeColorFromResourceColorRgbaOutOfRangeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_1700
     * @tc.desc   test makeColorFromResourceColor with rgba values out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorRgbaOutOfRangeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testMakeColorFromResourceColorRgbaOutOfRangeStatic';
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
     * @tc.name   testMakeColorFromResourceColorDifferentCasesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_1800
     * @tc.desc   test makeColorFromResourceColor with different case strings.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeColorFromResourceColorDifferentCasesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testMakeColorFromResourceColorDifferentCasesStatic';
      try {
        let colorLower = drawing.Tool.makeColorFromResourceColor('rgb(255, 0, 0)');
        console.info(msg + ' makeColorFromResourceColor rgb lower case succeeded colorLower: ' + JSON.stringify(colorLower));
        expect(colorLower != null && colorLower != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorUpper = drawing.Tool.makeColorFromResourceColor('RGB(255, 0, 0)');
        console.info(msg + ' makeColorFromResourceColor RGB upper case result colorUpper: '+ JSON.stringify(colorUpper));
        expect(colorUpper == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorMixed = drawing.Tool.makeColorFromResourceColor('Rgb(255, 0, 0)!');
        console.info(msg + ' makeColorFromResourceColor Rgb mixed case result');
        expect(colorMixed == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorSpacesInStringStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_1900
     * @tc.desc   test makeColorFromResourceColor with spaces in string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeColorFromResourceColorSpacesInStringStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testMakeColorFromResourceColorSpacesInStringStatic';
      try {
        let color1 = drawing.Tool.makeColorFromResourceColor('rgb(255,0,0)');
        console.info(msg + ' makeColorFromResourceColor rgb(255,0,0) succeeded color1: '+ JSON.stringify(color1));
        expect(color1 != null && color1 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color2 = drawing.Tool.makeColorFromResourceColor('rgb( 255, 0, 0 )');
        console.info(msg + ' makeColorFromResourceColor rgb( 255, 0, 0 ) succeeded color2: ' + JSON.stringify(color2));
        expect(color2 != null && color2 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color3 = drawing.Tool.makeColorFromResourceColor('  rgb(255, 0, 0)  ');
        console.info(msg + ' makeColorFromResourceColor rgb with outer spaces succeeded color3: ' + JSON.stringify(color3));
        expect(color3 != null && color3 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeColorFromResourceColorReturnNullPointerStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TOOL_STATIC_2000
     * @tc.desc   test makeColorFromResourceColor return null pointer on failure.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeColorFromResourceColorReturnNullPointerStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testMakeColorFromResourceColorReturnNullPointerStatic';
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