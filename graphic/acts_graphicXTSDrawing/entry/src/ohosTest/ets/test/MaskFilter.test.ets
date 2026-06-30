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
import { getEnumCount } from './utils';

export default function maskFilterTest() {
  describe('DrawingTsMaskFilterTest', () => {
    const DEFAULT = 0;
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
     * @tc.name   testCreateBlurMaskFilterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MASKFILTER_0100
     * @tc.desc   Test for testCreateBlurMaskFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBlurMaskFilterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateBlurMaskFilterNormal';

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
        console.info(msg + ' createBlurMaskFilter successed');
      } catch (e) {
        console.info(msg + ` createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 10.5);
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.SOLID, 10.5);
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10.5);
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.INNER, 10.5);
        console.info(msg + ' createBlurMaskFilter successed');
      } catch (e) {
        console.info(msg + ` createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateBlurMaskFilterNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MASKFILTER_0101
     * @tc.desc   Test for testCreateBlurMaskFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateBlurMaskFilterNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateBlurMaskFilterNull';

      try {
        drawing.MaskFilter.createBlurMaskFilter(undefined, 10);
        console.info(msg + ' 1 createBlurMaskFilter(undefined, 10) successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 1 createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, undefined);
        console.info(msg + ' 2 createBlurMaskFilter(drawing.BlurType.OUTER, undefined) successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 2 createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(undefined, 10);
        console.info(msg + ' 3 createBlurMaskFilter(undefined, 10) successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 3 createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, undefined);
        console.info(msg + ' 4 createBlurMaskFilter(drawing.BlurType.OUTER, undefined) successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 4 createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, null);
        console.info(msg + ' 5 createBlurMaskFilter(drawing.BlurType.OUTER, undefined) successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 5 createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.MaskFilter.createBlurMaskFilter(null, 10);
        console.info(msg + ' 6 createBlurMaskFilter(undefined, 10) successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 6 createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testCreateBlurMaskFilterMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MASKFILTER_0103
     * @tc.desc   Test for testCreateBlurMaskFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateBlurMaskFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateBlurMaskFilterMultipleCalls';

      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(Math.random() * (getEnumCount(drawing.BlurType)));
        const randomValue = Math.random() * 10 + 1;

        try {
          drawing.MaskFilter.createBlurMaskFilter(randomEnum, randomValue);
          console.info(`${msg} createBlurMaskFilter with ${randomEnum}, ${randomValue} succeeded`);
        } catch (e) {
          console.info(`${msg} createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testMaskFilterCreateBlurMaskFilterBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MASKFILTER_0200
     * @tc.desc   Test createBlurMaskFilter with boundary sigma values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaskFilterCreateBlurMaskFilterBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMaskFilterCreateBlurMaskFilterBoundaryValue';

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 0.001);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with minimum positive sigma succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, Number.MAX_VALUE);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with MAX_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.SOLID, Number.MIN_VALUE);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with MIN_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.INNER, 10000);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with large value succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 0);
        console.info(msg + ' createBlurMaskFilter with 0 succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, -1);
        console.info(msg + ' createBlurMaskFilter with -1 succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.SOLID, -100);
        console.info(msg + ' createBlurMaskFilter with -100 succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testMaskFilterAllBlurTypes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MASKFILTER_0300
     * @tc.desc   Test createBlurMaskFilter with all BlurType enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaskFilterAllBlurTypes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMaskFilterAllBlurTypes';

      const blurTypes = [
        drawing.BlurType.NORMAL,
        drawing.BlurType.SOLID,
        drawing.BlurType.OUTER,
        drawing.BlurType.INNER
      ];

      for (let blurType of blurTypes) {
        try {
          let maskFilter = drawing.MaskFilter.createBlurMaskFilter(blurType, 10);
          expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
          console.info(msg + ` createBlurMaskFilter with BlurType(${blurType}) succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testMaskFilterInvalidBlurType
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MASKFILTER_0400
     * @tc.desc   Test createBlurMaskFilter with invalid BlurType values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMaskFilterInvalidBlurType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testMaskFilterInvalidBlurType';

      try {
        drawing.MaskFilter.createBlurMaskFilter(-1 as any, 10);
        console.info(msg + ' createBlurMaskFilter with -1 BlurType succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(10 as any, 10);
        console.info(msg + ' createBlurMaskFilter with 10 BlurType succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(100 as any, 10);
        console.info(msg + ' createBlurMaskFilter with 100 BlurType succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(Number.MAX_VALUE as any, 10);
        console.info(msg + ' createBlurMaskFilter with MAX_VALUE BlurType succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` MAX_VALUE errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
      try {
        drawing.MaskFilter.createBlurMaskFilter(Number.MIN_VALUE as any, 10);
        console.info(msg + ' createBlurMaskFilter with MIN_VALUE BlurType succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` MIN_VALUE errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testMaskFilterSigmaFloatPrecision
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MASKFILTER_0900
     * @tc.desc   Test createBlurMaskFilter with float sigma precision.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMaskFilterSigmaFloatPrecision', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testMaskFilterSigmaFloatPrecision';

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 0.000001);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with very small float succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 1.23456789);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with high precision float succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.SOLID, 99.999999);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with large precision float succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.INNER, 0.5);
        expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
        console.info(msg + ' createBlurMaskFilter with 0.5 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMaskFilterDifferentSigmaValues
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MASKFILTER_1000
     * @tc.desc   Test createBlurMaskFilter with different sigma values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaskFilterDifferentSigmaValues', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMaskFilterDifferentSigmaValues';

      let sigmaValues = [1, 2, 5, 10, 20, 50, 100, 0.1, 0.5, 1.5, 2.5, 5.5, 10.5];

      for (let sigma of sigmaValues) {
        try {
          let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, sigma);
          expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
          console.info(msg + ` createBlurMaskFilter with sigma=${sigma} succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testMaskFilterAllBlurTypesWithBoundarySigma
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MASKFILTER_1200
     * @tc.desc   Test all BlurTypes with boundary sigma values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaskFilterAllBlurTypesWithBoundarySigma', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMaskFilterAllBlurTypesWithBoundarySigma';

      const blurTypes = [
        drawing.BlurType.NORMAL,
        drawing.BlurType.SOLID,
        drawing.BlurType.OUTER,
        drawing.BlurType.INNER
      ];

      for (let blurType of blurTypes) {
        try {
          let maskFilter = drawing.MaskFilter.createBlurMaskFilter(blurType, 0.001);
          expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
          console.info(msg + ` BlurType(${blurType}) with minimum sigma succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let blurType of blurTypes) {
        try {
          let maskFilter = drawing.MaskFilter.createBlurMaskFilter(blurType, 1000);
          expect(maskFilter !== null && maskFilter !== undefined).assertTrue();
          console.info(msg + ` BlurType(${blurType}) with large sigma succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }
    });
  })
}