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
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';

export default function DrawingImageFilterPart2Test() {
  describe('DrawingImageFilterPart2Test', () => {
    let pixel: image.PixelMap;
    
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })

    /**
     * @tc.name   testImageFilterCreateBlurBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_0100
     * @tc.desc   Test createBlurImageFilter with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateBlurBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateBlurBoundaryValue';
      
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
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(-1, -1, drawing.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter with negative value succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
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
     * @tc.name   testImageFilterCreateBlurAllTileModes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_0200
     * @tc.desc   Test createBlurImageFilter with all TileMode enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateBlurAllTileModes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateBlurAllTileModes';
      
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
     * @tc.name   testImageFilterCreateBlurInvalidTileMode
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_0300
     * @tc.desc   Test createBlurImageFilter with invalid TileMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageFilterCreateBlurInvalidTileMode', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testImageFilterCreateBlurInvalidTileMode';
      
      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, -1 as any);
        console.info(msg + ' createBlurImageFilter with invalid TileMode succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, 100 as any);
        console.info(msg + ' createBlurImageFilter with out-of-range TileMode succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testImageFilterCreateBlurWithCompose
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_0400
     * @tc.desc   Test createBlurImageFilter with compose filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateBlurWithCompose', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateBlurWithCompose';
      
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
     * @tc.name   testImageFilterCreateFromImageFloatRect
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_0500
     * @tc.desc   Test createFromImage with float rect values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateFromImageFloatRect', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateFromImageFloatRect';
      
      let srcRect: common2D.Rect = { left: 10.5, top: 10.3, right: 80.7, bottom: 80.9 };
      let dstRect: common2D.Rect = { left: 200.2, top: 200.4, right: 400.6, bottom: 400.8 };
      
      try {
        let filter = drawing.ImageFilter.createFromImage(pixel, srcRect, dstRect);
        expect(filter !== null && filter !== undefined).assertTrue();
        console.info(msg + ' createFromImage with float rect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromImageNegativeRect
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_0600
     * @tc.desc   Test createFromImage with negative rect values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageFilterCreateFromImageNegativeRect', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testImageFilterCreateFromImageNegativeRect';
      
      let srcRect: common2D.Rect = { left: -10, top: -20, right: 80, bottom: 90 };
      let dstRect: common2D.Rect = { left: -100, top: -200, right: 300, bottom: 400 };
      
      try {
        let filter = drawing.ImageFilter.createFromImage(pixel, srcRect, dstRect);
        expect(filter !== null && filter !== undefined).assertTrue();
        console.info(msg + ' createFromImage with negative rect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromImageZeroRect
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_0700
     * @tc.desc   Test createFromImage with zero rect values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageFilterCreateFromImageZeroRect', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testImageFilterCreateFromImageZeroRect';
      
      let srcRect: common2D.Rect = { left: 0, top: 0, right: 0, bottom: 0 };
      let dstRect: common2D.Rect = { left: 0, top: 0, right: 0, bottom: 0 };
      
      try {
        let filter = drawing.ImageFilter.createFromImage(pixel, srcRect, dstRect);
        expect(filter !== null && filter !== undefined).assertTrue();
        console.info(msg + ' createFromImage with zero rect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateBlendInvalidEnum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_0800
     * @tc.desc   Test createBlendImageFilter with invalid BlendMode enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageFilterCreateBlendInvalidEnum', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testImageFilterCreateBlendInvalidEnum';
      
      let offsetFilter1 = drawing.ImageFilter.createOffsetImageFilter(15, 10, null);
      let offsetFilter2 = drawing.ImageFilter.createOffsetImageFilter(25, 30, null);
      
      try {
        let blendFilter = drawing.ImageFilter.createBlendImageFilter(-1 as any, offsetFilter1, offsetFilter2);
        console.info(msg + ' createBlendImageFilter with -1 succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        let blendFilter = drawing.ImageFilter.createBlendImageFilter(100 as any, offsetFilter1, offsetFilter2);
        console.info(msg + ' createBlendImageFilter with 100 succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
      try {
        let blendFilter = drawing.ImageFilter.createBlendImageFilter(Number.MAX_VALUE as any, offsetFilter1, offsetFilter2);
        console.info(msg + ' createBlendImageFilter with MAX_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendFilter = drawing.ImageFilter.createBlendImageFilter(Number.MIN_VALUE as any, offsetFilter1, offsetFilter2);
        console.info(msg + ' createBlendImageFilter with MIN_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testImageFilterCreateComposeChained
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_1100
     * @tc.desc   Test chained compose of ImageFilters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateComposeChained', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateComposeChained';
      
      try {
        let blurFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 5, drawing.TileMode.CLAMP);
        let blurFilter2 = drawing.ImageFilter.createBlurImageFilter(10, 10, drawing.TileMode.REPEAT);
        let blurFilter3 = drawing.ImageFilter.createBlurImageFilter(15, 15, drawing.TileMode.MIRROR);
        
        let compose1 = drawing.ImageFilter.createComposeImageFilter(blurFilter2, blurFilter1);
        let compose2 = drawing.ImageFilter.createComposeImageFilter(blurFilter3, compose1);
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
        
        let compose1 = drawing.ImageFilter.createComposeImageFilter(blurFilter2, blurFilter1);
        let compose2 = drawing.ImageFilter.createComposeImageFilter(blurFilter3, compose1);
        let compose3 = drawing.ImageFilter.createComposeImageFilter(blurFilter4, compose2);
        expect(compose3 !== null && compose3 !== undefined).assertTrue();
        console.info(msg + ' three-level compose succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateOffsetBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_1200
     * @tc.desc   Test createOffsetImageFilter with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateOffsetBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateOffsetBoundaryValue';
      
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
     * @tc.name   testImageFilterCreateOffsetWithInput
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_1300
     * @tc.desc   Test createOffsetImageFilter with various input filters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateOffsetWithInput', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateOffsetWithInput';
      
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
        let imgFilter = drawing.ImageFilter.createFromColorFilter(colorFilter, null);
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(25, 30, imgFilter);
        expect(offsetFilter !== null && offsetFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter with color filter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createColorShader(0xFF00FF00);
        let shaderFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect);
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(35, 40, shaderFilter);
        expect(offsetFilter !== null && offsetFilter !== undefined).assertTrue();
        console.info(msg + ' createOffsetImageFilter with shader filter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromShaderWithLinearGradient
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_1400
     * @tc.desc   Test createFromShaderEffect with linear gradient shader.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateFromShaderWithLinearGradient', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateFromShaderWithLinearGradient';
      
      let startPt: common2D.Point = { x: 0, y: 0 };
      let endPt: common2D.Point = { x: 100, y: 100 };
      
      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(startPt, endPt, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.CLAMP);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with linear gradient succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(startPt, endPt, [0xFF0000FF, 0xFFFFFFFF, 0xFF000000], drawing.TileMode.REPEAT);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with 3 colors succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromShaderWithRadialGradient
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_1500
     * @tc.desc   Test createFromShaderEffect with radial gradient shader.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateFromShaderWithRadialGradient', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateFromShaderWithRadialGradient';
      
      let centerPt: common2D.Point = { x: 50, y: 50 };
      
      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient(centerPt, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.CLAMP);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with radial gradient succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient(centerPt, 100, [0xFF0000FF, 0xFFFFFFFF], drawing.TileMode.MIRROR);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with radial gradient MIRROR succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromShaderWithComposeShader
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_1600
     * @tc.desc   Test createFromShaderEffect with compose shader.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateFromShaderWithComposeShader', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateFromShaderWithComposeShader';
      
      try {
        let dstShader = drawing.ShaderEffect.createColorShader(0xFF0000FF);
        let srcShader = drawing.ShaderEffect.createColorShader(0xFFFF0000);
        let shaderEffect = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.SRC_OVER);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with compose shader succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let dstShader = drawing.ShaderEffect.createColorShader(0xFF00FF00);
        let srcShader = drawing.ShaderEffect.createColorShader(0xFFFF0000);
        let shaderEffect = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.MULTIPLY);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect);
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromShaderEffect with compose shader MULTIPLY succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterReturnValueValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_1900
     * @tc.desc   Test ImageFilter return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterReturnValueValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testImageFilterReturnValueValidation';
      
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
        let shaderEffect = drawing.ShaderEffect.createColorShader(0xFF00FF00);
        let imgFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect);
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
        let imgFilter = drawing.ImageFilter.createFromColorFilter(colorFilter, null);
        expect(typeof imgFilter === 'object').assertTrue();
        expect(imgFilter !== null && imgFilter !== undefined).assertTrue();
        console.info(msg + ' createFromColorFilter return value validated');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let imgFilter = drawing.ImageFilter.createFromImage(pixel);
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
     * @tc.name   testImageFilterMultipleOperations
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_IMAGEFILTER_2000
     * @tc.desc   Test multiple ImageFilter operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterMultipleOperations', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterMultipleOperations';
      
      try {
        let blurFilter = drawing.ImageFilter.createBlurImageFilter(10, 10, drawing.TileMode.CLAMP);
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(20, 30, blurFilter);
        let shaderEffect = drawing.ShaderEffect.createColorShader(0xFF00FF00);
        let shaderFilter = drawing.ImageFilter.createFromShaderEffect(shaderEffect);
        let blendFilter = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SRC_OVER, offsetFilter, shaderFilter);
        let composeFilter = drawing.ImageFilter.createComposeImageFilter(blendFilter, offsetFilter);
        
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