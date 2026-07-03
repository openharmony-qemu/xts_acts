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
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import { BusinessError } from '@ohos.base';

export default function DrawingTsBrushPart2() {

  describe('DrawingTsBrushPart2', () => {
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_2100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_2100
     * @tc.desc   The brush getHexColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let msg = " ====testBrushGetHexColor==== "
      try {
        let color : common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
        let brush = new drawing.Brush();
        brush.setColor(color);
        let hex_color: number = brush.getHexColor();
        console.info(msg + ' brush.getHexColor:  ', hex_color.toString(16));
        console.info(msg + ' brush.getHexColor: ' + JSON.stringify(hex_color));
        done()
      } catch (err) {
        console.log(msg + " Failed in brush.getHexColor " + JSON.stringify(err))
        console.log(msg + " Failed in brush.getHexColor " + err)
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.name   testBrushSetColor18Normal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_0100
     * @tc.desc   Test for setColor with number parameter (API 18+).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColor18Normal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetColor18Normal';
      const brush = new drawing.Brush();

      try {
        brush.setColor(0xFFFF0000);
        console.info(msg + ' setColor(0xFFFF0000) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setColor(0x00FF00FF);
        console.info(msg + ' setColor(0x00FF00FF) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setColor(0xFFFFFFFF);
        console.info(msg + ' setColor(0xFFFFFFFF) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setColor(0x00000000);
        console.info(msg + ' setColor(0x00000000) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetColor18Null
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_0200
     * @tc.desc   Test for setColor with null/undefined parameter (API 18+).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor18Null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushSetColor18Null';
      const brush = new drawing.Brush();

      try {
        brush.setColor(null);
        console.info(msg + ' setColor(null) succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor 1 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        brush.setColor(undefined);
        console.info(msg + ' setColor(undefined) succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor 2 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetColor18MultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_0300
     * @tc.desc   Test for setColor multiple calls with number parameter (API 18+).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor18MultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushSetColor18MultipleCalls';
      const brush = new drawing.Brush();

      for (let i = 0; i < 20; i++) {
        try {
          const randomColor = Math.floor(Math.random() * 0xFFFFFFFF);
          brush.setColor(randomColor);
          console.info(msg + ' setColor succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushSetColor18BoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_0400
     * @tc.desc   Test for setColor with boundary values (API 18+).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor18BoundaryValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushSetColor18BoundaryValue';
      const brush = new drawing.Brush();

      try {
        brush.setColor(-1);
        console.info(msg + ' setColor(-1) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setColor(0x100000000);
        console.info(msg + ' setColor(0x100000000) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetAlphaBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_0500
     * @tc.desc   Test for setAlpha with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAlphaBoundaryValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushSetAlphaBoundaryValue';
      const brush = new drawing.Brush();

      try {
        brush.setAlpha(-1);
        console.info(msg + ' setAlpha(-1) succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAlpha 1 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        brush.setAlpha(256);
        console.info(msg + ' setAlpha(256) succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAlpha 2 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        brush.setAlpha(0);
        let alpha = brush.getAlpha();
        expect(alpha).assertEqual(0);
        console.info(msg + ' setAlpha(0) succeeded, alpha: ' + alpha);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAlpha 3 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(255);
        let alpha = brush.getAlpha();
        expect(alpha).assertEqual(255);
        console.info(msg + ' setAlpha(255) succeeded, alpha: ' + alpha);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAlpha 4 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushGetColor4fBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_0600
     * @tc.desc   Test for getColor4f with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetColor4fBoundaryValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushGetColor4fBoundaryValue';
      const brush = new drawing.Brush();

      try {
        brush.setColor4f({alpha: 0, red: 0, green: 0, blue: 0}, null);
        let color = brush.getColor4f();
        expect(color.alpha).assertEqual(0);
        expect(color.red).assertEqual(0);
        expect(color.green).assertEqual(0);
        expect(color.blue).assertEqual(0);
        console.info(msg + ' getColor4f succeeded with min values');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getColor4f 1 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setColor4f({alpha: 1, red: 1, green: 1, blue: 1}, null);
        let color = brush.getColor4f();
        expect(Math.abs(color.alpha - 1) < 0.0001).assertTrue();
        expect(Math.abs(color.red - 1) < 0.0001).assertTrue();
        expect(Math.abs(color.green - 1) < 0.0001).assertTrue();
        expect(Math.abs(color.blue - 1) < 0.0001).assertTrue();
        console.info(msg + ' getColor4f succeeded with max values');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getColor4f 2 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushGetColor4fMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_0700
     * @tc.desc   Test for getColor4f multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetColor4fMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushGetColor4fMultipleCalls';
      const brush = new drawing.Brush();

      for (let i = 0; i < 20; i++) {
        try {
          let color = brush.getColor4f();
          expect(color != null && color != undefined).assertTrue();
          console.info(msg + ' getColor4f succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getColor4f errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushGetHexColorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_0800
     * @tc.desc   Test for getHexColor normal scenarios.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushGetHexColorNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushGetHexColorNormal';
      const brush = new drawing.Brush();

      try {
        let color: common2D.Color = {alpha: 255, red: 255, green: 0, blue: 0};
        brush.setColor(color);
        let hexColor = brush.getHexColor();
        expect(hexColor).assertEqual(0xFFFF0000);
        console.info(msg + ' getHexColor succeeded: ' + hexColor.toString(16));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getHexColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let color: common2D.Color = {alpha: 0, red: 0, green: 0, blue: 0};
        brush.setColor(color);
        let hexColor = brush.getHexColor();
        expect(hexColor).assertEqual(0x00000000);
        console.info(msg + ' getHexColor succeeded: ' + hexColor.toString(16));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getHexColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let color: common2D.Color = {alpha: 128, red: 128, green: 128, blue: 128};
        brush.setColor(color);
        let hexColor = brush.getHexColor();
        console.info(msg + ' getHexColor succeeded: ' + hexColor.toString(16));
        expect(hexColor).assertEqual(0x80808080);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getHexColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushGetHexColorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_0900
     * @tc.desc   Test for getHexColor multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetHexColorMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushGetHexColorMultipleCalls';
      const brush = new drawing.Brush();

      for (let i = 0; i < 20; i++) {
        try {
          let color: common2D.Color = {
            alpha: Math.floor(Math.random() * 256),
            red: Math.floor(Math.random() * 256),
            green: Math.floor(Math.random() * 256),
            blue: Math.floor(Math.random() * 256)
          };
          brush.setColor(color);
          let hexColor = brush.getHexColor();
          expect(hexColor != null && hexColor != undefined).assertTrue();
          console.info(msg + ' getHexColor succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getHexColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushConstructorWithNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_1100
     * @tc.desc   Test for Brush constructor with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushConstructorWithNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushConstructorWithNull';

      try {
        let brush = new drawing.Brush(null);
        console.info(msg + ' Brush(null) succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` Brush errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let brush = new drawing.Brush(undefined);
        console.info(msg + ' Brush(undefined) succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` Brush errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetColorFilterWithNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_1200
     * @tc.desc   Test for setColorFilter with null parameter to clear filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColorFilterWithNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetColorFilterWithNull';
      const brush = new drawing.Brush();

      try {
        let colorFilter = drawing.ColorFilter.createLinearToSRGBGamma();
        brush.setColorFilter(colorFilter);
        console.info(msg + ' setColorFilter succeeded');

        brush.setColorFilter(null);
        console.info(msg + ' setColorFilter(null) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColorFilter errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetMaskFilterWithNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_1300
     * @tc.desc   Test for setMaskFilter with null parameter to clear filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetMaskFilterWithNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetMaskFilterWithNull';
      const brush = new drawing.Brush();

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
        brush.setMaskFilter(maskFilter);
        console.info(msg + ' setMaskFilter succeeded');

        brush.setMaskFilter(null);
        console.info(msg + ' setMaskFilter(null) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setMaskFilter errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetShaderEffectWithNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_1400
     * @tc.desc   Test for setShaderEffect with null parameter to clear shader effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetShaderEffectWithNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetShaderEffectWithNull';
      const brush = new drawing.Brush();

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(
          {x: 100, y: 100},
          {x: 300, y: 300},
          [0xFF00FF00, 0xFFFF0000],
          drawing.TileMode.REPEAT
        );
        brush.setShaderEffect(shaderEffect);
        console.info(msg + ' setShaderEffect succeeded');

        brush.setShaderEffect(null);
        console.info(msg + ' setShaderEffect(null) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setShaderEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetShadowLayerWithNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_1500
     * @tc.desc   Test for setShadowLayer with null parameter to clear shadow layer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetShadowLayerWithNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetShadowLayerWithNull';
      const brush = new drawing.Brush();

      try {
        let shadowLayer = drawing.ShadowLayer.create(3, -3, 3, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
        brush.setShadowLayer(shadowLayer);
        console.info(msg + ' setShadowLayer succeeded');

        brush.setShadowLayer(null);
        console.info(msg + ' setShadowLayer(null) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setShadowLayer errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetImageFilterWithNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_1600
     * @tc.desc   Test for setImageFilter with null parameter to clear image filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetImageFilterWithNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetImageFilterWithNull';
      const brush = new drawing.Brush();

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.DECAL);
        brush.setImageFilter(imgFilter);
        console.info(msg + ' setImageFilter succeeded');

        brush.setImageFilter(null);
        console.info(msg + ' setImageFilter(null) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setImageFilter errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetColor18CombinedWithGetHexColor
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_1700
     * @tc.desc   Test for setColor(number) combined with getHexColor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColor18CombinedWithGetHexColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetColor18CombinedWithGetHexColor';
      const brush = new drawing.Brush();

      try {
        brush.setColor(0xFF123456);
        let hexColor = brush.getHexColor();
        expect(hexColor).assertEqual(0xFF123456);
        console.info(msg + ' setColor and getHexColor succeeded: ' + hexColor.toString(16));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setColor(0x00FFFFFF);
        let hexColor = brush.getHexColor();
        expect(hexColor).assertEqual(0x00FFFFFF);
        console.info(msg + ' setColor and getHexColor succeeded: ' + hexColor.toString(16));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetAndGetCombined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_1800
     * @tc.desc   Test for combined set and get operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetAndGetCombined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetAndGetCombined';
      const brush = new drawing.Brush();

      try {
        brush.setColor(255, 100, 150, 200);
        let color = brush.getColor();
        expect(color.alpha).assertEqual(255);
        expect(color.red).assertEqual(100);
        expect(color.green).assertEqual(150);
        expect(color.blue).assertEqual(200);
        console.info(msg + ' setColor and getColor succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(200);
        let alpha = brush.getAlpha();
        expect(alpha).assertEqual(200);
        console.info(msg + ' setAlpha and getAlpha succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setAntiAlias(true);
        let isAntiAlias = brush.isAntiAlias();
        expect(isAntiAlias).assertTrue();
        console.info(msg + ' setAntiAlias and isAntiAlias succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushResetAfterSettingProperties
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_1900
     * @tc.desc   Test for reset after setting various properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushResetAfterSettingProperties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushResetAfterSettingProperties';
      const brush = new drawing.Brush();

      try {
        brush.setColor(255, 100, 150, 200);
        brush.setAlpha(200);
        brush.setAntiAlias(true);

        brush.reset();

        let color = brush.getColor();
        expect(color.alpha).assertEqual(255);
        let alpha = brush.getAlpha();
        expect(alpha).assertEqual(255);
        let isAntiAlias = brush.isAntiAlias();
        expect(isAntiAlias).assertFalse();

        console.info(msg + ' reset succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushMultipleColorSetMethods
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_2000
     * @tc.desc   Test for multiple color setting methods interchangeably.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushMultipleColorSetMethods', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushMultipleColorSetMethods';
      const brush = new drawing.Brush();

      try {
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let color1 = brush.getColor();
        expect(color1.red).assertEqual(255);
        console.info(msg + ' setColor with Color object succeeded');

        brush.setColor(255, 0, 255, 0);
        let color2 = brush.getColor();
        expect(color2.green).assertEqual(255);
        console.info(msg + ' setColor with 4 parameters succeeded');

        brush.setColor(0xFF0000FF);
        let hexColor = brush.getHexColor();
        expect(hexColor).assertEqual(0xFF0000FF);
        console.info(msg + ' setColor with number succeeded');

        let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG);
        brush.setColor4f({alpha: 0.5, red: 0.3, green: 0.6, blue: 0.9}, colorSpace);
        let color4f = brush.getColor4f();
        expect(Math.abs(color4f.alpha - 0.5) < 0.0001).assertTrue();
        console.info(msg + ' setColor4f succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushConstructorCopy
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_2100
     * @tc.desc   Test for Brush copy constructor verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushConstructorCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushConstructorCopy';

      try {
        let brush1 = new drawing.Brush();
        brush1.setColor(255, 100, 150, 200);
        brush1.setAlpha(200);
        brush1.setAntiAlias(true);

        let brush2 = new drawing.Brush(brush1);

        let color1 = brush1.getColor();
        let color2 = brush2.getColor();
        expect(color1.alpha).assertEqual(color2.alpha);
        expect(color1.red).assertEqual(color2.red);
        expect(color1.green).assertEqual(color2.green);
        expect(color1.blue).assertEqual(color2.blue);

        let alpha1 = brush1.getAlpha();
        let alpha2 = brush2.getAlpha();
        expect(alpha1).assertEqual(alpha2);

        let isAntiAlias1 = brush1.isAntiAlias();
        let isAntiAlias2 = brush2.isAntiAlias();
        expect(isAntiAlias1).assertEqual(isAntiAlias2);

        console.info(msg + ' copy constructor succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetColor18ExtremeValues
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_2200
     * @tc.desc   Test for setColor with extreme number values (API 18+).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor18ExtremeValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushSetColor18ExtremeValues';
      const brush = new drawing.Brush();

      try {
        brush.setColor(Number.MAX_SAFE_INTEGER);
        console.info(msg + ' setColor with MAX_SAFE_INTEGER succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setColor(Number.MIN_SAFE_INTEGER);
        console.info(msg + ' setColor with MIN_SAFE_INTEGER succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setColor(0);
        let hexColor = brush.getHexColor();
        expect(hexColor).assertEqual(0);
        console.info(msg + ' setColor(0) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetBlendModeAllModes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_2300
     * @tc.desc   Test for setBlendMode covering all BlendMode enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetBlendModeAllModes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetBlendModeAllModes';
      const brush = new drawing.Brush();
      const blendModes = [
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
          brush.setBlendMode(mode);
          console.info(msg + ` setBlendMode(${mode}) succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setBlendMode errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushSetAlphaFloatValues
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_2400
     * @tc.desc   Test for setAlpha with float values (should be floored).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetAlphaFloatValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetAlphaFloatValues';
      const brush = new drawing.Brush();

      try {
        brush.setAlpha(255.9);
        let alpha = brush.getAlpha();
        expect(alpha).assertEqual(255);
        console.info(msg + ' setAlpha(255.9) succeeded, alpha: ' + alpha);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(0.1);
        let alpha = brush.getAlpha();
        expect(alpha).assertEqual(0);
        console.info(msg + ' setAlpha(0.1) succeeded, alpha: ' + alpha);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(128.5);
        let alpha = brush.getAlpha();
        expect(alpha).assertEqual(128);
        console.info(msg + ' setAlpha(128.5) succeeded, alpha: ' + alpha);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
  })
}
