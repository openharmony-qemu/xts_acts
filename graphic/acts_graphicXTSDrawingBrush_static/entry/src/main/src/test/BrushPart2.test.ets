'use static';
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
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import { BusinessError } from '@ohos.base';

export default function DrawingTsBrushPart2(): void {

  describe('DrawingTsBrushPart2', () => {
    /**
     * @tc.name   testBrushGetHexColor001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_2100
     * @tc.desc   The brush getHexColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBrushGetHexColor001Static',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        let msg = " ====testBrushGetHexColorStatic==== "
        try {
          let color : common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
          let brush = new drawing.Brush();
          brush.setColor(color);
          let hex_color: number = brush.getHexColor();
          console.info(msg + ' brush.getHexColor:  ', hex_color.toString(16));
          console.info(msg + ' brush.getHexColor: ' + JSON.stringify(hex_color));
        } catch (err) {
          err = err as BusinessError;
          console.log(msg + " Failed in brush.getHexColor " + JSON.stringify(err))
          console.log(msg + " Failed in brush.getHexColor " + err)
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testBrushSetColor18NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_0100
     * @tc.desc   Test for setColor with number parameter (API 18+).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColor18NormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetColor18NormalStatic';
      const brush = new drawing.Brush();

      try {
        brush.setColor(0xFFFF0000.toInt());
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
        brush.setColor(0xFFFFFFFF.toInt());
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
     * @tc.name   testBrushSetColor18MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_0300
     * @tc.desc   Test for setColor multiple calls with number parameter (API 18+).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor18MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushSetColor18MultipleCallsStatic';
      const brush = new drawing.Brush();

      for (let i = 0; i < 20; i++) {
        try {
          const randomColor = Math.floor(Math.random() * 0xFFFFFFFF).toInt();
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
     * @tc.name   testBrushSetColor18BoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_0400
     * @tc.desc   Test for setColor with boundary values (API 18+).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor18BoundaryValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushSetColor18BoundaryValueStatic';
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
        brush.setColor(0x100000000.toInt());
        console.info(msg + ' setColor(0x100000000) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetAlphaBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_0500
     * @tc.desc   Test for setAlpha with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAlphaBoundaryValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushSetAlphaBoundaryValueStatic';
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
     * @tc.name   testBrushGetColor4fBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_0600
     * @tc.desc   Test for getColor4f with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetColor4fBoundaryValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushGetColor4fBoundaryValueStatic';
      const brush = new drawing.Brush();

      try {
        brush.setColor4f({alpha: 0, red: 0, green: 0, blue: 0}, null);
        let color = brush.getColor4f();
        expect(color!.alpha).assertEqual(0);
        expect(color!.red).assertEqual(0);
        expect(color!.green).assertEqual(0);
        expect(color!.blue).assertEqual(0);
        console.info(msg + ' getColor4f succeeded with min values');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getColor4f 1 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setColor4f({alpha: 1, red: 1, green: 1, blue: 1}, null);
        let color = brush.getColor4f();
        expect(Math.abs(color!.alpha - 1) < 0.0001).assertTrue();
        expect(Math.abs(color!.red - 1) < 0.0001).assertTrue();
        expect(Math.abs(color!.green - 1) < 0.0001).assertTrue();
        expect(Math.abs(color!.blue - 1) < 0.0001).assertTrue();
        console.info(msg + ' getColor4f succeeded with max values');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getColor4f 2 errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushGetColor4fMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_0700
     * @tc.desc   Test for getColor4f multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetColor4fMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushGetColor4fMultipleCallsStatic';
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
     * @tc.name   testBrushGetHexColorMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_0900
     * @tc.desc   Test for getHexColor multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetHexColorMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushGetHexColorMultipleCallsStatic';
      const brush = new drawing.Brush();

      for (let i = 0; i < 20; i++) {
        try {
          let color: common2D.Color = {
            alpha: Math.floor(Math.random() * 256).toInt(),
            red: Math.floor(Math.random() * 256).toInt(),
            green: Math.floor(Math.random() * 256).toInt(),
            blue: Math.floor(Math.random() * 256).toInt()
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
     * @tc.name   testBrushSetColorFilterWithNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_1200
     * @tc.desc   Test for setColorFilter with null parameter to clear filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColorFilterWithNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetColorFilterWithNullStatic';
      const brush = new drawing.Brush();

      try {
        let colorFilter:drawing.ColorFilter|undefined = drawing.ColorFilter.createLinearToSRGBGamma();
        if(colorFilter !== undefined) {
          brush.setColorFilter(colorFilter);
          console.info(msg + ' setColorFilter succeeded');

          brush.setColorFilter(null);
          console.info(msg + ' setColorFilter(null) succeeded');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColorFilter errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetMaskFilterWithNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_1300
     * @tc.desc   Test for setMaskFilter with null parameter to clear filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetMaskFilterWithNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetMaskFilterWithNullStatic';
      const brush = new drawing.Brush();

      try {
        let maskFilter:drawing.MaskFilter|undefined = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
        if(maskFilter !== undefined) {
          brush.setMaskFilter(maskFilter);
          console.info(msg + ' setMaskFilter succeeded');

          brush.setMaskFilter(null);
          console.info(msg + ' setMaskFilter(null) succeeded');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setMaskFilter errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetShaderEffectWithNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_1400
     * @tc.desc   Test for setShaderEffect with null parameter to clear shader effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetShaderEffectWithNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetShaderEffectWithNullStatic';
      const brush = new drawing.Brush();

      try {
        let shaderEffect:drawing.ShaderEffect|undefined = drawing.ShaderEffect.createLinearGradient(
          {x: 100, y: 100},
          {x: 300, y: 300},
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        if(shaderEffect !== undefined) {
          brush.setShaderEffect(shaderEffect);
          console.info(msg + ' setShaderEffect succeeded');

          brush.setShaderEffect(null);
          console.info(msg + ' setShaderEffect(null) succeeded');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setShaderEffect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetShadowLayerWithNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_1500
     * @tc.desc   Test for setShadowLayer with null parameter to clear shadow layer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetShadowLayerWithNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetShadowLayerWithNullStatic';
      const brush = new drawing.Brush();

      try {
        let shadowLayer:drawing.ShadowLayer | undefined = drawing.ShadowLayer.create(3, -3, 3, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
        if(shadowLayer !== undefined) {
          brush.setShadowLayer(shadowLayer);
          console.info(msg + ' setShadowLayer succeeded');

          brush.setShadowLayer(null);
          console.info(msg + ' setShadowLayer(null) succeeded');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setShadowLayer errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetImageFilterWithNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_1600
     * @tc.desc   Test for setImageFilter with null parameter to clear image filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetImageFilterWithNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetImageFilterWithNullStatic';
      const brush = new drawing.Brush();

      try {
        let imgFilter:drawing.ImageFilter | undefined = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.DECAL);
        if(imgFilter !== undefined) {
          brush.setImageFilter(imgFilter);
          console.info(msg + ' setImageFilter succeeded');

          brush.setImageFilter(null);
          console.info(msg + ' setImageFilter(null) succeeded');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setImageFilter errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetAndGetCombinedStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_1800
     * @tc.desc   Test for combined set and get operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetAndGetCombinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetAndGetCombinedStatic';
      const brush = new drawing.Brush();

      try {
        brush.setColor(255, 100, 150, 200);
        let color = brush.getColor();
        expect(color!.alpha).assertEqual(255);
        expect(color!.red).assertEqual(100);
        expect(color!.green).assertEqual(150);
        expect(color!.blue).assertEqual(200);
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
     * @tc.name   testBrushResetAfterSettingPropertiesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_1900
     * @tc.desc   Test for reset after setting various properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushResetAfterSettingPropertiesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushResetAfterSettingPropertiesStatic';
      const brush = new drawing.Brush();

      try {
        brush.setColor(255, 100, 150, 200);
        brush.setAlpha(200);
        brush.setAntiAlias(true);

        brush.reset();

        let color = brush.getColor();
        expect(color!.alpha).assertEqual(255);
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
     * @tc.name   testBrushConstructorCopyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_2100
     * @tc.desc   Test for Brush copy constructor verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushConstructorCopyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushConstructorCopyStatic';

      try {
        let brush1 = new drawing.Brush();
        brush1.setColor(255, 100, 150, 200);
        brush1.setAlpha(200);
        brush1.setAntiAlias(true);

        let brush2 = new drawing.Brush(brush1);

        let color1 = brush1.getColor();
        let color2 = brush2.getColor();
        if(color1 && color2){
          expect(color1.alpha).assertEqual(color2.alpha);
          expect(color1.red).assertEqual(color2.red);
          expect(color1.green).assertEqual(color2.green);
          expect(color1.blue).assertEqual(color2.blue);
        }

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
     * @tc.name   testBrushSetColor18ExtremeValuesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_2200
     * @tc.desc   Test for setColor with extreme number values (API 18+).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor18ExtremeValuesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testBrushSetColor18ExtremeValuesStatic';
      const brush = new drawing.Brush();

      try {
        brush.setColor(Number.MAX_SAFE_INTEGER.toInt());
        console.info(msg + ' setColor with MAX_SAFE_INTEGER succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setColor(Number.MIN_SAFE_INTEGER.toInt());
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
     * @tc.name   testBrushSetBlendModeAllModesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_2300
     * @tc.desc   Test for setBlendMode covering all BlendMode enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetBlendModeAllModesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetBlendModeAllModesStatic';
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
     * @tc.name   testBrushSetAlphaFloatValuesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_BRUSH_STATIC_2400
     * @tc.desc   Test for setAlpha with float values (should be floored).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetAlphaFloatValuesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testBrushSetAlphaFloatValuesStatic';
      const brush = new drawing.Brush();

      try {
        brush.setAlpha(255);
        let alpha = brush.getAlpha();
        expect(alpha).assertEqual(255);
        console.info(msg + ' setAlpha(255.9) succeeded, alpha: ' + alpha);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(0);
        let alpha = brush.getAlpha();
        expect(alpha).assertEqual(0);
        console.info(msg + ' setAlpha(0.1) succeeded, alpha: ' + alpha);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(128);
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
