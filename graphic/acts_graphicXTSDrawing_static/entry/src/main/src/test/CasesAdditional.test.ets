'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

export default function casesAdditionalTest(): void {
  describe('DrawingTsCasesAdditionalTest', () => {

    /**
     * @tc.name   testImageFilterCreateBlurBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ADD_STATIC_0100
     * @tc.desc   Test createBlurImageFilter with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateBlurBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateBlurBoundaryValueStatic';
      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(Number.MAX_VALUE, Number.MAX_VALUE, drawing.TileMode.CLAMP);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurImageFilter with MAX_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(Number.MIN_VALUE, Number.MIN_VALUE, drawing.TileMode.CLAMP);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurImageFilter with MIN_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(0.001, 0.001, drawing.TileMode.CLAMP);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurImageFilter with minimum positive value succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(0, 0, drawing.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter with 0 succeeded');
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(-1, -1, drawing.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter with negative value succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(-5, -10, drawing.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter with negative value 2 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` 2 errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(Infinity, Infinity, drawing.TileMode.CLAMP);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurImageFilter with Infinity succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushGetHexColorNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ADD_STATIC_0200
     * @tc.desc   Test for getHexColor normal scenarios.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushGetHexColorNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushGetHexColorNormalStatic';
      const brush = new drawing.Brush();

      try {
        let color: common2D.Color = {alpha: 255, red: 255, green: 0, blue: 0};
        brush.setColor(color);
        let hexColor = brush.getHexColor();
        console.info(msg + ' getHexColor 1 succeeded: ' + hexColor);
        expect(Math.abs(hexColor + 65536) < 0.01).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getHexColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let color: common2D.Color = {alpha: 0, red: 0, green: 0, blue: 0};
        brush.setColor(color);
        let hexColor = brush.getHexColor();
        console.info(msg + ' getHexColor 2 succeeded: ' + hexColor);
        expect(Math.abs(hexColor - 0) < 0.01).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getHexColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let color: common2D.Color = {alpha: 128, red: 128, green: 128, blue: 128};
        brush.setColor(color);
        let hexColor = brush.getHexColor();
        console.info(msg + ' getHexColor 3 succeeded: ' + hexColor);
        expect(Math.abs(hexColor + 2139062144) < 0.01).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getHexColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetColor18CombinedWithGetHexColorStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ADD_STATIC_0300
     * @tc.desc   Test for setColor(number) combined with getHexColor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColor18CombinedWithGetHexColorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetColor18CombinedWithGetHexColorStatic';
      const brush = new drawing.Brush();

      try {
        brush.setColor(0xFF123456.toInt());
        let hexColor = brush.getHexColor();
        console.info(msg + ' setColor and getHexColor 1 succeeded: ' + hexColor);
        expect(Math.abs(hexColor + 15584170) < 0.01).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` 1 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setColor(0x00FFFFFF);
        let hexColor = brush.getHexColor();
        console.info(msg + ' setColor and getHexColor 2 succeeded: ' + hexColor);
        expect(Math.abs(hexColor - 16777215) < 0.01).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` 2 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushMultipleColorSetMethodsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ADD_STATIC_0400
     * @tc.desc   Test for multiple color setting methods interchangeably.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushMultipleColorSetMethodsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushMultipleColorSetMethodsStatic';
      const brush = new drawing.Brush();

      try {
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let color1 = brush.getColor();
        expect(color1!.red).assertEqual(255);
        console.info(msg + ' setColor with Color object succeeded');

        brush.setColor(255, 0, 255, 0);
        let color2 = brush.getColor();
        expect(color2!.green).assertEqual(255);
        console.info(msg + ' setColor with 4 parameters succeeded');

        brush.setColor(0xFF0000FF.toInt());
        let hexColor = brush.getHexColor();
        console.info(msg + ' getHexColor succeeded: ' + hexColor);
        console.info(msg + ' setColor with number succeeded');

        let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG);
        brush.setColor4f({alpha: 0.5, red: 0.3, green: 0.6, blue: 0.9}, colorSpace);
        let color4f = brush.getColor4f();
        expect(Math.abs(color4f!.alpha - 0.5) < 0.0001).assertTrue();
        console.info(msg + ' setColor4f succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testCreatePathDashEffectBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ADD_STATIC_0500
     * @tc.desc   createPathDashEffect advance parameter boundary test with zero.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePathDashEffectBoundary001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreatePathDashEffectBoundary001Static';
      const path1 = new drawing.Path();
      path1.moveTo(0, 0);
      path1.lineTo(10, 0);
      try {
        let effect = drawing.PathEffect.createPathDashEffect(path1, -2, -30, drawing.PathDashStyle.MORPH);
        console.info(msg + ' 1 createPathDashEffect with zero advance should success');
        expect(effect !== null && effect !== undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` 1 createPathDashEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let effect = drawing.PathEffect.createPathDashEffect(path1, 0, -30, drawing.PathDashStyle.MORPH);
        console.info(msg + ' 2 createPathDashEffect with zero advance should success');
        expect(effect !== null && effect !== undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` 2 createPathDashEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let effect = drawing.PathEffect.createPathDashEffect(path1, -50, -30, drawing.PathDashStyle.MORPH);
        console.info(msg + ' 3 createPathDashEffect with negative advance should success');
        expect(effect !== null && effect !== undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` 3 createPathDashEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPenGetHexColorNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ADD_STATIC_0600
     * @tc.desc   test getHexColor normal scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetHexColorNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenGetHexColorNormalStatic';
      const pen = new drawing.Pen();
      try {
        pen.setColor(255, 255, 0, 0);
        let hexColor = pen.getHexColor();
        console.info(msg + ' getHexColor succeeded, hexColor: ' + hexColor);
        expect(Math.abs(hexColor + 65536) < 0.01).assertTrue();
      } catch (e) {
        console.info(msg + ` getHexColor errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPenSetGetColorFilterNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ADD_STATIC_0700
     * @tc.desc   test setColorFilter null and getColorFilter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetGetColorFilterNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetGetColorFilterNullStatic';
      const pen = new drawing.Pen();
      try {
        let colorFilter = drawing.ColorFilter.createLumaColorFilter();
        if (colorFilter) {
          pen.setColorFilter(colorFilter);
          let getColorFilter = pen.getColorFilter();
          console.info(msg + ' setColorFilter 1 and getColorFilter succeeded');
          expect(getColorFilter != null).assertTrue();
        }
        pen.setColorFilter(null);
        let getColorFilter = pen.getColorFilter();
        console.info(msg + ' setColorFilter(null) and getColorFilter succeeded getColorFilter: ' + getColorFilter);
        expect(getColorFilter != null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMaskFilterCreateBlurMaskFilterBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ADD_STATIC_0800
     * @tc.desc   Test createBlurMaskFilter with boundary sigma values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaskFilterCreateBlurMaskFilterBoundaryValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMaskFilterCreateBlurMaskFilterBoundaryValue';

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 0.001);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with minimum positive sigma succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, Number.MAX_VALUE);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with MAX_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.SOLID, Number.MIN_VALUE);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with MIN_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.INNER, 10000);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with large value succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 0);
        console.info(msg + ' createBlurMaskFilter with 0 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, -1);
        console.info(msg + ' createBlurMaskFilter with -1 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.SOLID, -100);
        console.info(msg + ' createBlurMaskFilter with -100 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
  })
}
