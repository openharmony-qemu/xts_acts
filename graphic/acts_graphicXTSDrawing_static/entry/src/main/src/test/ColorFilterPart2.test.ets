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
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';

interface  ObjItem  {
  mul: common2D.Color,
  add: common2D.Color
}

export default function DrawingTsColorFilterPart2Test(): void {
  describe('DrawingTsColorFilterPart2Test', (): void => {
    /**
     * @tc.name   testColorFilterCreateBlendModeColorFilterNumberTypeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_COLORFILTER_STATIC_0100
     * @tc.desc   Test createBlendModeColorFilter with number type color parameter (API 18+).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateBlendModeColorFilterNumberTypeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterNumberTypeStatic';

      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createBlendModeColorFilter with red color succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 0, red: 0, green: 0, blue: 0}, drawing.BlendMode.SRC);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createBlendModeColorFilter with transparent color succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 255, blue: 255}, drawing.BlendMode.SRC);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createBlendModeColorFilter with white color succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter(255, drawing.BlendMode.SRC);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createBlendModeColorFilter with 255 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testColorFilterCreateBlendModeColorFilterExtremeValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_COLORFILTER_STATIC_0300
     * @tc.desc   Test createBlendModeColorFilter with extreme color values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateBlendModeColorFilterExtremeValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterExtremeValueStatic';

      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 0, red: 0, green: 0, blue: 0}, drawing.BlendMode.SRC);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createBlendModeColorFilter with minimum values succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 255, blue: 255}, drawing.BlendMode.SRC);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createBlendModeColorFilter with maximum values succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter with MAX_VALUE alpha succeeded');
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 1, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter with MIN_VALUE alpha succeeded');
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter with Infinity succeeded');
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter with -Infinity succeeded');
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterCreateComposeColorFilterBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_COLORFILTER_STATIC_0500
     * @tc.desc   Test createComposeColorFilter with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateComposeColorFilterBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateComposeColorFilterBoundaryValueStatic';

      let filter1 = drawing.ColorFilter.createLinearToSRGBGamma();
      let filter2 = drawing.ColorFilter.createSRGBGammaToLinear();
      let filter3 = drawing.ColorFilter.createLumaColorFilter();
      let filter4 = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC);

      try {
        let composeFilter = drawing.ColorFilter.createComposeColorFilter(filter1!, filter2!);
        expect(composeFilter != null && composeFilter != undefined).assertTrue();
        console.info(msg + ' compose LinearToSRGBGamma and SRGBGammaToLinear succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let composeFilter = drawing.ColorFilter.createComposeColorFilter(filter1!, filter1!);
        expect(composeFilter != null && composeFilter != undefined).assertTrue();
        console.info(msg + ' compose same filter succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let composeFilter = drawing.ColorFilter.createComposeColorFilter(filter3!, filter4!);
        expect(composeFilter != null && composeFilter != undefined).assertTrue();
        console.info(msg + ' compose LumaColorFilter and BlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterCreateMatrixColorFilterBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_COLORFILTER_STATIC_0600
     * @tc.desc   Test createMatrixColorFilter with boundary and extreme values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateMatrixColorFilterBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateMatrixColorFilterBoundaryValueStatic';

      let matrix1: Array<number> = [
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(matrix1);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createMatrixColorFilter with all zeros succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      let matrix2: Array<number> = [
        Number.MAX_VALUE, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(matrix2);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createMatrixColorFilter with MAX_VALUE succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      let matrix3: Array<number> = [
        Number.MIN_VALUE, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(matrix3);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createMatrixColorFilter with MIN_VALUE succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      let matrix4: Array<number> = [
        -Number.MAX_VALUE, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(matrix4);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createMatrixColorFilter with negative MAX_VALUE succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
      let matrix5: Array<number> = [
        Infinity, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(matrix5);
        console.info(msg + ' createMatrixColorFilter with Infinity succeeded');
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      let matrix6: Array<number> = [
        -Infinity, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(matrix6);
        console.info(msg + ' createMatrixColorFilter with -Infinity succeeded');
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterCreateLightingColorFilterBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_COLORFILTER_STATIC_0800
     * @tc.desc   Test createLightingColorFilter with boundary and extreme values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateLightingColorFilterBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateLightingColorFilterBoundaryValueStatic';

      let mulColor1: common2D.Color = { alpha: 0, red: 0, green: 0, blue: 0 };
      let addColor1: common2D.Color = { alpha: 0, red: 0, green: 0, blue: 0 };
      try {
        let colorFilter = drawing.ColorFilter.createLightingColorFilter(mulColor1, addColor1);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createLightingColorFilter with all zeros succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      let mulColor2: common2D.Color = { alpha: 255, red: 255, green: 255, blue: 255 };
      let addColor2: common2D.Color = { alpha: 255, red: 255, green: 255, blue: 255 };
      try {
        let colorFilter = drawing.ColorFilter.createLightingColorFilter(mulColor2, addColor2);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createLightingColorFilter with all max values succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createLightingColorFilter({alpha: 0, red: 0, green: 0, blue: 0}, {alpha: 0, red: 0, green: 0, blue: 0});
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createLightingColorFilter with number 0 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createLightingColorFilter({alpha: 255, red: 255, green: 255, blue: 255}, {alpha: 255, red: 255, green: 255, blue: 255});
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createLightingColorFilter with number max succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createLightingColorFilter({alpha: 0, red: 0, green: 0, blue: 0}, {alpha: 255, red: 255, green: 255, blue: 255});
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createLightingColorFilter with min and max succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createLightingColorFilter({alpha: 255, red: 255, green: 255, blue: 255}, {alpha: 0, red: 0, green: 0, blue: 0});
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createLightingColorFilter with max and min succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testColorFilterAllBlendModesWithNumberStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_COLORFILTER_STATIC_1300
     * @tc.desc   Test createBlendModeColorFilter with number color for all BlendModes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterAllBlendModesWithNumberStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterAllBlendModesWithNumberStatic';

      let blendModes = [
        drawing.BlendMode.CLEAR,
        drawing.BlendMode.SRC,
        drawing.BlendMode.DST,
        drawing.BlendMode.SRC_OVER,
        drawing.BlendMode.DST_OVER,
        drawing.BlendMode.SRC_IN,
        drawing.BlendMode.DST_IN,
        drawing.BlendMode.SRC_OUT,
        drawing.BlendMode.DST_OUT,
        drawing.BlendMode.SRC_ATOP,
        drawing.BlendMode.DST_ATOP,
        drawing.BlendMode.XOR,
        drawing.BlendMode.PLUS,
        drawing.BlendMode.MODULATE,
        drawing.BlendMode.SCREEN,
        drawing.BlendMode.OVERLAY,
        drawing.BlendMode.DARKEN,
        drawing.BlendMode.LIGHTEN,
        drawing.BlendMode.COLOR_DODGE,
        drawing.BlendMode.COLOR_BURN,
        drawing.BlendMode.HARD_LIGHT,
        drawing.BlendMode.SOFT_LIGHT,
        drawing.BlendMode.DIFFERENCE,
        drawing.BlendMode.EXCLUSION,
        drawing.BlendMode.MULTIPLY,
        drawing.BlendMode.HUE,
        drawing.BlendMode.SATURATION,
        drawing.BlendMode.COLOR,
        drawing.BlendMode.LUMINOSITY
      ];

      for (let mode of blendModes) {
        try {
          let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, mode);
          expect(colorFilter != null && colorFilter != undefined).assertTrue();
          console.info(msg + ` BlendMode ${mode} succeeded`);
        } catch (e) {
          console.info(msg + ` BlendMode ${mode} errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testColorFilterReturnValueValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_COLORFILTER_STATIC_1400
     * @tc.desc   Test ColorFilter return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterReturnValueValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterReturnValueValidationStatic';

      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC);
        expect(typeof colorFilter === 'object').assertTrue();
        expect(colorFilter != null).assertTrue();
        expect(colorFilter != undefined).assertTrue();
        console.info(msg + ' createBlendModeColorFilter return value validated');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createLinearToSRGBGamma();
        expect(typeof colorFilter === 'object').assertTrue();
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createLinearToSRGBGamma return value validated');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        expect(typeof colorFilter === 'object').assertTrue();
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createSRGBGammaToLinear return value validated');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createLumaColorFilter();
        expect(typeof colorFilter === 'object').assertTrue();
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createLumaColorFilter return value validated');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let matrix: Array<number> = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(matrix);
        expect(typeof colorFilter === 'object').assertTrue();
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createMatrixColorFilter return value validated');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let mulColor: common2D.Color = { alpha: 255, red: 128, green: 128, blue: 128 };
        let addColor: common2D.Color = { alpha: 255, red: 64, green: 64, blue: 64 };
        let colorFilter = drawing.ColorFilter.createLightingColorFilter(mulColor, addColor);
        expect(typeof colorFilter === 'object').assertTrue();
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createLightingColorFilter return value validated');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let filter1 = drawing.ColorFilter.createLumaColorFilter();
        let filter2 = drawing.ColorFilter.createLinearToSRGBGamma();
        let colorFilter = drawing.ColorFilter.createComposeColorFilter(filter1!, filter2!);
        expect(typeof colorFilter === 'object').assertTrue();
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' createComposeColorFilter return value validated');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterComposeChainedStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_COLORFILTER_STATIC_1500
     * @tc.desc   Test chained compose of ColorFilters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterComposeChainedStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterComposeChainedStatic';

      try {
        let filter1 = drawing.ColorFilter.createLinearToSRGBGamma();
        let filter2 = drawing.ColorFilter.createSRGBGammaToLinear();
        let filter3 = drawing.ColorFilter.createLumaColorFilter();

        let compose1 = drawing.ColorFilter.createComposeColorFilter(filter1!, filter2!);
        let compose2 = drawing.ColorFilter.createComposeColorFilter(compose1!, filter3!);
        expect(compose2 != null && compose2 != undefined).assertTrue();
        console.info(msg + ' two-level compose succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let filter1 = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC);
        let filter2 = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 0, green: 255, blue: 0}, drawing.BlendMode.DST);
        let filter3 = drawing.ColorFilter.createLumaColorFilter();
        let filter4 = drawing.ColorFilter.createLinearToSRGBGamma();

        let compose1 = drawing.ColorFilter.createComposeColorFilter(filter1!, filter2!);
        let compose2 = drawing.ColorFilter.createComposeColorFilter(filter3!, filter4!);
        let compose3 = drawing.ColorFilter.createComposeColorFilter(compose1!, compose2!);
        expect(compose3 != null && compose3 != undefined).assertTrue();
        console.info(msg + ' four-level compose succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterDifferentColorCombinationsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_COLORFILTER_STATIC_1600
     * @tc.desc   Test createBlendModeColorFilter with different color combinations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterDifferentColorCombinationsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterDifferentColorCombinationsStatic';

      let colors:Array<common2D.Color> = [
        {alpha: 255, red: 0, green: 0, blue: 0},
        {alpha: 255, red: 255, green: 0, blue: 0},
        {alpha: 255, red: 0, green: 255, blue: 0},
        {alpha: 255, red: 0, green: 0, blue: 255},
        {alpha: 255, red: 255, green: 255, blue: 0},
        {alpha: 255, red: 255, green: 0, blue: 255},
        {alpha: 255, red: 0, green: 255, blue: 255},
        {alpha: 255, red: 255, green: 255, blue: 255},
        {alpha: 0, red: 255, green: 0, blue: 0},
        {alpha: 128, red: 128, green: 128, blue: 128}
      ];

      for (let color of colors) {
        try {
          let colorFilter = drawing.ColorFilter.createBlendModeColorFilter(color, drawing.BlendMode.SRC);
          expect(colorFilter != null && colorFilter != undefined).assertTrue();
          console.info(msg + ` color ${JSON.stringify(color)} succeeded`);
        } catch (e) {
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testColorFilterSpecialMatrixValuesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_COLORFILTER_STATIC_1700
     * @tc.desc   Test createMatrixColorFilter with special matrix values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterSpecialMatrixValuesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterSpecialMatrixValuesStatic';

      let identityMatrix: Array<number> = [
        1, 0, 0, 0, 0,
        0, 1, 0, 0, 0,
        0, 0, 1, 0, 0,
        0, 0, 0, 1, 0
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(identityMatrix);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' identity matrix succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      let grayscaleMatrix: Array<number> = [
        0.33, 0.33, 0.33, 0, 0,
        0.33, 0.33, 0.33, 0, 0,
        0.33, 0.33, 0.33, 0, 0,
        0, 0, 0, 1, 0
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(grayscaleMatrix);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' grayscale matrix succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      let invertMatrix: Array<number> = [
        -1, 0, 0, 0, 255,
        0, -1, 0, 0, 255,
        0, 0, -1, 0, 255,
        0, 0, 0, 1, 0
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(invertMatrix);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' invert matrix succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      let sepiaMatrix: Array<number> = [
        0.393, 0.769, 0.189, 0, 0,
        0.349, 0.686, 0.168, 0, 0,
        0.272, 0.534, 0.131, 0, 0,
        0, 0, 0, 1, 0
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(sepiaMatrix);
        expect(colorFilter != null && colorFilter != undefined).assertTrue();
        console.info(msg + ' sepia matrix succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterLightingAllChannelsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_COLORFILTER_STATIC_1800
     * @tc.desc   Test createLightingColorFilter with all channel combinations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterLightingAllChannelsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testColorFilterLightingAllChannelsStatic';
      let testCases: ObjItem[] = [
        {mul: {alpha: 1, red: 1, green: 1, blue: 1}, add: {alpha: 0, red: 0, green: 0, blue: 0}},
        {mul: {alpha: 2, red: 2, green: 2, blue: 2}, add: {alpha: 10, red: 10, green: 10, blue: 10}},
        {mul: {alpha: 100, red: 100, green: 100, blue: 100}, add: {alpha: 50, red: 50, green: 50, blue: 50}},
        {mul: {alpha: 255, red: 0, green: 0, blue: 0}, add: {alpha: 0, red: 255, green: 0, blue: 0}},
        {mul: {alpha: 0, red: 255, green: 0, blue: 0}, add: {alpha: 255, red: 0, green: 0, blue: 0}},
        {mul: {alpha: 128, red: 128, green: 0, blue: 0}, add: {alpha: 64, red: 64, green: 128, blue: 128}},
        {mul: {alpha: 0, red: 0, green: 255, blue: 255}, add: {alpha: 255, red: 255, green: 0, blue: 0}},
      ];

      for (let testCase of testCases) {
        try {
          let colorFilter = drawing.ColorFilter.createLightingColorFilter(testCase.mul, testCase.add);
          expect(colorFilter != null && colorFilter != undefined).assertTrue();
          console.info(msg + ` test case succeeded`);
        } catch (e) {
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }
    });
  });
}