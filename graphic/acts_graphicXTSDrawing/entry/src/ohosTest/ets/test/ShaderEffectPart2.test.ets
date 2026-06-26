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
import image from '@ohos.multimedia.image';
import common2D from '@ohos.graphics.common2D';

export default function DrawingTsShaderEffectPart2Test() {
  describe('DrawingTsShaderEffectPart2Test', () => {
    let pixelMap: image.PixelMap;

    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: 100, width: 100 }
      }
      pixelMap = await image.createPixelMap(color, opts);
    })

    /**
     * @tc.name   testCreateColorShaderBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_0100
     * @tc.desc   test createColorShader with boundary color values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateColorShaderBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateColorShaderBoundaryValue';
      try {
        let shader0 = drawing.ShaderEffect.createColorShader(0x00000000);
        console.info(msg + ' createColorShader 0x00000000 succeeded');
        expect(shader0 != null && shader0 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shader1 = drawing.ShaderEffect.createColorShader(0xFFFFFFFF);
        console.info(msg + ' createColorShader 0xFFFFFFFF succeeded');
        expect(shader1 != null && shader1 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateColorShaderNegativeValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_0200
     * @tc.desc   test createColorShader with negative color value. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateColorShaderNegativeValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCreateColorShaderNegativeValue';
      try {
        drawing.ShaderEffect.createColorShader(-1);
        console.info(msg + ' createColorShader -1 succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateLinearGradientEmptyArray
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_0400
     * @tc.desc   test createLinearGradient with empty color array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateLinearGradientEmptyArray', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCreateLinearGradientEmptyArray';
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
     * @tc.name   testCreateLinearGradientReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_0600
     * @tc.desc   test createLinearGradient return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateLinearGradientReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateLinearGradientReturnValidation';
      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(
          {x: 100, y: 100},
          {x: 300, y: 300},
          [0xFF00FF00, 0xFFFF0000],
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
     * @tc.name   testCreateLinearGradientMaxValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_0700
     * @tc.desc   test createLinearGradient with max value points.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testCreateLinearGradientMaxValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testCreateLinearGradientMaxValue';
      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(
          {x: Number.MAX_VALUE, y: Number.MAX_VALUE},
          {x: Number.MAX_VALUE, y: Number.MAX_VALUE},
          [0xFF00FF00, 0xFFFF0000],
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
     * @tc.name   testCreateRadialGradientBoundaryRadius
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_0800
     * @tc.desc   test createRadialGradient with boundary radius values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateRadialGradientBoundaryRadius', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateRadialGradientBoundaryRadius';
      try {
        let shaderEffect0 = drawing.ShaderEffect.createRadialGradient(
          {x: 100, y: 100},
          0.1,
          [0xFF00FF00, 0xFFFF0000],
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
          [0xFF00FF00, 0xFFFF0000],
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
     * @tc.name   testCreateSweepGradientBoundaryAngle
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_1000
     * @tc.desc   test createSweepGradient with boundary angle values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSweepGradientBoundaryAngle', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCreateSweepGradientBoundaryAngle';
      try {
        let shaderEffect0 = drawing.ShaderEffect.createSweepGradient(
          {x: 100, y: 100},
          [0xFF00FF00, 0xFFFF0000],
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
          [0xFF00FF00, 0xFFFF0000],
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
     * @tc.name   testCreateConicalGradientBoundaryRadius
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_1200
     * @tc.desc   test createConicalGradient with boundary radius values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateConicalGradientBoundaryRadius', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCreateConicalGradientBoundaryRadius';
      try {
        let shaderEffect0 = drawing.ShaderEffect.createConicalGradient(
          {x: 100, y: 100},
          0.1,
          {x: 200, y: 200},
          0.1,
          [0xFF00FF00, 0xFFFF0000],
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
          [0xFF00FF00, 0xFFFF0000],
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
     * @tc.name   testCreateComposeShaderReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_1400
     * @tc.desc   test createComposeShader return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateComposeShaderReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateComposeShaderReturnValidation';
      let dstShader = drawing.ShaderEffect.createColorShader(0xFF0000FF);
      let srcShader = drawing.ShaderEffect.createColorShader(0xFFFF0000);
      try {
        let shader = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.SRC_OVER);
        console.info(msg + ' createComposeShader succeeded');
        expect(shader != null && shader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateComposeShaderWithGradientShaders
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_1600
     * @tc.desc   test createComposeShader with gradient shader effects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testCreateComposeShaderWithGradientShaders', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testCreateComposeShaderWithGradientShaders';
      try {
        let linearShader = drawing.ShaderEffect.createLinearGradient(
          {x: 0, y: 0},
          {x: 200, y: 200},
          [0xFF0000FF, 0xFFFF0000],
          drawing.TileMode.REPEAT
        );
        let radialShader = drawing.ShaderEffect.createRadialGradient(
          {x: 100, y: 100},
          100,
          [0xFF00FF00, 0xFFFF0000],
          drawing.TileMode.REPEAT
        );
        let composedShader = drawing.ShaderEffect.createComposeShader(linearShader, radialShader, drawing.BlendMode.SRC_OVER);
        console.info(msg + ' createComposeShader with gradients succeeded');
        expect(composedShader != null && composedShader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateImageShaderReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_1700
     * @tc.desc   test createImageShader return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateImageShaderReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateImageShaderReturnValidation';
      let options = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
      try {
        let imageShader = drawing.ShaderEffect.createImageShader(
          pixelMap,
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
     * @tc.name   testShaderEffectWithPen
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_1900
     * @tc.desc   test ShaderEffect with Pen joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testShaderEffectWithPen', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testShaderEffectWithPen';
      try {
        let shader = drawing.ShaderEffect.createColorShader(0xFFFF0000);
        let pen = new drawing.Pen();
        pen.setShaderEffect(shader);
        console.info(msg + ' ShaderEffect with Pen succeeded');
        expect(pen != null && pen != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectWithBrush
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_2000
     * @tc.desc   test ShaderEffect with Brush joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShaderEffectWithBrush', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testShaderEffectWithBrush';
      try {
        let shader = drawing.ShaderEffect.createLinearGradient(
          {x: 0, y: 0},
          {x: 100, y: 100},
          [0xFF0000FF, 0xFFFF0000],
          drawing.TileMode.REPEAT
        );
        let brush = new drawing.Brush();
        brush.setShaderEffect(shader);
        console.info(msg + ' ShaderEffect with Brush succeeded');
        expect(brush != null && brush != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateLinearGradientMultipleColors
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_2100
     * @tc.desc   test createLinearGradient with multiple colors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateLinearGradientMultipleColors', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateLinearGradientMultipleColors';
      try {
        let shader = drawing.ShaderEffect.createLinearGradient(
          {x: 0, y: 0},
          {x: 200, y: 200},
          [0xFF0000FF, 0xFF00FF00, 0xFFFF0000, 0xFFFFFF00],
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
     * @tc.name   testCreateRadialGradientMultipleColors
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_2200
     * @tc.desc   test createRadialGradient with multiple colors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testCreateRadialGradientMultipleColors', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testCreateRadialGradientMultipleColors';
      try {
        let shader = drawing.ShaderEffect.createRadialGradient(
          {x: 100, y: 100},
          100,
          [0xFF0000FF, 0xFF00FF00, 0xFFFF0000, 0xFFFFFF00],
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
     * @tc.name   testCreateSweepGradientMultipleColors
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_2300
     * @tc.desc   test createSweepGradient with multiple colors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSweepGradientMultipleColors', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateSweepGradientMultipleColors';
      try {
        let shader = drawing.ShaderEffect.createSweepGradient(
          {x: 100, y: 100},
          [0xFF0000FF, 0xFF00FF00, 0xFFFF0000, 0xFFFFFF00],
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
     * @tc.name   testCreateConicalGradientMultipleColors
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_2400
     * @tc.desc   test createConicalGradient with multiple colors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateConicalGradientMultipleColors', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCreateConicalGradientMultipleColors';
      try {
        let shader = drawing.ShaderEffect.createConicalGradient(
          {x: 100, y: 100},
          50,
          {x: 200, y: 200},
          100,
          [0xFF0000FF, 0xFF00FF00, 0xFFFF0000, 0xFFFFFF00],
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
     * @tc.name   testCreateImageShaderWithMatrixTransform
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_2500
     * @tc.desc   test createImageShader with matrix transform.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateImageShaderWithMatrixTransform', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCreateImageShaderWithMatrixTransform';
      let matrix = new drawing.Matrix();
      matrix.setTranslation(50, 50);
      let options = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
      try {
        let imageShader = drawing.ShaderEffect.createImageShader(
          pixelMap,
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
     * @tc.name   testCreateColorShaderFloatValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_2600
     * @tc.desc   test createColorShader with float color value. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateColorShaderFloatValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateColorShaderFloatValue';
      try {
        drawing.ShaderEffect.createColorShader(1.5);
        console.info(msg + ' createColorShader with float succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testCreateColorShaderNaNValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_2700
     * @tc.desc   test createColorShader with NaN color value. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testCreateColorShaderNaNValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testCreateColorShaderNaNValue';
      try {
        drawing.ShaderEffect.createColorShader(NaN);
        console.info(msg + ' createColorShader with NaN succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateComposeShaderWithImageShader
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_2800
     * @tc.desc   test createComposeShader with image shader effects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateComposeShaderWithImageShader', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateComposeShaderWithImageShader';
      let options = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
      try {
        let imageShader1 = drawing.ShaderEffect.createImageShader(
          pixelMap,
          drawing.TileMode.REPEAT,
          drawing.TileMode.MIRROR,
          options
        );
        let imageShader2 = drawing.ShaderEffect.createImageShader(
          pixelMap,
          drawing.TileMode.CLAMP,
          drawing.TileMode.DECAL,
          options
        );
        let composedShader = drawing.ShaderEffect.createComposeShader(imageShader1, imageShader2, drawing.BlendMode.SRC_OVER);
        console.info(msg + ' createComposeShader with image shaders succeeded');
        expect(composedShader != null && composedShader != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateRadialGradientReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_2900
     * @tc.desc   test createRadialGradient return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateRadialGradientReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCreateRadialGradientReturnValidation';
      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient(
          {x: 100, y: 100},
          100,
          [0xFF00FF00, 0xFFFF0000],
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
     * @tc.name   testCreateSweepGradientReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_3000
     * @tc.desc   test createSweepGradient return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateSweepGradientReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCreateSweepGradientReturnValidation';
      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient(
          {x: 100, y: 100},
          [0xFF00FF00, 0xFFFF0000],
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
     * @tc.name   testCreateConicalGradientReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_3100
     * @tc.desc   test createConicalGradient return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateConicalGradientReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateConicalGradientReturnValidation';
      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient(
          {x: 100, y: 100},
          100,
          {x: 200, y: 200},
          50,
          [0xFF00FF00, 0xFFFF0000],
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
     * @tc.name   testAllTileModesCombinations
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_3200
     * @tc.desc   test all TileMode combinations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testAllTileModesCombinations', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testAllTileModesCombinations';
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
              [0xFF0000FF, 0xFFFF0000],
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
     * @tc.name   testCreateComposeShaderAllBlendModes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADEREFFECT_3300
     * @tc.desc   test createComposeShader with all BlendMode values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateComposeShaderAllBlendModes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateComposeShaderAllBlendModes';
      let dstShader = drawing.ShaderEffect.createColorShader(0xFF0000FF);
      let srcShader = drawing.ShaderEffect.createColorShader(0xFFFF0000);
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
          let shader = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, blendMode);
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