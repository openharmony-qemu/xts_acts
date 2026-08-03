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
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';

interface TestColor {
  hex: number;
  alpha: number;
  red: number;
  green: number;
  blue: number;
}

export default function PenPart3(): void {

  describe('PenPart3', (): void => {
    let myColor: common2D.Color;
    beforeAll((): void => {
      myColor = {
        alpha: 255,
        red: 255,
        green: 0,
        blue: 0
      };
    })


    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_3100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_3100
     * @tc.desc   The pen getHexColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====testPenGetHexColorStatic==== "
        try {
          let color: common2D.Color = {
            alpha: 255,
            red: 255,
            green: 0,
            blue: 0
          };
          let pen = new drawing.Pen();
          pen.setColor(color);
          let hex_color: number = pen.getHexColor();
          console.info(msg + ' getHexColor:  ', hex_color.toString(16));
          console.info(msg + ' pen.getHexColor: ' + JSON.stringify(hex_color));
          done()
        } catch (err) {
          console.log(msg + " Failed in pen.getHexColor " + JSON.stringify(err))
          console.log(msg + " Failed in pen.getHexColor " + err)
          expect().assertFail()
          done()
        }
      })
    /**
     * @tc.name   testPenSetColor18WithHexColorStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_0100
     * @tc.desc   test setColor(number) with hex color value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetColor18WithHexColorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetColor18WithHexColorStatic';
      const pen = new drawing.Pen();
      try {
        pen.setColor(255, 255, 0, 0);
        let color = pen.getColor();
        if (color) {
          expect(color.alpha).assertEqual(255);
          expect(color.red).assertEqual(255);
          expect(color.green).assertEqual(0);
          expect(color.blue).assertEqual(0);
        }
        console.info(msg + ' setColor with hex color 0xffff0000 succeeded');
      } catch (e) {
        console.info(msg + ` setColor errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenSetColor18BoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_0200
     * @tc.desc   test setColor(number) with boundary hex color value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColor18BoundaryValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testPenSetColor18BoundaryValueStatic';
      const pen = new drawing.Pen();
      try {
        pen.setColor(0, 0, 0, 0);
        let color = pen.getColor();
        if (color) {
          expect(color.alpha).assertEqual(0);
          expect(color.red).assertEqual(0);
          expect(color.green).assertEqual(0);
          expect(color.blue).assertEqual(0);
        }
        console.info(msg + ' setColor with min hex color 0x00000000 succeeded');
      } catch (e) {
        console.info(msg + ` setColor errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }

      try {
        pen.setColor(255, 255, 255, 255);
        let color = pen.getColor();
        if (color) {
          expect(color.alpha).assertEqual(255);
          expect(color.red).assertEqual(255);
          expect(color.green).assertEqual(255);
          expect(color.blue).assertEqual(255);
        }
        console.info(msg + ' setColor with max hex color 0xffffffff succeeded');
      } catch (e) {
        console.info(msg + ` setColor errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenGetHexColorMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_0500
     * @tc.desc   test getHexColor with multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetHexColorMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testPenGetHexColorMultipleCallsStatic';
      const pen = new drawing.Pen();
      for (let i = 0; i < 20; i++) {
        try {
          let hexColor = pen.getHexColor();
          console.info(msg + ' getHexColor succeeded at iteration ' + i + ', hexColor: ' + hexColor.toString(16));
} catch (e) {
        console.info(msg + ` getHexColor errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
      }
    })

    /**
     * @tc.name   testPenSetColorAndGetHexColorConsistencyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_0600
     * @tc.desc   test setColor and getHexColor consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetColorAndGetHexColorConsistencyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetColorAndGetHexColorConsistencyStatic';
      const pen = new drawing.Pen();
      try {
        let testColors: TestColor[] = [
          { hex: 0xffff0000.toInt(), alpha: 255, red: 255, green: 0, blue: 0 },
          { hex: 0xff00ff00.toInt(), alpha: 255, red: 0, green: 255, blue: 0 },
          { hex: 0xff0000ff.toInt(), alpha: 255, red: 0, green: 0, blue: 255 },
          { hex: 0xffffffff.toInt(), alpha: 255, red: 255, green: 255, blue: 255 },
          { hex: 0x00000000.toInt(), alpha: 0, red: 0, green: 0, blue: 0 },
          { hex: 0x80808080.toInt(), alpha: 128, red: 128, green: 128, blue: 128 }
        ];
        for (let c of testColors) {
          pen.setColor((c.alpha).toInt(), (c.red).toInt(), (c.green).toInt(), (c.blue).toInt());
          let hexColor = pen.getHexColor();
          console.info(msg + ' setColor and getHexColor consistency test passed for color: ' + c.hex.toString(16));
          expect(hexColor).assertEqual(c.hex);
        }
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenSetStrokeWidthExtremeValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_0700
     * @tc.desc   test setStrokeWidth with extreme value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetStrokeWidthExtremeValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testPenSetStrokeWidthExtremeValueStatic';
      const pen = new drawing.Pen();
      try {
        pen.setStrokeWidth(Number.MAX_VALUE);
        let width = pen.getWidth();
        console.info(msg + ' setStrokeWidth with MAX_VALUE succeeded, width: ' + width);
      } catch (e) {
        console.info(msg + ` setStrokeWidth errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(Number.MIN_VALUE);
        let width = pen.getWidth();
        console.info(msg + ' setStrokeWidth with MIN_VALUE succeeded, width: ' + width);
      } catch (e) {
        console.info(msg + ` setStrokeWidth errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(0.0001);
        let width = pen.getWidth();
        expect(Math.abs(width - 0.0001) < 0.001).assertTrue();
        console.info(msg + ' setStrokeWidth with small float succeeded, width: ' + width);
      } catch (e) {
        console.info(msg + ` setStrokeWidth errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(10000.5);
        let width = pen.getWidth();
        expect(Math.abs(width - 10000.5) < 0.1).assertTrue();
        console.info(msg + ' setStrokeWidth with large float succeeded, width: ' + width);
      } catch (e) {
        console.info(msg + ` setStrokeWidth errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenSetStrokeWidthAndGetConsistencyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_0800
     * @tc.desc   test setStrokeWidth and getWidth consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetStrokeWidthAndGetConsistencyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetStrokeWidthAndGetConsistencyStatic';
      const pen = new drawing.Pen();
      let widths = [0, 1, 5.5, 10, 100, 255.3];
      try {
        for (let w of widths) {
          pen.setStrokeWidth(w);
          let getWidth = pen.getWidth();
          expect(Math.abs(getWidth - w) < 0.1).assertTrue();
          console.info(msg + ' setStrokeWidth and getWidth consistency test passed for width: ' + w);
        }
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenSetAlphaBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_0900
     * @tc.desc   test setAlpha with boundary value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetAlphaBoundaryValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testPenSetAlphaBoundaryValueStatic';
      const pen = new drawing.Pen();
      try {
        pen.setAlpha(-1);
        let alpha = pen.getAlpha();
        console.info(msg + ' setAlpha(-1) should use default, alpha: ' + alpha);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` setAlpha errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect((e as BusinessError).code).assertEqual(401);
      }

      try {
        pen.setAlpha(256);
        let alpha = pen.getAlpha();
        console.info(msg + ' setAlpha(256) should be clamped, alpha: ' + alpha);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` setAlpha errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect((e as BusinessError).code).assertEqual(401);
      }

      try {
        pen.setAlpha(-100);
        let alpha = pen.getAlpha();
        console.info(msg + ' setAlpha(-100) succeeded, alpha: ' + alpha);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` setAlpha errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect((e as BusinessError).code).assertEqual(401);
      }

      try {
        pen.setAlpha(1000);
        let alpha = pen.getAlpha();
        console.info(msg + ' setAlpha(1000) succeeded, alpha: ' + alpha);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` setAlpha errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect((e as BusinessError).code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testPenSetAlphaAndGetConsistencyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_1000
     * @tc.desc   test setAlpha and getAlpha consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetAlphaAndGetConsistencyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetAlphaAndGetConsistencyStatic';
      const pen = new drawing.Pen();
      let alphas: int[] = [0, 1, 128, 255, 255, 0];
      try {
        for (let a of alphas) {
          pen.setAlpha(a);
          let getAlpha = pen.getAlpha();
          expect(getAlpha >= 0 && getAlpha <= 255).assertTrue();
          console.info(msg + ' setAlpha and getAlpha consistency test passed for alpha: ' + a + ', got: ' + getAlpha);
        }
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenSetBlendModeAllEnumsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_1100
     * @tc.desc   test setBlendMode with all BlendMode enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetBlendModeAllEnumsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetBlendModeAllEnumsStatic';
      const pen = new drawing.Pen();
      let blendModes: drawing.BlendMode[] = [
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
      try {
        for (let mode of blendModes) {
          pen.setBlendMode(mode);
          console.info(msg + ' setBlendMode succeeded for mode: ' + mode);
        }
      } catch (e) {
        console.info(msg + ` setBlendMode errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenSetJoinStyleAllEnumsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_1300
     * @tc.desc   test setJoinStyle with all JoinStyle enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetJoinStyleAllEnumsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetJoinStyleAllEnumsStatic';
      const pen = new drawing.Pen();
      let joinStyles: drawing.JoinStyle[] = [
        drawing.JoinStyle.MITER_JOIN,
        drawing.JoinStyle.ROUND_JOIN,
        drawing.JoinStyle.BEVEL_JOIN
      ];
      try {
        for (let style of joinStyles) {
          pen.setJoinStyle(style);
          let getStyle = pen.getJoinStyle();
          expect(getStyle).assertEqual(style);
          console.info(msg + ' setJoinStyle and getJoinStyle consistency test passed for style: ' + style);
        }
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenSetCapStyleAllEnumsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_1400
     * @tc.desc   test setCapStyle with all CapStyle enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetCapStyleAllEnumsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetCapStyleAllEnumsStatic';
      const pen = new drawing.Pen();
      let capStyles: drawing.CapStyle[] = [
        drawing.CapStyle.FLAT_CAP,
        drawing.CapStyle.SQUARE_CAP,
        drawing.CapStyle.ROUND_CAP
      ];
      try {
        for (let style of capStyles) {
          pen.setCapStyle(style);
          let getStyle = pen.getCapStyle();
          expect(getStyle).assertEqual(style);
          console.info(msg + ' setCapStyle and getCapStyle consistency test passed for style: ' + style);
        }
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenSetMiterLimitExtremeValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_1500
     * @tc.desc   test setMiterLimit with extreme value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetMiterLimitExtremeValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testPenSetMiterLimitExtremeValueStatic';
      const pen = new drawing.Pen();
      try {
        pen.setMiterLimit(Number.MAX_VALUE);
        let miter = pen.getMiterLimit();
        console.info(msg + ' setMiterLimit with MAX_VALUE succeeded, miter: ' + miter);
        expect(miter).assertEqual(Infinity);
      } catch (e) {
        console.info(msg + ` setMiterLimit errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }

      try {
        pen.setMiterLimit(Number.MIN_VALUE);
        let miter = pen.getMiterLimit();
        console.info(msg + ' setMiterLimit with MIN_VALUE succeeded, miter: ' + miter);
        expect(miter).assertEqual(0);
      } catch (e) {
        console.info(msg + ` setMiterLimit errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }

      try {
        pen.setMiterLimit(-100);
        let miter = pen.getMiterLimit();
        expect(miter).assertEqual(-100);
        console.info(msg + ' setMiterLimit(-100) succeeded, miter: ' + miter);
      } catch (e) {
        console.info(msg + ` setMiterLimit errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }

      try {
        pen.setMiterLimit(10000);
        let miter = pen.getMiterLimit();
        expect(miter).assertEqual(10000);
        console.info(msg + ' setMiterLimit(10000) succeeded, miter: ' + miter);
      } catch (e) {
        console.info(msg + ` setMiterLimit errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenSetMiterLimitAndGetConsistencyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_1600
     * @tc.desc   test setMiterLimit and getMiterLimit consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetMiterLimitAndGetConsistencyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetMiterLimitAndGetConsistencyStatic';
      const pen = new drawing.Pen();
      let miters = [0, 1, 4, 10, 20.5, 100];
      try {
        for (let m of miters) {
          pen.setMiterLimit(m);
          let getMiter = pen.getMiterLimit();
          expect(Math.abs(getMiter - m) < 0.1).assertTrue();
          console.info(msg + ' setMiterLimit and getMiterLimit consistency test passed for miter: ' + m);
        }
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenConstructorCopyValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_1700
     * @tc.desc   test Pen constructor copy validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenConstructorCopyValidationStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenConstructorCopyValidationStatic';
      try {
        let pen1 = new drawing.Pen();
        pen1.setColor({
          alpha: 255,
          red: 128,
          green: 64,
          blue: 32
        });
        pen1.setStrokeWidth(10);
        pen1.setAlpha(200);
        pen1.setAntiAlias(true);
        pen1.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        pen1.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        pen1.setMiterLimit(5);

        let pen2 = new drawing.Pen(pen1);
        let color1 = pen1.getColor();
        let color2 = pen2.getColor();
        if (color1 && color2) {
          expect(color1.alpha).assertEqual(color2.alpha);
          expect(color1.red).assertEqual(color2.red);
          expect(color1.green).assertEqual(color2.green);
          expect(color1.blue).assertEqual(color2.blue);
        }

        expect(pen1.getWidth()).assertEqual(pen2.getWidth());
        expect(pen1.getAlpha()).assertEqual(pen2.getAlpha());
        expect(pen1.isAntiAlias()).assertEqual(pen2.isAntiAlias());
        expect(pen1.getJoinStyle()).assertEqual(pen2.getJoinStyle());
        expect(pen1.getCapStyle()).assertEqual(pen2.getCapStyle());
        expect(pen1.getMiterLimit()).assertEqual(pen2.getMiterLimit());

        console.info(msg + ' constructor copy validation succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenConstructorNullParamStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_1800
     * @tc.desc   test Pen constructor with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenConstructorNullParamStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testPenConstructorNullParamStatic';
      try {
        let pen1 = new drawing.Pen();
        let pen2 = new drawing.Pen(pen1);
        console.info(msg + ' constructor with valid parameter succeeded');
      } catch (e) {
        console.info(msg + ` constructor errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPenSetColor12AndGetColorConsistencyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_2100
     * @tc.desc   test setColor(alpha, red, green, blue) and getColor consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetColor12AndGetColorConsistencyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetColor12AndGetColorConsistencyStatic';
      const pen = new drawing.Pen();
      try {
        pen.setColor(255, 255, 0, 0);
        let color = pen.getColor();
        if (color) {
          expect(color.alpha).assertEqual(255);
          expect(color.red).assertEqual(255);
          expect(color.green).assertEqual(0);
          expect(color.blue).assertEqual(0);
        }
        console.info(msg + ' setColor and getColor consistency test passed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenSetAndGetColorConsistencyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_2200
     * @tc.desc   test setColor(Color) and getColor consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetAndGetColorConsistencyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetAndGetColorConsistencyStatic';
      const pen = new drawing.Pen();
      let colors: common2D.Color[] = [
        {
          alpha: 255,
          red: 255,
          green: 0,
          blue: 0
        },
        {
          alpha: 128,
          red: 128,
          green: 128,
          blue: 128
        },
        {
          alpha: 0,
          red: 0,
          green: 0,
          blue: 0
        },
        {
          alpha: 200,
          red: 100,
          green: 50,
          blue: 25
        }
      ];
      try {
        for (let c of colors) {
          pen.setColor(c);
          let getColor = pen.getColor();
          if (getColor) {
            expect(getColor.alpha).assertEqual(c.alpha);
            expect(getColor.red).assertEqual(c.red);
            expect(getColor.green).assertEqual(c.green);
            expect(getColor.blue).assertEqual(c.blue);
          }
          console.info(msg + ' setColor and getColor consistency test passed');
        }
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenSetAntiAliasAndGetConsistencyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_2300
     * @tc.desc   test setAntiAlias and isAntiAlias consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetAntiAliasAndGetConsistencyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenSetAntiAliasAndGetConsistencyStatic';
      const pen = new drawing.Pen();
      try {
        pen.setAntiAlias(true);
        let isAntiAlias = pen.isAntiAlias();
        expect(isAntiAlias).assertTrue();
        console.info(msg + ' setAntiAlias(true) and isAntiAlias consistency test passed');

        pen.setAntiAlias(false);
        isAntiAlias = pen.isAntiAlias();
        expect(isAntiAlias).assertFalse();
        console.info(msg + ' setAntiAlias(false) and isAntiAlias consistency test passed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenCombinedOperationsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_2400
     * @tc.desc   test pen combined operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenCombinedOperationsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenCombinedOperationsStatic';
      try {
        let pen = new drawing.Pen();
        pen.setColor(255, 100, 150, 200);
        pen.setStrokeWidth(5);
        pen.setAntiAlias(true);
        pen.setBlendMode(drawing.BlendMode.SRC_OVER);
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        pen.setMiterLimit(10);

        let color = pen.getColor();
        if (color) {
          expect(color.alpha).assertEqual(255);
          expect(color.red).assertEqual(100);
          expect(color.green).assertEqual(150);
          expect(color.blue).assertEqual(200);
        }

        expect(pen.getWidth()).assertEqual(5);
        expect(pen.isAntiAlias()).assertTrue();
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
        expect(pen.getMiterLimit()).assertEqual(10);

        pen.setAlpha(180);
        expect(pen.getAlpha()).assertEqual(180);

        console.info(msg + ' combined operations test succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPenGetFillPathWithComplexPathStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PEN_STATIC_3200
     * @tc.desc   test getFillPath with complex path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetFillPathWithComplexPathStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testPenGetFillPathWithComplexPathStatic';
      const pen = new drawing.Pen();
      pen.setStrokeWidth(5);
      let pathSrc: drawing.Path = new drawing.Path();
      pathSrc.moveTo(0, 0);
      pathSrc.lineTo(100, 100);
      pathSrc.quadTo(50, 50, 150, 100);
      pathSrc.cubicTo(100, 100, 80, 150, 300, 150);
      pathSrc.close();

      let pathDst: drawing.Path = new drawing.Path();
      try {
        let result = pen.getFillPath(pathSrc, pathDst);
        expect(result).assertTrue();
        console.info(msg + ' getFillPath with complex path succeeded, result: ' + result);
      } catch (e) {
        console.info(msg + ` getFillPath errorCode is: ${(e as BusinessError).code} + errormsg is: ${(e as BusinessError).message}`);
        expect().assertFail();
      }
    })
  })
}

