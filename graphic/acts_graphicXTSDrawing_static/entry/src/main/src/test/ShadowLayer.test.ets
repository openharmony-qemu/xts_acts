/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { BusinessError } from '@ohos.base';

export default function shadowLayerTest() {
  describe('DrawingTsShadowLayerTest', () => {
    let pixel: image.PixelMap;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADOWLAYER_STATIC_0100
     * @tc.name      : testShadowLayerCreateNormalStatic
     * @tc.desc      : Test for testShadowLayerCreateNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShadowLayerCreateNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateNormalStatic';
      const pen = new drawing.Pen();

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
        console.info(msg + ' create successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let color : common2D.Color = {
          alpha: 128, red: 246, green: 0, blue: 0
        };
        drawing.ShadowLayer.create(50.2, 100.2, 100.1, color);
        console.info(msg + ' create successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ShadowLayer.create(50, -100, -100, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
        console.info(msg + ' create successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADOWLAYER_STATIC_0103
     * @tc.name      : testShadowLayerCreateMultipleCallsStatic
     * @tc.desc      : Test for testShadowLayerCreateMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testShadowLayerCreateMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testShadowLayerCreateMultipleCallsStatic';

      for (let i = 0; i < 20; i++) {
        try {
          const randomRadius = Math.random() * 100;
          const randomOffsetX = Math.random() * 100;
          const randomOffsetY = Math.random() * 100;
          const randomColor: common2D.Color = {
            alpha: Math.floor(Math.random() * 256).toInt(),
            red: Math.floor(Math.random() * 256).toInt(),
            green: Math.floor(Math.random() * 256).toInt(),
            blue: Math.floor(Math.random() * 256).toInt()
          };
          drawing.ShadowLayer.create(randomRadius, randomOffsetX, randomOffsetY, randomColor);
          console.info(`${msg} create successed for iteration ${i}`);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADOWLAYER_STATIC_0104
     * @tc.name      : testShadowLayerCreateBoundaryValueStatic
     * @tc.desc      : Test for testShadowLayerCreateBoundaryValueStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testShadowLayerCreateBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testShadowLayerCreateBoundaryValueStatic';

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: -1, red: 255, green: 0, blue: 255
        });
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 256, red: 255, green: 0, blue: 255
        });
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: -2, green: 0, blue: 255
        });
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: 256, green: 0, blue: 255
        });
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: 255, green: 256, blue: 255
        });
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: 255, green: -1, blue: 255
        });
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: 255, green: 0, blue: -1
        });
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: 255, green: 0, blue: 256
        });
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });


  });
}