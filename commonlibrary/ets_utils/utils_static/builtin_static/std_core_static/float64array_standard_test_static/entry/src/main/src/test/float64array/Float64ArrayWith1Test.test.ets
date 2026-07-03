'use static'
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float64ArrayWith1Test(): void {
  describe('Float64ArrayWith1Test', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30)
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_0100
     * @tc.name testFloat64ArrayWith1001
     * @tc.desc Verify with(0, 10.0) with [0.5, 1.5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(pointFive, onePointFive);
      const r = arr.with(0, tenPointZero);
      const actVal1 = r.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_0200
     * @tc.name testFloat64ArrayWith1002
     * @tc.desc Verify with(0, 10.0) with [-32768, -128] returns Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      const r = arr.with(0, tenPointZero);
      let isF64: boolean = false;
      let o: Object = r as Object;
      if (o instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_0300
     * @tc.name testFloat64ArrayWith1003
     * @tc.desc Verify with returns copy while preserving original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const r = arr.with(0, tenPointZero);
      const actVal2 = r.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal2).assertEqual(expectVal);
      const actVal3 = arr.$_get(0);
      const expectVal2 = int32MinValue;
      expect(actVal3).assertEqual(expectVal2);
      const actVal4 = arr.$_get(1);
      const expectVal3 = negativeOne;
      expect(actVal4).assertEqual(expectVal3);
      const actVal5 = arr.$_get(2);
      const expectVal4 = zeroValue;
      expect(actVal5).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_0400
     * @tc.name testFloat64ArrayWith1004
     * @tc.desc Verify with returns copy with independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const r = arr.with(0, tenPointZero);
      let sameBuffer: boolean = false;
      let originalBuffer: Object = arr.buffer as Object;
      let copiedBuffer: Object = r.buffer as Object;
      sameBuffer = originalBuffer === copiedBuffer;
      const expectVal = false;
      expect(sameBuffer).assertEqual(expectVal);
      const actVal6 = r.$_get(0);
      const expectVal2 = tenPointZero;
      expect(actVal6).assertEqual(expectVal2);
      const actVal7 = arr.$_get(0);
      const expectVal3 = pointOne;
      expect(actVal7).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_0500
     * @tc.name testFloat64ArrayWith1005
     * @tc.desc Verify with(0, 100.0) with [0.5, 1.5, 0.25] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const hundredPointzero: number = 100.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const r = arr.with(0, hundredPointzero);
      const actVal8 = r.$_get(0);
      const expectVal = hundredPointzero;
      expect(actVal8).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_0600
     * @tc.name testFloat64ArrayWith1006
     * @tc.desc Verify with(1, 200.0) with [-32768, -128, 0] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const num200Pointzero: number = 200.0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const r = arr.with(1, num200Pointzero);
      const actVal9 = r.$_get(1);
      const expectVal = num200Pointzero;
      expect(actVal9).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_0700
     * @tc.name testFloat64ArrayWith1007
     * @tc.desc Verify with(2, 300.0) with [-2147483648, -1, 0] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const num300Pointzero: number = 300.0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const r = arr.with(2, num300Pointzero);
      const actVal10 = r.$_get(2);
      const expectVal = num300Pointzero;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_0800
     * @tc.name testFloat64ArrayWith1008
     * @tc.desc Verify with out of bounds index 3 throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      try {
        arr.with(3, num999Pointzero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_0900
     * @tc.name testFloat64ArrayWith1009
     * @tc.desc Verify with(-1, 300.0) with [-32768, -128, 0] exception handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const num300Pointzero: number = 300.0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      try {
        arr.with(-1, num300Pointzero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_1000
     * @tc.name testFloat64ArrayWith1010
     * @tc.desc Verify with large positive index throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(pointFive, onePointFive);
      try {
        arr.with(1000000, num999Pointzero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_1100
     * @tc.name testFloat64ArrayWith1011
     * @tc.desc Verify with large negative index throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      try {
        arr.with(-1000000, num999Pointzero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_1200
     * @tc.name testFloat64ArrayWith1012
     * @tc.desc Verify with(2, 200.0) with [0.1, 9007199254740991, 0, 3.141592653589793] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const num200Pointzero: number = 200.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      const r = arr.with(2, num200Pointzero);
      const actVal11 = r.$_get(2);
      const expectVal = num200Pointzero;
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_1300
     * @tc.name testFloat64ArrayWith1013
     * @tc.desc Verify with(0, 1.0) with [1.5, 1.5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(onePointFive, onePointFive);
      const r = arr.with(0, onePointZero);
      const actVal12 = r.$_get(0);
      const expectVal = onePointZero;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_1400
     * @tc.name testFloat64ArrayWith1014
     * @tc.desc Verify with(0, -1.0) with [-128, -128] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const negonePointzero: number = -1.0;
      const arr = Float64Array.of(int8MinValue, int8MinValue);
      const r = arr.with(0, negonePointzero);
      const actVal13 = r.$_get(0);
      const expectVal = negonePointzero;
      expect(actVal13).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_1500
     * @tc.name testFloat64ArrayWith1015
     * @tc.desc Verify with(0, 0.0) with [-2147483648, -1] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroPointZero: number = 0.0;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const r = arr.with(0, zeroPointZero);
      const actVal14 = r.$_get(0);
      const expectVal = zeroValue;
      expect(actVal14).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_1600
     * @tc.name testFloat64ArrayWith1016
     * @tc.desc Verify with(0, -0.0) with [0.1, 9007199254740991] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const r = arr.with(0, negativeZero);
      const actVal15 = r.$_get(0);
      const expectVal = negativeZero;
      expect(actVal15).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_1700
     * @tc.name testFloat64ArrayWith1017
     * @tc.desc Verify with(0, 1.7976931348623157e+308) with [0.5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(pointFive);
      const r = arr.with(0, doubleMaxValue);
      const actVal16 = r.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal16).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_1800
     * @tc.name testFloat64ArrayWith1018
     * @tc.desc Verify with(0, 5e-324) with [-32768] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const doubleMinValue: number = 5e-324;
      const arr = Float64Array.of(int16MinValue);
      const r = arr.with(0, doubleMinValue);
      const actVal17 = r.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal17).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_1900
     * @tc.name testFloat64ArrayWith1019
     * @tc.desc Verify with(0, infinity) with [-2147483648] element values and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(int32MinValue);
      const r = arr.with(0, positiveInfinity);
      const actVal18 = r.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_2000
     * @tc.name testFloat64ArrayWith1020
     * @tc.desc Verify with(0, -infinity) with [0.1] element values and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(pointOne);
      const r = arr.with(0, negativeInfinity);
      const actVal19 = r.$_get(0);
      const expectVal = negativeInfinity;
      expect(actVal19).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_2100
     * @tc.name testFloat64ArrayWith1021
     * @tc.desc Verify with(0, nan) with [0.5] element values and not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointFive);
      const r = arr.with(0, nanValue);
      const actVal20 = Number.isNaN(r.$_get(0));
      const expectVal = true;
      expect(actVal20).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_2200
     * @tc.name testFloat64ArrayWith1022
     * @tc.desc Verify with(0, 1.0e+308) with [-32768] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const sciValue10e308: number = 1.0e+308;
      const arr = Float64Array.of(int16MinValue);
      const r = arr.with(0, sciValue10e308);
      const actVal21 = r.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal21).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_2300
     * @tc.name testFloat64ArrayWith1023
     * @tc.desc Verify with(0, 1.0e-308) with [-2147483648] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const sciValue10e308: number = 1.0e-308;
      const arr = Float64Array.of(int32MinValue);
      const r = arr.with(0, sciValue10e308);
      const actVal22 = r.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal22).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_2400
     * @tc.name testFloat64ArrayWith1024
     * @tc.desc Verify with(0, 2147483647.0) with [0.1] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const num2147483647Pointzero: number = 2147483647.0;
      const arr = Float64Array.of(pointOne);
      const r = arr.with(0, num2147483647Pointzero);
      const actVal23 = r.$_get(0);
      const expectVal = num2147483647Pointzero;
      expect(actVal23).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_2500
     * @tc.name testFloat64ArrayWith1025
     * @tc.desc Verify with(0, -2147483648.0) with [0.5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const negnum2147483648Pointzero: number = -2147483648.0;
      const arr = Float64Array.of(pointFive);
      const r = arr.with(0, negnum2147483648Pointzero);
      const actVal24 = r.$_get(0);
      const expectVal = negnum2147483648Pointzero;
      expect(actVal24).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_2600
     * @tc.name testFloat64ArrayWith1026
     * @tc.desc Verify with(0, 9007199254740991.0) with [-32768] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const arr = Float64Array.of(int16MinValue);
      const r = arr.with(0, maxSafeIntegerValue);
      const actVal25 = r.$_get(0);
      const expectVal = maxSafeIntegerValue;
      expect(actVal25).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_2700
     * @tc.name testFloat64ArrayWith1027
     * @tc.desc Verify with(0, -9007199254740991.0) with [-2147483648] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const arr = Float64Array.of(int32MinValue);
      const r = arr.with(0, negativeMaxSafeIntegerValue);
      const actVal26 = r.$_get(0);
      const expectVal = negativeMaxSafeIntegerValue;
      expect(actVal26).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_2800
     * @tc.name testFloat64ArrayWith1028
     * @tc.desc Verify with(0, 0.1) with [0.1] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = Float64Array.of(pointOne);
      const r = arr.with(0, pointOne);
      const actVal27 = r.$_get(0);
      const expectVal = pointOne;
      expect(actVal27).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_2900
     * @tc.name testFloat64ArrayWith1029
     * @tc.desc Verify with(0, -999999.99) with [0.5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const negnum999999Pointninenine: number = -999999.99;
      const arr = Float64Array.of(pointFive);
      const r = arr.with(0, negnum999999Pointninenine);
      const actVal28 = r.$_get(0);
      const expectVal = negnum999999Pointninenine;
      expect(actVal28).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_3000
     * @tc.name testFloat64ArrayWith1030
     * @tc.desc Verify with(0, 1.7976931348623158e+308) with [-32768] element values and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const doubleMaxValueAlt: number = 1.7976931348623158e+308;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(int16MinValue);
      const r = arr.with(0, doubleMaxValueAlt);
      const actVal29 = r.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal29).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_3100
     * @tc.name testFloat64ArrayWith1031
     * @tc.desc Verify with(0, 16.0) with [-2147483648] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const sixteenPointzero: number = 16.0;
      const arr = Float64Array.of(int32MinValue);
      const r = arr.with(0, sixteenPointzero);
      const actVal30 = r.$_get(0);
      const expectVal = sixteenPointzero;
      expect(actVal30).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_3200
     * @tc.name testFloat64ArrayWith1032
     * @tc.desc Verify with(0, 8.0) with [0.1] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const eightPointZero: number = 8.0;
      const arr = Float64Array.of(pointOne);
      const r = arr.with(0, eightPointZero);
      const actVal31 = r.$_get(0);
      const expectVal = eightPointZero;
      expect(actVal31).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_3300
     * @tc.name testFloat64ArrayWith1033
     * @tc.desc Verify with(0, 10.0) with [0.5, 1.5] returns Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(pointFive, onePointFive);
      const r = arr.with(0, tenPointZero);
      let b: boolean = false;
      let o: Object = r as Object;
      if (o instanceof Float64Array) {
        b = true;
      }
      const expectVal = true;
      expect(b).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_3400
     * @tc.name testFloat64ArrayWith1034
     * @tc.desc Verify with(0, 10.0) with [-2147483648, -1] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const r = arr.with(0, tenPointZero);
      let s: boolean = false;
      let o1: Object = arr as Object;
      let o2: Object = r as Object;
      s = o1 === o2;
      const expectVal = false;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_3500
     * @tc.name testFloat64ArrayWith1035
     * @tc.desc Verify with(0, 10.0) with [0.1, 9007199254740991] shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const r = arr.with(0, tenPointZero);
      let s: boolean = false;
      let o1: Object = arr.buffer as Object;
      let o2: Object = r.buffer as Object;
      s = o1 === o2;
      const expectVal = false;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_3600
     * @tc.name testFloat64ArrayWith1036
     * @tc.desc Verify with(1, 999.0) with [0.5, 1.5, 0.25] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      arr.with(1, num999Pointzero);
      const actVal32 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal32).assertEqual(expectVal);
      const actVal33 = arr.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal33).assertEqual(expectVal2);
      const actVal34 = arr.$_get(2);
      const expectVal3 = pointTwoFive;
      expect(actVal34).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_3700
     * @tc.name testFloat64ArrayWith1037
     * @tc.desc Verify with(0, 1.7976931348623157e+308) with [-1, -1] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(negativeOne, negativeOne);
      const r = arr.with(0, doubleMaxValue);
      const actVal35 = r.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal35).assertEqual(expectVal);
      const actVal36 = r.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal36).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_3800
     * @tc.name testFloat64ArrayWith1038
     * @tc.desc Verify with(0, 5e-324) with [9007199254740991, 9007199254740991] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const doubleMinValue: number = 5e-324;
      const arr = Float64Array.of(maxSafeInteger, maxSafeInteger);
      const r = arr.with(0, doubleMinValue);
      const actVal37 = r.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal37).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_3900
     * @tc.name testFloat64ArrayWith1039
     * @tc.desc Verify with(0, nan) with [1.5, 1.5] element values and not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const nanValue: number = NaN;
      const arr = Float64Array.of(onePointFive, onePointFive);
      const r = arr.with(0, nanValue);
      const actVal38 = Number.isNaN(r.$_get(0));
      const expectVal = true;
      expect(actVal38).assertEqual(expectVal);
      const actVal39 = r.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal39).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_4000
     * @tc.name testFloat64ArrayWith1040
     * @tc.desc Verify with(0, infinity) with [-128, -128] element values and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(int8MinValue, int8MinValue);
      const r = arr.with(0, positiveInfinity);
      const actVal40 = r.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal40).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_4100
     * @tc.name testFloat64ArrayWith1041
     * @tc.desc Verify with(1, 1.7976931348623157e+308) with [-1, -1] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(negativeOne, negativeOne);
      const r = arr.with(1, doubleMaxValue);
      const actVal41 = r.$_get(0);
      const expectVal = negativeOne;
      expect(actVal41).assertEqual(expectVal);
      const actVal42 = r.$_get(1);
      const expectVal2 = doubleMaxValue;
      expect(actVal42).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_4200
     * @tc.name testFloat64ArrayWith1042
     * @tc.desc Verify with(1, 5e-324) with [9007199254740991, 9007199254740991] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const doubleMinValue: number = 5e-324;
      const arr = Float64Array.of(maxSafeInteger, maxSafeInteger);
      const r = arr.with(1, doubleMinValue);
      const actVal43 = r.$_get(1);
      const expectVal = doubleMinValue;
      expect(actVal43).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_4300
     * @tc.name testFloat64ArrayWith1043
     * @tc.desc Verify with(1, nan) with [1.5, 1.5] element values and not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const nanValue: number = NaN;
      const arr = Float64Array.of(onePointFive, onePointFive);
      const r = arr.with(1, nanValue);
      const actVal44 = Number.isNaN(r.$_get(1));
      const expectVal = true;
      expect(actVal44).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_4400
     * @tc.name testFloat64ArrayWith1044
     * @tc.desc Verify with stores MAX_VALUE at valid index and preserves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(int8MinValue, int8MinValue);
      const r = arr.with(1, doubleMaxValue);
      const actVal45 = r.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal45).assertEqual(expectVal);
      const actVal46 = r.$_get(1);
      const expectVal2 = doubleMaxValue;
      expect(actVal46).assertEqual(expectVal2);
      const actVal47 = arr.$_get(1);
      const expectVal3 = int8MinValue;
      expect(actVal47).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_4500
     * @tc.name testFloat64ArrayWith1045
     * @tc.desc Verify with stores MIN_VALUE at valid index and preserves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const doubleMinValue: number = 5e-324;
      const arr = Float64Array.of(negativeOne, negativeOne);
      const r = arr.with(1, doubleMinValue);
      const actVal48 = r.$_get(0);
      const expectVal = negativeOne;
      expect(actVal48).assertEqual(expectVal);
      const actVal49 = r.$_get(1);
      const expectVal2 = doubleMinValue;
      expect(actVal49).assertEqual(expectVal2);
      const actVal50 = arr.$_get(1);
      const expectVal3 = negativeOne;
      expect(actVal50).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_4600
     * @tc.name testFloat64ArrayWith1046
     * @tc.desc Verify with stores NaN at valid index and preserves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const nanValue: number = NaN;
      const arr = Float64Array.of(maxSafeInteger, maxSafeInteger);
      const r = arr.with(1, nanValue);
      const actVal51 = Number.isNaN(r.$_get(1));
      const expectVal = true;
      expect(actVal51).assertEqual(expectVal);
      const actVal52 = arr.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal52).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_4700
     * @tc.name testFloat64ArrayWith1047
     * @tc.desc Verify with stores -Infinity at valid index and preserves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(onePointFive, onePointFive);
      const r = arr.with(1, negativeInfinity);
      const actVal53 = r.$_get(0);
      const expectVal = onePointFive;
      expect(actVal53).assertEqual(expectVal);
      const actVal54 = r.$_get(1);
      const expectVal2 = negativeInfinity;
      expect(actVal54).assertEqual(expectVal2);
      const actVal55 = arr.$_get(1);
      const expectVal3 = onePointFive;
      expect(actVal55).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_4800
     * @tc.name testFloat64ArrayWith1048
     * @tc.desc Verify with stores -0.0 at valid index and preserves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(int8MinValue, int8MinValue);
      const r = arr.with(1, negativeZero);
      const actVal56 = r.$_get(1);
      const expectVal = negativeZero;
      expect(actVal56).assertEqual(expectVal);
      const actVal57 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal57).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_4900
     * @tc.name testFloat64ArrayWith1049
     * @tc.desc Verify with(0, -0.0) with [-1, -1] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(negativeOne, negativeOne);
      const r = arr.with(0, negativeZero);
      const actVal58 = r.$_get(0);
      const expectVal = negativeZero;
      expect(actVal58).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_5000
     * @tc.name testFloat64ArrayWith1050
     * @tc.desc Verify with(0, 1.0e+308) with [9007199254740991, 9007199254740991] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const sciValue10e308: number = 1.0e+308;
      const arr = Float64Array.of(maxSafeInteger, maxSafeInteger);
      const r = arr.with(0, sciValue10e308);
      const actVal59 = r.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal59).assertEqual(expectVal);
      const actVal60 = r.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal60).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_5100
     * @tc.name testFloat64ArrayWith1051
     * @tc.desc Verify with(1, 1.0e-308) with [1.5, 1.5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const sciValue10e308: number = 1.0e-308;
      const arr = Float64Array.of(onePointFive, onePointFive);
      const r = arr.with(1, sciValue10e308);
      const actVal61 = r.$_get(1);
      const expectVal = sciValue10e308;
      expect(actVal61).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_5200
     * @tc.name testFloat64ArrayWith1052
     * @tc.desc Verify with(0, 10.0) with 0 elements exception handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const arr = new Float64Array(0);
      try {
        arr.with(0, tenPointZero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_5300
     * @tc.name testFloat64ArrayWith1053
     * @tc.desc Verify with(0, 100.0) with [-32768] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const hundredPointzero: number = 100.0;
      const oneValue: number = 1;
      const arr = Float64Array.of(int16MinValue);
      const r = arr.with(0, hundredPointzero);
      const actVal62 = r.$_get(0);
      const expectVal = hundredPointzero;
      expect(actVal62).assertEqual(expectVal);
      expect(r.length).assertEqual(oneValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_5400
     * @tc.name testFloat64ArrayWith1054
     * @tc.desc Verify with(1, 100.0) with [-2147483648] exception handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const hundredPointzero: number = 100.0;
      const arr = Float64Array.of(int32MinValue);
      try {
        arr.with(1, hundredPointzero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_5500
     * @tc.name testFloat64ArrayWith1055
     * @tc.desc Verify with(2, 999.0) with [-32768, -128, 0, 127, 32767] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const r = arr.with(2, num999Pointzero);
      const actVal63 = r.$_get(2);
      const expectVal = num999Pointzero;
      expect(actVal63).assertEqual(expectVal);
      const actVal64 = r.$_get(0);
      const expectVal2 = int16MinValue;
      expect(actVal64).assertEqual(expectVal2);
      const actVal65 = r.$_get(4);
      const expectVal3 = int16MaxValue;
      expect(actVal65).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_5600
     * @tc.name testFloat64ArrayWith1056
     * @tc.desc Verify with(0, 1.0) with [0.1] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(pointOne);
      const r = arr.with(0, onePointZero);
      const actVal66 = r.$_get(0);
      const expectVal = onePointZero;
      expect(actVal66).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_5700
     * @tc.name testFloat64ArrayWith1057
     * @tc.desc Verify with(0, 2.0) with [0.5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(pointFive);
      const r = arr.with(0, twoPointZero);
      const actVal67 = r.$_get(0);
      const expectVal = twoPointZero;
      expect(actVal67).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_5800
     * @tc.name testFloat64ArrayWith1058
     * @tc.desc Verify with(0, sum) with [-32768] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      const sum: double = 0.1 + 0.2;
      const r = arr.with(0, sum);
      const actVal68 = r.$_get(0);
      const expectVal = sum;
      expect(actVal68).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_5900
     * @tc.name testFloat64ArrayWith1059
     * @tc.desc Verify with value -0.0 replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(int32MinValue);
      const r = arr.with(0, negativeZero);
      const actVal69 = r.$_get(0);
      const expectVal = negativeZero;
      expect(actVal69).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_6000
     * @tc.name testFloat64ArrayWith1060
     * @tc.desc Verify with value MAX_VALUE replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const numberMaxValue: number = Number.MAX_VALUE;
      const arr = Float64Array.of(pointOne);
      const r = arr.with(0, numberMaxValue);
      const actVal70 = r.$_get(0);
      const expectVal = numberMaxValue;
      expect(actVal70).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_6100
     * @tc.name testFloat64ArrayWith1061
     * @tc.desc Verify with(2, 999.0) with [0.5, 1.5, 0.25, 0.125, 0.0625] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      arr.with(2, num999Pointzero);
      const actVal71 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal71).assertEqual(expectVal);
      const actVal72 = arr.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal72).assertEqual(expectVal2);
      const actVal73 = arr.$_get(2);
      const expectVal3 = pointTwoFive;
      expect(actVal73).assertEqual(expectVal3);
      const actVal74 = arr.$_get(3);
      const expectVal4 = pointOneTwoFive;
      expect(actVal74).assertEqual(expectVal4);
      const actVal75 = arr.$_get(4);
      const expectVal5 = pointZeroSixTwoFive;
      expect(actVal75).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_6200
     * @tc.name testFloat64ArrayWith1062
     * @tc.desc Verify with(0, 100.0) with [-32768, -128] byteLength and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const hundredPointzero: number = 100.0;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      const ol: int = arr.length;
      const obl: int = arr.byteLength;
      arr.with(0, hundredPointzero);
      expect(arr.length).assertEqual(ol);
      expect(arr.byteLength).assertEqual(obl);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_6300
     * @tc.name testFloat64ArrayWith1063
     * @tc.desc Verify with(0, 100.0) with [-2147483648, -1] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const hundredPointzero: number = 100.0;
      const num200Pointzero: number = 200.0;
      const num300Pointzero: number = 300.0;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      arr.with(0, hundredPointzero);
      arr.with(1, num200Pointzero);
      arr.with(0, num300Pointzero);
      const actVal76 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal76).assertEqual(expectVal);
      const actVal77 = arr.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal77).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_6400
     * @tc.name testFloat64ArrayWith1064
     * @tc.desc Verify with(0, 100.0) with [0.1, 9007199254740991] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const hundredPointzero: number = 100.0;
      const num200Pointzero: number = 200.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const r1 = arr.with(0, hundredPointzero);
      const r2 = r1.with(1, num200Pointzero);
      const actVal78 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal78).assertEqual(expectVal);
      const actVal79 = r1.$_get(0);
      const expectVal2 = hundredPointzero;
      expect(actVal79).assertEqual(expectVal2);
      const actVal80 = r2.$_get(1);
      const expectVal3 = num200Pointzero;
      expect(actVal80).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_6500
     * @tc.name testFloat64ArrayWith1065
     * @tc.desc Verify with(0, -infinity) with [0.5, 1.5, 0.25] element values and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const r = arr.with(0, negativeInfinity);
      const actVal81 = r.$_get(1);
      const expectVal = onePointFive;
      expect(actVal81).assertEqual(expectVal);
      const actVal82 = r.$_get(2);
      const expectVal2 = pointTwoFive;
      expect(actVal82).assertEqual(expectVal2);
      const actVal83 = r.$_get(0);
      const expectVal3 = negativeInfinity;
      expect(actVal83).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_6600
     * @tc.name testFloat64ArrayWith1066
     * @tc.desc Verify with(1, 100.0) with [-32768, -128] element values and not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const hundredPointzero: number = 100.0;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      const r = arr.with(1, hundredPointzero);
      const actVal84 = Number.isNaN(arr.$_get(0));
      const expectVal = false;
      expect(actVal84).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_6700
     * @tc.name testFloat64ArrayWith1067
     * @tc.desc Verify with(2, 42.0) with 5 elements element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      const r = arr.with(2, fillValue42);
      const actVal85 = r.$_get(2);
      const expectVal = fillValue42;
      expect(actVal85).assertEqual(expectVal);
      const actVal86 = r.$_get(0);
      const expectVal2 = zeroPointZero;
      expect(actVal86).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_6800
     * @tc.name testFloat64ArrayWith1068
     * @tc.desc Verify with(1, 99.0) with [0, 0, 0] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fillValue99: number = 99.0;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const r = arr.with(1, fillValue99);
      const actVal87 = r.$_get(0);
      const expectVal = zeroValue;
      expect(actVal87).assertEqual(expectVal);
      const actVal88 = r.$_get(1);
      const expectVal2 = fillValue99;
      expect(actVal88).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_6900
     * @tc.name testFloat64ArrayWith1069
     * @tc.desc Verify with(1, 42.0) with [0.5, 1.5, 0.25] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const fillValue42: number = 42.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const r = arr.with(1, fillValue42);
      const actVal89 = r.$_get(0);
      const expectVal = pointFive;
      expect(actVal89).assertEqual(expectVal);
      const actVal90 = r.$_get(1);
      const expectVal2 = fillValue42;
      expect(actVal90).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_7000
     * @tc.name testFloat64ArrayWith1070
     * @tc.desc Verify with MAX_VALUE on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(pointOne);
      const r = arr.with(0, doubleMaxValue);
      const actVal91 = r.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal91).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_7100
     * @tc.name testFloat64ArrayWith1071
     * @tc.desc Verify with MIN_VALUE on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const doubleMinValue: number = 5e-324;
      const arr = Float64Array.of(pointFive);
      const r = arr.with(0, doubleMinValue);
      const actVal92 = r.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal92).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_7200
     * @tc.name testFloat64ArrayWith1072
     * @tc.desc Verify with NaN on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const nanValue: number = NaN;
      const arr = Float64Array.of(int16MinValue);
      const r = arr.with(0, nanValue);
      const actVal93 = Number.isNaN(r.$_get(0));
      const expectVal = true;
      expect(actVal93).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_7300
     * @tc.name testFloat64ArrayWith1073
     * @tc.desc Verify with -0.0 on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const negativeZero: number = -0.0;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(pointFive);
      const r = arr.with(0, negativeZero);
      const actVal94 = r.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal94).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_7400
     * @tc.name testFloat64ArrayWith1074
     * @tc.desc Verify with(0, 100.0) with [-32768, -128, 0] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const hundredPointzero: number = 100.0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const r = arr.with(0, hundredPointzero);
      const actVal95 = r.$_get(0);
      const expectVal = hundredPointzero;
      expect(actVal95).assertEqual(expectVal);
      const actVal96 = r.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal96).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_7500
     * @tc.name testFloat64ArrayWith1075
     * @tc.desc Verify with(1, 200.0) with [-2147483648, -1, 0] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const num200Pointzero: number = 200.0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const r = arr.with(1, num200Pointzero);
      const actVal97 = r.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal97).assertEqual(expectVal);
      const actVal98 = r.$_get(1);
      const expectVal2 = num200Pointzero;
      expect(actVal98).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_7600
     * @tc.name testFloat64ArrayWith1076
     * @tc.desc Verify with(2, 300.0) with [0.1, 9007199254740991, 0] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const num300Pointzero: number = 300.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const r = arr.with(2, num300Pointzero);
      const actVal99 = r.$_get(0);
      const expectVal = pointOne;
      expect(actVal99).assertEqual(expectVal);
      const actVal100 = r.$_get(2);
      const expectVal2 = num300Pointzero;
      expect(actVal100).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_7700
     * @tc.name testFloat64ArrayWith1077
     * @tc.desc Verify with(2, 999.0) array[5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const r = arr.with(2, num999Pointzero);
      const actVal101 = r.$_get(2);
      const expectVal = num999Pointzero;
      expect(actVal101).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_7800
     * @tc.name testFloat64ArrayWith1078
     * @tc.desc Verify five element array valid middle replacement preserves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const r = arr.with(3, num999Pointzero);
      const actVal102 = r.$_get(3);
      const expectVal = num999Pointzero;
      expect(actVal102).assertEqual(expectVal);
      const actVal103 = r.$_get(4);
      const expectVal2 = int32MaxValue;
      expect(actVal103).assertEqual(expectVal2);
      const actVal104 = arr.$_get(3);
      const expectVal3 = oneValue;
      expect(actVal104).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_7900
     * @tc.name testFloat64ArrayWith1079
     * @tc.desc Verify with double precision variable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const thirtyValue: number = 30;
      const values = Float64Array.of(int16MinValue, int8MinValue);
      const value: double = 30;
      const replaced = values.with(1, value);
      const expectVal = thirtyValue;
      expect(replaced[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_8000
     * @tc.name testFloat64ArrayWith1080
     * @tc.desc Verify with(index:int, value:number) with numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const thirtyValue: number = 30;
      const values = Float64Array.of(int32MinValue, negativeOne);
      const replaced = values.with(1, thirtyValue);
      const expectVal = thirtyValue;
      expect(replaced[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_8100
     * @tc.name testFloat64ArrayWith1081
     * @tc.desc Verify with with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue00: number = 0x00;
      const zeroPointZero: number = 0.0;
      const num170Pointzero: number = 170.0;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      const r = arr.with(0, hexValue00);
      expect(r[0]).assertEqual(zeroPointZero);
      expect(r[1]).assertEqual(num170Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_8200
     * @tc.name testFloat64ArrayWith1082
     * @tc.desc Verify with with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue00000000: number = 0b00000000;
      const zeroPointZero: number = 0.0;
      const num170Pointzero: number = 170.0;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      const r = arr.with(0, binaryValue00000000);
      expect(r[0]).assertEqual(zeroPointZero);
      expect(r[1]).assertEqual(num170Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_8300
     * @tc.name testFloat64ArrayWith1083
     * @tc.desc Verify with with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const result = arr.with(0, 1.0);
      expect(result[0]).assertEqual(1.0);
      expect(result[1]).assertEqual(doubleMaxValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_8400
     * @tc.name testFloat64ArrayWith1084
     * @tc.desc Verify with with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const result = arr.with(0, 0.0);
      expect(result[0]).assertEqual(0.0);
      expect(result[1]).assertEqual(negativeInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_1_8500
     * @tc.name testFloat64ArrayWith1085
     * @tc.desc Verify with with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith1085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const result = arr.with(0, 0.0);
      expect(result[0]).assertEqual(0.0);
      expect(result[1]).assertEqual(doubleMaxValue);
    })

  })
}
