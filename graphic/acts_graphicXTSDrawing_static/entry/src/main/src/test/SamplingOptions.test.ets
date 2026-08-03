'use static';
/*
 * Copyright (C) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';
import common2D from '@ohos.graphics.common2D';

export default function samplingOptionsTest(): void {
  describe('DrawingTsSamplingOptionsTest', (): void => {
    const DEFAULT = 0;
    let pixel: image.PixelMap | undefined;
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
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
     * @tc.name   testSamplingOptionsConstructorNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SAMPLINGOPTIONS_STATIC_0100
     * @tc.desc   Test for testSamplingOptionsConstructorNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSamplingOptionsConstructorNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testSamplingOptionsConstructorNormalStatic';
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
     * @tc.name   testSamplingOptionsConstructorMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SAMPLINGOPTIONS_STATIC_0103
     * @tc.desc   Test for testSamplingOptionsConstructorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSamplingOptionsConstructorMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      (): void => {
        const msg = 'testSamplingOptionsConstructorMultipleCallsStatic';

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
          try {
            new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
            console.info(`${msg} SamplingOptions with random enum value  succeeded`);
          } catch (e) {
            console.info(`${msg} SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
            expect().assertFail();
          }
        }
      });
    /**
     * @tc.name   testSamplingOptionsConstructorNullParamStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_0100
     * @tc.desc   test SamplingOptions constructor with null parameter. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSamplingOptionsConstructorNullParamStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testSamplingOptionsConstructorNullParamStatic';
      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        console.info(msg + ' SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorUndefinedParamStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_0200
     * @tc.desc   test SamplingOptions constructor with undefined parameter. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSamplingOptionsConstructorUndefinedParamStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const msg = 'testSamplingOptionsConstructorUndefinedParamStatic';
      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        console.info(msg + ' SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorNegativeValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_0700
     * @tc.desc   test SamplingOptions constructor with negative value. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSamplingOptionsConstructorNegativeValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const msg = 'testSamplingOptionsConstructorNegativeValueStatic';
      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        console.info(msg + ' SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        console.info(msg + ' SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testSamplingOptionsConstructorMinValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_1000
     * @tc.desc   test SamplingOptions constructor with min value. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSamplingOptionsConstructorMinValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, (): void => {
      const msg = 'testSamplingOptionsConstructorMinValueStatic';
      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        console.info(msg + ' SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        console.info(msg + ' SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorFloatValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_1100
     * @tc.desc   test SamplingOptions constructor with float value. error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSamplingOptionsConstructorFloatValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testSamplingOptionsConstructorFloatValueStatic';
      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        console.info(msg + ' SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        console.info(msg + ' SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_1200
     * @tc.desc   test SamplingOptions constructor with boundary value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSamplingOptionsConstructorBoundaryValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const msg = 'testSamplingOptionsConstructorBoundaryValueStatic';
      try {
        const samplingOptions0 = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        console.info(msg + ' SamplingOptions succeeded');
        expect(samplingOptions0 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        const samplingOptions1 = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        console.info(msg + ' SamplingOptions succeeded');
        expect(samplingOptions1 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsConstructorAllEnumsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_1300
     * @tc.desc   test SamplingOptions constructor with all enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSamplingOptionsConstructorAllEnumsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const msg = 'testSamplingOptionsConstructorAllEnumsStatic';
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
     * @tc.name   testSamplingOptionsConstructorMultipleTimesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_1400
     * @tc.desc   test SamplingOptions constructor multiple times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSamplingOptionsConstructorMultipleTimesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testSamplingOptionsConstructorMultipleTimesStatic';
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
     * @tc.name   testSamplingOptionsWithDrawImageRectStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_1600
     * @tc.desc   test SamplingOptions with drawImageRect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSamplingOptionsWithDrawImageRectStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (): Promise<void> => {
      const msg = 'testSamplingOptionsWithDrawImageRectStatic';
      try {
        const canvas = new drawing.Canvas(pixel!);
        const samplingOptions = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        const rect: common2D.Rect = {
          left: 0,
          top: 0,
          right: 100,
          bottom: 100
        };
        canvas.drawImageRect(pixel!, rect, samplingOptions);
        console.info(msg + ' drawImageRect with SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsWithDrawImageRectWithSrcStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_1700
     * @tc.desc   test SamplingOptions with drawImageRectWithSrc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSamplingOptionsWithDrawImageRectWithSrcStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const msg = 'testSamplingOptionsWithDrawImageRectWithSrcStatic';
      try {
        const canvas = new drawing.Canvas(pixel!);
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
        canvas.drawImageRectWithSrc(pixel!, srcRect, dstRect, samplingOptions);
        console.info(msg + ' drawImageRectWithSrc with SamplingOptions succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSamplingOptionsMultipleEnumsWithDrawImageStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_1800
     * @tc.desc   test SamplingOptions with multiple enum values in drawImage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSamplingOptionsMultipleEnumsWithDrawImageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const msg = 'testSamplingOptionsMultipleEnumsWithDrawImageStatic';
        try {
          const canvas = new drawing.Canvas(pixel!);
          const samplingOptionsNearest = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
          canvas.drawImage(pixel!, 0, 0, samplingOptionsNearest);
          console.info(msg + ' drawImage with FILTER_MODE_NEAREST succeeded');
          const samplingOptionsLinear = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
          canvas.drawImage(pixel!, 50, 50, samplingOptionsLinear);
          console.info(msg + ' drawImage with FILTER_MODE_LINEAR succeeded');
        } catch (e) {
          console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   testSamplingOptionsDefaultConstructorValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_1900
     * @tc.desc   test SamplingOptions default constructor value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSamplingOptionsDefaultConstructorValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const msg = 'testSamplingOptionsDefaultConstructorValueStatic';
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
     * @tc.name   testSamplingOptionsConstructorNoParamStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_SAMPLINGOPTIONS_STATIC_2000
     * @tc.desc   test SamplingOptions constructor with no parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSamplingOptionsConstructorNoParamStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testSamplingOptionsConstructorNoParamStatic';
      try {
        const samplingOptions = new drawing.SamplingOptions();
        console.info(msg + ' SamplingOptions no param constructor succeeded');
        expect(samplingOptions != null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
  })
}