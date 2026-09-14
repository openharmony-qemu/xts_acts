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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayIteratorPart02Test(): void {
  describe('Int8ArrayIteratorPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_0100
     * @tc.name int8ArrayIteratorPart02Test001
     * @tc.desc Verify $_iterator() on new Int8Array([1,2,3]) returns non-undefined iterator object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_0200
     * @tc.name int8ArrayIteratorPart02Test002
     * @tc.desc Verify $_iterator() first next() on new Int8Array([1]) returns value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_0300
     * @tc.name int8ArrayIteratorPart02Test003
     * @tc.desc Verify $_iterator() first next() on [1] is not done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      let firstIterDone = r.done;
      expect(firstIterDone).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_0400
     * @tc.name int8ArrayIteratorPart02Test004
     * @tc.desc Verify $_iterator() next() after exhaustion returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      iter.next();
      let r: IteratorResult<Number> = iter.next();
      let exhaustedIterValue = r.value;
      expect(exhaustedIterValue).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_0500
     * @tc.name int8ArrayIteratorPart02Test005
     * @tc.desc Verify empty array iterator first next().done is true via result variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      let emptyIterDone = r.done;
      expect(emptyIterDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_0600
     * @tc.name int8ArrayIteratorPart02Test006
     * @tc.desc Verify empty array iterator first next().value is undefined via result variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      let emptyIterValue = r.value;
      expect(emptyIterValue).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_0700
     * @tc.name int8ArrayIteratorPart02Test007
     * @tc.desc Verify $_iterator() on new Int8Array([1,2,3]) returns first element value assertion equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_0800
     * @tc.name int8ArrayIteratorPart02Test008
     * @tc.desc Verify $_iterator() on new Int8Array([1,2,3]) first next().done assertion equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r1: boolean = iter.next().done;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_0900
     * @tc.name int8ArrayIteratorPart02Test009
     * @tc.desc Verify $_iterator() first next() returns value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(1);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_1000
     * @tc.name int8ArrayIteratorPart02Test010
     * @tc.desc Verify single-element [0] iterator first value assertion equals 0 (zero/default)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_1100
     * @tc.name int8ArrayIteratorPart02Test011
     * @tc.desc Verify single-element [255] truncated to -1, iterator value assertion equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([255]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_1200
     * @tc.name int8ArrayIteratorPart02Test012
     * @tc.desc Verify single-element [1.9] truncated to 1, iterator value assertion equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1.9]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_1300
     * @tc.name int8ArrayIteratorPart02Test013
     * @tc.desc Verify single-element [-1.9] truncated to -1, iterator value assertion equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1.9]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_1400
     * @tc.name int8ArrayIteratorPart02Test014
     * @tc.desc Verify three-element [1, 2, 3] iterator sequential value assertions equal 1, 2, 3 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_1500
     * @tc.name int8ArrayIteratorPart02Test015
     * @tc.desc Verify [-1, 0, 1] mixed values, iterator sequential value assertions equal -1, 0, 1 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0, 1]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      expect(iter.next().value).assertEqual(-1);
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_1600
     * @tc.name int8ArrayIteratorPart02Test016
     * @tc.desc Verify [127, -128, 0] boundary values, iterator sequential value assertions equal 127, -128, 0 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN, 0]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      expect(iter.next().value).assertEqual(INT8_MAX);
      expect(iter.next().value).assertEqual(INT8_MIN);
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_1700
     * @tc.name int8ArrayIteratorPart02Test017
     * @tc.desc Verify $_iterator() exhausted next() returns undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      iter.next();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_1800
     * @tc.name int8ArrayIteratorPart02Test018
     * @tc.desc Verify $_iterator() exhausted after 3 next() calls returns undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      iter.next();
      iter.next();
      iter.next();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_1900
     * @tc.name int8ArrayIteratorPart02Test019
     * @tc.desc Verify $_iterator() does not change array length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_2000
     * @tc.name int8ArrayIteratorPart02Test020
     * @tc.desc Verify $_iterator() after 4 next() calls leaves length 3 elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      expect(arr.length).assertEqual(3);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_2100
     * @tc.name int8ArrayIteratorPart02Test021
     * @tc.desc Verify $_iterator() does not change byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(1);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_2200
     * @tc.name int8ArrayIteratorPart02Test022
     * @tc.desc Verify $_iterator() after 3 next() calls leaves byteLength 3 and elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      iter.next();
      iter.next();
      iter.next();
      expect(arr.byteLength).assertEqual(3);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_2300
     * @tc.name int8ArrayIteratorPart02Test023
     * @tc.desc Verify iterator fully consumed, iteration count assertion equals original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let count: int = 0;
      let r: IteratorResult<Number> = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_2400
     * @tc.name int8ArrayIteratorPart02Test024
     * @tc.desc Verify empty array iterator fully consumed, iteration count assertion equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let count: int = 0;
      let r: IteratorResult<Number> = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_2500
     * @tc.name int8ArrayIteratorPart02Test025
     * @tc.desc Verify $_iterator() after 3 next() calls leaves $_get(0) = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      iter.next();
      iter.next();
      iter.next();
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_2600
     * @tc.name int8ArrayIteratorPart02Test026
     * @tc.desc Verify $_iterator() after 4 next() calls leaves all elements 1, 2, 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_2700
     * @tc.name int8ArrayIteratorPart02Test027
     * @tc.desc Verify after calling iterator.next() once, $_get(0) returns 1, $_get(1) returns 2, $_get(2) returns 3 on new Int8Array([1,2,3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      iter.next();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_2800
     * @tc.name int8ArrayIteratorPart02Test028
     * @tc.desc Verify two independent iterators on same Int8Array return same first value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter1: IterableIterator<Number> = arr.$_iterator();
      let firstIterVal: Number = iter1.next().value!;
      let iter2: IterableIterator<Number> = arr.$_iterator();
      let secondIterVal: Number = iter2.next().value!;
      expect(firstIterVal).assertEqual(1);
      expect(secondIterVal).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_2900
     * @tc.name int8ArrayIteratorPart02Test029
     * @tc.desc Verify all same values [5, 5, 5], iterator value assertions all equal 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      expect(iter.next().value).assertEqual(5);
      expect(iter.next().value).assertEqual(5);
      expect(iter.next().value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_3000
     * @tc.name int8ArrayIteratorPart02Test030
     * @tc.desc Verify two independent iterator first next().value assertions equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iterA: IterableIterator<Number> = arr.$_iterator();
      let iterB: IterableIterator<Number> = arr.$_iterator();
      expect(iterA.next().value).assertEqual(1);
      expect(iterB.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_3100
     * @tc.name int8ArrayIteratorPart02Test031
     * @tc.desc Verify advancing iterator A twice does not affect iterator B's first next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iterA: IterableIterator<Number> = arr.$_iterator();
      let iterB: IterableIterator<Number> = arr.$_iterator();
      iterA.next();
      iterA.next();
      let rb: IteratorResult<Number> = iterB.next();
      expect(rb.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_3200
     * @tc.name int8ArrayIteratorPart02Test032
     * @tc.desc Verify exhausted iterator, next().done assertion still equals true on subsequent calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      iter.next();
      iter.next();
      let r: IteratorResult<Number> = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_3300
     * @tc.name int8ArrayIteratorPart02Test033
     * @tc.desc Verify exhausted iterator, next().value assertion still equals undefined on subsequent calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      iter.next();
      iter.next();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_3400
     * @tc.name int8ArrayIteratorPart02Test034
     * @tc.desc Verify subarray view iterator first element value assertion equals view first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 3);
      let iter: IterableIterator<Number> = view.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_3500
     * @tc.name int8ArrayIteratorPart02Test035
     * @tc.desc Verify modifying original array element then new iterator next().value assertion reflects modified value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 99);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_3600
     * @tc.name int8ArrayIteratorPart02Test036
     * @tc.desc Verify $_iterator() on subarray(1, 3) view of Int8Array([10, 20, 30, 40]) visits 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 3);
      let iter: IterableIterator<Number> = view.$_iterator();
      let count: int = 0;
      let r: IteratorResult<Number> = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_3700
     * @tc.name int8ArrayIteratorPart02Test037
     * @tc.desc Verify after creating iterator, modify shared buffer, iterator next().value assertion reflects real-time modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf, 0, 4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      let iter: IterableIterator<Number> = arr.$_iterator();
      arr.$_set(0, 5);
      view.$_set(1, 10);
      expect(iter.next().value).assertEqual(5);
      expect(iter.next().value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_3800
     * @tc.name int8ArrayIteratorPart02Test038
     * @tc.desc Verify Symbol.iterator for-of on Int8Array([10, 20, 30]) visits first element 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let first: Number = 0;
      for (let v of arr) {
        first = v;
        break;
      }
      expect(first).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_3900
     * @tc.name int8ArrayIteratorPart02Test039
     * @tc.desc Verify Symbol.iterator for-of on Int8Array([10, 20, 30]) visits last element 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let last: Number = 0;
      for (let v of arr) {
        last = v;
      }
      expect(last).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_4000
     * @tc.name int8ArrayIteratorPart02Test040
     * @tc.desc Verify Symbol.iterator for-of on Int8Array([1, 2, 3]) accumulates sum 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sum: number = 0;
      for (let v of arr) {
        sum = sum + v;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_4100
     * @tc.name int8ArrayIteratorPart02Test041
     * @tc.desc Verify Symbol.iterator for-of on Int8Array([1, 2, 3]) visits 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let count: int = 0;
      for (const _ of arr) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_4200
     * @tc.name int8ArrayIteratorPart02Test042
     * @tc.desc Verify empty array iterator first next().done is true via inline assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_4300
     * @tc.name int8ArrayIteratorPart02Test043
     * @tc.desc Verify empty array iterator first next().value is undefined via inline assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_4400
     * @tc.name int8ArrayIteratorPart02Test044
     * @tc.desc Verify empty array iterator second next().done assertion still equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter: IterableIterator<Number> = arr.$_iterator();
      iter.next();
      let r: IteratorResult<Number> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_4500
     * @tc.name int8ArrayIteratorPart02Test045
     * @tc.desc Verify $_iterator() on single-element Int8Array returns done=false for first next() then done=true for second next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r1: IteratorResult<Number> = iter.next();
      expect(r1.done).assertFalse();
      let r2: IteratorResult<Number> = iter.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_4600
     * @tc.name int8ArrayIteratorPart02Test046
     * @tc.desc Verify Int8Array.of constructed array iterator first element value assertion correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 10, 15);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART02_4700
     * @tc.name int8ArrayIteratorPart02Test047
     * @tc.desc Verify Int8Array.from constructed array iterator first element value assertion correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([7, 8, 9]);
      let arr: Int8Array = Int8Array.from(src);
      let iter: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertEqual(7);
    });
  });
}
