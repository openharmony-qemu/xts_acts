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

export default function Float64ArrayIteratorTest(): void {
  describe('Float64ArrayIteratorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0010
     * @tc.name testFloat64ArrayIterator001
     * @tc.desc Verify $_iterator first next value equals first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 22.0, 33.0);
      const it: IterableIterator<number> = arr.$_iterator();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 11.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0020
     * @tc.name testFloat64ArrayIterator002
     * @tc.desc Verify $_iterator last element next has done false and correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const it: IterableIterator<number> = arr.$_iterator();
      it.next();
      it.next();
      const last = it.next();
      const actualResult = last.value;
      const expectedResult: number = 3.0;
      expect(actualResult).assertEqual(expectedResult);
      expect(last.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0030
     * @tc.name testFloat64ArrayIterator003
     * @tc.desc Verify $_iterator exhausted next done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const it: IterableIterator<number> = arr.$_iterator();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0040
     * @tc.name testFloat64ArrayIterator004
     * @tc.desc Verify $_iterator exhausted next value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      const it: IterableIterator<number> = arr.$_iterator();
      it.next();
      expect(it.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0050
     * @tc.name testFloat64ArrayIterator005
     * @tc.desc Verify $_iterator multiple exhausted next continue done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0);
      const it: IterableIterator<number> = arr.$_iterator();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0060
     * @tc.name testFloat64ArrayIterator006
     * @tc.desc Verify entries() iterator first item done is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0]);
      const it = arr.entries();
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0070
     * @tc.name testFloat64ArrayIterator007
     * @tc.desc Verify keys() iterator first value is index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0, 8.0]);
      const it: IterableIterator<int> = arr.keys();
      const n = it.next();
      const actualResult = n.value;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0080
     * @tc.name testFloat64ArrayIterator008
     * @tc.desc Verify values() iterator first value equals first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0, 8.0]);
      const it: IterableIterator<number> = arr.values();
      const n = it.next();
      const actualResult = n.value;
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0090
     * @tc.name testFloat64ArrayIterator009
     * @tc.desc Verify for-of iteration accumulates sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let sum: number = 0;
      for (const v of arr) {
        sum = sum + v;
      }
      const actualResult = sum;
      const expectedResult: number = 6.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0100
     * @tc.name testFloat64ArrayIterator010
     * @tc.desc Verify for-of break terminates early
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      let sum: number = 0;
      for (const v of arr) {
        sum = sum + v;
        if (sum > 3) {
          break;
        }
      }
      const actualResult = sum;
      const expectedResult: number = 6.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0110
     * @tc.name testFloat64ArrayIterator011
     * @tc.desc Verify for-of continue skips element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      let sum: number = 0;
      for (const v of arr) {
        if (v === 2.0) {
          continue;
        }
        sum = sum + v;
      }
      const actualResult = sum;
      const expectedResult: number = 8.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0120
     * @tc.name testFloat64ArrayIterator012
     * @tc.desc Verify for-of empty array body not entered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let count: number = 0;
      for (const v of arr) {
        count = count + 1;
      }
      const actualResult = count;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0130
     * @tc.name testFloat64ArrayIterator013
     * @tc.desc Verify two independent iterators do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([10.0, 20.0, 30.0]);
      const it1: IterableIterator<number> = arr.values();
      const it2: IterableIterator<number> = arr.values();
      const a1 = it1.next();
      const a2 = it2.next();
      const b1 = it1.next();
      const b2 = it2.next();
      const actualResult = a1.value;
      const expectedResult: number = 10.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = a2.value;
      const expectedResultSecond: number = 10.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = b1.value;
      const expectedResultThird: number = 20.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = b2.value;
      const expectedResultFourth: number = 20.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0140
     * @tc.name testFloat64ArrayIterator014
     * @tc.desc Verify values() iterator exhausts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0]);
      const it: IterableIterator<number> = arr.values();
      it.next();
      const last = it.next();
      expect(last.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0150
     * @tc.name testFloat64ArrayIterator015
     * @tc.desc Verify $_iterator exhausted next() returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0]);
      const iter = arr.$_iterator();
      let r = iter.next();
      r = iter.next();
      r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0160
     * @tc.name testFloat64ArrayIterator016
     * @tc.desc Verify $_iterator exhausted next() value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([10.0]);
      const iter = arr.$_iterator();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0170
     * @tc.name testFloat64ArrayIterator017
     * @tc.desc Verify entries iterator exhausted next returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0]);
      const iter = arr.entries();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0180
     * @tc.name testFloat64ArrayIterator018
     * @tc.desc Verify keys iterator exhausted next returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 6.0]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0190
     * @tc.name testFloat64ArrayIterator019
     * @tc.desc Verify values iterator exhausted next returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0, 8.0, 9.0]);
      const iter = arr.values();
      iter.next();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0200
     * @tc.name testFloat64ArrayIterator020
     * @tc.desc Verify $_iterator repeated exhausted calls all return done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(100.0);
      const iter = arr.$_iterator();
      iter.next();
      const r1 = iter.next();
      const r2 = iter.next();
      const r3 = iter.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0210
     * @tc.name testFloat64ArrayIterator021
     * @tc.desc Verify two $_iterator on same array are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const iter1 = arr.$_iterator();
      const iter2 = arr.$_iterator();
      const r1 = iter1.next();
      const r2 = iter2.next();
      const actualResult = r1.value;
      const expectedResult: number = 10.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = r2.value;
      const expectedResultSecond: number = 10.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const r1b = iter1.next();
      const r2b = iter2.next();
      const actualResultThird = r1b.value;
      const expectedResultThird: number = 20.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = r2b.value;
      const expectedResultFourth: number = 20.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0220
     * @tc.name testFloat64ArrayIterator022
     * @tc.desc Verify two $_iterator advance at different speeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const fast = arr.$_iterator();
      const slow = arr.$_iterator();
      fast.next();
      fast.next();
      const rSlow1 = slow.next();
      const actualResult = rSlow1.value;
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      fast.next();
      const rFast = fast.next();
      const rSlow2 = slow.next();
      const actualResultSecond = rFast.value;
      const expectedResultSecond: number = 4.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = rSlow2.value;
      const expectedResultThird: number = 2.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0230
     * @tc.name testFloat64ArrayIterator023
     * @tc.desc Verify two entries iterators are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const e1 = arr.entries();
      const e2 = arr.entries();
      const [k1, firstResult] = e1.next().value!;
      const [k2, secondResult] = e2.next().value!;
      const actualResult = k1;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = k2;
      const expectedResultSecond: number = 0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = firstResult;
      const expectedResultThird: number = 1.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = secondResult;
      const expectedResultFourth: number = 1.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0240
     * @tc.name testFloat64ArrayIterator024
     * @tc.desc Verify two values iterators are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const firstResult = arr.values();
      const secondResult = arr.values();
      firstResult.next();
      firstResult.next();
      const rV1 = firstResult.next();
      const rV2 = secondResult.next();
      const actualResult = rV1.value;
      const expectedResult: number = 30.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = rV2.value;
      const expectedResultSecond: number = 10.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0250
     * @tc.name testFloat64ArrayIterator025
     * @tc.desc Verify for...of over $_iterator yields all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let count: int = 0;
      for (const val of arr) {
        if (count === 0) {
          const actualResult = val;
          const expectedResult: number = 1.0;
          expect(actualResult).assertEqual(expectedResult);
        }
        if (count === 1) {
          const actualResultSecond = val;
          const expectedResultSecond: number = 2.0;
          expect(actualResultSecond).assertEqual(expectedResultSecond);
        }
        if (count === 2) {
          const actualResultThird = val;
          const expectedResultThird: number = 3.0;
          expect(actualResultThird).assertEqual(expectedResultThird);
        }
        count++;
      }
      const actualResultFourth = count;
      const expectedResultFourth: number = 3;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0260
     * @tc.name testFloat64ArrayIterator026
     * @tc.desc Verify for...of over entries yields correct index-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 10.0);
      let count: int = 0;
      for (const entry of arr.entries()) {
        if (count === 0) {
          const actualResult = entry[0];
          const expectedResult: number = 0;
          expect(actualResult).assertEqual(expectedResult);
          const actualResultSecond = entry[1];
          const expectedResultSecond: number = 5.0;
          expect(actualResultSecond).assertEqual(expectedResultSecond);
        }
        if (count === 1) {
          const actualResultThird = entry[0];
          const expectedResultThird: number = 1;
          expect(actualResultThird).assertEqual(expectedResultThird);
          const actualResultFourth = entry[1];
          const expectedResultFourth: number = 10.0;
          expect(actualResultFourth).assertEqual(expectedResultFourth);
        }
        count++;
      }
      const actualResultFifth = count;
      const expectedResultFifth: number = 2;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0270
     * @tc.name testFloat64ArrayIterator027
     * @tc.desc Verify for...of over keys yields integer indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      let count: int = 0;
      for (const k of arr.keys()) {
        expect(k).assertEqual(count);
        count++;
      }
      const actualResult = count;
      const expectedResult: number = 4;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0280
     * @tc.name testFloat64ArrayIterator028
     * @tc.desc Verify for...of over values yields unboxed number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 6.0, 9.0);
      let sum: number = 0.0;
      for (const v of arr.values()) {
        sum = sum + v;
      }
      const actualResult = sum;
      const expectedResult: number = 18.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0290
     * @tc.name testFloat64ArrayIterator029
     * @tc.desc Verify $_iterator sees values modified before iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      arr.$_set(0, 99.0);
      const iter = arr.$_iterator();
      const r = iter.next();
      const actualResult = r.value;
      const expectedResult: number = 99.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0300
     * @tc.name testFloat64ArrayIterator030
     * @tc.desc Verify $_iterator sees fill changes before iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      arr.fill(7.0);
      const iter = arr.$_iterator();
      let count: int = 0;
      for (const v of arr) {
        const actualResult = v;
        const expectedResult: number = 7.0;
        expect(actualResult).assertEqual(expectedResult);
        count++;
      }
      const actualResultSecond = count;
      const expectedResultSecond: number = 3;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0310
     * @tc.name testFloat64ArrayIterator031
     * @tc.desc Verify $_iterator created before $_set sees new value for unvisited elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter = arr.$_iterator();
      const first = iter.next();
      const actualResult = first.value;
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      arr.$_set(1, 99.0);
      const second = iter.next();
      const actualResultSecond = second.value;
      const expectedResultSecond: number = 99.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0320
     * @tc.name testFloat64ArrayIterator032
     * @tc.desc Verify entries iterator created before fill sees new values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0]);
      const iter = arr.entries();
      arr.fill(5.0);
      const [, firstResult] = iter.next().value!;
      const [, secondResult] = iter.next().value!;
      const actualResult = firstResult;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = secondResult;
      const expectedResultSecond: number = 5.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0330
     * @tc.name testFloat64ArrayIterator033
     * @tc.desc Verify keys iterator yields correct indices after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([10.0, 20.0, 30.0]);
      arr.reverse();
      let count: int = 0;
      for (const k of arr.keys()) {
        expect(k).assertEqual(count);
        count++;
      }
      const actualResult = count;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0340
     * @tc.name testFloat64ArrayIterator034
     * @tc.desc Verify values iterator yields elements in order after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      arr.sort();
      const iter = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 2.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 3.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0350
     * @tc.name testFloat64ArrayIterator035
     * @tc.desc Verify entries key equals keys value for same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const eIter = arr.entries();
      const kIter = arr.keys();
      for (let i: int = 0; i < 3; i++) {
        const [ek] = eIter.next().value!;
        const kVal = kIter.next().value;
        expect(ek).assertEqual(kVal);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0360
     * @tc.name testFloat64ArrayIterator036
     * @tc.desc Verify entries value equals values iterator for same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const eIter = arr.entries();
      const vIter = arr.values();
      for (let i: int = 0; i < 3; i++) {
        const [, ev] = eIter.next().value!;
        const vv = vIter.next().value;
        expect(ev).assertEqual(vv);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0370
     * @tc.name testFloat64ArrayIterator037
     * @tc.desc Verify keys iterator returns indexes in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 10.0);
      let expected: int = 0;
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected);
        expected++;
      }
      const actualResult = expected;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0380
     * @tc.name testFloat64ArrayIterator038
     * @tc.desc Verify empty array $_iterator next immediately returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const iter = arr.$_iterator();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0390
     * @tc.name testFloat64ArrayIterator039
     * @tc.desc Verify empty array entries iterator next immediately returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0400
     * @tc.name testFloat64ArrayIterator040
     * @tc.desc Verify empty array keys iterator next immediately returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const iter = arr.keys();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0410
     * @tc.name testFloat64ArrayIterator041
     * @tc.desc Verify empty array values iterator next immediately returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const iter = arr.values();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0420
     * @tc.name testFloat64ArrayIterator042
     * @tc.desc Verify for...of on empty array does not execute loop body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let count: int = 0;
      for (const v of arr) {
        count++;
      }
      const actualResult = count;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0430
     * @tc.name testFloat64ArrayIterator043
     * @tc.desc Verify single element array for...of yields one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([42.0]);
      let count: int = 0;
      for (const v of arr) {
        const actualResult = v;
        const expectedResult: number = 42.0;
        expect(actualResult).assertEqual(expectedResult);
        count++;
      }
      const actualResultSecond = count;
      const expectedResultSecond: number = 1;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0440
     * @tc.name testFloat64ArrayIterator044
     * @tc.desc Verify for...of over 1000-element array yields 1000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1000);
      let count: int = 0;
      for (const v of arr) {
        if (count === 0) {
          const actualResult = v;
          const expectedResult: number = 0.0;
          expect(actualResult).assertEqual(expectedResult);
        }
        count++;
      }
      const actualResultSecond = count;
      const expectedResultSecond: number = 1000;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0450
     * @tc.name testFloat64ArrayIterator045
     * @tc.desc Verify entries iterator yields correct value for NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN]);
      for (const entry of arr.entries()) {
        const actualResult = entry[0];
        const expectedResult: number = 0;
        expect(actualResult).assertEqual(expectedResult);
        expect(entry[1]).assertNaN();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0460
     * @tc.name testFloat64ArrayIterator046
     * @tc.desc Verify values iterator yields Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Infinity);
      const iter = arr.values();
      const r = iter.next();
      const actualResult = r.value;
      const expectedResult: number = Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0470
     * @tc.name testFloat64ArrayIterator047
     * @tc.desc Verify values iterator yields -Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-Infinity);
      const iter = arr.values();
      const r = iter.next();
      const actualResult = r.value;
      const expectedResult: number = -Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0480
     * @tc.name testFloat64ArrayIterator048
     * @tc.desc Verify $_iterator yields all elements in reverse after reverse() call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.reverse();
      const expected = [3.0, 2.0, 1.0];
      let idx: int = 0;
      for (const v of arr) {
        expect(v).assertEqual(expected[idx]);
        idx++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0490
     * @tc.name testFloat64ArrayIterator049
     * @tc.desc Verify for...of over subarray view iterates correct subset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const sub = arr.subarray(1, 4);
      const expected = [2.0, 3.0, 4.0];
      let idx: int = 0;
      for (const v of sub) {
        expect(v).assertEqual(expected[idx]);
        idx++;
      }
      const actualResult = idx;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0500
     * @tc.name testFloat64ArrayIterator050
     * @tc.desc Verify $_iterator over mixed positive/negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-1.0, 0.0, 1.0);
      const iter = arr.$_iterator();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = -1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 0.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 1.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0510
     * @tc.name testFloat64ArrayIterator051
     * @tc.desc Verify keys iterator and values iterator have same count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let keyCount: int = 0;
      let valCount: int = 0;
      for (const k of arr.keys()) {
        keyCount++;
      }
      for (const v of arr.values()) {
        valCount++;
      }
      expect(keyCount).assertEqual(valCount);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0520
     * @tc.name testFloat64ArrayIterator052
     * @tc.desc Verify for...of yields correct values with -0.0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, 1.0);
      for (const v of arr) {
        if (v === 0.0) {
          const actualResult = 1.0 / v;
          const expectedResult: number = -Infinity;
          expect(actualResult).assertEqual(expectedResult);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0530
     * @tc.name testFloat64ArrayIterator053
     * @tc.desc Verify $_iterator yields elements equal to $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(arr.$_get(0));
      expect(iter.next().value).assertEqual(arr.$_get(1));
      expect(iter.next().value).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0540
     * @tc.name testFloat64ArrayIterator054
     * @tc.desc Verify entries iterator yields [index, unboxed_number] for large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.7976931348623157e+308);
      for (const entry of arr.entries()) {
        const actualResult = entry[0];
        const expectedResult: number = 0;
        expect(actualResult).assertEqual(expectedResult);
        const actualResultSecond = entry[1];
        const expectedResultSecond: number = 1.7976931348623157e+308;
        expect(actualResultSecond).assertEqual(expectedResultSecond);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0550
     * @tc.name testFloat64ArrayIterator055
     * @tc.desc Verify $_iterator on buffer view yields correct elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float64Array = new Float64Array(buf, 0, 4);
      arr.$_set(0, 1.0);
      arr.$_set(1, 2.0);
      arr.$_set(2, 3.0);
      arr.$_set(3, 4.0);
      let count: int = 0;
      for (const v of arr) {
        expect(v).assertEqual(arr.$_get(count));
        count++;
      }
      const actualResult = count;
      const expectedResult: number = 4;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0560
     * @tc.name testFloat64ArrayIterator056
     * @tc.desc Verify for...of over array with hex literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.1, 0.2]);
      const iter = arr.$_iterator();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 0.1;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 0.2;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0570
     * @tc.name testFloat64ArrayIterator057
     * @tc.desc Verify values iterator after copyWithin yields correct sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.copyWithin(0, 2, 4);
      const iter = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 3.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 4.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 3.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
      const actualIteratorValueFourth = iter.next().value;
      const expectedIteratorValueFourth: number = 4.0;
      expect(actualIteratorValueFourth).assertEqual(expectedIteratorValueFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0580
     * @tc.name testFloat64ArrayIterator058
     * @tc.desc Verify values iterator after with() returns new array content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r = arr.with(1, 99.0);
      const iter = r.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 99.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 3.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0590
     * @tc.name testFloat64ArrayIterator059
     * @tc.desc Verify for...of over single element array works with entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.5]);
      let count: int = 0;
      for (const entry of arr.entries()) {
        const actualResult = entry[0];
        const expectedResult: number = 0;
        expect(actualResult).assertEqual(expectedResult);
        const actualResultSecond = entry[1];
        const expectedResultSecond: number = 7.5;
        expect(actualResultSecond).assertEqual(expectedResultSecond);
        count++;
      }
      const actualResultThird = count;
      const expectedResultThird: number = 1;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0600
     * @tc.name testFloat64ArrayIterator060
     * @tc.desc Verify map callback throw at first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.map((v: number): number => {
          throw new Error('map err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0610
     * @tc.name testFloat64ArrayIterator061
     * @tc.desc Verify filter callback throw at middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.filter((v: number): boolean => {
          if (v === 2.0) {
            throw new RangeError('filter range err');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0620
     * @tc.name testFloat64ArrayIterator062
     * @tc.desc Verify forEach callback throw at last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.forEach((v: number): void => {
          if (v === 3.0) {
            throw new TypeError('forEach type err');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0630
     * @tc.name testFloat64ArrayIterator063
     * @tc.desc Verify find callback throw propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.find((v: number): boolean => {
          throw new Error('find err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0640
     * @tc.name testFloat64ArrayIterator064
     * @tc.desc Verify every callback throw propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.every((v: number): boolean => {
          throw new Error('every err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0650
     * @tc.name testFloat64ArrayIterator065
     * @tc.desc Verify some callback throw propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.some((v: number): boolean => {
          throw new Error('some err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0660
     * @tc.name testFloat64ArrayIterator066
     * @tc.desc Verify reduce callback throw propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduce((a: number, v: number): number => {
          throw new Error('reduce err');
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0670
     * @tc.name testFloat64ArrayIterator067
     * @tc.desc Verify findIndex callback throw propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.findIndex((v: number): boolean => {
          throw new Error('fi err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0680
     * @tc.name testFloat64ArrayIterator068
     * @tc.desc Verify subarray values chain iterator returns sliced view values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator0688', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const iter: IterableIterator<number> = arr.subarray(1, 4).values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 2.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 3.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 4.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0690
     * @tc.name testFloat64ArrayIterator069
     * @tc.desc Verify findLastIndex callback throw propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.findLastIndex((v: number): boolean => {
          throw new Error('fli err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0700
     * @tc.name testFloat64ArrayIterator070
     * @tc.desc Verify $_get OOB throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.$_get(5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0710
     * @tc.name testFloat64ArrayIterator071
     * @tc.desc Verify $_set OOB throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.$_set(10, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0720
     * @tc.name testFloat64ArrayIterator072
     * @tc.desc Verify set with offset OOB throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      try {
        arr.set(3, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0730
     * @tc.name testFloat64ArrayIterator073
     * @tc.desc Verify with maximum int index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const maxIndex: int = 2147483647;
      try {
        arr.with(maxIndex, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0740
     * @tc.name testFloat64ArrayIterator074
     * @tc.desc Verify findLastIndex not found returns -1 (not error)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const actualResult = arr.findLastIndex((v: number): boolean => v > 100.0);
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0750
     * @tc.name testFloat64ArrayIterator075
     * @tc.desc Verify array still usable after caught forEach callback error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.forEach((v: number): void => {
          if (v === 2.0) {
            throw new Error('fe err');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0760
     * @tc.name testFloat64ArrayIterator076
     * @tc.desc Verify array usable after caught map callback error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.map((v: number): number => {
          if (v === 2.0) {
            throw new Error('map err');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0770
     * @tc.name testFloat64ArrayIterator077
     * @tc.desc Verify constructor overflow length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bigLen: int = 2147483647;
        const arr: Float64Array = new Float64Array(bigLen);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0780
     * @tc.name testFloat64ArrayIterator078
     * @tc.desc Verify subarray(-1) wraps to last element length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(-1);
      const actualLength = sub.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = sub.$_get(0);
      const expectedElement0: number = 4.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualByteOffset = sub.byteOffset;
      const expectedByteOffset: int = 24;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0790
     * @tc.name testFloat64ArrayIterator079
     * @tc.desc Verify subarray(-1) byteOffset is 24 (3*8 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(-1);
      const actualByteOffset = sub.byteOffset;
      const expectedByteOffset: int = 24;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0800
     * @tc.name testFloat64ArrayIterator080
     * @tc.desc Verify subarray(-4) = -length wraps to beginning length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(-4);
      const actualLength = sub.length;
      const expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = sub.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = sub.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0810
     * @tc.name testFloat64ArrayIterator081
     * @tc.desc Verify subarray(4) = length returns empty view length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(4);
      const actualLength = sub.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0820
     * @tc.name testFloat64ArrayIterator082
     * @tc.desc Verify subarray(999999) huge positive returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(999999);
      const actualLength = sub.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0830
     * @tc.name testFloat64ArrayIterator083
     * @tc.desc Verify subarray(-999999) huge negative clamped to 0 length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(-999999);
      const actualLength = sub.length;
      const expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = sub.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = sub.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0840
     * @tc.name testFloat64ArrayIterator084
     * @tc.desc Verify subarray(2, -1) positive begin negative end length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(2, -1);
      const actualLength = sub.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0850
     * @tc.name testFloat64ArrayIterator085
     * @tc.desc Verify subarray(-1, -2) begin > end returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(-1, -2);
      const actualLength = sub.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0860
     * @tc.name testFloat64ArrayIterator086
     * @tc.desc Verify slice(-1) wraps to last element length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sl: Float64Array = arr.slice(-1);
      const actualLength = sl.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0870
     * @tc.name testFloat64ArrayIterator087
     * @tc.desc Verify slice(-1) new copy byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sl: Float64Array = arr.slice(-1);
      const actualByteOffset = sl.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0880
     * @tc.name testFloat64ArrayIterator088
     * @tc.desc Verify slice(4) = length returns empty copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sl: Float64Array = arr.slice(4);
      const actualLength = sl.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0890
     * @tc.name testFloat64ArrayIterator089
     * @tc.desc Verify slice(2, 1) begin > end returns empty copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sl: Float64Array = arr.slice(2, 1);
      const actualLength = sl.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0900
     * @tc.name testFloat64ArrayIterator090
     * @tc.desc Verify slice(1, -1) positive begin negative end length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sl: Float64Array = arr.slice(1, -1);
      const actualLength = sl.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0910
     * @tc.name testFloat64ArrayIterator091
     * @tc.desc Verify subarray(4) byteOffset at end position (4*8=32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(4);
      const actualByteOffset = sub.byteOffset;
      const expectedByteOffset: int = 32;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0920
     * @tc.name testFloat64ArrayIterator092
     * @tc.desc Verify subarray(-4) shares buffer reference with parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(-4);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0930
     * @tc.name testFloat64ArrayIterator093
     * @tc.desc Verify values iterator observes mutation before second next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const it: IterableIterator<number> = arr.values();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.$_set(1, 20.0);
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 20.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0940
     * @tc.name testFloat64ArrayIterator094
     * @tc.desc Verify values iterator returned value is snapshot before later write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(4.0, 5.0);
      const it: IterableIterator<number> = arr.values();
      const first = it.next().value;
      arr.$_set(0, 40.0);
      const actualResult = first;
      const expectedResult: number = 4.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 40.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0950
     * @tc.name testFloat64ArrayIterator095
     * @tc.desc Verify entries iterator observes mutation before next entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const it = arr.entries();
      const first = it.next();
      const actualResult = first.value![0];
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      arr.$_set(1, 22.0);
      const second = it.next();
      const actualResultSecond = second.value![0];
      const expectedResultSecond: number = 1;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = second.value![1];
      const expectedResultThird: number = 22.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0960
     * @tc.name testFloat64ArrayIterator096
     * @tc.desc Verify keys iterator ignores value mutation and returns next index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(9.0, 8.0, 7.0);
      const it: IterableIterator<int> = arr.keys();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.$_set(1, 80.0);
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 1;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0970
     * @tc.name testFloat64ArrayIterator097
     * @tc.desc Verify subarray values iterator observes parent write to shared slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const child: Float64Array = parent.subarray(1);
      const it: IterableIterator<number> = child.values();
      parent.$_set(1, 12.0);
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 12.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0980
     * @tc.name testFloat64ArrayIterator098
     * @tc.desc Verify parent values iterator observes subarray write to future slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const child: Float64Array = parent.subarray(1);
      const it: IterableIterator<number> = parent.values();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      child.$_set(0, 21.0);
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 21.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_0990
     * @tc.name testFloat64ArrayIterator099
     * @tc.desc Verify values iterator remains exhausted after repeated next calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      const it: IterableIterator<number> = arr.values();
      it.next();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1000
     * @tc.name testFloat64ArrayIterator100
     * @tc.desc Verify values iterator observes fill on unread tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const it: IterableIterator<number> = arr.values();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.fill(9.0, 1);
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 9.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = it.next().value;
      const expectedIteratorValueThird: number = 9.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1010
     * @tc.name testFloat64ArrayIterator101
     * @tc.desc Verify entries iterator observes reverse before unread entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const it = arr.entries();
      const first = it.next();
      const actualResult = first.value![1];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      arr.reverse();
      const second = it.next();
      const actualResultSecond = second.value![0];
      const expectedResultSecond: number = 1;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = second.value![1];
      const expectedResultThird: number = 2.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1020
     * @tc.name testFloat64ArrayIterator102
     * @tc.desc Verify keys iterator sequence remains positional after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const it: IterableIterator<int> = arr.keys();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.reverse();
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 1;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1030
     * @tc.name testFloat64ArrayIterator103
     * @tc.desc Verify values iterator observes copyWithin on unread slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const it: IterableIterator<number> = arr.values();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 5.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.copyWithin(1, 0, 1);
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 5.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1040
     * @tc.name testFloat64ArrayIterator104
     * @tc.desc Verify entries iterator observes sort before unread tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const it = arr.entries();
      const first = it.next();
      const actualResult = first.value![0];
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      arr.sort();
      const second = it.next();
      const actualResultSecond = second.value![1];
      const expectedResultSecond: number = 2.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1050
     * @tc.name testFloat64ArrayIterator105
     * @tc.desc Verify values iterator observes bracket write to future element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const it: IterableIterator<number> = arr.values();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr[1] = 12.0;
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 12.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1060
     * @tc.name testFloat64ArrayIterator106
     * @tc.desc Verify saved entry array is not rewritten by later source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const it = arr.entries();
      const entry = it.next();
      arr.$_set(0, 99.0);
      const actualResult = entry.value![1];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1070
     * @tc.name testFloat64ArrayIterator107
     * @tc.desc Verify two values iterators have independent cursors and shared data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const a: IterableIterator<number> = arr.values();
      const b: IterableIterator<number> = arr.values();
      const actualIteratorValue = a.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.$_set(0, 10.0);
      const actualIteratorValueSecond = b.next().value;
      const expectedIteratorValueSecond: number = 10.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1080
     * @tc.name testFloat64ArrayIterator108
     * @tc.desc Verify iterator over source is isolated from slice copy mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const it: IterableIterator<number> = arr.values();
      const copy: Float64Array = arr.slice();
      copy.$_set(0, 90.0);
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1090
     * @tc.name testFloat64ArrayIterator109
     * @tc.desc Verify iterator over source is isolated from toReversed copy mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const it: IterableIterator<number> = arr.values();
      const rev: Float64Array = arr.toReversed();
      rev.$_set(1, 99.0);
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1100
     * @tc.name testFloat64ArrayIterator110
     * @tc.desc Verify iterator observes valueOf alias mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const alias: Float64Array = arr.valueOf();
      const it: IterableIterator<number> = arr.values();
      alias.$_set(0, 31.0);
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 31.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1110
     * @tc.name testFloat64ArrayIterator111
     * @tc.desc Verify values iterator reads NaN with NaN assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, 1.0);
      const it: IterableIterator<number> = arr.values();
      expect(it.next().value).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1120
     * @tc.name testFloat64ArrayIterator112
     * @tc.desc Verify entries iterator preserves infinity ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Infinity, -Infinity);
      const it = arr.entries();
      const first = it.next();
      const second = it.next();
      const actualResult = first.value![1];
      const expectedResult: number = Infinity;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = second.value![1];
      const expectedResultSecond: number = -Infinity;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1130
     * @tc.name testFloat64ArrayIterator113
     * @tc.desc Verify values iterator observes subnormal write before read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const it: IterableIterator<number> = arr.values();
      arr.$_set(0, 5e-324);
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 5e-324;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1140
     * @tc.name testFloat64ArrayIterator114
     * @tc.desc Verify keys iterator increments through all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(4.0, 5.0, 6.0);
      const it: IterableIterator<int> = arr.keys();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 1;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = it.next().value;
      const expectedIteratorValueThird: number = 2;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1150
     * @tc.name testFloat64ArrayIterator115
     * @tc.desc Verify source iterator is isolated from map result mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const it: IterableIterator<number> = arr.values();
      const mapped: Float64Array = arr.map((v: number): number => v + 10.0);
      mapped.$_set(0, 99.0);
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1160
     * @tc.name testFloat64ArrayIterator116
     * @tc.desc Verify source iterator is isolated from filter result mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const it: IterableIterator<number> = arr.values();
      const filtered: Float64Array = arr.filter((v: number): boolean => v > 1.0);
      filtered.$_set(0, 99.0);
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1170
     * @tc.name testFloat64ArrayIterator117
     * @tc.desc Verify iterator observes full fill before first read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const it: IterableIterator<number> = arr.values();
      arr.fill(8.0);
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 8.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 8.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1180
     * @tc.name testFloat64ArrayIterator118
     * @tc.desc Verify iterator length boundary remains original after element writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const it: IterableIterator<number> = arr.values();
      arr.$_set(1, 20.0);
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1190
     * @tc.name testFloat64ArrayIterator119
     * @tc.desc Verify entries iterator index matches current slot after parent write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const it = arr.entries();
      it.next();
      arr.$_set(1, 42.0);
      const e = it.next();
      const actualResult = e.value![0];
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = e.value![1];
      const expectedResultSecond: number = 42.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1200
     * @tc.name testFloat64ArrayIterator120
     * @tc.desc Verify values iterator observes overlapping copyWithin result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const it: IterableIterator<number> = arr.values();
      it.next();
      arr.copyWithin(1, 0, 3);
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 2.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1210
     * @tc.name testFloat64ArrayIterator121
     * @tc.desc Verify interleaved iterators share mutation but keep cursors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const a: IterableIterator<number> = arr.values();
      const b: IterableIterator<number> = arr.values();
      const actualIteratorValue = a.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.$_set(1, 22.0);
      const actualIteratorValueSecond = b.next().value;
      const expectedIteratorValueSecond: number = 1.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = a.next().value;
      const expectedIteratorValueThird: number = 22.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ITERATOR_1220
     * @tc.name testFloat64ArrayIterator122
     * @tc.desc Verify for-of observes mutation of not-yet-visited element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIterator122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let second: number = 0.0;
      let index: int = 0;
      for (const v of arr) {
        if (index === 0) {
          arr.$_set(1, 20.0);
        }
        if (index === 1) {
          second = v;
        }
        index++;
      }
      const actualResult = second;
      const expectedResult: number = 20.0;
      expect(actualResult).assertEqual(expectedResult);
    });
  })
}
