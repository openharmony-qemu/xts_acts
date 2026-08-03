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

export default function float64ArrayDollarGetTest(): void {
  describe('Float64ArrayDollarGetTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_0100
     * @tc.name testFloat64ArrayDollarGet001
     * @tc.desc Verify $_get index 0 reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array([int32MinValue, -1, 0]);
      const indexZero: int = 0;
      const actVal1 = arr.$_get(indexZero);
      const expectVal = int32MinValue;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_0200
     * @tc.name testFloat64ArrayDollarGet002
     * @tc.desc Verify $_get index 1 reads second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const indexOne: short = 1;
      const actVal2 = arr.$_get(indexOne);
      const expectVal = maxSafeInteger;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_0300
     * @tc.name testFloat64ArrayDollarGet003
     * @tc.desc Verify $_get index 2 reads last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(0.5, 1.5, pointTwoFive);
      const indexTwo: int = 2;
      const actVal3 = arr.$_get(indexTwo);
      const expectVal = pointTwoFive;
      expect(actVal3).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_0400
     * @tc.name testFloat64ArrayDollarGet004
     * @tc.desc Verify $_get index 100 OOB throws invalid index error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const oobIndex: short = 100;
      try {
        arr.$_get(oobIndex);
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_0500
     * @tc.name testFloat64ArrayDollarGet005
     * @tc.desc Verify $_get index 1000 reads default 0.0 in 1001-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(1001);
      const indexThousand: int = 1000;
      const actVal4 = arr.$_get(indexThousand);
      const expectVal = zeroPointZero;
      expect(actVal4).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_0600
     * @tc.name testFloat64ArrayDollarGet006
     * @tc.desc Verify $_get index 2147483647 max int OOB throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const maxIntIndex: int = 2147483647;
      try {
        arr.$_get(maxIntIndex);
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_0700
     * @tc.name testFloat64ArrayDollarGet007
     * @tc.desc Verify $_get index 3 equals length OOB throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const lengthIndex: short = 3;
      try {
        arr.$_get(lengthIndex);
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_0800
     * @tc.name testFloat64ArrayDollarGet008
     * @tc.desc Verify $_get negative index -1 throws invalid index error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_0900
     * @tc.name testFloat64ArrayDollarGet009
     * @tc.desc Verify $_get INT32_MIN negative index throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const int32MinIndex: int = -2147483648;
      try {
        arr.$_get(int32MinIndex);
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_1000
     * @tc.name testFloat64ArrayDollarGet010
     * @tc.desc Verify $_get empty array index 0 OOB throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      try {
        arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_1100
     * @tc.name testFloat64ArrayDollarGet011
     * @tc.desc Verify $_get -0 equals 0 reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      const actVal5 = arr.$_get(-0);
      const expectVal = pointOne;
      expect(actVal5).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_1200
     * @tc.name testFloat64ArrayDollarGet012
     * @tc.desc Verify $_get single element array index 0 reads element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = new Float64Array([pointFive]);
      const actVal6 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal6).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_1300
     * @tc.name testFloat64ArrayDollarGet013
     * @tc.desc Verify $_get single element index 1 OOB throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768]);
      try {
        arr.$_get(1);
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_1400
     * @tc.name testFloat64ArrayDollarGet014
     * @tc.desc Verify $_get single element index -1 negative throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_1500
     * @tc.name testFloat64ArrayDollarGet015
     * @tc.desc Verify $_get 0.5 truncates to 0 reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      const actVal7 = arr.$_get(Double.toInt(0.5));
      const expectVal = pointOne;
      expect(actVal7).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_1600
     * @tc.name testFloat64ArrayDollarGet016
     * @tc.desc Verify $_get 1.9 truncates to 1 reads second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const arr = new Float64Array([0.5, onePointFive, 0.25]);
      const actVal8 = arr.$_get(Double.toInt(1.9));
      const expectVal = onePointFive;
      expect(actVal8).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_1700
     * @tc.name testFloat64ArrayDollarGet017
     * @tc.desc Verify $_get 2.1 truncates to 2 reads third element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const actVal9 = arr.$_get(Double.toInt(2.1));
      const expectVal = zeroValue;
      expect(actVal9).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_1800
     * @tc.name testFloat64ArrayDollarGet018
     * @tc.desc Verify $_get 3.99 truncates to 3 OOB throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.$_get(Double.toInt(3.99));
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_1900
     * @tc.name testFloat64ArrayDollarGet019
     * @tc.desc Verify $_get Double.toInt(NaN) normalizes to 0 and reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      let idx: int = Double.toInt(NaN);
      const actVal10 = arr.$_get(idx);
      const expectVal = pointOne;
      expect(actVal10).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_2000
     * @tc.name testFloat64ArrayDollarGet020
     * @tc.desc Verify $_get Infinity index throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.$_get(Double.toInt(Infinity));
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_2100
     * @tc.name testFloat64ArrayDollarGet021
     * @tc.desc Verify $_get hex 0x0 equals index 0 reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue, -128, 0);
      const actVal11 = arr.$_get(0x0);
      const expectVal = int16MinValue;
      expect(actVal11).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_2200
     * @tc.name testFloat64ArrayDollarGet022
     * @tc.desc Verify $_get hex 0x1 equals index 1 reads second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const actVal12 = arr.$_get(0x1);
      const expectVal = negativeOne;
      expect(actVal12).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_2300
     * @tc.name testFloat64ArrayDollarGet023
     * @tc.desc Verify $_get hex 0x2 equals index 2 reads last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const actVal13 = arr.$_get(0x2);
      const expectVal = zeroValue;
      expect(actVal13).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_2400
     * @tc.name testFloat64ArrayDollarGet024
     * @tc.desc Verify $_get hex 0x3 equals index 3 reads 4th element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFour: number = 0.4;
      const arr = Float64Array.of(0.1, 0.2, 0.3, pointFour);
      const actVal14 = arr.$_get(0x3);
      const expectVal = pointFour;
      expect(actVal14).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_2500
     * @tc.name testFloat64ArrayDollarGet025
     * @tc.desc Verify $_get octal 0o7 equals index 7 reads 8th element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const eightPointZero: number = 8.0;
      const arr =
        new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0,
          sevenPointZero, eightPointZero]);
      const actVal15 = arr.$_get(0o7);
      const expectVal = eightPointZero;
      expect(actVal15).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_2600
     * @tc.name testFloat64ArrayDollarGet026
     * @tc.desc Verify $_get octal 0o3 equals index 3 reads 4th element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fortyPointZero: number = 40.0;
      const arr = new Float64Array([10.0, 20.0, 30.0, fortyPointZero]);
      const actVal16 = arr.$_get(0o3);
      const expectVal = fortyPointZero;
      expect(actVal16).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_2700
     * @tc.name testFloat64ArrayDollarGet027
     * @tc.desc Verify $_get binary 0b1 equals index 1 reads second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const actVal17 = arr.$_get(0b1);
      const expectVal = maxSafeInteger;
      expect(actVal17).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_2800
     * @tc.name testFloat64ArrayDollarGet028
     * @tc.desc Verify $_get binary 0b10 equals index 2 reads last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(0.5, 1.5, pointTwoFive);
      const actVal18 = arr.$_get(0b10);
      const expectVal = pointTwoFive;
      expect(actVal18).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_2900
     * @tc.name testFloat64ArrayDollarGet029
     * @tc.desc Verify $_get binary 0b11 equals index 3 reads 4th element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num400Pointzero: number = 400.0;
      const arr = Float64Array.of(100.0, 200.0, 300.0, num400Pointzero);
      const actVal19 = arr.$_get(0b11);
      const expectVal = num400Pointzero;
      expect(actVal19).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_3000
     * @tc.name testFloat64ArrayDollarGet030
     * @tc.desc Verify $_get Double.toInt(1.0e2) equals 100 reads element in 101-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array(101);
      arr.$_set(100, num999Pointzero);
      const actVal20 = arr.$_get(Double.toInt(1.0e2));
      const expectVal = num999Pointzero;
      expect(actVal20).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_3100
     * @tc.name testFloat64ArrayDollarGet031
     * @tc.desc Verify $_get 1.0e0 equals 1 reads second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const actVal21 = arr.$_get(Double.toInt(1.0e0));
      const expectVal = maxSafeInteger;
      expect(actVal21).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_3200
     * @tc.name testFloat64ArrayDollarGet032
     * @tc.desc Verify $_get in 100-element array works with $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array(100);
      arr.$_set(50, num999Pointzero);
      const actVal22 = arr.$_get(50);
      const expectVal = num999Pointzero;
      expect(actVal22).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_3300
     * @tc.name testFloat64ArrayDollarGet033
     * @tc.desc Verify $_get index 99 in 100-element reads last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num888Pointzero: number = 888.0;
      const arr = new Float64Array(100);
      arr.$_set(99, num888Pointzero);
      const actVal23 = arr.$_get(99);
      const expectVal = num888Pointzero;
      expect(actVal23).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_3400
     * @tc.name testFloat64ArrayDollarGet034
     * @tc.desc Verify $_get index 0 reads 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(zeroPointZero, 1.5, 0.25);
      const actVal24 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal24).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_3500
     * @tc.name testFloat64ArrayDollarGet035
     * @tc.desc Verify $_get index 0 reads -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(negativeZero, 1.0, 2.0);
      const actVal25 = arr.$_get(0);
      const expectVal = negativeZero;
      expect(actVal25).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_3600
     * @tc.name testFloat64ArrayDollarGet036
     * @tc.desc Verify $_get index 0 reads NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array([nanValue, 2.0, 3.0]);
      let result = arr.$_get(0);
      const actVal26 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal26).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_3700
     * @tc.name testFloat64ArrayDollarGet037
     * @tc.desc Verify $_get index 0 reads Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(positiveInfinity, 2.0, 3.0);
      const actVal27 = arr.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal27).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_3800
     * @tc.name testFloat64ArrayDollarGet038
     * @tc.desc Verify $_get index 0 reads -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(negativeInfinity, 2.0, 3.0);
      const actVal28 = arr.$_get(0);
      const expectVal = negativeInfinity;
      expect(actVal28).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_3900
     * @tc.name testFloat64ArrayDollarGet039
     * @tc.desc Verify $_get index 0 reads max double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array([doubleMaxValue, 2.0, 3.0]);
      const actVal29 = arr.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal29).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_4000
     * @tc.name testFloat64ArrayDollarGet040
     * @tc.desc Verify $_get index 0 reads min positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = new Float64Array([doubleMinValue, 2.0, 3.0]);
      const actVal30 = arr.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal30).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_4100
     * @tc.name testFloat64ArrayDollarGet041
     * @tc.desc Verify $_get all-same element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const arr = Float64Array.of(piValue, piValue, piValue, piValue);
      const actVal31 = arr.$_get(0);
      const expectVal = piValue;
      expect(actVal31).assertEqual(expectVal);
      const actVal32 = arr.$_get(1);
      const expectVal2 = piValue;
      expect(actVal32).assertEqual(expectVal2);
      const actVal33 = arr.$_get(2);
      const expectVal3 = piValue;
      expect(actVal33).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_4200
     * @tc.name testFloat64ArrayDollarGet042
     * @tc.desc Verify $_get all-zero array returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      const actVal34 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal34).assertEqual(expectVal);
      const actVal35 = arr.$_get(2);
      const expectVal2 = zeroPointZero;
      expect(actVal35).assertEqual(expectVal2);
      const actVal36 = arr.$_get(4);
      const expectVal3 = zeroPointZero;
      expect(actVal36).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_4300
     * @tc.name testFloat64ArrayDollarGet043
     * @tc.desc Verify $_get negative element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativePointFive: number = -0.5;
      const negativePointTwoFive: number = -0.25;
      const arr = new Float64Array([negativePointFive, -1.5, negativePointTwoFive]);
      const actVal37 = arr.$_get(0);
      const expectVal = negativePointFive;
      expect(actVal37).assertEqual(expectVal);
      const actVal38 = arr.$_get(2);
      const expectVal2 = negativePointTwoFive;
      expect(actVal38).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_4400
     * @tc.name testFloat64ArrayDollarGet044
     * @tc.desc Verify $_get mixed positive-negative-zero array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MinValue: number = -128;
      const arr = new Float64Array([int16MinValue, -128, zeroValue]);
      const actVal39 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal39).assertEqual(expectVal);
      const actVal40 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal40).assertEqual(expectVal2);
      const actVal41 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal41).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_4500
     * @tc.name testFloat64ArrayDollarGet045
     * @tc.desc Verify $_get in 1000-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num12345Pointzero: number = 12345.0;
      const arr = new Float64Array(1000);
      arr.$_set(500, num12345Pointzero);
      const actVal42 = arr.$_get(500);
      const expectVal = num12345Pointzero;
      expect(actVal42).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_4600
     * @tc.name testFloat64ArrayDollarGet046
     * @tc.desc Verify $_get index 999 in 1000-element reads last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num54321Pointzero: number = 54321.0;
      const arr = new Float64Array(1000);
      arr.$_set(999, num54321Pointzero);
      const actVal43 = arr.$_get(999);
      const expectVal = num54321Pointzero;
      expect(actVal43).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_4700
     * @tc.name testFloat64ArrayDollarGet047
     * @tc.desc Verify $_get ArrayBuffer view index 0 reads default 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 0, 3);
      const actVal44 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal44).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_4800
     * @tc.name testFloat64ArrayDollarGet048
     * @tc.desc Verify $_get ArrayBuffer view after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num123Pointfourfivesix: number = 123.456;
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 0, 3);
      arr.$_set(1, num123Pointfourfivesix);
      const actVal45 = arr.$_get(1);
      const expectVal = num123Pointfourfivesix;
      expect(actVal45).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_4900
     * @tc.name testFloat64ArrayDollarGet049
     * @tc.desc Verify $_get ArrayBuffer view index 3 reads 4th element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 0, 4);
      arr.$_set(3, num999Pointzero);
      const actVal46 = arr.$_get(3);
      const expectVal = num999Pointzero;
      expect(actVal46).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_5000
     * @tc.name testFloat64ArrayDollarGet050
     * @tc.desc Verify $_get from Float64Array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const src = Float64Array.of(int32MinValue, -1, 0);
      const arr = new Float64Array(src);
      const actVal47 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal47).assertEqual(expectVal);
      const actVal48 = arr.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal48).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_5100
     * @tc.name testFloat64ArrayDollarGet051
     * @tc.desc Verify $_get from FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const ninePointZero: number = 9.0;
      const nums: FixedArray<number> = [7.0, 8.0, 9.0];
      const arr = new Float64Array(nums);
      const actVal49 = arr.$_get(0);
      const expectVal = sevenPointZero;
      expect(actVal49).assertEqual(expectVal);
      const actVal50 = arr.$_get(2);
      const expectVal2 = ninePointZero;
      expect(actVal50).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_5200
     * @tc.name testFloat64ArrayDollarGet052
     * @tc.desc Verify $_get from Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fifteenPointzero: number = 15.0;
      const twentyfivePointzero: number = 25.0;
      const nums: Array<number> = [15.0, 25.0, 35.0];
      const arr = new Float64Array(nums);
      const actVal51 = arr.$_get(0);
      const expectVal = fifteenPointzero;
      expect(actVal51).assertEqual(expectVal);
      const actVal52 = arr.$_get(1);
      const expectVal2 = twentyfivePointzero;
      expect(actVal52).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_5300
     * @tc.name testFloat64ArrayDollarGet053
     * @tc.desc Verify $_get return type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      let result = arr.$_get(0);
      const actualType = typeof result;
      const expectedType = 'number';
      expect(actualType).assertEqual(expectedType);
      const expectVal = pointOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_5400
     * @tc.name testFloat64ArrayDollarGet054
     * @tc.desc Verify $_get returns value equal to stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApproxValue: number = 3.14159;
      const arr = new Float64Array(1);
      arr.$_set(0, piApproxValue);
      const actVal53 = arr.$_get(0);
      const expectVal = piApproxValue;
      expect(actVal53).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_5500
     * @tc.name testFloat64ArrayDollarGet055
     * @tc.desc Verify $_get does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const before0 = arr.$_get(0);
      const before1 = arr.$_get(1);
      const before2 = arr.$_get(2);
      arr.$_get(0);
      const actVal54 = arr.$_get(0);
      const expectVal = before0;
      expect(actVal54).assertEqual(expectVal);
      const actVal55 = arr.$_get(1);
      const expectVal2 = before1;
      expect(actVal55).assertEqual(expectVal2);
      const actVal56 = arr.$_get(2);
      const expectVal3 = before2;
      expect(actVal56).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_5600
     * @tc.name testFloat64ArrayDollarGet056
     * @tc.desc Verify $_get repeated calls return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const arr = Float64Array.of(-32768, -128);
      const actVal57 = arr.$_get(1);
      const expectVal = int8MinValue;
      expect(actVal57).assertEqual(expectVal);
      const actVal58 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal58).assertEqual(expectVal2);
      const actVal59 = arr.$_get(1);
      const expectVal3 = int8MinValue;
      expect(actVal59).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_5700
     * @tc.name testFloat64ArrayDollarGet057
     * @tc.desc Verify $_get reads latest value after multiple $_set writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = new Float64Array(1);
      arr.$_set(0, onePointZero);
      const actVal60 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal60).assertEqual(expectVal);
      arr.$_set(0, twoPointZero);
      const actVal61 = arr.$_get(0);
      const expectVal2 = twoPointZero;
      expect(actVal61).assertEqual(expectVal2);
      arr.$_set(0, threePointZero);
      const actVal62 = arr.$_get(0);
      const expectVal3 = threePointZero;
      expect(actVal62).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_5800
     * @tc.name testFloat64ArrayDollarGet058
     * @tc.desc Verify $_get truncation 1.999 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const actVal63 = arr.$_get(Double.toInt(1.999));
      const expectVal = negativeOne;
      expect(actVal63).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_5900
     * @tc.name testFloat64ArrayDollarGet059
     * @tc.desc Verify $_get 0.1+0.2 truncates to 0 reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      const actVal64 = arr.$_get(Double.toInt(0.1 + 0.2));
      const expectVal = pointOne;
      expect(actVal64).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_6000
     * @tc.name testFloat64ArrayDollarGet060
     * @tc.desc Verify $_get 1e-308 truncates to 0 reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
      const actVal65 = arr.$_get(Double.toInt(1e-308));
      const expectVal = pointFive;
      expect(actVal65).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_6100
     * @tc.name testFloat64ArrayDollarGet061
     * @tc.desc Verify $_get -1e-308 truncates to 0 reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue, -128, 0);
      const result = arr.$_get(Double.toInt(-1e-308));
      const expectVal = int16MinValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_6200
     * @tc.name testFloat64ArrayDollarGet062
     * @tc.desc Verify $_get Double.toInt(1.0e1) equals 10 reads element in 11-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num555Pointzero: number = 555.0;
      const arr = new Float64Array(11);
      arr.$_set(10, num555Pointzero);
      const actVal66 = arr.$_get(Double.toInt(1.0e1));
      const expectVal = num555Pointzero;
      expect(actVal66).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_6300
     * @tc.name testFloat64ArrayDollarGet063
     * @tc.desc Verify $_get Double.toInt(1.0e-1) truncates to 0 reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      const actVal67 = arr.$_get(Double.toInt(1.0e-1));
      const expectVal = pointOne;
      expect(actVal67).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_6400
     * @tc.name testFloat64ArrayDollarGet064
     * @tc.desc Verify $_get Double.MAX_VALUE converted index throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0);
      const maxValueIndex: int = Double.toInt(Double.MAX_VALUE);
      try {
        arr.$_get(maxValueIndex);
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_6500
     * @tc.name testFloat64ArrayDollarGet065
     * @tc.desc Verify $_get negative short index throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1, 9007199254740991, 0);
      const negativeShortIndex: short = -1;
      try {
        arr.$_get(negativeShortIndex);
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_6600
     * @tc.name testFloat64ArrayDollarGet066
     * @tc.desc Verify $_get byte index parameter reads middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const byteIndex: byte = 1;
      const actualValue = arr.$_get(byteIndex);
      const expectVal = maxSafeInteger;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_6700
     * @tc.name testFloat64ArrayDollarGet067
     * @tc.desc Verify $_get short index parameter reads last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(-2147483648, -1, zeroValue);
      const shortIndex: short = 2;
      const actualValue = arr.$_get(shortIndex);
      const expectVal = zeroValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_6800
     * @tc.name testFloat64ArrayDollarGet068
     * @tc.desc Verify nested $_get uses returned value as next index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const targetValue: number = 77.0;
      const arr = Float64Array.of(2.0, 99.0, targetValue, 88.0);
      const firstValue = arr.$_get(0);
      const nextIndex: int = Double.toInt(firstValue);
      const actualValue = arr.$_get(nextIndex);
      const expectVal = targetValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_6900
     * @tc.name testFloat64ArrayDollarGet069
     * @tc.desc Verify $_get return values participate in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([12.0, 3.0, 5.0]);
      const firstValue = arr.$_get(0);
      const secondValue = arr.$_get(1);
      const expectVal = 15.0;
      expect(firstValue + secondValue).assertEqual(expectVal);
      const expectVal2 = 36.0;
      expect(firstValue * secondValue).assertEqual(expectVal2);
      const expectVal3 = 4.0;
      expect(firstValue / secondValue).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARGET_7000
     * @tc.name testFloat64ArrayDollarGet070
     * @tc.desc Verify $_get reads updated value after bracket assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarGet070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const secondIndex: int = 1;
      const before = arr.$_get(secondIndex);
      arr[1] = 99.0;
      const after = arr.$_get(secondIndex);
      const expectVal = 20.0;
      expect(before).assertEqual(expectVal);
      const expectVal2 = 99.0;
      expect(after).assertEqual(expectVal2);
    });

  })
}
