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
import { getEnumCount } from './utils';

export default function samplingOptionsTest() {
  describe('DrawingTsSamplingOptionsTest', () => {
    let pixel: image.PixelMap;
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
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
     * @tc.name   testSamplingOptionsConstructorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SAMPLINGOPTIONS_0100
     * @tc.desc   Test for testSamplingOptionsConstructorNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSamplingOptionsConstructorNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testSamplingOptionsConstructorNormal';
      try {
        new drawing.SamplingOptions();
        console.info(msg + ' SamplingOptions successed');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        console.info(msg + ' SamplingOptions successed');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SAMPLINGOPTIONS_0103
     * @tc.desc   Test for testSamplingOptionsConstructorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSamplingOptionsConstructorMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testSamplingOptionsConstructorMultipleCalls';

      for (let i = 0; i < 20; i++) {
        try {
          new drawing.SamplingOptions();
          console.info(`${msg} SamplingOptions succeeded`);
        } catch (e) {
          console.info(`${msg} SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.FilterMode));
        try {
          new drawing.SamplingOptions(randomEnum);
          console.info(`${msg} SamplingOptions with random enum value ${randomEnum} succeeded`);
        } catch (e) {
          console.info(`${msg} SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testSamplingOptionsConstructorNullParam
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_0100
     * @tc.desc   test SamplingOptions constructor with null parameter. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSamplingOptionsConstructorNullParam', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testSamplingOptionsConstructorNullParam';
      try {
        new drawing.SamplingOptions(null);
        console.info(msg + ' SamplingOptions with null succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorUndefinedParam
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_0200
     * @tc.desc   test SamplingOptions constructor with undefined parameter. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSamplingOptionsConstructorUndefinedParam', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testSamplingOptionsConstructorUndefinedParam';
      try {
        new drawing.SamplingOptions(undefined);
        console.info(msg + ' SamplingOptions with undefined succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorNegativeValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_0700
     * @tc.desc   test SamplingOptions constructor with negative value. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSamplingOptionsConstructorNegativeValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testSamplingOptionsConstructorNegativeValue';
      try {
        new drawing.SamplingOptions(-1);
        console.info(msg + ' SamplingOptions with -1 succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        new drawing.SamplingOptions(-100);
        console.info(msg + ' SamplingOptions with -100 succeeded');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testSamplingOptionsConstructorMinValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_1000
     * @tc.desc   test SamplingOptions constructor with min value. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSamplingOptionsConstructorMinValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testSamplingOptionsConstructorMinValue';
      try {
        new drawing.SamplingOptions(Number.MIN_VALUE);
        console.info(msg + ' SamplingOptions with MIN_VALUE succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        new drawing.SamplingOptions(Number.MAX_VALUE);
        console.info(msg + ' SamplingOptions with MAX_VALUE succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorFloatValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_1100
     * @tc.desc   test SamplingOptions constructor with float value. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSamplingOptionsConstructorFloatValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testSamplingOptionsConstructorFloatValue';
      try {
        new drawing.SamplingOptions(0.5);
        console.info(msg + ' SamplingOptions with 0.5 succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        new drawing.SamplingOptions(1.5);
        console.info(msg + ' SamplingOptions with 1.5 succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_1200
     * @tc.desc   test SamplingOptions constructor with boundary value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSamplingOptionsConstructorBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testSamplingOptionsConstructorBoundaryValue';
      try {
        const samplingOptions0 = new drawing.SamplingOptions(0);
        console.info(msg + ' SamplingOptions with 0 succeeded');
        expect(samplingOptions0 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        const samplingOptions1 = new drawing.SamplingOptions(1);
        console.info(msg + ' SamplingOptions with 1 succeeded');
        expect(samplingOptions1 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorAllEnums
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_1300
     * @tc.desc   test SamplingOptions constructor with all enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSamplingOptionsConstructorAllEnums', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testSamplingOptionsConstructorAllEnums';
      try {
        const samplingOptionsNearest = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        console.info(msg + ' SamplingOptions with FILTER_MODE_NEAREST succeeded');
        expect(samplingOptionsNearest != null).assertTrue();
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        const samplingOptionsLinear = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        console.info(msg + ' SamplingOptions with FILTER_MODE_LINEAR succeeded');
        expect(samplingOptionsLinear != null).assertTrue();
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorMultipleTimes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_1400
     * @tc.desc   test SamplingOptions constructor multiple times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSamplingOptionsConstructorMultipleTimes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testSamplingOptionsConstructorMultipleTimes';
      for (let i = 0; i < 100; i++) {
        try {
          const samplingOptions = new drawing.SamplingOptions();
          console.info(`${msg} SamplingOptions iteration ${i} succeeded`);
          expect(samplingOptions != null).assertTrue();
        } catch (e) {
          console.info(`${msg} SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
          expect().assertFail();
          break;
        }
      }
      for (let i = 0; i < 100; i++) {
        try {
          const samplingOptions = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
          console.info(`${msg} SamplingOptions NEAREST iteration ${i} succeeded`);
          expect(samplingOptions != null).assertTrue();
        } catch (e) {
          console.info(`${msg} SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
          expect().assertFail();
          break;
        }
      }
      for (let i = 0; i < 100; i++) {
        try {
          const samplingOptions = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
          console.info(`${msg} SamplingOptions LINEAR iteration ${i} succeeded`);
          expect(samplingOptions != null).assertTrue();
        } catch (e) {
          console.info(`${msg} SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
          expect().assertFail();
          break;
        }
      }
    });

    /**
     * @tc.name   testSamplingOptionsWithDrawImageRect
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_1600
     * @tc.desc   test SamplingOptions with drawImageRect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSamplingOptionsWithDrawImageRect', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async () => {
      const msg = 'testSamplingOptionsWithDrawImageRect';
      try {
        const canvas = new drawing.Canvas(pixel);
        const samplingOptions = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        const rect: common2D.Rect = {
          left: 0,
          top: 0,
          right: 100,
          bottom: 100
        };
        canvas.drawImageRect(pixel, rect, samplingOptions);
        console.info(msg + ' drawImageRect with SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsWithDrawImageRectWithSrc
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_1700
     * @tc.desc   test SamplingOptions with drawImageRectWithSrc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSamplingOptionsWithDrawImageRectWithSrc', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async () => {
      const msg = 'testSamplingOptionsWithDrawImageRectWithSrc';
      try {
        const canvas = new drawing.Canvas(pixel);
        const samplingOptions = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        const srcRect: common2D.Rect = {
          left: 0,
          top: 0,
          right: 50,
          bottom: 50
        };
        const dstRect: common2D.Rect = {
          left: 0,
          top: 0,
          right: 100,
          bottom: 100
        };
        canvas.drawImageRectWithSrc(pixel, srcRect, dstRect, samplingOptions);
        console.info(msg + ' drawImageRectWithSrc with SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsMultipleEnumsWithDrawImage
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_1800
     * @tc.desc   test SamplingOptions with multiple enum values in drawImage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSamplingOptionsMultipleEnumsWithDrawImage', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async () => {
      const msg = 'testSamplingOptionsMultipleEnumsWithDrawImage';
      try {
        const canvas = new drawing.Canvas(pixel);
        const samplingOptionsNearest = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        canvas.drawImage(pixel, 0, 0, samplingOptionsNearest);
        console.info(msg + ' drawImage with FILTER_MODE_NEAREST succeeded');
        const samplingOptionsLinear = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        canvas.drawImage(pixel, 50, 50, samplingOptionsLinear);
        console.info(msg + ' drawImage with FILTER_MODE_LINEAR succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsDefaultConstructorValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_1900
     * @tc.desc   test SamplingOptions default constructor value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSamplingOptionsDefaultConstructorValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testSamplingOptionsDefaultConstructorValue';
      try {
        const samplingOptions = new drawing.SamplingOptions();
        console.info(msg + ' SamplingOptions default constructor succeeded');
        expect(samplingOptions != null).assertTrue();
        const samplingOptionsNearest = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(samplingOptionsNearest != null).assertTrue();
        console.info(msg + ' Both constructors succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorNoParam
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_2000
     * @tc.desc   test SamplingOptions constructor with no parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSamplingOptionsConstructorNoParam', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testSamplingOptionsConstructorNoParam';
      try {
        const samplingOptions = new drawing.SamplingOptions();
        console.info(msg + ' SamplingOptions no param constructor succeeded');
        expect(samplingOptions != null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsInfinityParam
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_2500
     * @tc.desc   test SamplingOptions constructor with Infinity parameter. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSamplingOptionsInfinityParam', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testSamplingOptionsInfinityParam';
      try {
        new drawing.SamplingOptions(Infinity);
        console.info(msg + ' SamplingOptions with Infinity succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        new drawing.SamplingOptions(-Infinity);
        console.info(msg + ' SamplingOptions with -Infinity succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
  })
}