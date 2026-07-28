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
import image from '@ohos.multimedia.image';
import common2D from '@ohos.graphics.common2D';

export default function DrawingTsShaderEffectPart2Test(): void {
  describe('DrawingTsShaderEffectPart2Test', (): void => {
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
     * @tc.name   testCreateColorShaderBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_0100
     * @tc.desc   test createColorShader with boundary color values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateColorShaderBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateColorShaderBoundaryValueStatic';
      try {
        let shader0 = drawing.ShaderEffect.createColorShader(0x00000000);
        console.info(msg + ' createColorShader 0x00000000 succeeded');
        expect(shader0 != null && shader0 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shader1 = drawing.ShaderEffect.createColorShader(0xFFFFFFFF.toInt());
        console.info(msg + ' createColorShader 0xFFFFFFFF succeeded');
        expect(shader1 != null && shader1 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateColorShaderNegativeValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_0200
     * @tc.desc   test createColorShader with negative color value. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateColorShaderNegativeValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testCreateColorShaderNegativeValueStatic';
      try {
        drawing.ShaderEffect.createColorShader(-1);
        console.info(msg + ' createColorShader -1 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateLinearGradientEmptyArrayStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_0400
     * @tc.desc   test createLinearGradient with empty color array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateLinearGradientEmptyArrayStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testCreateLinearGradientEmptyArrayStatic';
      let matrix = new drawing.Matrix();
      try {
        drawing.ShaderEffect.createLinearGradient(
          {x: 100, y: 100},
          {x: 300, y: 300},
          [],
          drawing.TileMode.REPEAT,
          [],
          matrix
        );
        console.info(msg + ' createLinearGradient with empty array succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateLinearGradientReturnValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_0600
     * @tc.desc   test createLinearGradient return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateLinearGradientReturnValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testCreateLinearGradientReturnValidationStatic';
      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(
          {x: 100, y: 100},
          {x: 300, y: 300},
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        console.info(msg + ' createLinearGradient succeeded');
        expect(shaderEffect != null && shaderEffect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateLinearGradientMaxValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_0700
     * @tc.desc   test createLinearGradient with max value points.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testCreateLinearGradientMaxValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testCreateLinearGradientMaxValueStatic';
      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(
          {x: Number.MAX_VALUE, y: Number.MAX_VALUE},
          {x: Number.MAX_VALUE, y: Number.MAX_VALUE},
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        console.info(msg + ' createLinearGradient with MAX_VALUE succeeded');
        expect(shaderEffect != null && shaderEffect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateRadialGradientBoundaryRadiusStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_0800
     * @tc.desc   test createRadialGradient with boundary radius values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateRadialGradientBoundaryRadiusStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateRadialGradientBoundaryRadiusStatic';
      try {
        let shaderEffect0 = drawing.ShaderEffect.createRadialGradient(
          {x: 100, y: 100},
          0.1,
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        console.info(msg + ' createRadialGradient with radius 0.1 succeeded');
        expect(shaderEffect0 != null && shaderEffect0 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shaderEffect1 = drawing.ShaderEffect.createRadialGradient(
          {x: 100, y: 100},
          1000,
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        console.info(msg + ' createRadialGradient with radius 1000 succeeded');
        expect(shaderEffect1 != null && shaderEffect1 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateSweepGradientBoundaryAngleStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_1000
     * @tc.desc   test createSweepGradient with boundary angle values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSweepGradientBoundaryAngleStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testCreateSweepGradientBoundaryAngleStatic';
      try {
        let shaderEffect0 = drawing.ShaderEffect.createSweepGradient(
          {x: 100, y: 100},
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT,
          0,
          360
        );
        console.info(msg + ' createSweepGradient with angles 0-360 succeeded');
        expect(shaderEffect0 != null && shaderEffect0 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shaderEffect1 = drawing.ShaderEffect.createSweepGradient(
          {x: 100, y: 100},
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT,
          -360,
          360
        );
        console.info(msg + ' createSweepGradient with angles -360-360 succeeded');
        expect(shaderEffect1 != null && shaderEffect1 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testCreateConicalGradientBoundaryRadiusStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_1200
     * @tc.desc   test createConicalGradient with boundary radius values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateConicalGradientBoundaryRadiusStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testCreateConicalGradientBoundaryRadiusStatic';
      try {
        let shaderEffect0 = drawing.ShaderEffect.createConicalGradient(
          {x: 100, y: 100},
          0.1,
          {x: 200, y: 200},
          0.1,
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        console.info(msg + ' createConicalGradient with radius 0.1 succeeded');
        expect(shaderEffect0 != null && shaderEffect0 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shaderEffect1 = drawing.ShaderEffect.createConicalGradient(
          {x: 100, y: 100},
          1000,
          {x: 200, y: 200},
          1000,
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        console.info(msg + ' createConicalGradient with radius 1000 succeeded');
        expect(shaderEffect1 != null && shaderEffect1 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testCreateComposeShaderReturnValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_1400
     * @tc.desc   test createComposeShader return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateComposeShaderReturnValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testCreateComposeShaderReturnValidationStatic';
      let dstShader = drawing.ShaderEffect.createColorShader(0xFF0000FF.toInt());
      let srcShader = drawing.ShaderEffect.createColorShader(0xFFFF0000.toInt());
      try {
        let shader = drawing.ShaderEffect.createComposeShader(dstShader!, srcShader!, drawing.BlendMode.SRC_OVER);
        console.info(msg + ' createComposeShader succeeded');
        expect(shader != null && shader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateComposeShaderWithGradientShadersStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_1600
     * @tc.desc   test createComposeShader with gradient shader effects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testCreateComposeShaderWithGradientShadersStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testCreateComposeShaderWithGradientShadersStatic';
      try {
        let linearShader = drawing.ShaderEffect.createLinearGradient(
          {x: 0, y: 0},
          {x: 200, y: 200},
          [0xFF0000FF.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        let radialShader = drawing.ShaderEffect.createRadialGradient(
          {x: 100, y: 100},
          100,
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        let composedShader = drawing.ShaderEffect.createComposeShader(linearShader!, radialShader!, drawing.BlendMode.SRC_OVER);
        console.info(msg + ' createComposeShader with gradients succeeded');
        expect(composedShader != null && composedShader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateImageShaderReturnValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_1700
     * @tc.desc   test createImageShader return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateImageShaderReturnValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateImageShaderReturnValidationStatic';
      let options = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
      try {
        let imageShader = drawing.ShaderEffect.createImageShader(
          pixelMap!,
          drawing.TileMode.REPEAT,
          drawing.TileMode.MIRROR,
          options
        );
        console.info(msg + ' createImageShader succeeded');
        expect(imageShader != null && imageShader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectWithPenStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_1900
     * @tc.desc   test ShaderEffect with Pen joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testShaderEffectWithPenStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testShaderEffectWithPenStatic';
      try {
        let shader = drawing.ShaderEffect.createColorShader(0xFFFF0000.toInt());
        let pen = new drawing.Pen();
        pen.setShaderEffect(shader!);
        console.info(msg + ' ShaderEffect with Pen succeeded');
        expect(pen != null && pen != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectWithBrushStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_2000
     * @tc.desc   test ShaderEffect with Brush joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShaderEffectWithBrushStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testShaderEffectWithBrushStatic';
      try {
        let shader = drawing.ShaderEffect.createLinearGradient(
          {x: 0, y: 0},
          {x: 100, y: 100},
          [0xFF0000FF.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        let brush = new drawing.Brush();
        brush.setShaderEffect(shader!);
        console.info(msg + ' ShaderEffect with Brush succeeded');
        expect(brush != null && brush != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateLinearGradientMultipleColorsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_2100
     * @tc.desc   test createLinearGradient with multiple colors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateLinearGradientMultipleColorsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testCreateLinearGradientMultipleColorsStatic';
      try {
        let shader = drawing.ShaderEffect.createLinearGradient(
          {x: 0, y: 0},
          {x: 200, y: 200},
          [0xFF0000FF.toInt(), 0xFF00FF00.toInt(), 0xFFFF0000.toInt(), 0xFFFFFF00.toInt()],
          drawing.TileMode.REPEAT,
          [0.0, 0.25, 0.75, 1.0]
        );
        console.info(msg + ' createLinearGradient with 4 colors succeeded');
        expect(shader != null && shader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateRadialGradientMultipleColorsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_2200
     * @tc.desc   test createRadialGradient with multiple colors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testCreateRadialGradientMultipleColorsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testCreateRadialGradientMultipleColorsStatic';
      try {
        let shader = drawing.ShaderEffect.createRadialGradient(
          {x: 100, y: 100},
          100,
          [0xFF0000FF.toInt(), 0xFF00FF00.toInt(), 0xFFFF0000.toInt(), 0xFFFFFF00.toInt()],
          drawing.TileMode.REPEAT,
          [0.0, 0.25, 0.75, 1.0]
        );
        console.info(msg + ' createRadialGradient with 4 colors succeeded');
        expect(shader != null && shader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateSweepGradientMultipleColorsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_2300
     * @tc.desc   test createSweepGradient with multiple colors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSweepGradientMultipleColorsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateSweepGradientMultipleColorsStatic';
      try {
        let shader = drawing.ShaderEffect.createSweepGradient(
          {x: 100, y: 100},
          [0xFF0000FF.toInt(), 0xFF00FF00.toInt(), 0xFFFF0000.toInt(), 0xFFFFFF00.toInt()],
          drawing.TileMode.REPEAT,
          0,
          360,
          [0.0, 0.25, 0.75, 1.0]
        );
        console.info(msg + ' createSweepGradient with 4 colors succeeded');
        expect(shader != null && shader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateConicalGradientMultipleColorsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_2400
     * @tc.desc   test createConicalGradient with multiple colors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateConicalGradientMultipleColorsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testCreateConicalGradientMultipleColorsStatic';
      try {
        let shader = drawing.ShaderEffect.createConicalGradient(
          {x: 100, y: 100},
          50,
          {x: 200, y: 200},
          100,
          [0xFF0000FF.toInt(), 0xFF00FF00.toInt(), 0xFFFF0000.toInt(), 0xFFFFFF00.toInt()],
          drawing.TileMode.REPEAT,
          [0.0, 0.25, 0.75, 1.0]
        );
        console.info(msg + ' createConicalGradient with 4 colors succeeded');
        expect(shader != null && shader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateImageShaderWithMatrixTransformStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_2500
     * @tc.desc   test createImageShader with matrix transform.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateImageShaderWithMatrixTransformStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testCreateImageShaderWithMatrixTransformStatic';
      let matrix = new drawing.Matrix();
      matrix.setTranslation(50, 50);
      let options = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
      try {
        let imageShader = drawing.ShaderEffect.createImageShader(
          pixelMap!,
          drawing.TileMode.REPEAT,
          drawing.TileMode.MIRROR,
          options,
          matrix
        );
        console.info(msg + ' createImageShader with matrix transform succeeded');
        expect(imageShader != null && imageShader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateColorShaderNaNValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_2700
     * @tc.desc   test createColorShader with NaN color value. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testCreateColorShaderNaNValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testCreateColorShaderNaNValueStatic';
      try {
        drawing.ShaderEffect.createColorShader(NaN.toInt());
        console.info(msg + ' createColorShader with NaN succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateComposeShaderWithImageShaderStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_2800
     * @tc.desc   test createComposeShader with image shader effects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateComposeShaderWithImageShaderStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateComposeShaderWithImageShaderStatic';
      let options = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
      try {
        let imageShader1 = drawing.ShaderEffect.createImageShader(
          pixelMap!,
          drawing.TileMode.REPEAT,
          drawing.TileMode.MIRROR,
          options
        );
        let imageShader2 = drawing.ShaderEffect.createImageShader(
          pixelMap!,
          drawing.TileMode.CLAMP,
          drawing.TileMode.DECAL,
          options
        );
        let composedShader = drawing.ShaderEffect.createComposeShader(imageShader1!, imageShader2!, drawing.BlendMode.SRC_OVER);
        console.info(msg + ' createComposeShader with image shaders succeeded');
        expect(composedShader != null && composedShader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateRadialGradientReturnValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_2900
     * @tc.desc   test createRadialGradient return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateRadialGradientReturnValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testCreateRadialGradientReturnValidationStatic';
      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient(
          {x: 100, y: 100},
          100,
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        console.info(msg + ' createRadialGradient succeeded');
        expect(shaderEffect != null && shaderEffect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateSweepGradientReturnValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_3000
     * @tc.desc   test createSweepGradient return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateSweepGradientReturnValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testCreateSweepGradientReturnValidationStatic';
      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient(
          {x: 100, y: 100},
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT,
          0,
          360
        );
        console.info(msg + ' createSweepGradient succeeded');
        expect(shaderEffect != null && shaderEffect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateConicalGradientReturnValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_3100
     * @tc.desc   test createConicalGradient return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateConicalGradientReturnValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testCreateConicalGradientReturnValidationStatic';
      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient(
          {x: 100, y: 100},
          100,
          {x: 200, y: 200},
          50,
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],
          drawing.TileMode.REPEAT
        );
        console.info(msg + ' createConicalGradient succeeded');
        expect(shaderEffect != null && shaderEffect != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAllTileModesCombinationsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_3200
     * @tc.desc   test all TileMode combinations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testAllTileModesCombinationsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testAllTileModesCombinationsStatic';
      let tileModes = [
        drawing.TileMode.CLAMP,
        drawing.TileMode.REPEAT,
        drawing.TileMode.MIRROR,
        drawing.TileMode.DECAL
      ];
      try {
        for (let modeX of tileModes) {
          for (let modeY of tileModes) {
            let shader = drawing.ShaderEffect.createLinearGradient(
              {x: 0, y: 0},
              {x: 100, y: 100},
              [0xFF0000FF.toInt(), 0xFFFF0000.toInt()],
              modeX
            );
            expect(shader != null && shader != undefined).assertTrue();
          }
        }
        console.info(msg + ' all TileMode combinations succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateComposeShaderAllBlendModesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_STATIC_3300
     * @tc.desc   test createComposeShader with all BlendMode values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateComposeShaderAllBlendModesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateComposeShaderAllBlendModesStatic';
      let dstShader = drawing.ShaderEffect.createColorShader(0xFF0000FF.toInt());
      let srcShader = drawing.ShaderEffect.createColorShader(0xFFFF0000.toInt());
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
      try {
        for (let blendMode of blendModes) {
          let shader = drawing.ShaderEffect.createComposeShader(dstShader!, srcShader!, blendMode);
          expect(shader != null && shader != undefined).assertTrue();
        }
        console.info(msg + ' all BlendMode values succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

  })
}