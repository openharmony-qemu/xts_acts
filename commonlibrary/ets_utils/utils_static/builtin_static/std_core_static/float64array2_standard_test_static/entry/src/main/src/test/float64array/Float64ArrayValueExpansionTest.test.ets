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
import Utils from './../Util.test';

export default function Float64ArrayValueExpansionTest(): void {
  describe('Float64ArrayValueExpansionTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_0100
     * @tc.name testFloat64ArrayValueExpansionTest001
     * @tc.desc Verify valueOf alias sort mutates original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const alias: Float64Array = arr.valueOf();
      const returned: Float64Array = alias.sort();
      expect(alias).assertEqual(arr);
      expect(returned).assertEqual(arr);
      const actualString = arr.join();
      const expectedString: string = '1,2,3';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_0200
     * @tc.name testFloat64ArrayValueExpansionTest002
     * @tc.desc Verify valueOf alias reverse mutates original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const alias: Float64Array = arr.valueOf();
      const returned: Float64Array = alias.reverse();
      expect(alias).assertEqual(arr);
      expect(returned).assertEqual(arr);
      const actualString = arr.join();
      const expectedString: string = '4,3,2,1';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_0300
     * @tc.name testFloat64ArrayValueExpansionTest003
     * @tc.desc Verify valueOf alias fill mutates original middle range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const alias: Float64Array = arr.valueOf();
      const returned: Float64Array = alias.fill(9.0, 1, 3);
      expect(returned).assertEqual(arr);
      const actualString = arr.join();
      const expectedString: string = '1,9,9,4';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_0400
     * @tc.name testFloat64ArrayValueExpansionTest004
     * @tc.desc Verify valueOf alias copyWithin mutates original copied range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const alias: Float64Array = arr.valueOf();
      const returned: Float64Array = alias.copyWithin(1, 3, 4);
      expect(returned).assertEqual(arr);
      const actualString = arr.join();
      const expectedString: string = '1,4,3,4';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_0500
     * @tc.name testFloat64ArrayValueExpansionTest005
     * @tc.desc Verify valueOf alias dollar set mutates original element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const alias: Float64Array = arr.valueOf();
      alias.$_set(2, 8.0);
      expect(alias).assertEqual(arr);
      const actualString = arr.join();
      const expectedString: string = '1,2,8';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_0600
     * @tc.name testFloat64ArrayValueExpansionTest006
     * @tc.desc Verify valueOf toSorted result leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const alias: Float64Array = arr.valueOf();
      const sorted: Float64Array = alias.toSorted();
      const actualString = sorted.join();
      const expectedString: string = '1,2,3';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = arr.join();
      const expectedStringSecond: string = '3,1,2';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
      const sharesSortedBuffer: boolean = sorted.buffer === arr.buffer;
      expect(sharesSortedBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_0700
     * @tc.name testFloat64ArrayValueExpansionTest007
     * @tc.desc Verify valueOf toReversed result leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const alias: Float64Array = arr.valueOf();
      const reversed: Float64Array = alias.toReversed();
      const actualString = reversed.join();
      const expectedString: string = '3,2,1';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = arr.join();
      const expectedStringSecond: string = '1,2,3';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
      const sharesReversedBuffer: boolean = reversed.buffer === arr.buffer;
      expect(sharesReversedBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_0800
     * @tc.name testFloat64ArrayValueExpansionTest008
     * @tc.desc Verify valueOf map result leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const alias: Float64Array = arr.valueOf();
      const mapped: Float64Array = alias.map((v: number): number => v * 10.0);
      const actualString = mapped.join();
      const expectedString: string = '10,20,30';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = arr.join();
      const expectedStringSecond: string = '1,2,3';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_0900
     * @tc.name testFloat64ArrayValueExpansionTest009
     * @tc.desc Verify valueOf filter result leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, -2.0, 3.0, -4.0]);
      const alias: Float64Array = arr.valueOf();
      const filtered: Float64Array = alias.filter((v: number): boolean => v > 0.0);
      const actualString = filtered.join();
      const expectedString: string = '1,3';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = arr.join();
      const expectedStringSecond: string = '1,-2,3,-4';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_1000
     * @tc.name testFloat64ArrayValueExpansionTest010
     * @tc.desc Verify valueOf with result leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const alias: Float64Array = arr.valueOf();
      const replaced: Float64Array = alias.with(1, 99.0);
      const actualString = replaced.join();
      const expectedString: string = '1,99,3';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = arr.join();
      const expectedStringSecond: string = '1,2,3';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
      const sharesReplacedBuffer: boolean = replaced.buffer === arr.buffer;
      expect(sharesReplacedBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_1100
     * @tc.name testFloat64ArrayValueExpansionTest011
     * @tc.desc Verify overlapping sibling view write at shared first position is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(40);
      const whole: Float64Array = new Float64Array(buf);
      const tail: Float64Array = new Float64Array(buf, 8, 4);
      whole.set(new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]), 0);
      tail.$_set(0, 20.0);
      const actualString = whole.join();
      const expectedString: string = '1,20,3,4,5';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = tail.join();
      const expectedStringSecond: string = '20,3,4,5';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_1200
     * @tc.name testFloat64ArrayValueExpansionTest012
     * @tc.desc Verify overlapping sibling view write at shared last position is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(40);
      const whole: Float64Array = new Float64Array(buf);
      const middle: Float64Array = new Float64Array(buf, 8, 3);
      whole.set(new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]), 0);
      middle.$_set(2, 40.0);
      const actualString = whole.join();
      const expectedString: string = '1,2,3,40,5';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = middle.join();
      const expectedStringSecond: string = '2,3,40';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_1300
     * @tc.name testFloat64ArrayValueExpansionTest013
     * @tc.desc Verify overlapping sibling view fill changes only physical overlap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const whole: Float64Array = new Float64Array(buf);
      const window: Float64Array = new Float64Array(buf, 16, 3);
      whole.set(new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]), 0);
      window.fill(7.0, 0, 2);
      const actualString = whole.join();
      const expectedString: string = '1,2,7,7,5,6';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = window.join();
      const expectedStringSecond: string = '7,7,5';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_1400
     * @tc.name testFloat64ArrayValueExpansionTest014
     * @tc.desc Verify overlapping sibling view set source writes exact middle window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const whole: Float64Array = new Float64Array(buf);
      const window: Float64Array = new Float64Array(buf, 8, 4);
      whole.set(new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]), 0);
      window.set(new Float64Array([8.0, 9.0]), 1);
      const actualString = whole.join();
      const expectedString: string = '1,2,8,9,5,6';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = window.join();
      const expectedStringSecond: string = '2,8,9,5';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_1500
     * @tc.name testFloat64ArrayValueExpansionTest015
     * @tc.desc Verify overlapping sibling view sort changes shared window only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(40);
      const whole: Float64Array = new Float64Array(buf);
      const window: Float64Array = new Float64Array(buf, 8, 3);
      whole.set(new Float64Array([9.0, 3.0, 1.0, 2.0, 8.0]), 0);
      window.sort();
      const actualString = window.join();
      const expectedString: string = '1,2,3';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = whole.join();
      const expectedStringSecond: string = '9,1,2,3,8';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_1600
     * @tc.name testFloat64ArrayValueExpansionTest016
     * @tc.desc Verify values iterator sees dollar set on unread element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.$_set(1, 20.0);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 20.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 3.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_1700
     * @tc.name testFloat64ArrayValueExpansionTest017
     * @tc.desc Verify values iterator sees fill on unread range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.fill(8.0, 1, 3);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 8.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 8.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_1800
     * @tc.name testFloat64ArrayValueExpansionTest018
     * @tc.desc Verify values iterator sees sort before next unread index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 3.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.sort();
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 2.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualString = arr.join();
      const expectedString: string = '1,2,3';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_1900
     * @tc.name testFloat64ArrayValueExpansionTest019
     * @tc.desc Verify values iterator sees reverse before next unread index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.reverse();
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 3.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualString = arr.join();
      const expectedString: string = '4,3,2,1';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_2000
     * @tc.name testFloat64ArrayValueExpansionTest020
     * @tc.desc Verify values iterator sees copyWithin before next unread index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.copyWithin(1, 3, 4);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 4.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualString = arr.join();
      const expectedString: string = '1,4,3,4';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_2100
     * @tc.name testFloat64ArrayValueExpansionTest021
     * @tc.desc Verify entries iterator sees dollar set on next pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter = arr.entries();
      const [firstKey, firstValue] = iter.next().value!;
      const actualResult = firstKey;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = firstValue;
      const expectedResultSecond: number = 1.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      arr.$_set(1, 22.0);
      const [nextKey, nextValue] = iter.next().value!;
      const actualResultThird = nextKey;
      const expectedResultThird: number = 1;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = nextValue;
      const expectedResultFourth: number = 22.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '1,22,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_2200
     * @tc.name testFloat64ArrayValueExpansionTest022
     * @tc.desc Verify entries iterator keeps next key after current element mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter = arr.entries();
      const [firstKey, firstValue] = iter.next().value!;
      const actualResult = firstKey;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = firstValue;
      const expectedResultSecond: number = 1.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      arr.$_set(0, 11.0);
      const [nextKey, nextValue] = iter.next().value!;
      const actualResultThird = nextKey;
      const expectedResultThird: number = 1;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = nextValue;
      const expectedResultFourth: number = 2.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '11,2,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_2300
     * @tc.name testFloat64ArrayValueExpansionTest023
     * @tc.desc Verify entries iterator sees fill on tail pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const iter = arr.entries();
      const [firstKey, firstValue] = iter.next().value!;
      const actualResult = firstKey;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = firstValue;
      const expectedResultSecond: number = 1.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      arr.fill(9.0, 1, 4);
      const [nextKey, nextValue] = iter.next().value!;
      const actualResultThird = nextKey;
      const expectedResultThird: number = 1;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = nextValue;
      const expectedResultFourth: number = 9.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '1,9,9,9';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_2400
     * @tc.name testFloat64ArrayValueExpansionTest024
     * @tc.desc Verify entries iterator sees reverse at next logical key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter = arr.entries();
      const [firstKey, firstValue] = iter.next().value!;
      const actualResult = firstKey;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = firstValue;
      const expectedResultSecond: number = 1.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      arr.reverse();
      const [nextKey, nextValue] = iter.next().value!;
      const actualResultThird = nextKey;
      const expectedResultThird: number = 1;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = nextValue;
      const expectedResultFourth: number = 2.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '3,2,1';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_2500
     * @tc.name testFloat64ArrayValueExpansionTest025
     * @tc.desc Verify entries iterator sees copyWithin at next logical key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const iter = arr.entries();
      const [firstKey, firstValue] = iter.next().value!;
      const actualResult = firstKey;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = firstValue;
      const expectedResultSecond: number = 1.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      arr.copyWithin(1, 2, 3);
      const [nextKey, nextValue] = iter.next().value!;
      const actualResultThird = nextKey;
      const expectedResultThird: number = 1;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = nextValue;
      const expectedResultFourth: number = 3.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '1,3,3,4';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_2600
     * @tc.name testFloat64ArrayValueExpansionTest026
     * @tc.desc Verify every first false skips later throwing branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let calls: int = 0;
      const result: boolean = arr.every((v: number, index: int): boolean => {
        calls++;
        if (index > 0) {
          throw new Error('should-not-run');
        }
        return false;
      });
      expect(result).assertFalse();
      const actualResult = calls;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '1,2,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_2700
     * @tc.name testFloat64ArrayValueExpansionTest027
     * @tc.desc Verify every middle false skips tail mutation branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, -1.0, 3.0]);
      let guard: number = 0.0;
      const result: boolean = arr.every((v: number, index: int): boolean => {
        if (index === 2) {
          guard = 99.0;
        }
        return v > 0.0;
      });
      expect(result).assertFalse();
      const actualResult = guard;
      const expectedResult: number = 0.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '1,-1,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_2800
     * @tc.name testFloat64ArrayValueExpansionTest028
     * @tc.desc Verify every last false executes all prior branches only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, -3.0]);
      let calls: int = 0;
      const result: boolean = arr.every((v: number): boolean => {
        calls++;
        return v > 0.0;
      });
      expect(result).assertFalse();
      const actualResult = calls;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_2900
     * @tc.name testFloat64ArrayValueExpansionTest029
     * @tc.desc Verify every false after source mutation stops later mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, -2.0, 3.0]);
      const result: boolean = arr.every((v: number, index: int): boolean => {
        if (index === 0) {
          arr.$_set(0, 10.0);
        }
        if (index === 2) {
          arr.$_set(2, 30.0);
        }
        return v > 0.0;
      });
      expect(result).assertFalse();
      const actualStringThird = arr.join();
      const expectedStringThird: string = '10,-2,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_3000
     * @tc.name testFloat64ArrayValueExpansionTest030
     * @tc.desc Verify every empty array true path has zero callback calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let calls: int = 0;
      const result: boolean = arr.every((v: number): boolean => {
        calls++;
        return false;
      });
      expect(result).assertTrue();
      const actualResult = calls;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_3100
     * @tc.name testFloat64ArrayValueExpansionTest031
     * @tc.desc Verify some first true skips later throwing branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let calls: int = 0;
      const result: boolean = arr.some((v: number, index: int): boolean => {
        calls++;
        if (index > 0) {
          throw new Error('should-not-run');
        }
        return true;
      });
      expect(result).assertTrue();
      const actualResult = calls;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '1,2,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_3200
     * @tc.name testFloat64ArrayValueExpansionTest032
     * @tc.desc Verify some middle true skips tail mutation branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-1.0, 2.0, 3.0]);
      let guard: number = 0.0;
      const result: boolean = arr.some((v: number, index: int): boolean => {
        if (index === 2) {
          guard = 99.0;
        }
        return v > 0.0;
      });
      expect(result).assertTrue();
      const actualResult = guard;
      const expectedResult: number = 0.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '-1,2,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_3300
     * @tc.name testFloat64ArrayValueExpansionTest033
     * @tc.desc Verify some last true executes all prior branches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-1.0, -2.0, 3.0]);
      let calls: int = 0;
      const result: boolean = arr.some((v: number): boolean => {
        calls++;
        return v > 0.0;
      });
      expect(result).assertTrue();
      const actualResult = calls;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_3400
     * @tc.name testFloat64ArrayValueExpansionTest034
     * @tc.desc Verify some true after source mutation stops later mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-1.0, 2.0, 3.0]);
      const result: boolean = arr.some((v: number, index: int): boolean => {
        if (index === 0) {
          arr.$_set(0, -10.0);
        }
        if (index === 2) {
          arr.$_set(2, 30.0);
        }
        return v > 0.0;
      });
      expect(result).assertTrue();
      const actualStringThird = arr.join();
      const expectedStringThird: string = '-10,2,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_3500
     * @tc.name testFloat64ArrayValueExpansionTest035
     * @tc.desc Verify some empty array false path has zero callback calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let calls: int = 0;
      const result: boolean = arr.some((v: number): boolean => {
        calls++;
        return true;
      });
      expect(result).assertFalse();
      const actualResult = calls;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_3600
     * @tc.name testFloat64ArrayValueExpansionTest036
     * @tc.desc Verify map callback throw preserves source state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let calls: int = 0;
      try {
        arr.map((v: number): number => {
          calls++;
          throw new Error('map-batch-error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'map-batch-error';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = calls;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '1,2,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_3700
     * @tc.name testFloat64ArrayValueExpansionTest037
     * @tc.desc Verify filter callback throw preserves source state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let calls: int = 0;
      try {
        arr.filter((v: number): boolean => {
          calls++;
          throw new Error('filter-batch-error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'filter-batch-error';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = calls;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '1,2,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_3800
     * @tc.name testFloat64ArrayValueExpansionTest038
     * @tc.desc Verify forEach callback throw preserves source state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let calls: int = 0;
      try {
        arr.forEach((v: number): void => {
          calls++;
          throw new Error('forEach-batch-error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'forEach-batch-error';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = calls;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '1,2,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_3900
     * @tc.name testFloat64ArrayValueExpansionTest039
     * @tc.desc Verify every callback throw preserves source state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let calls: int = 0;
      try {
        arr.every((v: number): boolean => {
          calls++;
          throw new Error('every-batch-error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'every-batch-error';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = calls;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '1,2,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_4000
     * @tc.name testFloat64ArrayValueExpansionTest040
     * @tc.desc Verify some callback throw preserves source state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let calls: int = 0;
      try {
        arr.some((v: number): boolean => {
          calls++;
          throw new Error('some-batch-error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'some-batch-error';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = calls;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualStringThird = arr.join();
      const expectedStringThird: string = '1,2,3';
      expect(actualStringThird).assertEqual(expectedStringThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_4100
     * @tc.name testFloat64ArrayValueExpansionTest041
     * @tc.desc Verify set oversized source at tail throws and target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const source: Float64Array = new Float64Array([9.0, 8.0]);
      try {
        target.set(source, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const actualStringFourth = target.join();
      const expectedStringFourth: string = '1,2,3,4';
      expect(actualStringFourth).assertEqual(expectedStringFourth);
      const actualStringFifth = source.join();
      const expectedStringFifth: string = '9,8';
      expect(actualStringFifth).assertEqual(expectedStringFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_4200
     * @tc.name testFloat64ArrayValueExpansionTest042
     * @tc.desc Verify set negative offset throws and target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const source: Float64Array = new Float64Array([7.0]);
      try {
        target.set(source, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const actualStringFourth = target.join();
      const expectedStringFourth: string = '1,2,3';
      expect(actualStringFourth).assertEqual(expectedStringFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_4300
     * @tc.name testFloat64ArrayValueExpansionTest043
     * @tc.desc Verify set offset beyond length throws and target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const source: Float64Array = new Float64Array([7.0]);
      try {
        target.set(source, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const actualStringFourth = target.join();
      const expectedStringFourth: string = '1,2,3';
      expect(actualStringFourth).assertEqual(expectedStringFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_4400
     * @tc.name testFloat64ArrayValueExpansionTest044
     * @tc.desc Verify set overlapping subarray too long throws and target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const source: Float64Array = target.subarray(1, 4);
      try {
        target.set(source, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const actualStringFourth = target.join();
      const expectedStringFourth: string = '1,2,3,4';
      expect(actualStringFourth).assertEqual(expectedStringFourth);
      const actualStringFifth = source.join();
      const expectedStringFifth: string = '2,3,4';
      expect(actualStringFifth).assertEqual(expectedStringFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_4500
     * @tc.name testFloat64ArrayValueExpansionTest045
     * @tc.desc Verify set into empty target throws and source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(0);
      const source: Float64Array = new Float64Array([1.0]);
      try {
        target.set(source, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const actualLength = target.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      const actualStringFourth = source.join();
      const expectedStringFourth: string = '1';
      expect(actualStringFourth).assertEqual(expectedStringFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_4600
     * @tc.name testFloat64ArrayValueExpansionTest046
     * @tc.desc Verify includes ordinary value hit returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      expect(arr.includes(2.0)).assertTrue();
      const actualStringFourth = arr.join();
      const expectedStringFourth: string = '1,2,3';
      expect(actualStringFourth).assertEqual(expectedStringFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_4700
     * @tc.name testFloat64ArrayValueExpansionTest047
     * @tc.desc Verify includes ordinary value miss returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      expect(arr.includes(4.0)).assertFalse();
      const actualLength = arr.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_4800
     * @tc.name testFloat64ArrayValueExpansionTest048
     * @tc.desc Verify includes NaN returns true while source remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      expect(arr.includes(NaN)).assertTrue();
      const actualLength = arr.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_4900
     * @tc.name testFloat64ArrayValueExpansionTest049
     * @tc.desc Verify includes plus zero hits minus zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-0.0, 1.0]);
      expect(arr.includes(0.0)).assertTrue();
      const actualElement0 = 1.0 / arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_5000
     * @tc.name testFloat64ArrayValueExpansionTest050
     * @tc.desc Verify includes fromIndex skips earlier hit and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 1.0, 5.0]);
      expect(arr.includes(1.0, 2)).assertFalse();
      expect(arr.includes(5.0, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_5100
     * @tc.name testFloat64ArrayValueExpansionTest051
     * @tc.desc Verify indexOf duplicate returns first matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([2.0, 4.0, 2.0]);
      const actualIndex = arr.indexOf(2.0);
      const expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_5200
     * @tc.name testFloat64ArrayValueExpansionTest052
     * @tc.desc Verify indexOf missing ordinary value returns negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([2.0, 4.0, 6.0]);
      const actualIndex = arr.indexOf(5.0);
      const expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_5300
     * @tc.name testFloat64ArrayValueExpansionTest053
     * @tc.desc Verify indexOf fromIndex skips earlier duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0, 1.0, 7.0, 1.0]);
      const actualIndex = arr.indexOf(7.0, 1);
      const expectedIndex: int = 2;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_5400
     * @tc.name testFloat64ArrayValueExpansionTest054
     * @tc.desc Verify indexOf NaN returns negative one while includes can hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 2.0]);
      const actualIndex = arr.indexOf(NaN);
      const expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_5500
     * @tc.name testFloat64ArrayValueExpansionTest055
     * @tc.desc Verify indexOf zero treats plus and minus zero as equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-0.0, 1.0, 0.0]);
      const actualIndex = arr.indexOf(0.0);
      const expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
      const actualElement0 = 1.0 / arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_5600
     * @tc.name testFloat64ArrayValueExpansionTest056
     * @tc.desc Verify filter then map differs from map then filter on negative crossing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-2.0, 1.0, 3.0]);
      const filtered056: Float64Array = arr.filter((v: number): boolean => v > 0.0);
      const filterThenMap: Float64Array = filtered056.map((v: number): number => v - 2.0);
      const mapped056: Float64Array = arr.map((v: number): number => v - 2.0);
      const mapThenFilter: Float64Array = mapped056.filter((v: number): boolean => v > 0.0);
      const actualStringFourth = filterThenMap.join();
      const expectedStringFourth: string = '-1,1';
      expect(actualStringFourth).assertEqual(expectedStringFourth);
      const actualStringFifth = mapThenFilter.join();
      const expectedStringFifth: string = '1';
      expect(actualStringFifth).assertEqual(expectedStringFifth);
      const actualStringSixth = arr.join();
      const expectedStringSixth: string = '-2,1,3';
      expect(actualStringSixth).assertEqual(expectedStringSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_5700
     * @tc.name testFloat64ArrayValueExpansionTest057
     * @tc.desc Verify filter finite then map overflow differs from map overflow then filter finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Number.MAX_VALUE, 1.0]);
      const filtered057: Float64Array = arr.filter((v: number): boolean => v < Infinity);
      const filterThenMap: Float64Array = filtered057.map((v: number): number => v * 2.0);
      const mapped057: Float64Array = arr.map((v: number): number => v * 2.0);
      const mapThenFilter: Float64Array = mapped057.filter((v: number): boolean => v < Infinity);
      const actualStringFourth = filterThenMap.join();
      const expectedStringFourth: string = 'Infinity,2';
      expect(actualStringFourth).assertEqual(expectedStringFourth);
      const actualStringFifth = mapThenFilter.join();
      const expectedStringFifth: string = '2';
      expect(actualStringFifth).assertEqual(expectedStringFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_5800
     * @tc.name testFloat64ArrayValueExpansionTest058
     * @tc.desc Verify filtering zero before reciprocal preserves an overflow value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, Number.MIN_VALUE, -2.0]);
      const filtered058: Float64Array = arr.filter((v: number): boolean => v !== 0.0);
      const filterThenMap: Float64Array = filtered058.map((v: number): number => 1.0 / v);
      const mapped058: Float64Array = arr.map((v: number): number => 1.0 / v);
      const mapThenFilter: Float64Array = mapped058.filter((v: number): boolean => v < Infinity && v > -Infinity);
      const actualLength = filterThenMap.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = filterThenMap.$_get(0);
      const expectedElement0: number = Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = filterThenMap.$_get(1);
      const expectedElement1: number = -0.5;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualLengthSecond = mapThenFilter.length;
      const expectedLengthSecond: int = 1;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const actualElement0Second = mapThenFilter.$_get(0);
      const expectedElement0Second: number = -0.5;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 0.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
      const actualElement1Second = arr.$_get(1);
      const expectedElement1Second: number = Number.MIN_VALUE;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = -2.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_5900
     * @tc.name testFloat64ArrayValueExpansionTest059
     * @tc.desc Verify filter NaN before map differs from map then NaN filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      const filtered059: Float64Array = arr.filter((v: number): boolean => !isNaN(v));
      const filterThenMap: Float64Array = filtered059.map((v: number): number => v + 1.0);
      const mapped059: Float64Array = arr.map((v: number): number => v + 1.0);
      const mapThenFilter: Float64Array = mapped059.filter((v: number): boolean => isNaN(v));
      const actualStringFourth = filterThenMap.join();
      const expectedStringFourth: string = '2,4';
      expect(actualStringFourth).assertEqual(expectedStringFourth);
      const actualLength = mapThenFilter.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      expect(isNaN(mapThenFilter.$_get(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_6000
     * @tc.name testFloat64ArrayValueExpansionTest060
     * @tc.desc Verify filter by index then map differs from map then value filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const filtered060: Float64Array = arr.filter((v: number, index: int): boolean => index % 2 === 0);
      const filterThenMap: Float64Array = filtered060.map((v: number): number => v * 10.0);
      const mapped060: Float64Array = arr.map((v: number): number => v * 10.0);
      const mapThenFilter: Float64Array = mapped060.filter((v: number): boolean => v > 20.0);
      const actualStringFourth = filterThenMap.join();
      const expectedStringFourth: string = '10,30';
      expect(actualStringFourth).assertEqual(expectedStringFourth);
      const actualStringFifth = mapThenFilter.join();
      const expectedStringFifth: string = '30,40';
      expect(actualStringFifth).assertEqual(expectedStringFifth);
      const actualStringSixth = arr.join();
      const expectedStringSixth: string = '1,2,3,4';
      expect(actualStringSixth).assertEqual(expectedStringSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_6100
     * @tc.name testFloat64ArrayValueExpansionTest061
     * @tc.desc Verify values iterator sees bracket assignment on unread element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValueFourth = iter.next().value;
      const expectedIteratorValueFourth: number = 1.0;
      expect(actualIteratorValueFourth).assertEqual(expectedIteratorValueFourth);
      arr[1] = 22.0;
      const actualIteratorValueFifth = iter.next().value;
      const expectedIteratorValueFifth: number = 22.0;
      expect(actualIteratorValueFifth).assertEqual(expectedIteratorValueFifth);
      const actualIteratorValueSixth = iter.next().value;
      const expectedIteratorValueSixth: number = 3.0;
      expect(actualIteratorValueSixth).assertEqual(expectedIteratorValueSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_6200
     * @tc.name testFloat64ArrayValueExpansionTest062
     * @tc.desc Verify values iterator stays exhausted after source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([4.0, 5.0]);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValueSeventh = iter.next().value;
      const expectedIteratorValueSeventh: number = 4.0;
      expect(actualIteratorValueSeventh).assertEqual(expectedIteratorValueSeventh);
      const actualIteratorValueEighth = iter.next().value;
      const expectedIteratorValueEighth: number = 5.0;
      expect(actualIteratorValueEighth).assertEqual(expectedIteratorValueEighth);
      expect(iter.next().done).assertTrue();
      arr[0] = 40.0;
      expect(iter.next().done).assertTrue();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_6300
     * @tc.name testFloat64ArrayValueExpansionTest063
     * @tc.desc Verify normal static params chain preserves expanded values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0x1, 0b10, 0o3, 1e-308);
      const result = arr.slice(0).map((v: number): number => v + 1.0);
      const actualLengthThird = result.length;
      const expectedLengthThird: int = 4;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualElement0Fourth = result.$_get(0);
      const expectedElement0Fourth: number = 2.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement1Third = result.$_get(1);
      const expectedElement1Third: number = 3.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement2Second = result.$_get(2);
      const expectedElement2Second: number = 4.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
      const actualElement3 = result.$_get(3);
      const expectedElement3: number = 1.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_6400
     * @tc.name testFloat64ArrayValueExpansionTest064
     * @tc.desc Verify lastIndexOf duplicate returns last matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([2.0, 4.0, 2.0]);
      const actualIndex = arr.lastIndexOf(2.0);
      const expectedIndex: int = 2;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_6500
     * @tc.name testFloat64ArrayValueExpansionTest065
     * @tc.desc Verify lastIndexOf missing ordinary value returns negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([2.0, 4.0, 6.0]);
      const actualIndex = arr.lastIndexOf(5.0);
      const expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_6600
     * @tc.name testFloat64ArrayValueExpansionTest066
     * @tc.desc Verify lastIndexOf fromIndex limits the search range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0, 1.0, 7.0, 1.0]);
      const actualIndex = arr.lastIndexOf(1.0, 2);
      const expectedIndex: int = 1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_6700
     * @tc.name testFloat64ArrayValueExpansionTest067
     * @tc.desc Verify includes finds NaN while indexOf does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 2.0]);
      expect(arr.includes(NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUE_EXPANSION_6800
     * @tc.name testFloat64ArrayValueExpansionTest068
     * @tc.desc Verify lastIndexOf treats plus and minus zero as equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueExpansionTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-0.0, 1.0, 0.0]);
      const actualIndex = arr.lastIndexOf(-0.0);
      const expectedIndex: int = 2;
      expect(actualIndex).assertEqual(expectedIndex);
    });
  })
}
