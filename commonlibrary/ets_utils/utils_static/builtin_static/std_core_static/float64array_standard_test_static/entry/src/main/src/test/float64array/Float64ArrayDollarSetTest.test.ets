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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function float64ArrayDollarSetTest(): void {
  describe('Float64ArrayDollarSetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_0100
     * @tc.name testFloat64ArrayDollarSet001
     * @tc.desc Verify $_set two-param normal call writes value at index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(2);
      arr.$_set(0, onePointZero);
      const actVal1 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_0200
     * @tc.name testFloat64ArrayDollarSet002
     * @tc.desc Verify $_set index=0 writes first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const arr = new Float64Array(3);
      arr.$_set(0, hundredPointZero);
      const actVal2 = arr.$_get(0);
      const expectVal = hundredPointZero;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_0300
     * @tc.name testFloat64ArrayDollarSet003
     * @tc.desc Verify $_set index=1 writes middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num200Pointzero: number = 200.0;
      const arr = new Float64Array(3);
      arr.$_set(1, num200Pointzero);
      const actVal3 = arr.$_get(1);
      const expectVal = num200Pointzero;
      expect(actVal3).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_0400
     * @tc.name testFloat64ArrayDollarSet004
     * @tc.desc Verify $_set index=length-1 writes last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num500Pointzero: number = 500.0;
      const arr = new Float64Array(5);
      arr.$_set(4, num500Pointzero);
      const actVal4 = arr.$_get(4);
      const expectVal = num500Pointzero;
      expect(actVal4).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_0500
     * @tc.name testFloat64ArrayDollarSet005
     * @tc.desc Verify $_set index=length out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array(3);
      try {
        arr.$_set(3, num999Pointzero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_0600
     * @tc.name testFloat64ArrayDollarSet006
     * @tc.desc Verify $_set index=length+1 out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array(3);
      try {
        arr.$_set(4, num999Pointzero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_0700
     * @tc.name testFloat64ArrayDollarSet007
     * @tc.desc Verify $_set index=1000000 large out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array(3);
      try {
        arr.$_set(1000000, num999Pointzero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_0800
     * @tc.name testFloat64ArrayDollarSet008
     * @tc.desc Verify $_set index=-1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      try {
        arr.$_set(-1, -100.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_0900
     * @tc.name testFloat64ArrayDollarSet009
     * @tc.desc Verify $_set index=-2 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(5);
      try {
        arr.$_set(-2, -200.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_1000
     * @tc.name testFloat64ArrayDollarSet010
     * @tc.desc Verify $_set index=-length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(4);
      try {
        arr.$_set(-4, -400.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_1100
     * @tc.name testFloat64ArrayDollarSet011
     * @tc.desc Verify $_set index=-length-1 out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      try {
        arr.$_set(-4, -999.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_1200
     * @tc.name testFloat64ArrayDollarSet012
     * @tc.desc Verify $_set index=-1000000 large negative throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      try {
        arr.$_set(-1000000, -999.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_1300
     * @tc.name testFloat64ArrayDollarSet013
     * @tc.desc Verify $_set index=0x3 hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thirtyPointZero: number = 30.0;
      const arr = new Float64Array(5);
      arr.$_set(0x3, thirtyPointZero);
      const actVal5 = arr.$_get(3);
      const expectVal = thirtyPointZero;
      expect(actVal5).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_1400
     * @tc.name testFloat64ArrayDollarSet014
     * @tc.desc Verify $_set index=0o10 octal literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightyPointZero: number = 80.0;
      const arr = new Float64Array(10);
      arr.$_set(0o10, eightyPointZero);
      const actVal6 = arr.$_get(8);
      const expectVal = eightyPointZero;
      expect(actVal6).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_1500
     * @tc.name testFloat64ArrayDollarSet015
     * @tc.desc Verify $_set index=0b111 binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const seventyPointZero: number = 70.0;
      const arr = new Float64Array(10);
      arr.$_set(0b111, seventyPointZero);
      const actVal7 = arr.$_get(7);
      const expectVal = seventyPointZero;
      expect(actVal7).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_1600
     * @tc.name testFloat64ArrayDollarSet016
     * @tc.desc Verify $_set value=0.0 positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(3);
      const indexOne: int = 1;
      arr.$_set(indexOne, zeroPointZero);
      const actVal8 = arr.$_get(indexOne);
      const expectVal = zeroPointZero;
      expect(actVal8).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_1700
     * @tc.name testFloat64ArrayDollarSet017
     * @tc.desc Verify $_set value=-0.0 negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const arr = new Float64Array(3);
      const indexTwo: short = 2;
      arr.$_set(indexTwo, -0.0);
      const actVal9 = arr.$_get(indexTwo);
      const expectVal = negativeZero;
      expect(actVal9).assertEqual(expectVal);
      const signVal = 1.0 / arr.$_get(indexTwo);
      const expectVal2 = -Infinity;
      expect(signVal).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_1800
     * @tc.name testFloat64ArrayDollarSet018
     * @tc.desc Verify $_set value=NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array(3);
      const indexOne: short = 1;
      arr.$_set(indexOne, nanValue);
      const actVal10 = arr.$_get(indexOne);
      expect(actVal10).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_1900
     * @tc.name testFloat64ArrayDollarSet019
     * @tc.desc Verify $_set value=Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array(3);
      const indexTwo: int = 2;
      arr.$_set(indexTwo, positiveInfinity);
      const actVal11 = arr.$_get(indexTwo);
      const expectVal = positiveInfinity;
      expect(actVal11).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_2000
     * @tc.name testFloat64ArrayDollarSet020
     * @tc.desc Verify $_set value=-Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array(3);
      const indexOne: int = 1;
      arr.$_set(indexOne, -positiveInfinity);
      const actVal12 = arr.$_get(indexOne);
      const expectVal = negativeInfinity;
      expect(actVal12).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_2100
     * @tc.name testFloat64ArrayDollarSet021
     * @tc.desc Verify $_set value=MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array(3);
      const indexTwo: short = 2;
      arr.$_set(indexTwo, doubleMaxValue);
      const actVal13 = arr.$_get(indexTwo);
      const expectVal = doubleMaxValue;
      expect(actVal13).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_2200
     * @tc.name testFloat64ArrayDollarSet022
     * @tc.desc Verify $_set value=MIN_VALUE 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = new Float64Array(3);
      const indexOne: short = 1;
      arr.$_set(indexOne, doubleMinValue);
      const actVal14 = arr.$_get(indexOne);
      const expectVal = doubleMinValue;
      expect(actVal14).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_2300
     * @tc.name testFloat64ArrayDollarSet023
     * @tc.desc Verify $_set overwrites a negative decimal with a positive decimal at the same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negTwelvePointFive: number = -12.5;
      const overwriteValue: number = 12345.5;
      const arr = new Float64Array(3);
      arr.$_set(0, negTwelvePointFive);
      arr.$_set(0, overwriteValue);
      const actVal15 = arr.$_get(0);
      const expectVal = overwriteValue;
      expect(actVal15).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_2400
     * @tc.name testFloat64ArrayDollarSet024
     * @tc.desc Verify $_set all elements in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const zeroPointZero: number = 0.0;
      const fortyPointZero: number = 40.0;
      const arr = new Float64Array(5);
      for (let i: int = 0; i < 5; i++) {
        arr.$_set(i, i * tenPointZero);
      }
      const actVal16 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal16).assertEqual(expectVal);
      const actVal17 = arr.$_get(4);
      const expectVal2 = fortyPointZero;
      expect(actVal17).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_2500
     * @tc.name testFloat64ArrayDollarSet025
     * @tc.desc Verify $_set value=0.0 distinguished from -0.0 via division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array(3);
      arr.$_set(0, zeroPointZero);
      const actVal18 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal18).assertEqual(expectVal);
      const actVal19 = 1.0 / arr.$_get(0);
      const expectVal2 = positiveInfinity;
      expect(actVal19).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_2600
     * @tc.name testFloat64ArrayDollarSet026
     * @tc.desc Verify $_set value=-0.0 distinguished from +0.0 via division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array(3);
      arr.$_set(0, -0.0);
      const actVal20 = arr.$_get(0);
      const expectVal = negativeZero;
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = 1.0 / arr.$_get(0);
      const expectVal2 = negativeInfinity;
      expect(actVal21).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_2700
     * @tc.name testFloat64ArrayDollarSet027
     * @tc.desc Verify $_set with negative literal value -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const arr = new Float64Array(3);
      arr.$_set(0, -1.0);
      const actVal22 = arr.$_get(0);
      const expectVal = negonePointzero;
      expect(actVal22).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_2800
     * @tc.name testFloat64ArrayDollarSet028
     * @tc.desc Verify $_set with overflow boundary value 1.7976931348623158e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValueAlt: number = 1.7976931348623158e+308;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array(3);
      arr.$_set(0, doubleMaxValueAlt);
      const v = arr.$_get(0);
      expect(v).assertEqual(doubleMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_2900
     * @tc.name testFloat64ArrayDollarSet029
     * @tc.desc Verify $_set with int type variable index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = new Float64Array(5);
      const idx: int = 3;
      arr.$_set(idx, fillValue99);
      const actVal24 = arr.$_get(3);
      const expectVal = fillValue99;
      expect(actVal24).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_3000
     * @tc.name testFloat64ArrayDollarSet030
     * @tc.desc Verify $_set with short type variable index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiftyPointZero: number = 50.0;
      const arr = new Float64Array(5);
      const s: short = 2;
      arr.$_set(s, fiftyPointZero);
      const actVal25 = arr.$_get(2);
      const expectVal = fiftyPointZero;
      expect(actVal25).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_3100
     * @tc.name testFloat64ArrayDollarSet031
     * @tc.desc Verify $_set on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const arr = new Float64Array(1);
      arr.$_set(0, fillValue42);
      const actVal26 = arr.$_get(0);
      const expectVal = fillValue42;
      expect(actVal26).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_3200
     * @tc.name testFloat64ArrayDollarSet032
     * @tc.desc Verify $_set out of bounds preserves negative and safe-integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negPointFive: number = -0.5;
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const oobWriteValue: number = 12345.5;
      const arr = new Float64Array(3);
      arr.$_set(0, negPointFive);
      arr.$_set(1, maxSafeInteger);
      try {
        arr.$_set(100, oobWriteValue);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      const actVal27 = arr.$_get(0);
      const expectVal = negPointFive;
      expect(actVal27).assertEqual(expectVal);
      const actVal28 = arr.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal28).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_3300
     * @tc.name testFloat64ArrayDollarSet033
     * @tc.desc Verify $_set(index:int, value:E) with double precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenValue: number = 10;
      const values = new Float64Array(2);
      const value: double = 10;
      const indexOne: int = 1;
      values.$_set(indexOne, value);
      const actVal29 = values.$_get(indexOne);
      const expectVal = tenValue;
      expect(actVal29).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_3400
     * @tc.name testFloat64ArrayDollarSet034
     * @tc.desc Verify $_set() at index 2 accepts number literal 10 and stores it correctly as confirmed by $_get(2) returning 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenValue: number = 10;
      const values = new Float64Array(3);
      const indexTwo: short = 2;
      values.$_set(indexTwo, tenValue);
      const actVal30 = values.$_get(indexTwo);
      const expectVal = tenValue;
      expect(actVal30).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_3500
     * @tc.name testFloat64ArrayDollarSet035
     * @tc.desc Verify $_set index=2147483647 with MAX_SAFE_INTEGER value throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const arr = new Float64Array(3);
      try {
        arr.$_set(2147483647, maxSafeInteger);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_3600
     * @tc.name testFloat64ArrayDollarSet036
     * @tc.desc Verify $_set index=-2147483648 with -Double.MAX_VALUE value throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negDoubleMaxValue: number = -1.7976931348623157e+308;
      const arr = new Float64Array(3);
      try {
        arr.$_set(-2147483648, negDoubleMaxValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_3700
     * @tc.name testFloat64ArrayDollarSet037
     * @tc.desc Verify $_set value=-Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negDoubleMaxValue: number = -1.7976931348623157e+308;
      const arr = new Float64Array(3);
      const indexOne: int = 1;
      arr.$_set(indexOne, negDoubleMaxValue);
      const actVal31 = arr.$_get(indexOne);
      const expectVal = negDoubleMaxValue;
      expect(actVal31).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_3800
     * @tc.name testFloat64ArrayDollarSet038
     * @tc.desc Verify $_set value=0.1+0.2 floating-point precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatSum: number = 0.1 + 0.2;
      const expected: number = 0.30000000000000004;
      const arr = new Float64Array(3);
      const indexTwo: short = 2;
      arr.$_set(indexTwo, floatSum);
      const actVal32 = arr.$_get(indexTwo);
      const expectVal = expected;
      expect(actVal32).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_3900
     * @tc.name testFloat64ArrayDollarSet039
     * @tc.desc Verify $_set value=1.0e-308 small scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciSmall: number = 1.0e-308;
      const arr = new Float64Array(3);
      const indexOne: short = 1;
      arr.$_set(indexOne, sciSmall);
      const actVal33 = arr.$_get(indexOne);
      const expectVal = sciSmall;
      expect(actVal33).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_4000
     * @tc.name testFloat64ArrayDollarSet040
     * @tc.desc Verify $_set value=1.0e+308 large scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciLarge: number = 1.0e+308;
      const arr = new Float64Array(3);
      const indexTwo: int = 2;
      arr.$_set(indexTwo, sciLarge);
      const actVal34 = arr.$_get(indexTwo);
      const expectVal = sciLarge;
      expect(actVal34).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_4100
     * @tc.name testFloat64ArrayDollarSet041
     * @tc.desc Verify $_set value=Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const arr = new Float64Array(3);
      const indexOne: int = 1;
      arr.$_set(indexOne, maxSafeInteger);
      const actVal35 = arr.$_get(indexOne);
      const expectVal = maxSafeInteger;
      expect(actVal35).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_4200
     * @tc.name testFloat64ArrayDollarSet042
     * @tc.desc Verify $_set value=Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const arr = new Float64Array(3);
      const indexTwo: short = 2;
      arr.$_set(indexTwo, minSafeInteger);
      const actVal36 = arr.$_get(indexTwo);
      const expectVal = minSafeInteger;
      expect(actVal36).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_4300
     * @tc.name testFloat64ArrayDollarSet043
     * @tc.desc Verify $_set value=0x10 hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const sixteenValue: number = 16.0;
      const arr = new Float64Array(3);
      const indexOne: short = 1;
      arr.$_set(indexOne, hexValue10);
      const actVal37 = arr.$_get(indexOne);
      const expectVal = sixteenValue;
      expect(actVal37).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_4400
     * @tc.name testFloat64ArrayDollarSet044
     * @tc.desc Verify $_set value=0b1010 binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const tenValue: number = 10.0;
      const arr = new Float64Array(3);
      const indexTwo: int = 2;
      arr.$_set(indexTwo, binaryValue1010);
      const actVal38 = arr.$_get(indexTwo);
      const expectVal = tenValue;
      expect(actVal38).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_4500
     * @tc.name testFloat64ArrayDollarSet045
     * @tc.desc Verify set from array negative check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array(3);
      arr.$_set(0, 1.0);
      const actVal39 = arr.$_get(0);
      const expectVal = 1.0;
      expect(actVal39).assertEqual(expectVal);
      const actVal40 = arr.$_get(1);
      const expectVal2 = 0.0;
      expect(actVal40).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_4600
     * @tc.name testFloat64ArrayDollarSet046
     * @tc.desc Verify $_set return value is undefined after binary literal write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1111: number = 0b1111;
      const fifteenValue: number = 15;
      const arr = new Float64Array(3);
      const result = arr.$_set(0, binaryValue1111);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
      const actVal = arr.$_get(0);
      expect(actVal).assertEqual(fifteenValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_4700
     * @tc.name testFloat64ArrayDollarSet047
     * @tc.desc Verify $_set length unchanged after out-of-bounds scientific value write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciLarge: number = 1.0e+308;
      const threeValue: number = 3;
      const arr = new Float64Array(3);
      try {
        arr.$_set(100, sciLarge);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.length).assertEqual(threeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_4800
     * @tc.name testFloat64ArrayDollarSet048
     * @tc.desc Verify $_set keeps hex value unchanged when another index is updated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue20: number = 0x20;
      const negFifteenPointFive: number = -15.5;
      const arr = new Float64Array(3);
      arr.$_set(1, hexValue20);
      arr.$_set(0, negFifteenPointFive);
      const actVal1 = arr.$_get(1);
      const expectVal = hexValue20;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_4900
     * @tc.name testFloat64ArrayDollarSet049
     * @tc.desc Verify $_set on shared buffer parent view affects child view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf);
      const child = new Float64Array(buf, 8, 2);
      parent.$_set(1, hundredPointZero);
      const actVal2 = child.$_get(0);
      const expectVal = hundredPointZero;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_5000
     * @tc.name testFloat64ArrayDollarSet050
     * @tc.desc Verify $_set on shared buffer child view affects parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num200Pointzero: number = 200.0;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf);
      const child = new Float64Array(buf, 8, 2);
      child.$_set(0, num200Pointzero);
      const actVal3 = parent.$_get(1);
      const expectVal = num200Pointzero;
      expect(actVal3).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_5100
     * @tc.name testFloat64ArrayDollarSet051
     * @tc.desc Verify $_set on copy does not affect original negative decimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negOnePointFive: number = -1.5;
      const copyWriteValue: number = 12345.5;
      const original = new Float64Array(3);
      original.$_set(0, negOnePointFive);
      const copy = new Float64Array(original);
      copy.$_set(0, copyWriteValue);
      const actVal4 = original.$_get(0);
      const expectVal = negOnePointFive;
      expect(actVal4).assertEqual(expectVal);
      const actVal5 = copy.$_get(0);
      const expectVal2 = copyWriteValue;
      expect(actVal5).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_5200
     * @tc.name testFloat64ArrayDollarSet052
     * @tc.desc Verify $_set on empty array with MIN_SAFE_INTEGER does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      try {
        arr.$_set(0, minSafeInteger);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.length).assertEqual(zeroValue);
      expect(arr.byteLength).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_5300
     * @tc.name testFloat64ArrayDollarSet053
     * @tc.desc Verify $_set NaN and other elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const nanValue: number = NaN;
      const arr = new Float64Array(3);
      arr.$_set(1, twoPointZero);
      arr.$_set(0, nanValue);
      const actVal6 = Number.isNaN(arr.$_get(0));
      const expectVal = true;
      expect(actVal6).assertEqual(expectVal);
      const nanElement = arr.$_get(0);
      expect(nanElement).assertNaN();
      const actVal7 = arr.$_get(1);
      const expectVal2 = twoPointZero;
      expect(actVal7).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_5400
     * @tc.name testFloat64ArrayDollarSet054
     * @tc.desc Verify $_set multi-view shared buffer consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const buf = new ArrayBuffer(32);
      const v1 = new Float64Array(buf, 0, 2);
      const v2 = new Float64Array(buf, 16, 2);
      v1.$_set(0, tenPointZero);
      v2.$_set(0, twentyPointZero);
      const actVal8 = v1.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal8).assertEqual(expectVal);
      const actVal9 = v2.$_get(0);
      const expectVal2 = twentyPointZero;
      expect(actVal9).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_5500
     * @tc.name testFloat64ArrayDollarSet055
     * @tc.desc Verify $_set NaN shared across buffer views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const buf = new ArrayBuffer(16);
      const a1 = new Float64Array(buf);
      const a2 = new Float64Array(buf);
      a1.$_set(0, nanValue);
      const actVal10 = a2.$_get(0);
      expect(actVal10).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_5600
     * @tc.name testFloat64ArrayDollarSet056
     * @tc.desc Verify $_set Infinity shared across buffer views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const buf = new ArrayBuffer(16);
      const a1 = new Float64Array(buf);
      const a2 = new Float64Array(buf);
      a1.$_set(0, positiveInfinity);
      const actVal11 = a2.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal11).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_5700
     * @tc.name testFloat64ArrayDollarSet057
     * @tc.desc Verify $_set on empty array with negative scientific value does not change invariants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negSciLarge: number = -1.0e+308;
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      try {
        arr.$_set(0, negSciLarge);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.length).assertEqual(zeroValue);
      expect(arr.byteLength).assertEqual(zeroValue);
      expect(arr.byteOffset).assertEqual(zeroValue);
      expect(arr.byteLength).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_5800
     * @tc.name testFloat64ArrayDollarSet058
     * @tc.desc Verify $_set with one element preserves byteLength and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const oneValue: number = 1;
      const eightValue: number = 8;
      const arr = new Float64Array(1);
      arr.$_set(0, onePointZero);
      expect(arr.length).assertEqual(oneValue);
      expect(arr.byteLength).assertEqual(eightValue);
      expect(arr.buffer.byteLength).assertEqual(eightValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_5900
     * @tc.name testFloat64ArrayDollarSet059
     * @tc.desc Verify $_set with 1000 elements preserves byteLength and length after negative scientific write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negSciLarge: number = -1.0e+308;
      const thousandValue: number = 1000;
      const num8000Value: number = 8000;
      const arr = new Float64Array(1000);
      const bufBefore = arr.buffer;
      arr.$_set(500, negSciLarge);
      expect(arr.length).assertEqual(thousandValue);
      expect(arr.byteLength).assertEqual(num8000Value);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_6000
     * @tc.name testFloat64ArrayDollarSet060
     * @tc.desc Verify $_set with three elements preserves byteLength, length and non-NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const arr = new Float64Array(3);
      arr.$_set(1, nanValue);
      expect(arr.length).assertEqual(threeValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
      const actVal12 = arr.$_get(1);
      expect(actVal12).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_6100
     * @tc.name testFloat64ArrayDollarSet061
     * @tc.desc Verify $_set with three elements stores positive zero 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const arr = new Float64Array(3);
      arr.$_set(2, zeroPointZero);
      expect(arr.length).assertEqual(threeValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
      const actVal13 = arr.$_get(2);
      const expectVal = zeroPointZero;
      expect(actVal13).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_6200
     * @tc.name testFloat64ArrayDollarSet062
     * @tc.desc Verify $_set with three elements stores negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const negativeZero: number = -0.0;
      const arr = new Float64Array(3);
      arr.$_set(1, -0.0);
      expect(arr.length).assertEqual(threeValue);
      expect(arr.byteLength).assertEqual(twentyfourValue);
      const actVal14 = arr.$_get(1);
      const expectVal = negativeZero;
      expect(actVal14).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_6300
     * @tc.name testFloat64ArrayDollarSet063
     * @tc.desc Verify $_set with three elements stores Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const threeValue: number = 3;
      const arr = new Float64Array(3);
      arr.$_set(2, doubleMinValue);
      expect(arr.length).assertEqual(threeValue);
      const actVal15 = arr.$_get(2);
      const expectVal = doubleMinValue;
      expect(actVal15).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_6400
     * @tc.name testFloat64ArrayDollarSet064
     * @tc.desc Verify $_set with three elements stores Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const threeValue: number = 3;
      const arr = new Float64Array(3);
      arr.$_set(1, doubleMaxValue);
      expect(arr.length).assertEqual(threeValue);
      const actVal16 = arr.$_get(1);
      const expectVal = doubleMaxValue;
      expect(actVal16).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_6500
     * @tc.name testFloat64ArrayDollarSet065
     * @tc.desc Verify $_set with three elements stores negative, hex and scientific values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negOnePointFive: number = -1.5;
      const hexValue10: number = 0x10;
      const sciSmall: number = 1.0e-308;
      const threeValue: number = 3;
      const arr = new Float64Array(3);
      arr.$_set(0, negOnePointFive);
      arr.$_set(1, hexValue10);
      arr.$_set(2, sciSmall);
      const actVal17 = arr.$_get(0);
      const expectVal = negOnePointFive;
      expect(actVal17).assertEqual(expectVal);
      const actVal18 = arr.$_get(1);
      const expectVal2 = hexValue10;
      expect(actVal18).assertEqual(expectVal2);
      const actVal19 = arr.$_get(2);
      const expectVal3 = sciSmall;
      expect(actVal19).assertEqual(expectVal3);
      expect(arr.length).assertEqual(threeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_6600
     * @tc.name testFloat64ArrayDollarSet066
     * @tc.desc Verify $_set with three elements preserves safe-integer and binary values after exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const binaryValue1111: number = 0b1111;
      const oobWriteValue: number = -9876.5;
      const arr = new Float64Array(3);
      arr.$_set(0, maxSafeInteger);
      arr.$_set(1, minSafeInteger);
      arr.$_set(2, binaryValue1111);
      try {
        arr.$_set(100, oobWriteValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      const actVal20 = arr.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = arr.$_get(1);
      const expectVal2 = minSafeInteger;
      expect(actVal21).assertEqual(expectVal2);
      const actVal22 = arr.$_get(2);
      const expectVal3 = binaryValue1111;
      expect(actVal22).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_6700
     * @tc.name testFloat64ArrayDollarSet067
     * @tc.desc Verify $_set on original array does not affect copied array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciSmall: number = 1.0e-308;
      const zeroPointZero: number = 0.0;
      const original = new Float64Array(3);
      const copy = new Float64Array(original);
      original.$_set(0, sciSmall);
      const actVal23 = copy.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal23).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_6800
     * @tc.name testFloat64ArrayDollarSet068
     * @tc.desc Verify $_set stores hex value and preserves bytes per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1F: number = 0x1F;
      const eightValue: number = 8;
      const arr = new Float64Array(3);
      arr.$_set(0, hexValue1F);
      const actVal = arr.$_get(0);
      expect(actVal).assertEqual(hexValue1F);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(eightValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_6900
     * @tc.name testFloat64ArrayDollarSet069
     * @tc.desc Verify $_set preserves byteLength after out-of-bounds MIN_SAFE_INTEGER write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const twentyfourValue: number = 24;
      const arr = new Float64Array(3);
      try {
        arr.$_set(100, minSafeInteger);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.byteLength).assertEqual(twentyfourValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_7000
     * @tc.name testFloat64ArrayDollarSet070
     * @tc.desc Verify $_set return value is undefined after NaN write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array(3);
      const result = arr.$_set(0, nanValue);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
      const actVal = arr.$_get(0);
      expect(actVal).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_7100
     * @tc.name testFloat64ArrayDollarSet071
     * @tc.desc Verify $_set return value is undefined after Infinity write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array(3);
      const result = arr.$_set(0, positiveInfinity);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_7200
     * @tc.name testFloat64ArrayDollarSet072
     * @tc.desc Verify $_set byteOffset unchanged after OOB catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciSmall: number = 1.0e-308;
      const eightValue: number = 8;
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 8, 2);
      try {
        arr.$_set(100, sciSmall);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.byteOffset).assertEqual(eightValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_7300
     * @tc.name testFloat64ArrayDollarSet073
     * @tc.desc Verify $_set negative OOB preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negSciLarge: number = -1.0e+308;
      const threeValue: number = 3;
      const arr = new Float64Array(3);
      try {
        arr.$_set(-100, negSciLarge);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.length).assertEqual(threeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_7400
     * @tc.name testFloat64ArrayDollarSet074
     * @tc.desc Verify $_set on offset view updates matching parent buffer element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new ArrayBuffer(32);
      const parent = new Float64Array(b);
      const v = new Float64Array(b, 8, 2);
      v.$_set(0, 9.25);
      const actVal24 = parent.$_get(1);
      const expectVal = 9.25;
      expect(actVal24).assertEqual(expectVal);
      const actVal25 = v.$_get(0);
      const expectVal2 = 9.25;
      expect(actVal25).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_7500
     * @tc.name testFloat64ArrayDollarSet075
     * @tc.desc Verify $_set at last valid index writes value and keeps length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array(4);
      a.$_set(3, 12.0);
      const actVal26 = a.$_get(3);
      const expectVal = 12.0;
      expect(actVal26).assertEqual(expectVal);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_7600
     * @tc.name testFloat64ArrayDollarSet076
     * @tc.desc Verify $_set stores negative zero with signed reciprocal observable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minusZero: number = -0.0;
      const a = new Float64Array(2);
      a.$_set(1, minusZero);
      const actVal27 = a.$_get(1);
      const expectVal = 0.0;
      expect(actVal27).assertEqual(expectVal);
      const actVal28 = 1 / a.$_get(1);
      const expectVal2 = -Infinity;
      expect(actVal28).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_7700
     * @tc.name testFloat64ArrayDollarSet077
     * @tc.desc Verify $_set writes Double.MIN_VALUE exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array(2);
      a.$_set(1, Double.MIN_VALUE);
      const actVal29 = a.$_get(1);
      const expectVal = Double.MIN_VALUE;
      expect(actVal29).assertEqual(expectVal);
      const actVal30 = a.$_get(0);
      const expectVal2 = 0.0;
      expect(actVal30).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_7800
     * @tc.name testFloat64ArrayDollarSet078
     * @tc.desc Verify $_set writes Double.MAX_VALUE exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array(2);
      a.$_set(1, Double.MAX_VALUE);
      const actVal31 = a.$_get(1);
      const expectVal = Double.MAX_VALUE;
      expect(actVal31).assertEqual(expectVal);
      const actVal32 = a.$_get(0);
      const expectVal2 = 0.0;
      expect(actVal32).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_7900
     * @tc.name testFloat64ArrayDollarSet079
     * @tc.desc Verify $_set writes negative infinity without changing neighbor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([1.0, 2.0, 3.0]);
      a.$_set(1, -Infinity);
      const actVal33 = a.$_get(0);
      const expectVal = 1.0;
      expect(actVal33).assertEqual(expectVal);
      const actVal34 = a.$_get(1);
      const expectVal2 = -Infinity;
      expect(actVal34).assertEqual(expectVal2);
      const actVal35 = a.$_get(2);
      const expectVal3 = 3.0;
      expect(actVal35).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_8000
     * @tc.name testFloat64ArrayDollarSet080
     * @tc.desc Verify $_set writes NaN and leaves following element intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([1.0, 2.0]);
      a.$_set(0, NaN);
      const actVal36 = a.$_get(0);
      expect(actVal36).assertNaN();
      const actVal37 = a.$_get(1);
      const expectVal2 = 2.0;
      expect(actVal37).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_8100
     * @tc.name testFloat64ArrayDollarSet081
     * @tc.desc Verify $_set overwrites one element without touching surrounding values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([4.0, 5.0, 6.0]);
      a.$_set(1, 50.0);
      const actVal38 = a.$_get(0);
      const expectVal = 4.0;
      expect(actVal38).assertEqual(expectVal);
      const actVal39 = a.$_get(1);
      const expectVal2 = 50.0;
      expect(actVal39).assertEqual(expectVal2);
      const actVal40 = a.$_get(2);
      const expectVal3 = 6.0;
      expect(actVal40).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_8200
     * @tc.name testFloat64ArrayDollarSet082
     * @tc.desc Verify $_set after fill changes only selected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array(3);
      a.fill(7.0);
      a.$_set(2, 9.0);
      const actVal41 = a.$_get(0);
      const expectVal = 7.0;
      expect(actVal41).assertEqual(expectVal);
      const actVal42 = a.$_get(1);
      const expectVal2 = 7.0;
      expect(actVal42).assertEqual(expectVal2);
      const actVal43 = a.$_get(2);
      const expectVal3 = 9.0;
      expect(actVal43).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_8300
     * @tc.name testFloat64ArrayDollarSet083
     * @tc.desc Verify $_set on subarray updates parent at shifted index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const v = a.subarray(1, 3);
      v.$_set(1, 30.0);
      const actVal44 = a.$_get(2);
      const expectVal = 30.0;
      expect(actVal44).assertEqual(expectVal);
      const actVal45 = v.$_get(1);
      const expectVal2 = 30.0;
      expect(actVal45).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_8400
     * @tc.name testFloat64ArrayDollarSet084
     * @tc.desc Verify $_set accepts index produced by keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array(2);
      const index = a.keys().next().value!;
      a.$_set(index, 14.0);
      const actVal46 = a.$_get(0);
      const expectVal = 14.0;
      expect(actVal46).assertEqual(expectVal);
      const actVal47 = a.$_get(1);
      const expectVal2 = 0.0;
      expect(actVal47).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_8500
     * @tc.name testFloat64ArrayDollarSet085
     * @tc.desc Verify $_set accepts index produced by entries iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([3.0, 4.0]);
      const entry = a.entries().next().value!;
      a.$_set(entry[0], 30.0);
      const actVal48 = a.$_get(0);
      const expectVal = 30.0;
      expect(actVal48).assertEqual(expectVal);
      const actVal49 = a.$_get(1);
      const expectVal2 = 4.0;
      expect(actVal49).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_8600
     * @tc.name testFloat64ArrayDollarSet086
     * @tc.desc Verify $_set positive out-of-range preserves existing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([1.0, 2.0]);
      const oobWriteValue: number = 12345.5;
      let caught = false;
      try {
        a.$_set(2, oobWriteValue);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual("RangeError");
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
      const actVal50 = a.$_get(0);
      const expectVal2 = 1.0;
      expect(actVal50).assertEqual(expectVal2);
      const actVal51 = a.$_get(1);
      const expectVal3 = 2.0;
      expect(actVal51).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DOLLARSET_8700
     * @tc.name testFloat64ArrayDollarSet087
     * @tc.desc Verify $_set negative out-of-range preserves existing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarSet087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([1.0, 2.0]);
      const oobWriteValue: number = -9876.5;
      let caught = false;
      try {
        a.$_set(-1, oobWriteValue);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual("RangeError");
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
      const actVal52 = a.$_get(0);
      const expectVal2 = 1.0;
      expect(actVal52).assertEqual(expectVal2);
      const actVal53 = a.$_get(1);
      const expectVal3 = 2.0;
      expect(actVal53).assertEqual(expectVal3);
    });
  })
}

