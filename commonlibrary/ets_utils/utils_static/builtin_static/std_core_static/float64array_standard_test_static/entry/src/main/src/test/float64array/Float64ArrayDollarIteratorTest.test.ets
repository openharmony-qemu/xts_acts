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

export default function Float64ArrayDollarIteratorTest(): void {
  describe('Float64ArrayDollarIteratorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0100
     * @tc.name testFloat64ArrayDollarIterator001
     * @tc.desc Verify $_iterator with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const values = Float64Array.of(int32MinValue, -1, zeroValue);
      const iter = values.$_iterator();
      const expectVal = false;
      expect(iter === null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0200
     * @tc.name testFloat64ArrayDollarIterator002
     * @tc.desc Verify $_iterator single signature no overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(3);
      const iter = values.$_iterator();
      const expectVal = false;
      expect(iter === null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0300
     * @tc.name testFloat64ArrayDollarIterator003
     * @tc.desc Verify return value type is IterableIterator with next method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const values = Float64Array.of(pointOne, maxSafeInteger);
      const iter = values.$_iterator();
      const expectVal = false;
      expect(iter.next === null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0400
     * @tc.name testFloat64ArrayDollarIterator004
     * @tc.desc Verify return value has next method that returns result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const values = Float64Array.of(pointFive);
      const iter = values.$_iterator();
      const result = iter.next();
      const expectVal = false;
      expect(result === null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0500
     * @tc.name testFloat64ArrayDollarIterator005
     * @tc.desc Verify iterator next() returns valid result with -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      const iter = values.$_iterator();
      const result = iter.next();
      const expectVal = false;
      expect(result === null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0600
     * @tc.name testFloat64ArrayDollarIterator006
     * @tc.desc Verify iterator next() returns valid result with -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = Float64Array.of(int32MinValue);
      const iter = values.$_iterator();
      const result = iter.next();
      const expectVal = false;
      expect(result === null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0700
     * @tc.name testFloat64ArrayDollarIterator007
     * @tc.desc Verify iterator is not null with 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const values = Float64Array.of(pointOne);
      const iter = values.$_iterator();
      const expectVal = false;
      expect(iter === null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0800
     * @tc.name testFloat64ArrayDollarIterator008
     * @tc.desc Verify empty array $_iterator completes immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const iter = values.$_iterator();
      const first = iter.next();
      const expectVal = true;
      expect(first.done).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0900
     * @tc.name testFloat64ArrayDollarIterator009
     * @tc.desc Verify empty array $_iterator returns undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const iter = values.$_iterator();
      const result = iter.next();
      expect(result.value).assertUndefined();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1000
     * @tc.name testFloat64ArrayDollarIterator010
     * @tc.desc Verify for...of on empty array does not execute loop body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array(0);
      let count = 0;
      const iter010 = values.$_iterator();
      while (true) {
        const result = iter010.next();
        if (result.done) {
          break;
        }
        count++;
      }
      const expectVal = zeroValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1100
     * @tc.name testFloat64ArrayDollarIterator011
     * @tc.desc Verify single-element array $_iterator first next returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const values = Float64Array.of(pointFive);
      const iter = values.$_iterator();
      const result = iter.next();
      const expectVal = pointFive;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1200
     * @tc.name testFloat64ArrayDollarIterator012
     * @tc.desc Verify single-element array $_iterator second next completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      const iter = values.$_iterator();
      iter.next();
      const second = iter.next();
      const expectVal = true;
      expect(second.done).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1300
     * @tc.name testFloat64ArrayDollarIterator013
     * @tc.desc Verify dollariterator with [-2147483648] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const oneValue: number = 1;
      const values = Float64Array.of(int32MinValue);
      let count = 0;
      const iter013 = values.$_iterator();
      while (true) {
        const result = iter013.next();
        if (result.done) {
          break;
        }
        count++;
      }
      const expectVal = oneValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1400
     * @tc.name testFloat64ArrayDollarIterator014
     * @tc.desc Verify single-element array $_iterator returns value type number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const values = Float64Array.of(pointOne);
      const iter = values.$_iterator();
      const result = iter.next();
      const expectVal = pointOne;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1500
     * @tc.name testFloat64ArrayDollarIterator015
     * @tc.desc Verify three-element array $_iterator returns all elements sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter = values.$_iterator();
      const r1 = iter.next();
      const r2 = iter.next();
      const r3 = iter.next();
      expect(r1.value).assertEqual(pointFive);
      expect(r2.value).assertEqual(onePointFive);
      expect(r3.value).assertEqual(pointTwoFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1600
     * @tc.name testFloat64ArrayDollarIterator016
     * @tc.desc Verify three-element array $_iterator fourth next completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const values = Float64Array.of(int16MinValue, -128, zeroValue);
      const iter = values.$_iterator();
      iter.next();
      iter.next();
      iter.next();
      const fourth = iter.next();
      const expectVal = true;
      expect(fourth.done).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1700
     * @tc.name testFloat64ArrayDollarIterator017
     * @tc.desc Verify for...of on three-element array executes three times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const values = Float64Array.of(int32MinValue, -1, zeroValue);
      let count = 0;
      const iter017 = values.$_iterator();
      while (true) {
        const result = iter017.next();
        if (result.done) {
          break;
        }
        count++;
      }
      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1800
     * @tc.name testFloat64ArrayDollarIterator018
     * @tc.desc Verify for...of on three-element array collects values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const collected: Array<number> = [];
      const iter018 = values.$_iterator();
      while (true) {
        const result = iter018.next();
        if (result.done) {
          break;
        }
        collected.push(result.value as number);
      }
      const expectVal = threeValue;
      expect(collected.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1900
     * @tc.name testFloat64ArrayDollarIterator019
     * @tc.desc Verify ten-element array $_iterator complete traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const zeroValue: number = 0;
      const tenValue: number = 10;
      const values =
        Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive, zeroValue,
          zeroValue, zeroValue, zeroValue, zeroValue);
      const iter = values.$_iterator();
      let i = 0;
      while (!iter.next().done) {
        i++;
      }
      const expectVal = tenValue;
      expect(i).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_2000
     * @tc.name testFloat64ArrayDollarIterator020
     * @tc.desc Verify ten-element array $_iterator fifth next returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const values =
        Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue, zeroValue, zeroValue, zeroValue,
          zeroValue, zeroValue);
      const iter = values.$_iterator();
      for (let j = 0; j < 4; j++) {
        iter.next();
      }
      const fifth = iter.next();
      const expectVal = int16MaxValue;
      expect(fifth.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_2100
     * @tc.name testFloat64ArrayDollarIterator021
     * @tc.desc Verify element with Double.MAX_VALUE in $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = Float64Array.of(int32MinValue);
      const iter = values.$_iterator();
      const result = iter.next();
      const expectVal = int32MinValue;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_2200
     * @tc.name testFloat64ArrayDollarIterator022
     * @tc.desc Verify element with NaN in $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter = values.$_iterator();
      iter.next();
      const nanResult = iter.next();
      const actVal1 = Number.isNaN(nanResult.value as number);
      const expectVal = false;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_2300
     * @tc.name testFloat64ArrayDollarIterator023
     * @tc.desc Verify element with Infinity in $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MinValue: number = -128;
      const values = Float64Array.of(int16MinValue, -128, zeroValue);
      const iter = values.$_iterator();
      iter.next();
      const infResult = iter.next();
      const expectVal = int8MinValue;
      expect(infResult.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_2400
     * @tc.name testFloat64ArrayDollarIterator024
     * @tc.desc Verify element with -Infinity in $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, -1, zeroValue);
      const iter = values.$_iterator();
      iter.next();
      const negInfResult = iter.next();
      const expectVal = negativeOne;
      expect(negInfResult.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_2500
     * @tc.name testFloat64ArrayDollarIterator025
     * @tc.desc Verify element with -0.0 in $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter = values.$_iterator();
      iter.next();
      const negZeroResult = iter.next();
      const expectVal = maxSafeInteger;
      expect(negZeroResult.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_2600
     * @tc.name testFloat64ArrayDollarIterator026
     * @tc.desc Verify element with 0.0 in $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter = values.$_iterator();
      iter.next();
      const zeroResult = iter.next();
      const expectVal = onePointFive;
      expect(zeroResult.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_2700
     * @tc.name testFloat64ArrayDollarIterator027
     * @tc.desc Verify elements with negative values in $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MinValue: number = -128;
      const values = Float64Array.of(int16MinValue, -128, zeroValue);
      const iter = values.$_iterator();
      const r1 = iter.next();
      const r2 = iter.next();
      const r3 = iter.next();
      expect(r1.value).assertEqual(int16MinValue);
      expect(r2.value).assertEqual(int8MinValue);
      expect(r3.value).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_2800
     * @tc.name testFloat64ArrayDollarIterator028
     * @tc.desc Verify elements with scientific notation in $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, -1, zeroValue);
      const iter = values.$_iterator();
      const r1 = iter.next();
      const r2 = iter.next();
      const r3 = iter.next();
      expect(r1.value).assertEqual(int32MinValue);
      expect(r2.value).assertEqual(negativeOne);
      expect(r3.value).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_2900
     * @tc.name testFloat64ArrayDollarIterator029
     * @tc.desc Verify elements with integer values in $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter = values.$_iterator();
      const r1 = iter.next();
      const r2 = iter.next();
      const r3 = iter.next();
      expect(r1.value).assertEqual(pointOne);
      expect(r2.value).assertEqual(maxSafeInteger);
      expect(r3.value).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_3000
     * @tc.name testFloat64ArrayDollarIterator030
     * @tc.desc Verify element with MAX_SAFE_INTEGER in $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      const iter = values.$_iterator();
      const result = iter.next();
      const expectVal = int16MinValue;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_3100
     * @tc.name testFloat64ArrayDollarIterator031
     * @tc.desc Verify $_iterator returns value and done=false on first next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const values = Float64Array.of(pointFive);
      const iter = values.$_iterator();
      const result = iter.next();
      expect(result.value).assertEqual(pointFive);
      expect(result.done).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_3200
     * @tc.name testFloat64ArrayDollarIterator032
     * @tc.desc Verify $_iterator returns done=true and undefined value after exhausted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      const iter = values.$_iterator();
      iter.next();
      const exhausted = iter.next();
      const expectVal = true;
      expect(exhausted.done).assertEqual(expectVal);
      expect(exhausted.value).assertUndefined();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_3300
     * @tc.name testFloat64ArrayDollarIterator033
     * @tc.desc Verify $_iterator can call next multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, -1);
      const iter = values.$_iterator();
      const r1 = iter.next();
      const r2 = iter.next();
      const r3 = iter.next();
      expect(r1.value).assertEqual(int32MinValue);
      expect(r2.value).assertEqual(negativeOne);
      expect(r3.done).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_3400
     * @tc.name testFloat64ArrayDollarIterator034
     * @tc.desc Verify iterator exhausted after full next traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter = values.$_iterator();
      const r1 = iter.next();
      expect(r1.value).assertEqual(pointOne);
      const r2 = iter.next();
      expect(r2.value).assertEqual(maxSafeInteger);
      const r3 = iter.next();
      expect(r3.value).assertEqual(zeroValue);
      const r4 = iter.next();
      expect(r4.done).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_3500
     * @tc.name testFloat64ArrayDollarIterator035
     * @tc.desc Verify iterator state after partial traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const values = Float64Array.of(pointFive, onePointFive);
      const iter = values.$_iterator();
      const r1 = iter.next();
      expect(r1.value).assertEqual(pointFive);
      expect(r1.done).assertEqual(false);
      const r2 = iter.next();
      expect(r2.value).assertEqual(onePointFive);
      expect(r2.done).assertEqual(false);
      const r3 = iter.next();
      expect(r3.done).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_3600
     * @tc.name testFloat64ArrayDollarIterator036
     * @tc.desc Verify $_iterator Symbol.iterator returns itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      const iter = values.$_iterator();
      const expectVal = false;
      expect(iter === null).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_3700
     * @tc.name testFloat64ArrayDollarIterator037
     * @tc.desc Verify for...of iterates Float64Array correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, -1, zeroValue);
      const collected: Array<number> = [];
      const iter041 = values.$_iterator();
      while (true) {
        const result = iter041.next();
        if (result.done) {
          break;
        }
        collected.push(result.value as number);
      }
      expect(collected[0]).assertEqual(int32MinValue);
      expect(collected[1]).assertEqual(negativeOne);
      expect(collected[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_3800
     * @tc.name testFloat64ArrayDollarIterator038
     * @tc.desc Verify for...of with break exits early
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      let count = 0;
      const iter042 = values.$_iterator();
      while (true) {
        const result = iter042.next();
        if (result.done) {
          break;
        }
        count++;
        if (result.value === 2.0) {
          break;
        }
      }
      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_3900
     * @tc.name testFloat64ArrayDollarIterator039
     * @tc.desc Verify for...of with continue skips elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoPointtwofive: number = 2.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      let sum = 0.0;
      const iter043 = values.$_iterator();
      while (true) {
        const result = iter043.next();
        if (result.done) {
          break;
        }
        if (result.value === 2.0) {
          continue;
        }
        sum += result.value as number;
      }
      const expectVal = twoPointtwofive;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_4000
     * @tc.name testFloat64ArrayDollarIterator040
     * @tc.desc Verify for...of on empty array does not execute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      let executed = false;
      const iter044 = values.$_iterator();
      while (true) {
        const result = iter044.next();
        if (result.done) {
          break;
        }
        executed = true;
      }
      const expectVal = false;
      expect(executed).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_4100
     * @tc.name testFloat64ArrayDollarIterator041
     * @tc.desc Verify dollariterator with [-32768] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const oneValue: number = 1;
      const values = Float64Array.of(int16MinValue);
      let count = 0;
      const iter045 = values.$_iterator();
      while (true) {
        const result = iter045.next();
        if (result.done) {
          break;
        }
        count++;
      }
      const expectVal = oneValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_4200
     * @tc.name testFloat64ArrayDollarIterator042
     * @tc.desc Verify for...of with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const values = Float64Array.of(int32MinValue, -1, zeroValue);
      let nanCount = 0;
      const iter046 = values.$_iterator();
      while (true) {
        const result = iter046.next();
        if (result.done) {
          break;
        }
        if (Number.isNaN(result.value as number)) {
          nanCount++;
        }
      }
      const expectVal = zeroValue;
      expect(nanCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_4300
     * @tc.name testFloat64ArrayDollarIterator043
     * @tc.desc Verify for...of with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      let infCount = 0;
      const iter047 = values.$_iterator();
      while (true) {
        const result = iter047.next();
        if (result.done) {
          break;
        }
        if (result.value === Infinity) {
          infCount++;
        }
      }
      const expectVal = zeroValue;
      expect(infCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_4400
     * @tc.name testFloat64ArrayDollarIterator044
     * @tc.desc Verify $_iterator returns expected iteration results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter1 = values.$_iterator();
      const actVal2 = iter1.next().value!;
      const expectVal = pointFive;
      expect(actVal2).assertEqual(expectVal);
      const actVal3 = iter1.next().value!;
      const expectVal2 = onePointFive;
      expect(actVal3).assertEqual(expectVal2);
      const actVal4 = iter1.next().value!;
      const expectVal3 = pointTwoFive;
      expect(actVal4).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_4500
     * @tc.name testFloat64ArrayDollarIterator045
     * @tc.desc Verify $_iterator is done on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const iter1 = values.$_iterator();
      const actVal5 = iter1.next().done;
      const expectVal = true;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_4600
     * @tc.name testFloat64ArrayDollarIterator046
     * @tc.desc Verify $_iterator returns single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      const iter1 = values.$_iterator();
      const actVal6 = iter1.next().value!;
      const expectVal = int16MinValue;
      expect(actVal6).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_4700
     * @tc.name testFloat64ArrayDollarIterator047
     * @tc.desc Verify multiple $_iterator calls return independent iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = Float64Array.of(int32MinValue, -1);
      const iter1 = values.$_iterator();
      const iter2 = values.$_iterator();
      const actVal7 = iter1.next().value!;
      const expectVal = int32MinValue;
      expect(actVal7).assertEqual(expectVal);
      const actVal8 = iter2.next().value!;
      const expectVal2 = int32MinValue;
      expect(actVal8).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_4800
     * @tc.name testFloat64ArrayDollarIterator048
     * @tc.desc Verify two iterators traverse independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter1 = values.$_iterator();
      const iter2 = values.$_iterator();
      iter1.next();
      iter1.next();
      const actVal9 = iter2.next().value!;
      const expectVal = pointOne;
      expect(actVal9).assertEqual(expectVal);
      const actVal10 = iter1.next().value!;
      const expectVal2 = zeroValue;
      expect(actVal10).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_4900
     * @tc.name testFloat64ArrayDollarIterator049
     * @tc.desc Verify multiple for...of traversals on same array are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const twoValue: number = 2;
      const twoPointZero: number = 2.0;
      const values = Float64Array.of(pointFive, onePointFive);
      let sum1 = 0.0;
      const iter1 = values.$_iterator();
      while (true) {
        const result = iter1.next();
        if (result.done) {
          break;
        }
        sum1 += result.value as number;
      }
      let sum2 = 0.0;
      const iter2 = values.$_iterator();
      while (true) {
        const result = iter2.next();
        if (result.done) {
          break;
        }
        sum2 += result.value as number;
      }
      const expectVal = twoValue;
      expect(sum1).assertEqual(expectVal);
      const expectVal2 = twoPointZero;
      expect(sum2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_5000
     * @tc.name testFloat64ArrayDollarIterator050
     * @tc.desc Verify $_iterator traversal does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const values = Float64Array.of(int16MinValue, -128, zeroValue);
      const iter = values.$_iterator();
      iter.next();
      iter.next();
      expect(values.length).assertEqual(threeValue);
      const actVal11 = values.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_5100
     * @tc.name testFloat64ArrayDollarIterator051
     * @tc.desc Verify for...of traversal does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, -1, zeroValue);
      const iter055 = values.$_iterator();
      while (true) {
        const result = iter055.next();
        if (result.done) {
          break;
        }
      }
      expect(values.length).assertEqual(threeValue);
      const actVal12 = values.$_get(1);
      const expectVal = negativeOne;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_5200
     * @tc.name testFloat64ArrayDollarIterator052
     * @tc.desc Verify element values unchanged after iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const values = Float64Array.of(pointOne, maxSafeInteger);
      const iter = values.$_iterator();
      iter.next();
      iter.next();
      iter.next();
      const actVal13 = values.$_get(0);
      const expectVal = pointOne;
      expect(actVal13).assertEqual(expectVal);
      const actVal14 = values.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal14).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_5300
     * @tc.name testFloat64ArrayDollarIterator053
     * @tc.desc Verify $_iterator after new Float64Array(3) construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const values = new Float64Array(3);
      values.$_set(0, onePointZero);
      values.$_set(1, twoPointZero);
      values.$_set(2, threePointZero);
      const iter = values.$_iterator();
      const actVal15 = iter.next().value!;
      const expectVal = onePointZero;
      expect(actVal15).assertEqual(expectVal);
      const actVal16 = iter.next().value!;
      const expectVal2 = twoPointZero;
      expect(actVal16).assertEqual(expectVal2);
      const actVal17 = iter.next().value!;
      const expectVal3 = threePointZero;
      expect(actVal17).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_5400
     * @tc.name testFloat64ArrayDollarIterator054
     * @tc.desc Verify $_iterator after new Float64Array([1.0, 2.0]) construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const values = new Float64Array([onePointZero, twoPointZero]);
      const iter = values.$_iterator();
      const actVal18 = iter.next().value!;
      const expectVal = oneValue;
      expect(actVal18).assertEqual(expectVal);
      const actVal19 = iter.next().value!;
      const expectVal2 = twoValue;
      expect(actVal19).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_5500
     * @tc.name testFloat64ArrayDollarIterator055
     * @tc.desc Verify $_iterator after Float64Array.of(0.5, 1.5) construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const values = Float64Array.of(int16MinValue, -128);
      const iter = values.$_iterator();
      const actVal20 = iter.next().value!;
      const expectVal = int16MinValue;
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = iter.next().value!;
      const expectVal2 = int8MinValue;
      expect(actVal21).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_5600
     * @tc.name testFloat64ArrayDollarIterator056
     * @tc.desc Verify $_iterator after new Float64Array() empty construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array();
      const iter = values.$_iterator();
      const actVal22 = iter.next().done;
      const expectVal = true;
      expect(actVal22).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_5700
     * @tc.name testFloat64ArrayDollarIterator057
     * @tc.desc Verify $_iterator after copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const source = Float64Array.of(int32MinValue, -1);
      const copied = new Float64Array(source);
      const iter = copied.$_iterator();
      const actVal23 = iter.next().value!;
      const expectVal = int32MinValue;
      expect(actVal23).assertEqual(expectVal);
      const actVal24 = iter.next().value!;
      const expectVal2 = negativeOne;
      expect(actVal24).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_5800
     * @tc.name testFloat64ArrayDollarIterator058
     * @tc.desc Verify $_iterator on array with mixed boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue, zeroValue);
      const iter = values.$_iterator();
      const actVal25 = iter.next().value!;
      const expectVal = pointOne;
      expect(actVal25).assertEqual(expectVal);
      const actVal26 = iter.next().value!;
      const expectVal2 = maxSafeInteger;
      expect(actVal26).assertEqual(expectVal2);
      const actVal27 = iter.next().value!;
      const expectVal3 = zeroValue;
      expect(actVal27).assertEqual(expectVal3);
      const actVal28 = iter.next().value!;
      const expectVal4 = piValue;
      expect(actVal28).assertEqual(expectVal4);
      const infResult = iter.next();
      expect(infResult.value).assertEqual(tinyNegativeValue);
      const nanResult = iter.next();
      const actVal29 = Number.isNaN(nanResult.value as number);
      const expectVal5 = false;
      expect(actVal29).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_5900
     * @tc.name testFloat64ArrayDollarIterator059
     * @tc.desc Verify $_iterator on array with very large and small values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const values = Float64Array.of(pointFive, onePointFive);
      const iter = values.$_iterator();
      const actVal30 = iter.next().value!;
      const expectVal = pointFive;
      expect(actVal30).assertEqual(expectVal);
      const actVal31 = iter.next().value!;
      const expectVal2 = onePointFive;
      expect(actVal31).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_6000
     * @tc.name testFloat64ArrayDollarIterator060
     * @tc.desc Verify $_iterator on array with positive/negative zero and infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int8MinValue: number = -128;
      const values = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue);
      const iter = values.$_iterator();
      const actVal32 = iter.next().value!;
      const expectVal = int16MinValue;
      expect(actVal32).assertEqual(expectVal);
      const actVal33 = iter.next().value!;
      const expectVal2 = int8MinValue;
      expect(actVal33).assertEqual(expectVal2);
      const actVal34 = iter.next().value!;
      const expectVal3 = zeroValue;
      expect(actVal34).assertEqual(expectVal3);
      const actVal35 = iter.next().value!;
      const expectVal4 = int8MaxValue;
      expect(actVal35).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_6100
     * @tc.name testFloat64ArrayDollarIterator061
     * @tc.desc Verify iterator returns done=true after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = Float64Array.of(int32MinValue);
      const iter = values.$_iterator();
      iter.next();
      iter.next();
      const extra = iter.next();
      const expectVal = true;
      expect(extra.done).assertEqual(expectVal);
      expect(extra.value).assertUndefined();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_6200
     * @tc.name testFloat64ArrayDollarIterator062
     * @tc.desc Verify partial traversal then fresh iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const values = Float64Array.of(pointOne, maxSafeInteger);
      const iter1 = values.$_iterator();
      iter1.next();
      const iter2 = values.$_iterator();
      const actVal36 = iter2.next().value!;
      const expectVal = pointOne;
      expect(actVal36).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_6300
     * @tc.name testFloat64ArrayDollarIterator063
     * @tc.desc Verify iterator state maintained in while loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoPointtwofive: number = 2.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const iter = values.$_iterator();
      let sum = 0.0;
      let result = iter.next();
      while (!result.done) {
        sum += result.value as number;
        result = iter.next();
      }
      const expectVal = twoPointtwofive;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_6400
     * @tc.name testFloat64ArrayDollarIterator064
     * @tc.desc Verify nested for...of traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const fourValue: number = 4;
      const outer = Float64Array.of(int16MinValue, -128);
      let total = 0;
      const iter1_068 = outer.$_iterator();
      while (true) {
        const result1 = iter1_068.next();
        if (result1.done) {
          break;
        }
        const iter2_068 = outer.$_iterator();
        while (true) {
          const result2 = iter2_068.next();
          if (result2.done) {
            break;
          }
          total++;
        }
      }
      const expectVal = fourValue;
      expect(total).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_6500
     * @tc.name testFloat64ArrayDollarIterator065
     * @tc.desc Verify nested $_iterator calls are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = Float64Array.of(int32MinValue, -1);
      const outerIter = values.$_iterator();
      outerIter.next();
      const innerIter = values.$_iterator();
      const actVal37 = innerIter.next().value!;
      const expectVal = int32MinValue;
      expect(actVal37).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_6600
     * @tc.name testFloat64ArrayDollarIterator066
     * @tc.desc Verify 100-element array $_iterator complete traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const hundredValue: number = 100;
      const values = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        values.$_set(i, i * onePointZero);
      }
      const iter = values.$_iterator();
      let count = 0;
      let result = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      const expectVal = hundredValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_6700
     * @tc.name testFloat64ArrayDollarIterator067
     * @tc.desc Verify 100-element array $_iterator 50th next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fortyninePointzero: number = 49.0;
      const values = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        values.$_set(i, i * onePointZero);
      }
      const iter = values.$_iterator();
      for (let j = 0; j < 49; j++) {
        iter.next();
      }
      const fiftieth = iter.next();
      const expectVal = fortyninePointzero;
      expect(fiftieth.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_6800
     * @tc.name testFloat64ArrayDollarIterator068
     * @tc.desc Verify 100-element array $_iterator 100th next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fillValue99: number = 99.0;
      const values = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        values.$_set(i, i * onePointZero);
      }
      const iter = values.$_iterator();
      for (let j = 0; j < 99; j++) {
        iter.next();
      }
      const hundredth = iter.next();
      const expectVal = fillValue99;
      expect(hundredth.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_6900
     * @tc.name testFloat64ArrayDollarIterator069
     * @tc.desc Verify 100-element array $_iterator 101st next completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const values = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        values.$_set(i, i * onePointZero);
      }
      const iter = values.$_iterator();
      for (let j = 0; j < 100; j++) {
        iter.next();
      }
      const afterEnd = iter.next();
      const expectVal = true;
      expect(afterEnd.done).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_7000
     * @tc.name testFloat64ArrayDollarIterator070
     * @tc.desc Verify $_get returns original value after $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const iter = values.$_iterator();
      iter.next();
      iter.next();
      const actVal38 = values.$_get(1);
      const expectVal = maxSafeInteger;
      expect(actVal38).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_7100
     * @tc.name testFloat64ArrayDollarIterator071
     * @tc.desc Verify $_set works after for...of traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const tenPointZero: number = 10.0;
      const values = Float64Array.of(pointFive, onePointFive);
      const iter075 = values.$_iterator();
      while (true) {
        const result = iter075.next();
        if (result.done) {
          break;
        }
      }
      values.$_set(0, tenPointZero);
      const actVal39 = values.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal39).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_7200
     * @tc.name testFloat64ArrayDollarIterator072
     * @tc.desc Verify $_iterator on array with all elements 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const fiveValue: number = 5;
      const values = new Float64Array(5);
      const iter = values.$_iterator();
      let count = 0;
      let result = iter.next();
      while (!result.done) {
        expect(result.value).assertEqual(zeroPointZero);
        count++;
        result = iter.next();
      }
      const expectVal = fiveValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_7300
     * @tc.name testFloat64ArrayDollarIterator073
     * @tc.desc Verify $_iterator on array with all elements the same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const iter = values.$_iterator();
      const actVal40 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal40).assertEqual(expectVal);
      const actVal41 = iter.next().value!;
      const expectVal2 = zeroValue;
      expect(actVal41).assertEqual(expectVal2);
      const actVal42 = iter.next().value!;
      const expectVal3 = zeroValue;
      expect(actVal42).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_7400
     * @tc.name testFloat64ArrayDollarIterator074
     * @tc.desc Verify $_iterator on array with all elements NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const iter = values.$_iterator();
      const actVal43 = Number.isNaN(iter.next().value! as number);
      const expectVal = false;
      expect(actVal43).assertEqual(expectVal);
      const actVal44 = Number.isNaN(iter.next().value! as number);
      const expectVal2 = false;
      expect(actVal44).assertEqual(expectVal2);
      const actVal45 = Number.isNaN(iter.next().value! as number);
      const expectVal3 = false;
      expect(actVal45).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_7500
     * @tc.name testFloat64ArrayDollarIterator075
     * @tc.desc Verify $_iterator on array with alternating positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const zeroValue: number = 0;
      const values =
        Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive, zeroValue);
      const iter = values.$_iterator();
      const actVal46 = iter.next().value!;
      const expectVal = pointFive;
      expect(actVal46).assertEqual(expectVal);
      const actVal47 = iter.next().value!;
      const expectVal2 = onePointFive;
      expect(actVal47).assertEqual(expectVal2);
      const actVal48 = iter.next().value!;
      const expectVal3 = pointTwoFive;
      expect(actVal48).assertEqual(expectVal3);
      const actVal49 = iter.next().value!;
      const expectVal4 = pointOneTwoFive;
      expect(actVal49).assertEqual(expectVal4);
      const actVal50 = iter.next().value!;
      const expectVal5 = pointZeroSixTwoFive;
      expect(actVal50).assertEqual(expectVal5);
      const actVal51 = iter.next().value!;
      const expectVal6 = zeroValue;
      expect(actVal51).assertEqual(expectVal6);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_7600
     * @tc.name testFloat64ArrayDollarIterator076
     * @tc.desc Verify $_iterator on array with increasing sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const int8MinValue: number = -128;
      const values = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue);
      const iter = values.$_iterator();
      const actVal52 = iter.next().value!;
      const expectVal = int16MinValue;
      expect(actVal52).assertEqual(expectVal);
      const actVal53 = iter.next().value!;
      const expectVal2 = int8MinValue;
      expect(actVal53).assertEqual(expectVal2);
      const actVal54 = iter.next().value!;
      const expectVal3 = zeroValue;
      expect(actVal54).assertEqual(expectVal3);
      const actVal55 = iter.next().value!;
      const expectVal4 = int8MaxValue;
      expect(actVal55).assertEqual(expectVal4);
      const actVal56 = iter.next().value!;
      const expectVal5 = int16MaxValue;
      expect(actVal56).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_7700
     * @tc.name testFloat64ArrayDollarIterator077
     * @tc.desc Verify $_iterator on array with decreasing sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      const iter = values.$_iterator();
      const actVal57 = iter.next().value!;
      const expectVal = int32MinValue;
      expect(actVal57).assertEqual(expectVal);
      const actVal58 = iter.next().value!;
      const expectVal2 = negativeOne;
      expect(actVal58).assertEqual(expectVal2);
      const actVal59 = iter.next().value!;
      const expectVal3 = zeroValue;
      expect(actVal59).assertEqual(expectVal3);
      const actVal60 = iter.next().value!;
      const expectVal4 = oneValue;
      expect(actVal60).assertEqual(expectVal4);
      const actVal61 = iter.next().value!;
      const expectVal5 = int32MaxValue;
      expect(actVal61).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_7800
     * @tc.name testFloat64ArrayDollarIterator078
     * @tc.desc Verify $_iterator on array with repeated boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const piValue: number = 3.141592653589793;
      const values = Float64Array.of(maxSafeInteger, maxSafeInteger, piValue, piValue);
      const iter = values.$_iterator();
      const actVal62 = iter.next().value!;
      const expectVal = maxSafeInteger;
      expect(actVal62).assertEqual(expectVal);
      const actVal63 = iter.next().value!;
      const expectVal2 = maxSafeInteger;
      expect(actVal63).assertEqual(expectVal2);
      const actVal64 = iter.next().value!;
      const expectVal3 = piValue;
      expect(actVal64).assertEqual(expectVal3);
      const actVal65 = iter.next().value!;
      const expectVal4 = piValue;
      expect(actVal65).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_7900
     * @tc.name testFloat64ArrayDollarIterator079
     * @tc.desc Verify $_iterator on single-element array with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const values = Float64Array.of(pointFive);
      const iter = values.$_iterator();
      const result = iter.next();
      const actVal66 = Number.isNaN(result.value as number);
      const expectVal = false;
      expect(actVal66).assertEqual(expectVal);
      expect(result.done).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_8000
     * @tc.name testFloat64ArrayDollarIterator080
     * @tc.desc Verify $_iterator on single-element array with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      const iter = values.$_iterator();
      const result = iter.next();
      expect(result.value).assertEqual(int16MinValue);
      expect(result.done).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_8100
     * @tc.name testFloat64ArrayDollarIterator081
     * @tc.desc Verify $_iterator on single-element array with -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = Float64Array.of(int32MinValue);
      const iter = values.$_iterator();
      const result = iter.next();
      expect(result.value).assertEqual(int32MinValue);
      expect(result.done).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_8200
     * @tc.name testFloat64ArrayDollarIterator082
     * @tc.desc Verify $_iterator on offset view yields only visible values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new ArrayBuffer(40);
      const p = new Float64Array(b);
      p.$_set(0, 10.0);
      p.$_set(1, 20.0);
      p.$_set(2, 30.0);
      p.$_set(3, 40.0);
      const iter = new Float64Array(b, 8, 2).$_iterator();
      const actVal67 = iter.next().value!;
      const expectVal = 20.0;
      expect(actVal67).assertEqual(expectVal);
      const actVal68 = iter.next().value!;
      const expectVal2 = 30.0;
      expect(actVal68).assertEqual(expectVal2);
      const actVal69 = iter.next().done;
      const expectVal3 = true;
      expect(actVal69).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_8300
     * @tc.name testFloat64ArrayDollarIterator083
     * @tc.desc Verify $_iterator exhausted state remains done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter = Float64Array.of(1.0).$_iterator();
      iter.next();
      const actVal70 = iter.next().done;
      const expectVal = true;
      expect(actVal70).assertEqual(expectVal);
      const actVal71 = iter.next().done;
      const expectVal2 = true;
      expect(actVal71).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_8400
     * @tc.name testFloat64ArrayDollarIterator084
     * @tc.desc Verify $_iterator creates independent state for same source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(5.0, 6.0);
      const first = a.$_iterator();
      const second = a.$_iterator();
      const actVal72 = first.next().value!;
      const expectVal = 5.0;
      expect(actVal72).assertEqual(expectVal);
      const actVal73 = second.next().value!;
      const expectVal2 = 5.0;
      expect(actVal73).assertEqual(expectVal2);
      const actVal74 = first.next().value!;
      const expectVal3 = 6.0;
      expect(actVal74).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_8500
     * @tc.name testFloat64ArrayDollarIterator085
     * @tc.desc Verify $_iterator observes mutation before first next call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.0, 2.0);
      const iter = a.$_iterator();
      a.$_set(0, 10.0);
      const actVal75 = iter.next().value!;
      const expectVal = 10.0;
      expect(actVal75).assertEqual(expectVal);
      const actVal76 = iter.next().value!;
      const expectVal2 = 2.0;
      expect(actVal76).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_8600
     * @tc.name testFloat64ArrayDollarIterator086
     * @tc.desc Verify $_iterator observes mutation before later next call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.0, 2.0, 3.0);
      const iter = a.$_iterator();
      const actVal77 = iter.next().value!;
      const expectVal = 1.0;
      expect(actVal77).assertEqual(expectVal);
      a.$_set(2, 30.0);
      const actVal78 = iter.next().value!;
      const expectVal2 = 2.0;
      expect(actVal78).assertEqual(expectVal2);
      const actVal79 = iter.next().value!;
      const expectVal3 = 30.0;
      expect(actVal79).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_8700
     * @tc.name testFloat64ArrayDollarIterator087
     * @tc.desc Verify $_iterator over toReversed copy yields reversed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter = Float64Array.of(1.0, 2.0, 3.0).toReversed().$_iterator();
      const actVal80 = iter.next().value!;
      const expectVal = 3.0;
      expect(actVal80).assertEqual(expectVal);
      const actVal81 = iter.next().value!;
      const expectVal2 = 2.0;
      expect(actVal81).assertEqual(expectVal2);
      const actVal82 = iter.next().value!;
      const expectVal3 = 1.0;
      expect(actVal82).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_8800
     * @tc.name testFloat64ArrayDollarIterator088
     * @tc.desc Verify $_iterator over toSorted copy yields ascending values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter = Float64Array.of(3.0, 1.0, 2.0).toSorted().$_iterator();
      const actVal83 = iter.next().value!;
      const expectVal = 1.0;
      expect(actVal83).assertEqual(expectVal);
      const actVal84 = iter.next().value!;
      const expectVal2 = 2.0;
      expect(actVal84).assertEqual(expectVal2);
      const actVal85 = iter.next().value!;
      const expectVal3 = 3.0;
      expect(actVal85).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_8900
     * @tc.name testFloat64ArrayDollarIterator089
     * @tc.desc Verify $_iterator yields NaN and Infinity values without reordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDollarIterator089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter = Float64Array.of(NaN, Infinity).$_iterator();
      const value: number = iter.next().value!;
      const actVal86 = Number.isNaN(value);
      const expectVal = true;
      expect(actVal86).assertEqual(expectVal);
      const actVal87 = iter.next().value!;
      const expectVal2 = Infinity;
      expect(actVal87).assertEqual(expectVal2);
    })

  })
}
