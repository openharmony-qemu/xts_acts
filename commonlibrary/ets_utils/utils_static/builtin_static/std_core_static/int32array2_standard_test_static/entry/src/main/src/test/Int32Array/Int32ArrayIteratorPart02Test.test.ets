'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayIteratorPart02Test(): void {
  describe('Int32ArrayIteratorPart02Test', () => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayIteratorPart02TestMindmapTest001
     * @tc.desc Verify values() returns the first array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let it = arr.values();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayIteratorPart02TestMindmapTest002
     * @tc.desc Verify iterator returns the expected iteration result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let it = arr.values();
      let r = it.next();
      expect(r.value).assertEqual(1);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayIteratorPart02TestMindmapTest003
     * @tc.desc Verify values() creates independent iterator instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let it1 = arr.values();
      let it2 = arr.values();
      expect(it1).not().assertEqual(it2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayIteratorPart02TestMindmapTest004
     * @tc.desc Verify iterator Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let it = arr.values();
      let first = it.next();
      expect(first.value).assertEqual(1);
      expect(first.done).assertFalse();
      expect(it.next().value).assertEqual(2);
      expect(it.next().done).assertTrue();
      expect(Array.isArray(it)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayIteratorPart02TestMindmapTest005
     * @tc.desc Verify iterator next() returns the array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let it = arr.values();
      let r = it.next();
      expect(r.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayIteratorPart02TestMindmapTest006
     * @tc.desc Verify iterator() next() done boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let it = arr.values();
      let r = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayIteratorPart02TestMindmapTest007
     * @tc.desc Verify iterator() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 5);
      let it = arr.values();
      it.next();
      let r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayIteratorPart02TestMindmapTest008
     * @tc.desc Verify iterator() next() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 5);
      let it = arr.values();
      it.next();
      let r = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayIteratorPart02TestMindmapTest009
     * @tc.desc Verify iterator() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let it = arr.values();
      let r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayIteratorPart02TestMindmapTest010
     * @tc.desc Verify iterator() next() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let it = arr.values();
      let r = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayIteratorPart02TestMindmapTest011
     * @tc.desc Verify iterator() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let it = arr.values();
      it.next();
      let r2 = it.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayIteratorPart02TestMindmapTest012
     * @tc.desc Verify iterator() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let it = arr.values();
      it.next();
      it.next();
      let r3 = it.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayIteratorPart02TestMindmapTest013
     * @tc.desc Verify iterator() next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 777);
      let it = arr.values();
      expect(it.next().value).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayIteratorPart02TestMindmapTest014
     * @tc.desc Verify iterator() next 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      let it = arr.values();
      expect(it.next().value).assertEqual(11);
      expect(it.next().value).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayIteratorPart02TestMindmapTest015
     * @tc.desc Verify iterator() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let it = arr.values();
      it.next();
      it.next();
      expect(it.next().value).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayIteratorPart02TestMindmapTest016
     * @tc.desc Verify iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -42);
      let it = arr.values();
      expect(it.next().value).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayIteratorPart02TestMindmapTest017
     * @tc.desc Verify iterator() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 0);
      let it = arr.values();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayIteratorPart02TestMindmapTest018
     * @tc.desc Verify iterator() INT_MIN ( 2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2147483648);
      let it = arr.values();
      expect(it.next().value).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayIteratorPart02TestMindmapTest019
     * @tc.desc Verify iterator() INT_MAX (2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483647);
      let it = arr.values();
      expect(it.next().value).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayIteratorPart02TestMindmapTest020
     * @tc.desc Verify iterator() Number.NaN ToInt32 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Number.NaN]);
      let it = arr.values();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayIteratorPart02TestMindmapTest021
     * @tc.desc Verify iterator() +Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Number.POSITIVE_INFINITY]);
      let it = arr.values();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayIteratorPart02TestMindmapTest022
     * @tc.desc Verify iterator() -Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-Number.POSITIVE_INFINITY]);
      let it = arr.values();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayIteratorPart02TestMindmapTest023
     * @tc.desc Verify iterator() 0.9 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0.9]);
      let it = arr.values();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayIteratorPart02TestMindmapTest024
     * @tc.desc Verify iterator() -0.9 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-0.9]);
      let it = arr.values();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayIteratorPart02TestMindmapTest025
     * @tc.desc Verify iterator() 2147483647.9 ToInt32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647.9]);
      let it = arr.values();
      expect(it.next().value).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayIteratorPart02TestMindmapTest026
     * @tc.desc Verify iterator() +0 -0 SameValueZero 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0);
      let it = arr.values();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayIteratorPart02TestMindmapTest027
     * @tc.desc Verify iterator() for-of $_get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 8, 7, 6]);
      let last: number = 0;
      for (let v of arr) {
        last = v;
      }
      expect(last).assertEqual(arr.$_get(arr.length - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayIteratorPart02TestMindmapTest028
     * @tc.desc Verify iterator() 2147483648 INT_MAX+1 ToInt32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483648.0]);
      let it = arr.values();
      expect(it.next().value).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayIteratorPart02TestMindmapTest029
     * @tc.desc Verify iterator() 2147483649 ToInt32 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483649.0]);
      let it = arr.values();
      expect(it.next().value).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayIteratorPart02TestMindmapTest030
     * @tc.desc Verify iterator() -2147483649 ToInt32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483649.0]);
      let it = arr.values();
      expect(it.next().value).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayIteratorPart02TestMindmapTest031
     * @tc.desc Verify iterator() 4294967296 (2^32) ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4294967296.0]);
      let it = arr.values();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayIteratorPart02TestMindmapTest032
     * @tc.desc Verify iterator() 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let count: number = 0;
      for (let _v of arr) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayIteratorPart02TestMindmapTest033
     * @tc.desc Verify iterator() 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let count: number = 0;
      for (let _v of arr) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayIteratorPart02TestMindmapTest034
     * @tc.desc Verify iterator() 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 0);
      let count: number = 0;
      for (let _v of arr) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayIteratorPart02TestMindmapTest035
     * @tc.desc Verify iterator() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let lenBefore: number = arr.length;
      let seen: number[] = [];
      for (let v of arr) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(4);
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(2);
      expect(seen[2]).assertEqual(3);
      expect(seen[3]).assertEqual(4);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayIteratorPart02TestMindmapTest036
     * @tc.desc Verify iterator() byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let bl: number = arr.byteLength;
      let seen: number[] = [];
      for (let v of arr) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(2);
      expect(arr.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayIteratorPart02TestMindmapTest037
     * @tc.desc Verify iterator() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let bo: number = arr.byteOffset;
      let seen: number[] = [];
      for (let v of arr) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(0);
      expect(seen[1]).assertEqual(0);
      expect(arr.byteOffset).assertEqual(bo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayIteratorPart02TestMindmapTest038
     * @tc.desc Verify iterator() next() length + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let it = arr.values();
      let calls: number = 0;
      while (!it.next().done) {
        calls++;
      }
      expect(calls).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayIteratorPart02TestMindmapTest039
     * @tc.desc Verify iterator() length=4 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let count: number = 0;
      for (let _v of arr) {
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayIteratorPart02TestMindmapTest040
     * @tc.desc Verify iterator() for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([101, 202]);
      let firstBefore: number = arr.$_get(0);
      let seen: number[] = [];
      for (let v of arr) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(101);
      expect(seen[1]).assertEqual(202);
      expect(arr.$_get(0)).assertEqual(firstBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayIteratorPart02TestMindmapTest041
     * @tc.desc Verify iterator() for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
      let snapshot: number[] = [arr.$_get(0), arr.$_get(1), arr.$_get(2), arr.$_get(3)];
      let seen: number[] = [];
      for (let v of arr) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(4);
      expect(seen[0]).assertEqual(5);
      expect(seen[1]).assertEqual(6);
      expect(seen[2]).assertEqual(7);
      expect(seen[3]).assertEqual(8);
      expect(arr.$_get(0)).assertEqual(snapshot[0]);
      expect(arr.$_get(1)).assertEqual(snapshot[1]);
      expect(arr.$_get(2)).assertEqual(snapshot[2]);
      expect(arr.$_get(3)).assertEqual(snapshot[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayIteratorPart02TestMindmapTest042
     * @tc.desc Verify iterator() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      let bufRef = arr.buffer;
      let seen: number[] = [];
      for (let v of arr) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(3);
      expect(seen[0]).assertEqual(0);
      expect(seen[1]).assertEqual(0);
      expect(seen[2]).assertEqual(0);
      expect(arr.buffer).assertEqual(bufRef);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayIteratorPart02TestMindmapTest043
     * @tc.desc Verify iterator() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([33, 44]);
      let it = arr.values();
      it.next();
      it.next();
      expect(arr.$_get(0)).assertEqual(33);
      expect(arr.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayIteratorPart02TestMindmapTest044
     * @tc.desc Verify iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 4]);
      let a: number[] = [];
      let b: number[] = [];
      for (let v of arr) {
        a.push(v);
      }
      for (let v of arr) {
        b.push(v);
      }
      expect(a.length).assertEqual(b.length);
      for (let i = 0; i < a.length; i++) {
        expect(a[i]).assertEqual(b[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayIteratorPart02TestMindmapTest045
     * @tc.desc Verify iterator() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let sum: number = 0;
      for (let _v of arr) {
        sum += arr.length;
      }
      expect(sum).assertEqual(5 * 5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayIteratorPart02TestMindmapTest046
     * @tc.desc Verify iterator() $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let seen: number[] = [];
      for (let v of arr) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayIteratorPart02TestMindmapTest047
     * @tc.desc Verify iterator() spread Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([91, 92]);
      let spread = [...arr];
      expect(spread.length).assertEqual(2);
      expect(spread[0]).assertEqual(91);
      expect(spread[1]).assertEqual(92);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayIteratorPart02TestMindmapTest048
     * @tc.desc Verify for-of iterator iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8]);
      let it = arr.values();
      let seen: number[] = [];
      for (let v of it) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(7);
      expect(seen[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayIteratorPart02TestMindmapTest049
     * @tc.desc Verify spread iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([13, 14]);
      let it = arr.values();
      let parts = [...it];
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(13);
      expect(parts[1]).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayIteratorPart02TestMindmapTest050
     * @tc.desc Verify spread iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([21]);
      let it = arr.values();
      it.next();
      it.next();
      let parts = [...it];
      expect(parts.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayIteratorPart02TestMindmapTest051
     * @tc.desc Verify iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let it1 = arr.values();
      let it2 = arr.values();
      expect(it1.next().value).assertEqual(100);
      expect(it2.next().value).assertEqual(100);
      expect(it1.next().value).assertEqual(200);
      expect(it2.next().value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayIteratorPart02TestMindmapTest052
     * @tc.desc Verify iterator iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let itA = arr.values();
      let itB = arr.values();
      itA.next();
      itA.next();
      itA.next();
      itA.next();
      itA.next();
      expect(itA.next().done).assertTrue();
      expect(itB.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayIteratorPart02TestMindmapTest053
     * @tc.desc Verify iterator() Int32Array ArrayBuffer.isView true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let before: boolean = ArrayBuffer.isView(arr);
      let seen: number[] = [];
      for (let v of arr) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(2);
      let after: boolean = ArrayBuffer.isView(arr);
      expect(before).assertTrue();
      expect(after).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayIteratorPart02TestMindmapTest054
     * @tc.desc Verify values() iteration preserves the underlying ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      let seen: number[] = [];
      for (let v of arr) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(0);
      expect(seen[1]).assertEqual(0);
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayIteratorPart02TestMindmapTest055
     * @tc.desc Verify iterator() byteOffset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 111);
      full.$_set(1, 222);
      full.$_set(2, 333);
      full.$_set(3, 444);
      let view: Int32Array = new Int32Array(buf, 4, 2);
      let seen: number[] = [];
      for (let v of view) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(222);
      expect(seen[1]).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayIteratorPart02TestMindmapTest056
     * @tc.desc Verify iterator() subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(1, 4);
      let seen: number[] = [];
      for (let v of sub) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(3);
      expect(seen[0]).assertEqual(20);
      expect(seen[1]).assertEqual(30);
      expect(seen[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayIteratorPart02TestMindmapTest057
     * @tc.desc Verify iterator() subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(0, 2);
      expect(sub.buffer).assertEqual(arr.buffer);
      let seen: number[] = [];
      for (let v of sub) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayIteratorPart02TestMindmapTest058
     * @tc.desc Verify iterator() subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([55, 66, 77, 88]);
      let sub: Int32Array = arr.subarray(1, 3);
      let seen: number[] = [];
      for (let v of sub) {
        seen.push(v);
      }
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(66);
      expect(seen[1]).assertEqual(77);
      expect(arr.$_get(0)).assertEqual(55);
      expect(arr.$_get(1)).assertEqual(66);
      expect(arr.$_get(2)).assertEqual(77);
      expect(arr.$_get(3)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayIteratorPart02TestMindmapTest059
     * @tc.desc Verify iterator() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      b.$_set(0, 11);
      b.$_set(1, 22);
      b.$_set(2, 33);
      let seen: number[] = [];
      for (let v of a) {
        seen.push(v);
      }
      expect(seen[0]).assertEqual(11);
      expect(seen[1]).assertEqual(22);
      expect(seen[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayIteratorPart02TestMindmapTest060
     * @tc.desc Verify iterator() $_set live
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let seen: number[] = [];
      for (let v of arr) {
        seen.push(v);
        if (v === 1) {
          arr.$_set(2, 999);
        }
      }
      expect(seen[0]).assertEqual(1);
      expect(seen[2]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayIteratorPart02TestMindmapTest061
     * @tc.desc Verify iterator() byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, 12345);
      let count: number = 0;
      let got: number = 0;
      for (let v of view) {
        count++;
        got = v;
      }
      expect(count).assertEqual(1);
      expect(got).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayIteratorPart02TestMindmapTest062
     * @tc.desc Verify iterator() ArrayBuffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big = new ArrayBuffer(4096);
      let view: Int32Array = new Int32Array(big, 0, 2);
      view.$_set(0, 111);
      view.$_set(1, 222);
      let count: number = 0;
      for (let _v of view) {
        count++;
      }
      expect(count).assertEqual(2);
      expect(view.$_get(0)).assertEqual(111);
      expect(view.$_get(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayIteratorPart02TestMindmapTest063
     * @tc.desc Verify iterator() Int32Array buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let count: int = 0;
      for (let v of arr) {
        expect(v).assertEqual(1);
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayIteratorPart02TestMindmapTest064
     * @tc.desc Verify iterator() of of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77, 88, 99);
      let it = arr.values();
      expect(it.next().value).assertEqual(77);
      expect(it.next().value).assertEqual(88);
      expect(it.next().value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayIteratorPart02TestMindmapTest065
     * @tc.desc Verify iterator() from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [4, 5, 6];
      let arr: Int32Array = Int32Array.from(src);
      let seen: number[] = [];
      for (let v of arr) {
        seen.push(v);
      }
      expect(seen[0]).assertEqual(4);
      expect(seen[1]).assertEqual(5);
      expect(seen[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayIteratorPart02TestMindmapTest066
     * @tc.desc Verify iterator returns the expected iteration result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let i: int = 0;
      for (let v of arr) {
        expect(v).assertEqual(arr.$_get(i));
        i++;
      }
      expect(i).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayIteratorPart02TestMindmapTest067
     * @tc.desc Verify iterator() preserves INT32_MAX-1 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483646);
      let iterator = arr.values();
      expect(iterator.next().value).assertEqual(2147483646);
    });
  });
}
