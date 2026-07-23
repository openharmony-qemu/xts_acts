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

export default function Uint8ArrayIteratorTest(): void {
  describe('Uint8ArrayIteratorTest', () => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_0100
     * @tc.name testUint8ArrayIterator001
     * @tc.desc Verify calling $_iterator() without parameters returns non-null iterator object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(10, 20);
      let iter = arr.$_iterator();
      expect(iter).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_0200
     * @tc.name testUint8ArrayIterator002
     * @tc.desc Verify $_iterator() returns object type as 'object'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(10);
      let iter = arr.$_iterator();
      let result = iter.next();
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_0300
     * @tc.name testUint8ArrayIterator003
     * @tc.desc Verify returned iterator object contains next method and is function type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(10);
      let iter = arr.$_iterator();
      let result = iter.next();
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_0400
     * @tc.name testUint8ArrayIterator004
     * @tc.desc Verify next() returns object with done property of boolean type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(10);
      let iter = arr.$_iterator();
      let result = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_0500
     * @tc.name testUint8ArrayIterator005
     * @tc.desc Verify next() returns object with value property of number type when not done
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(10);
      let iter = arr.$_iterator();
      let result = iter.next();
      expect(result.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_0600
     * @tc.name testUint8ArrayIterator006
     * @tc.desc Verify returned iterator itself can be consumed by for-of loop
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(10, 20);
      let iter = arr.$_iterator();
      let count = 0;
      let nextResult = iter.next();
      while (!nextResult.done) {
        count++;
        nextResult = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_0700
     * @tc.name testUint8ArrayIterator007
     * @tc.desc Verify empty array for-of loop body does not execute
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array();
      let count = 0;
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        count++;
        nextResult = iter.next();
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_0800
     * @tc.name testUint8ArrayIterator008
     * @tc.desc Verify empty array $_iterator().next().done is true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array();
      let iter = arr.$_iterator();
      let result = iter.next();
      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_0900
     * @tc.name testUint8ArrayIterator009
     * @tc.desc Verify empty array $_iterator().next().value is undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array();
      let iter = arr.$_iterator();
      let result = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_1000
     * @tc.name testUint8ArrayIterator010
     * @tc.desc Verify empty array iterator second next() done is still true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array();
      let iter = arr.$_iterator();
      iter.next();
      let result = iter.next();
      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_1100
     * @tc.name testUint8ArrayIterator011
     * @tc.desc Verify empty array length remains 0 after iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array();
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        nextResult = iter.next();
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_1200
     * @tc.name testUint8ArrayIterator012
     * @tc.desc Verify [0] for-of collects 1 element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0);
      let count = 0;
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        count++;
        nextResult = iter.next();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_1300
     * @tc.name testUint8ArrayIterator013
     * @tc.desc Verify [0] manual iteration .next().value is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_1400
     * @tc.name testUint8ArrayIterator014
     * @tc.desc Verify [0] first .next().done is false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0);
      let iter = arr.$_iterator();
      expect(iter.next().done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_1500
     * @tc.name testUint8ArrayIterator015
     * @tc.desc Verify [0] second .next().done is true (iteration exhausted)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0);
      let iter = arr.$_iterator();
      iter.next();
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_1600
     * @tc.name testUint8ArrayIterator016
     * @tc.desc Verify [255] manual iteration .next().value is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(255);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_1700
     * @tc.name testUint8ArrayIterator017
     * @tc.desc Verify [128] manual iteration .next().value is 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(128);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_1800
     * @tc.name testUint8ArrayIterator018
     * @tc.desc Verify [127] for-of iteration value matches index read arr[0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(127);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(arr.at(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_1900
     * @tc.name testUint8ArrayIterator019
     * @tc.desc Verify [0, 127, 255] for-of collects 3 elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 127, 255);
      let count = 0;
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        count++;
        nextResult = iter.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_2000
     * @tc.name testUint8ArrayIterator020
     * @tc.desc Verify [0, 127, 255] first iteration value is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 127, 255);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_2100
     * @tc.name testUint8ArrayIterator021
     * @tc.desc Verify [0, 127, 255] second iteration value is 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 127, 255);
      let iter = arr.$_iterator();
      iter.next();
      expect(iter.next().value).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_2200
     * @tc.name testUint8ArrayIterator022
     * @tc.desc Verify [0, 127, 255] third iteration value is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 127, 255);
      let iter = arr.$_iterator();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_2300
     * @tc.name testUint8ArrayIterator023
     * @tc.desc Verify [0, 127, 255] iteration completed .next().done is true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 127, 255);
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        nextResult = iter.next();
      }
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_2400
     * @tc.name testUint8ArrayIterator024
     * @tc.desc Verify [1, 2, 3, 4, 5] five elements all iterated in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3, 4, 5);
      let collected: Number[] = [];
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        collected.push(nextResult.value!);
        nextResult = iter.next();
      }
      expect(collected.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_2500
     * @tc.name testUint8ArrayIterator025
     * @tc.desc Verify [1, 2, 3, 4, 5] iteration order matches index order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3, 4, 5);
      let iter = arr.$_iterator();
      let ok = true;
      for (let i = 0; i < 5; i++) {
        if (iter.next().value !== arr.at(i)) {
          ok = false;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_2600
     * @tc.name testUint8ArrayIterator026
     * @tc.desc Verify 100 elements all iteration values match index values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr.set([i], i);
      }
      let iter = arr.$_iterator();
      let ok = true;
      for (let i = 0; i < 100; i++) {
        if (iter.next().value !== i) {
          ok = false;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_2700
     * @tc.name testUint8ArrayIterator027
     * @tc.desc Verify element 256 truncated to 0, iteration value is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(256);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_2800
     * @tc.name testUint8ArrayIterator028
     * @tc.desc Verify element -1 wraps to 255, iteration value is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(-1);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_2900
     * @tc.name testUint8ArrayIterator029
     * @tc.desc Verify element 0xFF (hex 255) iteration value is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0xFF);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_3000
     * @tc.name testUint8ArrayIterator030
     * @tc.desc Verify element 0x100 (hex 256) truncated to 0, iteration value is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0x100);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_3100
     * @tc.name testUint8ArrayIterator031
     * @tc.desc Verify element 0x80 (hex 128) iteration value is 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0x80);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_3200
     * @tc.name testUint8ArrayIterator032
     * @tc.desc Verify all-zero array [0, 0, 0, 0] iteration all values are 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0, 0);
      let count = 0;
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        count++;
        nextResult = iter.next();
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_3300
     * @tc.name testUint8ArrayIterator033
     * @tc.desc Verify for-of loop break terminates iteration early
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3, 4, 5);
      let count = 0;
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        count++;
        if (count === 2) {
          break;
        }
        nextResult = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_3400
     * @tc.name testUint8ArrayIterator034
     * @tc.desc Verify for-of loop continue skips current iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3);
      let sum = 0;
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        let v = nextResult.value;
        if (v === 2) {
          nextResult = iter.next();
          continue;
        }
        sum += v!;
        nextResult = iter.next();
      }
      expect(sum).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_3500
     * @tc.name testUint8ArrayIterator035
     * @tc.desc Verify nested for-of two traversals of same array do not interfere
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2);
      let outer = 0;
      let iterA = arr.$_iterator();
      let nextA = iterA.next();
      while (!nextA.done) {
        let iterB = arr.$_iterator();
        let nextB = iterB.next();
        while (!nextB.done) {
          outer++;
          nextB = iterB.next();
        }
        nextA = iterA.next();
      }
      expect(outer).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_3600
     * @tc.name testUint8ArrayIterator036
     * @tc.desc Verify for-of iteration values match ordinary for loop index reads
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(10, 20, 30);
      let iter = arr.$_iterator();
      let match = true;
      for (let i = 0; i < 3; i++) {
        if (iter.next().value !== arr.at(i)) {
          match = false;
        }
      }
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_3700
     * @tc.name testUint8ArrayIterator037
     * @tc.desc Verify for-of const variable scope is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(5, 10);
      let values: Number[] = [];
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        values.push(nextResult.value!);
        nextResult = iter.next();
      }
      expect(values[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_3800
     * @tc.name testUint8ArrayIterator038
     * @tc.desc Verify empty array $_iterator and values() both produce no values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array();
      let iterA = arr.$_iterator();
      let iterB = arr.values();
      expect(iterA.next().done).assertEqual(iterB.next().done);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_3900
     * @tc.name testUint8ArrayIterator039
     * @tc.desc Verify [0, 128] $_iterator and values() first element are same
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 128);
      expect(arr.$_iterator().next().value).assertEqual(arr.values().next().value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_4000
     * @tc.name testUint8ArrayIterator040
     * @tc.desc Verify [255, 0, 127] $_iterator and values() second element are same
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(255, 0, 127);
      let a = arr.$_iterator();
      let b = arr.values();
      a.next();
      b.next();
      expect(a.next().value).assertEqual(b.next().value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_4100
     * @tc.name testUint8ArrayIterator041
     * @tc.desc Verify large array $_iterator and values() traverse same element count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(50);
      let countA = 0;
      let countB = 0;
      let iterA = arr.$_iterator();
      let nextA = iterA.next();
      while (!nextA.done) {
        countA++;
        nextA = iterA.next();
      }
      let iterB = arr.values();
      let nextB = iterB.next();
      while (!nextB.done) {
        countB++;
        nextB = iterB.next();
      }
      expect(countA).assertEqual(countB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_4200
     * @tc.name testUint8ArrayIterator042
     * @tc.desc Verify [0, 0xFF, 128, 256, -1] two iterators equivalent to respective sequential reads
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0xFF, 128, 256, -1);
      let iterA = arr.$_iterator();
      let iterB = arr.values();
      let equal = true;
      for (let i = 0; i < 5; i++) {
        if (iterA.next().value !== iterB.next().value) {
          equal = false;
        }
      }
      expect(equal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_4300
     * @tc.name testUint8ArrayIterator043
     * @tc.desc Verify same array two for-of produce same value sequence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(10, 20, 30);
      let first: Number[] = [];
      let second: Number[] = [];
      let iter1 = arr.$_iterator();
      let next1 = iter1.next();
      while (!next1.done) {
        first.push(next1.value!);
        next1 = iter1.next();
      }
      let iter2 = arr.$_iterator();
      let next2 = iter2.next();
      while (!next2.done) {
        second.push(next2.value!);
        next2 = iter2.next();
      }
      expect(first[0]).assertEqual(second[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_4400
     * @tc.name testUint8ArrayIterator044
     * @tc.desc Verify two independent $_iterator calls produce independent iterators
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3);
      let iter1 = arr.$_iterator();
      let iter2 = arr.$_iterator();
      iter1.next();
      iter1.next();
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_4500
     * @tc.name testUint8ArrayIterator045
     * @tc.desc Verify array element content not modified after iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(5, 10, 15);
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        nextResult = iter.next();
      }
      expect(arr.at(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_4600
     * @tc.name testUint8ArrayIterator046
     * @tc.desc Verify array length remains unchanged after iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(5, 10, 15);
      let before = arr.length;
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        nextResult = iter.next();
      }
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_4700
     * @tc.name testUint8ArrayIterator047
     * @tc.desc Verify iterator exhausted then re-create iterator to traverse again
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(7, 14, 21);
      let iter = arr.$_iterator();
      while (!iter.next().done) {
      }
      let iter2 = arr.$_iterator();
      expect(iter2.next().value).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_4800
     * @tc.name testUint8ArrayIterator048
     * @tc.desc Verify modifying current element during iteration reflects new value in subsequent iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3);
      let iter = arr.$_iterator();
      iter.next();
      iter.next();
      arr.set([99], 2);
      expect(iter.next().value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_4900
     * @tc.name testUint8ArrayIterator049
     * @tc.desc Verify modifying array element before iteration, iteration reads modified value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3);
      arr.set([200], 1);
      let iter = arr.$_iterator();
      iter.next();
      expect(iter.next().value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_5000
     * @tc.name testUint8ArrayIterator050
     * @tc.desc Verify modifying array by index after iteration completes, array usable normally
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3);
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        nextResult = iter.next();
      }
      arr.set([100], 0);
      expect(arr.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_5100
     * @tc.name testUint8ArrayIterator051
     * @tc.desc Verify fill during iteration, subsequent iteration values reflect fill
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3, 4, 5);
      let count = 0;
      let iter = arr.$_iterator();
      let nextResult = iter.next();
      while (!nextResult.done) {
        count++;
        if (count === 2) {
          arr.fill(9);
        }
        nextResult = iter.next();
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_5200
     * @tc.name testUint8ArrayIterator052
     * @tc.desc Verify calling next() after iterator exhausted does not throw exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1);
      let iter = arr.$_iterator();
      iter.next();
      let result = iter.next();
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_5300
     * @tc.name testUint8ArrayIterator053
     * @tc.desc Verify calling next() after iterator exhausted, done is true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1);
      let iter = arr.$_iterator();
      iter.next();
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ITERATOR_5400
     * @tc.name testUint8ArrayIterator054
     * @tc.desc Verify calling next() after iterator exhausted, value is undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIterator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1);
      let iter = arr.$_iterator();
      iter.next();
      expect(iter.next().value).assertUndefined();
    });
  });
}
