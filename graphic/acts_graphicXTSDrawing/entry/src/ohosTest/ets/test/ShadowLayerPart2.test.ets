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

export default function shadowLayerPart2Test() {
  describe('DrawingTsShadowLayerPart2Test', () => {
    /**
     * @tc.name   testShadowLayerCreateBlurRadiusBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_0100
     * @tc.desc   test ShadowLayer create with blurRadius boundary values. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateBlurRadiusBoundary', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateBlurRadiusBoundary';
      try {
        drawing.ShadowLayer.create(0, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with blurRadius 0 succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.ShadowLayer.create(-1, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with blurRadius -1 succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.ShadowLayer.create(-0.1, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with blurRadius -0.1 succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testShadowLayerCreateBlurRadiusMinValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_0200
     * @tc.desc   test ShadowLayer create with blurRadius minimum positive value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateBlurRadiusMinValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateBlurRadiusMinValue';
      try {
        let shadowLayer = drawing.ShadowLayer.create(0.01, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with blurRadius 0.01 succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shadowLayer = drawing.ShadowLayer.create(Number.MIN_VALUE, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with blurRadius MIN_VALUE succeeded');
        console.info(msg + ` shadowLayer: ${shadowLayer}`);
        expect(shadowLayer == undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateBlurRadiusMaxValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_0300
     * @tc.desc   test ShadowLayer create with blurRadius max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateBlurRadiusMaxValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateBlurRadiusMaxValue';
      try {
        let shadowLayer = drawing.ShadowLayer.create(1000, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with blurRadius 1000 succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shadowLayer = drawing.ShadowLayer.create(Number.MAX_VALUE, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with blurRadius MAX_VALUE succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateReturnValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_0400
     * @tc.desc   test ShadowLayer create return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateReturnValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateReturnValidation';
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, 100, 100, 0xFF00FF00);
        console.info(msg + ' create with number color succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testShadowLayerCreateOffsetExtremes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_0600
     * @tc.desc   test ShadowLayer create with extreme offset values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateOffsetExtremes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateOffsetExtremes';
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, Number.MAX_VALUE, Number.MAX_VALUE, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with MAX_VALUE offset succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, -Number.MAX_VALUE, -Number.MAX_VALUE, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with negative MAX_VALUE offset succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, Number.MIN_VALUE, Number.MIN_VALUE, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with MIN_VALUE offset succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateColorNumberFormats
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_0700
     * @tc.desc   test ShadowLayer create with different color number formats.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateColorNumberFormats', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateColorNumberFormats';
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, 100, 100, 0x00000000);
        console.info(msg + ' create with color 0x00000000 succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, 100, 100, 0xFFFFFFFF);
        console.info(msg + ' create with color 0xFFFFFFFF succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, 100, 100, 0xFF000000);
        console.info(msg + ' create with color 0xFF000000 succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateNegativeColorNumber
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_0800
     * @tc.desc   test ShadowLayer create with negative color number. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateNegativeColorNumber', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateNegativeColorNumber';
      try {
        drawing.ShadowLayer.create(10, 100, 100, -1);
        console.info(msg + ' create with negative color succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateWithPen
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_0900
     * @tc.desc   test ShadowLayer with Pen joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateWithPen', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateWithPen';
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        let pen = new drawing.Pen();
        pen.setShadowLayer(shadowLayer);
        console.info(msg + ' ShadowLayer with Pen succeeded');
        expect(pen != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateWithBrush
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_1000
     * @tc.desc   test ShadowLayer with Brush joint call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateWithBrush', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateWithBrush';
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        let brush = new drawing.Brush();
        brush.setShadowLayer(shadowLayer);
        console.info(msg + ' ShadowLayer with Brush succeeded');
        expect(brush != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testShadowLayerCreateNaNValues
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_1400
     * @tc.desc   test ShadowLayer create with NaN values. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateNaNValues', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateNaNValues';
      try {
        let shadowLayer = drawing.ShadowLayer.create(NaN, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with NaN blurRadius succeeded');
        console.info(msg + ` 1 shadowLayer: ${shadowLayer}`);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, NaN, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with NaN x succeeded');
        console.info(msg + ` 2 shadowLayer: ${shadowLayer}`);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, 100, NaN, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with NaN y succeeded');
        console.info(msg + ` 3 shadowLayer: ${shadowLayer}`);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateInfinityValues
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_1500
     * @tc.desc   test ShadowLayer create with Infinity values. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateInfinityValues', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateInfinityValues';
      try {
        let shadowLayer = drawing.ShadowLayer.create(Infinity, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with Infinity blurRadius succeeded');
        console.info(msg + ` shadowLayer: ${shadowLayer}`);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        drawing.ShadowLayer.create(-Infinity, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with -Infinity blurRadius succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, Infinity, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with Infinity x succeeded');
        console.info(msg + ` shadowLayer: ${shadowLayer}`);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateMultipleTimesStability
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_1800
     * @tc.desc   test ShadowLayer create multiple times for stability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateMultipleTimesStability', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateMultipleTimesStability';
      try {
        for (let i = 0; i < 100; i++) {
          let shadowLayer = drawing.ShadowLayer.create(10, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
          expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
        }
        console.info(msg + ' 100 create calls succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateZeroOffset
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_1900
     * @tc.desc   test ShadowLayer create with zero offset values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateZeroOffset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateZeroOffset';
      try {
        let shadowLayer = drawing.ShadowLayer.create(10, 0, 0, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with zero offset succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateColorBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_2000
     * @tc.desc   test ShadowLayer create with color boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateColorBoundary', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateColorBoundary';
      try {
        let shadowLayer0 = drawing.ShadowLayer.create(10, 100, 100, {alpha: 0, red: 0, green: 0, blue: 0});
        console.info(msg + ' create with color 0 succeeded');
        expect(shadowLayer0 != null && shadowLayer0 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shadowLayer1 = drawing.ShadowLayer.create(10, 100, 100, {alpha: 255, red: 255, green: 255, blue: 255});
        console.info(msg + ' create with color 255 succeeded');
        expect(shadowLayer1 != null && shadowLayer1 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateFloatBlurRadius
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SHADOWLAYER_2100
     * @tc.desc   test ShadowLayer create with float blurRadius values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateFloatBlurRadius', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateFloatBlurRadius';
      try {
        let shadowLayer = drawing.ShadowLayer.create(0.5, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with float blurRadius 0.5 succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let shadowLayer = drawing.ShadowLayer.create(3.14159, 100, 100, {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00});
        console.info(msg + ' create with float blurRadius 3.14159 succeeded');
        expect(shadowLayer != null && shadowLayer != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

  })
}