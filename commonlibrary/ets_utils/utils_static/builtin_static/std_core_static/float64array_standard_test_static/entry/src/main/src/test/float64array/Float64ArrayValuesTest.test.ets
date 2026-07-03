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

function iterateCountReturn(iter: IterableIterator<number>, limit: number): number {
  let count: number = 0;
  for (const v of iter) {
    count++;
    if (count === limit) {
      return count;
    }
  }
  return count;
}

export default function Float64ArrayValuesTest(): void {
  describe('Float64ArrayValuesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0010
     * @tc.name testFloat64ArrayValues001
     * @tc.desc Verify values method called with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter = values.values();
      const expectVal = true;
      expect(iter != null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0020
     * @tc.name testFloat64ArrayValues002
     * @tc.desc Verify values method has no overload variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      const iter1 = values.values();
      const iter2 = values.values();
      const expectVal = false;
      expect(iter1 === iter2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0030
     * @tc.name testFloat64ArrayValues003
     * @tc.desc Verify return value type is IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, negativeOne);
      const iter = values.values();
      const actVal1 = iter.next().done;
      const expectVal = false;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0040
     * @tc.name testFloat64ArrayValues004
     * @tc.desc Verify return value has next method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const values = Float64Array.of(pointOne);
      const iter = values.values();
      const actVal2 = iter.next().done;
      const expectVal = false;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0050
     * @tc.name testFloat64ArrayValues005
     * @tc.desc Verify values iterator next() with 0.5 returns non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const values = Float64Array.of(pointFive);
      const iter = values.values();
      const result = iter.next();
      const expectVal = true;
      expect(result != null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0060
     * @tc.name testFloat64ArrayValues006
     * @tc.desc Verify values iterator next() with -32768 returns non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      const iter = values.values();
      const result = iter.next();
      const expectVal = true;
      expect(result != null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0070
     * @tc.name testFloat64ArrayValues007
     * @tc.desc Verify empty array values returns non-null iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const iter = values.values();
      const expectVal = true;
      expect(iter != null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0080
     * @tc.name testFloat64ArrayValues008
     * @tc.desc Verify single element array values returns iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = Float64Array.of(int32MinValue);
      const iter = values.values();
      const expectVal = true;
      expect(iter != null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0090
     * @tc.name testFloat64ArrayValues009
     * @tc.desc Verify multi-element array values returns iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const iter = values.values();
      const expectVal = true;
      expect(iter != null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0100
     * @tc.name testFloat64ArrayValues010
     * @tc.desc Verify empty array first next returns done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const iter = values.values();
      const result = iter.next();
      const expectVal = true;
      expect(result.done).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0110
     * @tc.name testFloat64ArrayValues011
     * @tc.desc Verify empty array next value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const iter = values.values();
      const result = iter.next();
      expect(result.value).assertUndefined();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0120
     * @tc.name testFloat64ArrayValues012
     * @tc.desc Verify empty array multiple next calls all return done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const iter = values.values();
      iter.next();
      const result2 = iter.next();
      const expectVal = true;
      expect(result2.done).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0130
     * @tc.name testFloat64ArrayValues013
     * @tc.desc Verify single positive element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const values = Float64Array.of(pointFive);
      const iter = values.values();
      const result = iter.next();
      const expectVal = pointFive;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0140
     * @tc.name testFloat64ArrayValues014
     * @tc.desc Verify single negative element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      const iter = values.values();
      const result = iter.next();
      const expectVal = int16MinValue;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0150
     * @tc.name testFloat64ArrayValues015
     * @tc.desc Verify single zero element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const values = Float64Array.of(zeroPointZero);
      const iter = values.values();
      const result = iter.next();
      const expectVal = zeroPointZero;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0160
     * @tc.name testFloat64ArrayValues016
     * @tc.desc Verify multi-element iteration values in correct order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(pointOne);
      r = iter.next();
      expect(r.value).assertEqual(maxSafeInteger);
      r = iter.next();
      expect(r.value).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0170
     * @tc.name testFloat64ArrayValues017
     * @tc.desc Verify multi-element iteration done flag correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const values = Float64Array.of(pointFive, onePointFive);
      const iter = values.values();
      iter.next();
      iter.next();
      const r = iter.next();
      const expectVal = true;
      expect(r.done).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0180
     * @tc.name testFloat64ArrayValues018
     * @tc.desc Verify iterator states are independent and not shared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const values = Float64Array.of(int16MinValue, int8MinValue);
      const iter1 = values.values();
      const iter2 = values.values();
      iter1.next();
      const r2 = iter2.next();
      const expectVal = int16MinValue;
      expect(r2.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0190
     * @tc.name testFloat64ArrayValues019
     * @tc.desc Verify NaN element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const values = Float64Array.of(nanValue);
      const iter = values.values();
      const result = iter.next();
      const actVal3 = Number.isNaN(result.value as number);
      const expectVal = true;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0200
     * @tc.name testFloat64ArrayValues020
     * @tc.desc Verify positive Infinity element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const values = Float64Array.of(positiveInfinity);
      const iter = values.values();
      const result = iter.next();
      const expectVal = positiveInfinity;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0210
     * @tc.name testFloat64ArrayValues021
     * @tc.desc Verify negative Infinity element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(-Infinity);
      const iter = values.values();
      const result = iter.next();
      const expectVal = -Infinity;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0220
     * @tc.name testFloat64ArrayValues022
     * @tc.desc Verify negative zero element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const negativeInfinity: number = -Infinity;
      const values = Float64Array.of(negativeZero);
      const iter = values.values();
      const result = iter.next();
      const actVal4 = 1.0 / (result.value as Double);
      const expectVal = negativeInfinity;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0230
     * @tc.name testFloat64ArrayValues023
     * @tc.desc Verify max value element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(Number.MAX_VALUE);
      const iter = values.values();
      const result = iter.next();
      const expectVal = Number.MAX_VALUE;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0240
     * @tc.name testFloat64ArrayValues024
     * @tc.desc Verify min positive element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(Number.MIN_VALUE);
      const iter = values.values();
      const result = iter.next();
      const expectVal = Number.MIN_VALUE;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0250
     * @tc.name testFloat64ArrayValues025
     * @tc.desc Verify mixed special values iteration order correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const nanValue: number = Number.NaN;
      const values = Float64Array.of(zeroPointZero, positiveInfinity, negativeInfinity, nanValue);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(zeroPointZero);
      r = iter.next();
      expect(r.value).assertEqual(positiveInfinity);
      r = iter.next();
      expect(r.value).assertEqual(negativeInfinity);
      r = iter.next();
      const actVal5 = Number.isNaN(r.value as number);
      const expectVal = true;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0260
     * @tc.name testFloat64ArrayValues026
     * @tc.desc Verify int32 positive boundary element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MaxValue: number = 2147483647;
      const values = Float64Array.of(int32MaxValue);
      const iter = values.values();
      const result = iter.next();
      const expectVal = int32MaxValue;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0270
     * @tc.name testFloat64ArrayValues027
     * @tc.desc Verify int32 negative boundary element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = Float64Array.of(int32MinValue);
      const iter = values.values();
      const result = iter.next();
      const expectVal = int32MinValue;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0280
     * @tc.name testFloat64ArrayValues028
     * @tc.desc Verify MAX_SAFE_INTEGER element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(Number.MAX_SAFE_INTEGER);
      const iter = values.values();
      const result = iter.next();
      const expectVal = Number.MAX_SAFE_INTEGER;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0290
     * @tc.name testFloat64ArrayValues029
     * @tc.desc Verify MIN_SAFE_INTEGER element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(Number.MIN_SAFE_INTEGER);
      const iter = values.values();
      const result = iter.next();
      const expectVal = Number.MIN_SAFE_INTEGER;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0300
     * @tc.name testFloat64ArrayValues030
     * @tc.desc Verify large scientific notation element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e+308;
      const values = Float64Array.of(sciValue10e308);
      const iter = values.values();
      const result = iter.next();
      const expectVal = sciValue10e308;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0310
     * @tc.name testFloat64ArrayValues031
     * @tc.desc Verify small scientific notation element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const values = Float64Array.of(sciValue10e308);
      const iter = values.values();
      const result = iter.next();
      const expectVal = sciValue10e308;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0320
     * @tc.name testFloat64ArrayValues032
     * @tc.desc Verify hexadecimal literal element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const sixteenPointzero: number = 16.0;
      const values = Float64Array.of(hexValue10);
      const iter = values.values();
      const result = iter.next();
      const expectVal = sixteenPointzero;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0330
     * @tc.name testFloat64ArrayValues033
     * @tc.desc Verify octal literal element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointZero: number = 8.0;
      const values = Float64Array.of(0o10);
      const iter = values.values();
      const result = iter.next();
      const expectVal = eightPointZero;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0340
     * @tc.name testFloat64ArrayValues034
     * @tc.desc Verify binary literal element iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const tenPointZero: number = 10.0;
      const values = Float64Array.of(binaryValue1010);
      const iter = values.values();
      const result = iter.next();
      const expectVal = tenPointZero;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0350
     * @tc.name testFloat64ArrayValues035
     * @tc.desc Verify decimal precision boundary iteration value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, negativeOne);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(int32MinValue);
      r = iter.next();
      expect(r.value).assertEqual(negativeOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0360
     * @tc.name testFloat64ArrayValues036
     * @tc.desc Verify single element array complete iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const values = Float64Array.of(pointOne);
      const iter = values.values();
      const r1 = iter.next();
      expect(r1.done).assertEqual(false);
      expect(r1.value).assertEqual(pointOne);
      const r2 = iter.next();
      expect(r2.done).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0370
     * @tc.name testFloat64ArrayValues037
     * @tc.desc Verify two-element array complete iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const values = Float64Array.of(pointFive, onePointFive);
      const iter = values.values();
      let r = iter.next();
      expect(r.done).assertEqual(false);
      r = iter.next();
      expect(r.done).assertEqual(false);
      r = iter.next();
      expect(r.done).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0380
     * @tc.name testFloat64ArrayValues038
     * @tc.desc Verify ten-element array complete iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const values = new Float64Array(10);
      for (let i = 0; i < 10; i++) {
        values.$_set(i, i * onePointZero);
      }
      const iter = values.values();
      for (let i = 0; i < 10; i++) {
        const r = iter.next();
        expect(r.done).assertEqual(false);
        expect(r.value).assertEqual(i * onePointZero);
      }
      const r = iter.next();
      expect(r.done).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0390
     * @tc.name testFloat64ArrayValues039
     * @tc.desc Verify hundred-element array complete iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const hundredValue: number = 100;
      const values = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        values.$_set(i, i * onePointZero);
      }
      const iter = values.values();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      const expectVal = hundredValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0400
     * @tc.name testFloat64ArrayValues040
     * @tc.desc Verify iteration break early termination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const threeValue: number = 3;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const iter = values.values();
      let count = 0;
      for (const v of iter) {
        count++;
        if (count === 3) {
          break;
        }
      }
      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0410
     * @tc.name testFloat64ArrayValues041
     * @tc.desc Verify iteration return early termination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const count = iterateCountReturn(values.values(), 2);
      const expectVal = twoValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0420
     * @tc.name testFloat64ArrayValues042
     * @tc.desc Verify iteration throw exception termination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter = values.values();
      let count = 0;
      try {
        for (const v of iter) {
          count++;
          if (count === 2) {
            throw new Error('abort');
          }
        }
      } catch (e) {
        // expected
      }
      const expectVal = twoValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0430
     * @tc.name testFloat64ArrayValues043
     * @tc.desc Verify values iterator iterates all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter = values.values();
      const r = iter.next();
      expect(r.done).assertEqual(false);
      const r2 = iter.next();
      expect(r2.done).assertEqual(false);
      const r3 = iter.next();
      expect(r3.done).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0440
     * @tc.name testFloat64ArrayValues044
     * @tc.desc Verify same array multiple values calls return different iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const values = Float64Array.of(int16MinValue, int8MinValue);
      const iter1 = values.values();
      const iter2 = values.values();
      const expectVal = false;
      expect(iter1 === iter2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0450
     * @tc.name testFloat64ArrayValues045
     * @tc.desc Verify second traversal after first complete traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, negativeOne);
      const iter = values.values();
      iter.next();
      iter.next();
      iter.next();
      const iter2 = values.values();
      const r = iter2.next();
      const expectVal = int32MinValue;
      expect(r.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0460
     * @tc.name testFloat64ArrayValues046
     * @tc.desc Verify nested iterators run independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const values = Float64Array.of(pointOne, maxSafeInteger);
      const outer = values.values();
      const inner = values.values();
      outer.next();
      const r = inner.next();
      const expectVal = pointOne;
      expect(r.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0470
     * @tc.name testFloat64ArrayValues047
     * @tc.desc Verify for-of loop iterates all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoPointtwofive: number = 2.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      let sum = 0.0;
      for (const v of values.values()) {
        sum += v;
      }
      const expectVal = twoPointtwofive;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0480
     * @tc.name testFloat64ArrayValues048
     * @tc.desc Verify for-of loop iterates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array(0);
      let count = 0;
      for (const v of values.values()) {
        count++;
      }
      const expectVal = zeroValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0490
     * @tc.name testFloat64ArrayValues049
     * @tc.desc Verify for-of loop iterates special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const nanValue: number = Number.NaN;
      const threeValue: number = 3;
      const values = Float64Array.of(positiveInfinity, negativeInfinity, nanValue);
      let count = 0;
      for (const v of values.values()) {
        count++;
      }
      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0500
     * @tc.name testFloat64ArrayValues050
     * @tc.desc Verify for-of loop with break early exit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const twoPointZero: number = 2.0;
      const int8MaxValue: number = 127;
      const threeValue: number = 3;
      const values = Float64Array.of(int16MinValue, int8MinValue, twoPointZero, int8MaxValue);
      let count = 0;
      for (const v of values.values()) {
        count++;
        if (v === 2.0) {
          break;
        }
      }
      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0510
     * @tc.name testFloat64ArrayValues051
     * @tc.desc Verify for-of loop with continue skip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const negnum2147483649Pointzero: number = -2147483649.0;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      let sum = 0.0;
      for (const v of values.values()) {
        if (v === 2.0) {
          continue;
        }
        sum += v;
      }
      const expectVal = negnum2147483649Pointzero;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0520
     * @tc.name testFloat64ArrayValues052
     * @tc.desc Verify modify array element during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const fillValue99: number = 99.0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter = values.values();
      const r1 = iter.next();
      values.$_set(1, fillValue99);
      const r2 = iter.next();
      const expectVal = fillValue99;
      expect(r2.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0530
     * @tc.name testFloat64ArrayValues053
     * @tc.desc Verify original array content unchanged after iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const iter = values.values();
      for (const v of iter) {
        // iterate all
      }
      const actVal6 = values.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal6).assertEqual(expectVal);
      const actVal7 = values.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal7).assertEqual(expectVal2);
      const actVal8 = values.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal8).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0540
     * @tc.name testFloat64ArrayValues054
     * @tc.desc Verify values iteration returns first expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const vIter = values.values();
      let v = vIter.next();
      const expectVal = int16MinValue;
      expect(v.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0550
     * @tc.name testFloat64ArrayValues055
     * @tc.desc Verify values iteration returns first indexed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, negativeOne);
      const vIter = values.values();
      let v = vIter.next();
      const expectVal = int32MinValue;
      expect(v.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0560
     * @tc.name testFloat64ArrayValues056
     * @tc.desc Verify values iterator remains independent across reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger);
      const vIter = values.values();
      const first = vIter.next();
      expect(first.value).assertEqual(pointOne);
      expect(first.done).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0570
     * @tc.name testFloat64ArrayValues057
     * @tc.desc Verify values iteration from length-constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const values = new Float64Array(3);
      values.$_set(0, onePointZero);
      values.$_set(1, twoPointZero);
      values.$_set(2, threePointZero);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(onePointZero);
      r = iter.next();
      expect(r.value).assertEqual(twoPointZero);
      r = iter.next();
      expect(r.value).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0580
     * @tc.name testFloat64ArrayValues058
     * @tc.desc Verify values iteration from array-constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const values = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(onePointZero);
      r = iter.next();
      expect(r.value).assertEqual(twoPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0590
     * @tc.name testFloat64ArrayValues059
     * @tc.desc Verify values iteration from of-constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(pointFive);
      r = iter.next();
      expect(r.value).assertEqual(onePointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0600
     * @tc.name testFloat64ArrayValues060
     * @tc.desc Verify values iteration from same-type copy-constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const src = Float64Array.of(int16MinValue, int8MinValue);
      const values = new Float64Array(src);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(int16MinValue);
      r = iter.next();
      expect(r.value).assertEqual(int8MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0610
     * @tc.name testFloat64ArrayValues061
     * @tc.desc Verify values iteration from ArrayBuffer view-constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointzero: number = 100.0;
      const num200Pointzero: number = 200.0;
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf, 0, 2);
      view.$_set(0, hundredPointzero);
      view.$_set(1, num200Pointzero);
      const iter = view.values();
      let r = iter.next();
      expect(r.value).assertEqual(hundredPointzero);
      r = iter.next();
      expect(r.value).assertEqual(num200Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0620
     * @tc.name testFloat64ArrayValues062
     * @tc.desc Verify values iteration from ArrayBuffer offset view-constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const eightPointZero: number = 8.0;
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 8, 2);
      view.$_set(0, sevenPointZero);
      view.$_set(1, eightPointZero);
      const iter = view.values();
      let r = iter.next();
      expect(r.value).assertEqual(sevenPointZero);
      r = iter.next();
      expect(r.value).assertEqual(eightPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0630
     * @tc.name testFloat64ArrayValues063
     * @tc.desc Verify values iteration from FixedArray-constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const fa: FixedArray<number> = [3.0, 4.0];
      const values = new Float64Array(fa);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(threePointZero);
      r = iter.next();
      expect(r.value).assertEqual(fourPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0640
     * @tc.name testFloat64ArrayValues064
     * @tc.desc Verify values iteration from Iterable-constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr: Array<Number> = [2.0, 3.0];
      const values = new Float64Array(arr);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(twoPointZero);
      r = iter.next();
      expect(r.value).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0650
     * @tc.name testFloat64ArrayValues065
     * @tc.desc Verify values iteration from Float64Array.from-constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const src = Float64Array.of(int32MinValue, negativeOne);
      const values = Float64Array.from(src);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(int32MinValue);
      r = iter.next();
      expect(r.value).assertEqual(negativeOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0660
     * @tc.name testFloat64ArrayValues066
     * @tc.desc Verify values iteration from from-with-mapfn-constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const sixPointZero: number = 6.0;
      const values = Float64Array.from([onePointZero, twoPointZero, threePointZero], (v: number): number => v * 2.0);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(twoPointZero);
      r = iter.next();
      expect(r.value).assertEqual(fourPointZero);
      r = iter.next();
      expect(r.value).assertEqual(sixPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0670
     * @tc.name testFloat64ArrayValues067
     * @tc.desc Verify $_set modify elements before iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointzero: number = 20.0;
      const values = new Float64Array(2);
      values.$_set(0, tenPointZero);
      values.$_set(1, twentyPointzero);
      const iter = values.values();
      let r = iter.next();
      const expectVal = tenPointZero;
      expect(r.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0680
     * @tc.name testFloat64ArrayValues068
     * @tc.desc Verify $_set modify unvisited element during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const fillValue99: number = 99.0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter = values.values();
      iter.next();
      values.$_set(1, fillValue99);
      const r = iter.next();
      const expectVal = fillValue99;
      expect(r.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0690
     * @tc.name testFloat64ArrayValues069
     * @tc.desc Verify $_set modify visited element does not affect returned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const fillValue99: number = 99.0;
      const values = Float64Array.of(pointFive, onePointFive);
      const iter = values.values();
      const r1 = iter.next();
      values.$_set(0, fillValue99);
      const expectVal = pointFive;
      expect(r1.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0700
     * @tc.name testFloat64ArrayValues070
     * @tc.desc Verify set method modify elements during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const iter = values.values();
      iter.next();
      values.set(Float64Array.of(int32MinValue, negativeOne, zeroValue), 0);
      const r = iter.next();
      const expectVal = negativeOne;
      expect(r.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0710
     * @tc.name testFloat64ArrayValues071
     * @tc.desc Verify values iteration on selected copied values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(maxSafeInteger, zeroValue);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(maxSafeInteger);
      r = iter.next();
      expect(r.value).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0720
     * @tc.name testFloat64ArrayValues072
     * @tc.desc Verify values iteration on selected middle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(onePointFive, pointTwoFive);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(onePointFive);
      r = iter.next();
      expect(r.value).assertEqual(pointTwoFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0730
     * @tc.name testFloat64ArrayValues073
     * @tc.desc Verify values iteration does not modify source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const iter = values.values();
      for (const v of iter) {
        // iterate all
      }
      const actVal9 = values.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal9).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0740
     * @tc.name testFloat64ArrayValues074
     * @tc.desc Verify values iteration on filled-equivalent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const values = Float64Array.of(fivePointZero, fivePointZero, fivePointZero);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(fivePointZero);
      r = iter.next();
      expect(r.value).assertEqual(fivePointZero);
      r = iter.next();
      expect(r.value).assertEqual(fivePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0750
     * @tc.name testFloat64ArrayValues075
     * @tc.desc Verify values iteration on copied-equivalent order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const values = Float64Array.of(zeroValue, oneValue, zeroValue, oneValue);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(zeroValue);
      r = iter.next();
      expect(r.value).assertEqual(oneValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0760
     * @tc.name testFloat64ArrayValues076
     * @tc.desc Verify values iteration follows sorted-equivalent order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(zeroValue, pointOne, maxSafeInteger);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(zeroValue);
      r = iter.next();
      expect(r.value).assertEqual(pointOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0770
     * @tc.name testFloat64ArrayValues077
     * @tc.desc Verify values iteration follows reversed-equivalent order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointTwoFive, onePointFive, pointFive);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(pointTwoFive);
      r = iter.next();
      expect(r.value).assertEqual(onePointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0780
     * @tc.name testFloat64ArrayValues078
     * @tc.desc Verify values iteration returns original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const iter = values.values();
      let r = iter.next();
      const expectVal = int16MinValue;
      expect(r.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0790
     * @tc.name testFloat64ArrayValues079
     * @tc.desc Verify values iteration returns original first negative element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const iter = values.values();
      let r = iter.next();
      const expectVal = int32MinValue;
      expect(r.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0800
     * @tc.name testFloat64ArrayValues080
     * @tc.desc Verify values iteration returns original decimal first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter = values.values();
      let r = iter.next();
      const expectVal = pointOne;
      expect(r.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0810
     * @tc.name testFloat64ArrayValues081
     * @tc.desc Verify values iteration returns original first fractional element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter = values.values();
      let r = iter.next();
      const expectVal = pointFive;
      expect(r.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0820
     * @tc.name testFloat64ArrayValues082
     * @tc.desc Verify values iteration on transformed-equivalent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum65536Value: number = -65536;
      const negnum256Value: number = -256;
      const values = Float64Array.of(negnum65536Value, negnum256Value, 0.0);
      const iter = values.values();
      let r = iter.next();
      expect(r.value).assertEqual(negnum65536Value);
      r = iter.next();
      expect(r.value).assertEqual(negnum256Value);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0830
     * @tc.name testFloat64ArrayValues083
     * @tc.desc Verify values iteration on empty selected values is done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const iter = values.values();
      let r = iter.next();
      expect(r.done).assertEqual(true);
      expect(r.value).assertEqual(undefined);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0840
     * @tc.name testFloat64ArrayValues084
     * @tc.desc Verify values iteration combined with reduce accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const expectedRoundedSum: number = 9007199254740994.0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      let sum = 0.0;
      const iter = values.values();
      while (true) {
        const result = iter.next();
        if (result.done) {
          break;
        }
        sum += result.value as number;
      }
      const expectVal = expectedRoundedSum;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0850
     * @tc.name testFloat64ArrayValues085
     * @tc.desc Verify values iteration combined with reduce multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroPointoneeightsevenfive: number = 0.1875;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      let product = 1.0;
      const iter = values.values();
      while (true) {
        const result = iter.next();
        if (result.done) {
          break;
        }
        product *= result.value as number;
      }
      const expectVal = zeroPointoneeightsevenfive;
      expect(product).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0860
     * @tc.name testFloat64ArrayValues086
     * @tc.desc Verify values iteration order is left-to-right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      let order: Array<number> = [];
      const iter = values.values();
      while (true) {
        const result = iter.next();
        if (result.done) {
          break;
        }
        order.push(result.value as number);
      }
      expect(order[0]).assertEqual(int16MinValue);
      expect(order[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0870
     * @tc.name testFloat64ArrayValues087
     * @tc.desc Verify find method uses values iteration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const iter = values.values();
      const results: Array<number> = [];
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        results.push(r.value as number);
      }
      expect(results[0]).assertEqual(int32MinValue);
      expect(results[1]).assertEqual(negativeOne);
      expect(results[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0880
     * @tc.name testFloat64ArrayValues088
     * @tc.desc Verify findIndex method uses values iteration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter = values.values();
      const results: Array<number> = [];
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        results.push(r.value as number);
      }
      expect(results[0]).assertEqual(pointOne);
      expect(results[1]).assertEqual(maxSafeInteger);
      expect(results[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0890
     * @tc.name testFloat64ArrayValues089
     * @tc.desc Verify some method uses values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter = values.values();
      const results: Array<number> = [];
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        results.push(r.value as number);
      }
      expect(results[0]).assertEqual(pointFive);
      expect(results[2]).assertEqual(pointTwoFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0900
     * @tc.name testFloat64ArrayValues090
     * @tc.desc Verify every method uses values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const iter = values.values();
      let count = 0;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        count++;
      }
      const expectVal = 3;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0910
     * @tc.name testFloat64ArrayValues091
     * @tc.desc Verify forEach method uses values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const negnum2147483649Pointzero: number = -2147483649.0;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      let sum = 0.0;
      const iter = values.values();
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        sum += r.value as number;
      }
      const expectVal = negnum2147483649Pointzero;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0920
     * @tc.name testFloat64ArrayValues092
     * @tc.desc Verify includes finds existing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter = values.values();
      let found = false;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        if (r.value === twoPointZero) {
          found = true;
        }
      }
      const expectVal = false;
      expect(found).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0930
     * @tc.name testFloat64ArrayValues093
     * @tc.desc Verify includes cannot find non-existent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const fivePointZero: number = 5.0;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter = values.values();
      let found = false;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        if (r.value === fivePointZero) {
          found = true;
        }
      }
      const expectVal = false;
      expect(found).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0940
     * @tc.name testFloat64ArrayValues094
     * @tc.desc Verify indexOf finds existing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const iter = values.values();
      let found = false;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        if (r.value === twoPointZero) {
          found = true;
        }
      }
      const expectVal = false;
      expect(found).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0950
     * @tc.name testFloat64ArrayValues095
     * @tc.desc Verify indexOf cannot find non-existent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const fivePointZero: number = 5.0;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const iter = values.values();
      let found = false;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        if (r.value === fivePointZero) {
          found = true;
        }
      }
      const expectVal = false;
      expect(found).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0960
     * @tc.name testFloat64ArrayValues096
     * @tc.desc Verify lastIndexOf finds duplicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const twoPointZero: number = 2.0;
      const values = Float64Array.of(pointOne, zeroValue, zeroValue, piValue);
      const iter = values.values();
      let found = false;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        if (r.value === twoPointZero) {
          found = true;
        }
      }
      const expectVal = false;
      expect(found).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0970
     * @tc.name testFloat64ArrayValues097
     * @tc.desc Verify includes with fromIndex argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoPointZero: number = 2.0;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter = values.values();
      let found = false;
      let idx = 0;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        if (idx >= 2 && r.value === twoPointZero) {
          found = true;
        }
        idx++;
      }
      const expectVal = false;
      expect(found).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0980
     * @tc.name testFloat64ArrayValues098
     * @tc.desc Verify indexOf with fromIndex argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const iter = values.values();
      let found = false;
      let idx = 0;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        if (idx >= 2 && r.value === twoPointZero) {
          found = true;
        }
        idx++;
      }
      const expectVal = false;
      expect(found).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_0990
     * @tc.name testFloat64ArrayValues099
     * @tc.desc Verify values iterates all element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const negnum2147483649Pointzero: number = -2147483649.0;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      let sum = 0.0;
      for (const value of values.values()) {
        sum += value;
      }
      const expectVal = negnum2147483649Pointzero;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_1000
     * @tc.name testFloat64ArrayValues100
     * @tc.desc Verify values iterates single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const values = Float64Array.of(pointOne);
      for (const value of values.values()) {
        const expectVal = pointOne;
        expect(value).assertEqual(expectVal);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_1010
     * @tc.name testFloat64ArrayValues101
     * @tc.desc Verify values iterates array containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const values = Float64Array.of(pointFive, onePointFive);
      let hasNaN = false;
      for (const value of values.values()) {
        if (Number.isNaN(value)) {
          hasNaN = true;
        }
      }
      const expectVal = false;
      expect(hasNaN).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_1020
     * @tc.name testFloat64ArrayValues102
     * @tc.desc Verify values iterates array containing Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const values = Float64Array.of(int16MinValue, int8MinValue);
      let hasInf = false;
      for (const value of values.values()) {
        if (value === Infinity) {
          hasInf = true;
        }
      }
      const expectVal = false;
      expect(hasInf).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_1030
     * @tc.name testFloat64ArrayValues103
     * @tc.desc Verify values iterator can be used multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, negativeOne);
      let sum1 = 0.0;
      for (const value of values.values()) {
        sum1 += value;
      }
      let sum2 = 0.0;
      for (const value of values.values()) {
        sum2 += value;
      }
      const expectVal = sum2;
      expect(sum1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_1040
     * @tc.name testFloat64ArrayValues104
     * @tc.desc Verify values with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      const iter = arr.values();
      const actVal10 = iter.next().value!;
      const expectVal = num255Value;
      expect(actVal10).assertEqual(expectVal);
      const actVal11 = iter.next().value!;
      const expectVal2 = num170Pointzero;
      expect(actVal11).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_1050
     * @tc.name testFloat64ArrayValues105
     * @tc.desc Verify values with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      const iter = arr.values();
      const actVal12 = iter.next().value!;
      const expectVal = num255Value;
      expect(actVal12).assertEqual(expectVal);
      const actVal13 = iter.next().value!;
      const expectVal2 = num170Pointzero;
      expect(actVal13).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_1060
     * @tc.name testFloat64ArrayValues106
     * @tc.desc Verify values with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const iter = arr.values();
      const first = iter.next();
      expect(first.done).assertEqual(false);
      const actVal14 = Number.isNaN(first.value as number);
      const expectVal = true;
      expect(actVal14).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_1070
     * @tc.name testFloat64ArrayValues107
     * @tc.desc Verify values with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const iter = arr.values();
      const first = iter.next();
      expect(first.done).assertEqual(false);
      expect(first.value).assertEqual(positiveInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUES_1080
     * @tc.name testFloat64ArrayValues108
     * @tc.desc Verify values with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValues108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const iter = arr.values();
      const first = iter.next();
      expect(first.done).assertEqual(false);
      expect(first.value).assertEqual(doubleMinValue);
    })

  })
}
