'use static';
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';

export default function DrawingImageFilterPart2Test(): void {
  describe('DrawingImageFilterPart2Test', (): void => {
    let pixel: image.PixelMap | undefined;

    beforeAll(async (): Promise<void> => {
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })

    /**
     * @tc.name   testImageFilterCreateBlurAllTileModesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_0200
     * @tc.desc   Test createBlurImageFilter with all TileMode enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateBlurAllTileModesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateBlurAllTileModesStatic';

      const tileModes = [
        drawing.TileMode.CLAMP,
        drawing.TileMode.REPEAT,
        drawing.TileMode.MIRROR,
        drawing.TileMode.DECAL
      ];

      for (let tileMode of tileModes) {
        try {
          let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, tileMode);
          expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
          console.info(msg + ` createBlurImageFilter with TileMode(${tileMode}) succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testImageFilterCreateBlurWithComposeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_0400
     * @tc.desc   Test createBlurImageFilter with compose filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateBlurWithComposeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateBlurWithComposeStatic';

      try {
        let blurFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.CLAMP);
        let blurFilter2 = drawing.ImageFilter.createBlurImageFilter(15, 20, drawing.TileMode.REPEAT, blurFilter1);
        expect(blurFilter2 !== null && blurFilter2 !== undefined).assertTrue();
        console.info(msg + ' createBlurImageFilter with compose filter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let blurFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.CLAMP);
        let blurFilter2 = drawing.ImageFilter.createBlurImageFilter(15, 20, drawing.TileMode.MIRROR, blurFilter1);
        let blurFilter3 = drawing.ImageFilter.createBlurImageFilter(25, 30, drawing.TileMode.DECAL, blurFilter2);
        expect(blurFilter3 !== null && blurFilter3 !== undefined).assertTrue();
        console.info(msg + ' three-level compose succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromImageFloatRectStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_0500
     * @tc.desc   Test createFromImage with float rect values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateFromImageFloatRectStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateFromImageFloatRectStatic';

      let srcRect: common2D.Rect = { left: 10.5, top: 10.3, right: 80.7, bottom: 80.9 };
      let dstRect: common2D.Rect = { left: 200.2, top: 200.4, right: 400.6, bottom: 400.8 };

      try {
        let filter = drawing.ImageFilter.createFromImage(pixel!, srcRect, dstRect);
        expect(filter !== null && filter !== undefined).assertTrue();
        console.info(msg + ' createFromImage with float rect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromImageNegativeRectStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_0600
     * @tc.desc   Test createFromImage with negative rect values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageFilterCreateFromImageNegativeRectStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testImageFilterCreateFromImageNegativeRectStatic';

      let srcRect: common2D.Rect = { left: -10, top: -20, right: 80, bottom: 90 };
      let dstRect: common2D.Rect = { left: -100, top: -200, right: 300, bottom: 400 };

      try {
        let filter = drawing.ImageFilter.createFromImage(pixel!, srcRect, dstRect);
        expect(filter !== null && filter !== undefined).assertTrue();
        console.info(msg + ' createFromImage with negative rect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromImageZeroRectStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_0700
     * @tc.desc   Test createFromImage with zero rect values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageFilterCreateFromImageZeroRectStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testImageFilterCreateFromImageZeroRectStatic';

      let srcRect: common2D.Rect = { left: 0, top: 0, right: 0, bottom: 0 };
      let dstRect: common2D.Rect = { left: 0, top: 0, right: 0, bottom: 0 };

      try {
        let filter = drawing.ImageFilter.createFromImage(pixel!, srcRect, dstRect);
        expect(filter !== null && filter !== undefined).assertTrue();
        console.info(msg + ' createFromImage with zero rect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateComposeChainedStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_1100
     * @tc.desc   Test chained compose of ImageFilters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateComposeChainedStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateComposeChainedStatic';

      try {
        let blurFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 5, drawing.TileMode.CLAMP);
        let blurFilter2 = drawing.ImageFilter.createBlurImageFilter(10, 10, drawing.TileMode.REPEAT);
        let blurFilter3 = drawing.ImageFilter.createBlurImageFilter(15, 15, drawing.TileMode.MIRROR);

        let compose1 = drawing.ImageFilter.createComposeImageFilter(blurFilter2!, blurFilter1!);
        let compose2 = drawing.ImageFilter.createComposeImageFilter(blurFilter3!, compose1!);
        expect(compose2 !== null && compose2 !== undefined).assertTrue();
        console.info(msg + ' two-level compose succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let blurFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 5, drawing.TileMode.CLAMP);
        let blurFilter2 = drawing.ImageFilter.createBlurImageFilter(10, 10, drawing.TileMode.REPEAT);
        let blurFilter3 = drawing.ImageFilter.createBlurImageFilter(15, 15, drawing.TileMode.MIRROR);
        let blurFilter4 = drawing.ImageFilter.createBlurImageFilter(20, 20, drawing.TileMode.DECAL);

        let compose1 = drawing.ImageFilter.createComposeImageFilter(blurFilter2!, blurFilter1!);
        let compose2 = drawing.ImageFilter.createComposeImageFilter(blurFilter3!, compose1!);
        let compose3 = drawing.ImageFilter.createComposeImageFilter(blurFilter4!, compose2!);
        expect(compose3 !== null && compose3 !== undefined).assertTrue();
        console.info(msg + ' three-level compose succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateOffsetBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_1200
     * @tc.desc   Test createOffsetImageFilter with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateOffsetBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateOffsetBoundaryValueStatic';

      try {
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(0, 0, null);
        expect(offsetFilter !== null && offsetFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter with 0 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(Number.MAX_VALUE, Number.MAX_VALUE, null);
        expect(offsetFilter !== null && offsetFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter with MAX_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(Number.MIN_VALUE, Number.MIN_VALUE, null);
        expect(offsetFilter !== null && offsetFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter with MIN_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(-Number.MAX_VALUE, -Number.MAX_VALUE, null);
        expect(offsetFilter !== null && offsetFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter with negative MAX_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(0.0001, 0.0001, null);
        expect(offsetFilter !== null && offsetFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter with small float succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(Infinity, Infinity, null);
        expect(offsetFilter !== null && offsetFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter with Infinity succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateOffsetWithInputStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_1300
     * @tc.desc   Test createOffsetImageFilter with various input filters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateOffsetWithInputStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateOffsetWithInputStatic';

      try {
        let blurFilter = drawing.ImageFilter.createBlurImageFilter(10, 10, drawing.TileMode.CLAMP);
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(15, 20, blurFilter);
        expect(offsetFilter !== null && offsetFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter with blur filter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        let imgFilter = drawing.ImageFilter.createFromColorFilter(colorFilter!, null);
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(25, 30, imgFilter!);
        expect(offsetFilter !== null && offsetFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter with color filter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createColorShader(0xFF00FF00.toInt());
        let shaderFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(35, 40, shaderFilter!);
        expect(offsetFilter !== null && offsetFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter with shader filter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromShaderWithLinearGradientStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_1400
     * @tc.desc   Test createFromShaderEffect with linear gradient shader.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateFromShaderWithLinearGradientStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateFromShaderWithLinearGradientStatic';

      let startPt: common2D.Point = { x: 0, y: 0 };
      let endPt: common2D.Point = { x: 100, y: 100 };

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(startPt, endPt, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.CLAMP);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with linear gradient succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(startPt, endPt, [0xFF0000FF.toInt(), 0xFFFFFFFF.toInt(), 0xFF000000.toInt()], drawing.TileMode.REPEAT);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with 3 colors succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromShaderWithRadialGradientStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_1500
     * @tc.desc   Test createFromShaderEffect with radial gradient shader.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateFromShaderWithRadialGradientStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateFromShaderWithRadialGradientStatic';

      let centerPt: common2D.Point = { x: 50, y: 50 };

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient(centerPt, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.CLAMP);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with radial gradient succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient(centerPt, 100, [0xFF0000FF.toInt(), 0xFFFFFFFF.toInt()], drawing.TileMode.MIRROR);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with radial gradient MIRROR succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromShaderWithComposeShaderStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_1600
     * @tc.desc   Test createFromShaderEffect with compose shader.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateFromShaderWithComposeShaderStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateFromShaderWithComposeShaderStatic';

      try {
        let dstShader = drawing.ShaderEffect.createColorShader(0xFF0000FF.toInt());
        let srcShader = drawing.ShaderEffect.createColorShader(0xFFFF0000.toInt());
        let shaderEffect = drawing.ShaderEffect.createComposeShader(dstShader!, srcShader!, drawing.BlendMode.SRC_OVER);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with compose shader succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let dstShader = drawing.ShaderEffect.createColorShader(0xFF00FF00.toInt());
        let srcShader = drawing.ShaderEffect.createColorShader(0xFFFF0000.toInt());
        let shaderEffect = drawing.ShaderEffect.createComposeShader(dstShader!, srcShader!, drawing.BlendMode.MULTIPLY);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with compose shader MULTIPLY succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterReturnValueValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_1900
     * @tc.desc   Test ImageFilter return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterReturnValueValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterReturnValueValidationStatic';

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.CLAMP);
        expect(typeof imgFilter === 'object').assertTrue();
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurImageFilter return value validated');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let imgFilter = drawing.ImageFilter.createOffsetImageFilter(15, 20, null);
        expect(typeof imgFilter === 'object').assertTrue();
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter return value validated');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createColorShader(0xFF00FF00.toInt());
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        expect(typeof imgFilter === 'object').assertTrue();
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect return value validated');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        let imgFilter = drawing.ImageFilter.createFromColorFilter(colorFilter!, null);
        expect(typeof imgFilter === 'object').assertTrue();
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromColorFilter return value validated');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let imgFilter = drawing.ImageFilter.createFromImage(pixel!);
        expect(typeof imgFilter === 'object').assertTrue();
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromImage return value validated');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterMultipleOperationsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_STATIC_2000
     * @tc.desc   Test multiple ImageFilter operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterMultipleOperationsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterMultipleOperationsStatic';

      try {
        let blurFilter = drawing.ImageFilter.createBlurImageFilter(10, 10, drawing.TileMode.CLAMP);
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(20, 30, blurFilter!);
        let shaderEffect = drawing.ShaderEffect.createColorShader(0xFF00FF00.toInt());
        let shaderFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        let blendFilter = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SRC_OVER, offsetFilter!, shaderFilter!);
        let composeFilter = drawing.ImageFilter.createComposeImageFilter(blendFilter!, offsetFilter!);

        expect(composeFilter !== null && composeFilter !== undefined).assertTrue();
        console.info(msg + ' multiple operations succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
  });
}