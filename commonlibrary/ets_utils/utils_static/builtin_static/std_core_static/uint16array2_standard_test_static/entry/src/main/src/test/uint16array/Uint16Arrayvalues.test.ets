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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayValuesTest(): void {
  describe('Uint16ArrayValuesTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_0100
     * @tc.name testUint16ArrayValues001
       * @tc.desc Confirm for-of consumes every element from a two-item iterator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2]);
      let iter: IterableIterator<Number> = arr.values();
      let count: number = 0;
      for (let v of iter) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_0200
     * @tc.name testUint16ArrayValues002
       * @tc.desc Confirm the initial next call returns a singleton array entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([42]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_0300
     * @tc.name testUint16ArrayValues003
       * @tc.desc Confirm a singleton entry is returned before completion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([42]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_0400
     * @tc.name testUint16ArrayValues004
       * @tc.desc Confirm sequential next calls follow ascending source indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2]);
      let iter: IterableIterator<Number> = arr.values();
      let r1: IteratorResult<Number> = iter.next();
      let r2: IteratorResult<Number> = iter.next();
      expect(r1.value).assertEqual(1);
      expect(r1.done).assertFalse();
      expect(r2.value).assertEqual(2);
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_0500
     * @tc.name testUint16ArrayValues005
       * @tc.desc Confirm a zero-length array completes without producing entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(0);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_0600
     * @tc.name testUint16ArrayValues006
       * @tc.desc Confirm for-of skips the body for a zero-length array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(0);
      let count: number = 0;
      for (let v of arr.values()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_0700
     * @tc.name testUint16ArrayValues007
       * @tc.desc Confirm an empty iterator returns no value at completion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(0);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_0800
     * @tc.name testUint16ArrayValues008
       * @tc.desc Confirm an empty iterator remains complete after an extra read
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(0);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_0900
     * @tc.name testUint16ArrayValues009
       * @tc.desc Confirm iteration preserves the lower Uint16 boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_1000
     * @tc.name testUint16ArrayValues010
       * @tc.desc Confirm iteration preserves the upper Uint16 boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([65535]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_1100
     * @tc.name testUint16ArrayValues011
       * @tc.desc Confirm iteration preserves the high-bit Uint16 boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([32768]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_1200
     * @tc.name testUint16ArrayValues012
       * @tc.desc Confirm iteration returns an ordinary singleton value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_1300
     * @tc.name testUint16ArrayValues013
       * @tc.desc Confirm boundary values retain their source ordering
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0, 65535]);
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      let second: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(0);
      expect(second.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_1400
     * @tc.name testUint16ArrayValues014
       * @tc.desc Confirm every entry in a three-item array precedes completion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.values();
      let v1: IteratorResult<Number> = iter.next();
      let v2: IteratorResult<Number> = iter.next();
      let v3: IteratorResult<Number> = iter.next();
      expect(v1.value).assertEqual(1);
      expect(v1.done).assertFalse();
      expect(v2.value).assertEqual(2);
      expect(v2.done).assertFalse();
      expect(v3.value).assertEqual(3);
      expect(v3.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_1500
     * @tc.name testUint16ArrayValues015
       * @tc.desc Confirm reads reach the final upper-boundary entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0, 32768, 65535]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      let last: IteratorResult<Number> = iter.next();
      expect(last.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_1600
     * @tc.name testUint16ArrayValues016
       * @tc.desc Confirm the first read preserves a leading maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([65535, 0, 65535]);
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_1700
     * @tc.name testUint16ArrayValues017
       * @tc.desc Confirm repeated zero entries remain addressable by position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0, 0, 0]);
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      let second: IteratorResult<Number> = iter.next();
      let third: IteratorResult<Number> = iter.next();
      expect(third.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_1800
     * @tc.name testUint16ArrayValues018
       * @tc.desc Confirm iteration does not reorder descending source data
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([5, 4, 3, 2, 1]);
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_1900
     * @tc.name testUint16ArrayValues019
       * @tc.desc Confirm next-based traversal counts every entry before completion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let iter: IterableIterator<Number> = arr.values();
      let count: number = 0;
      let result: IteratorResult<Number> = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_2000
     * @tc.name testUint16ArrayValues020
       * @tc.desc Confirm duplicate entries remain present at later indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([42, 42, 42]);
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      let second: IteratorResult<Number> = iter.next();
      expect(second.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_2100
     * @tc.name testUint16ArrayValues021
       * @tc.desc Confirm for-of supports aggregating all yielded numeric entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let sum: number = 0;
      for (let v of arr.values()) {
        sum += v as number;
      }
      expect(sum).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_2200
     * @tc.name testUint16ArrayValues022
       * @tc.desc Confirm breaking for-of stops traversal after two entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let count: number = 0;
      for (let v of arr.values()) {
        count++;
        if (count === 2) {
          break;
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_2300
     * @tc.name testUint16ArrayValues023
       * @tc.desc Confirm continue excludes a selected entry during aggregation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let sum: number = 0;
      for (let v of arr.values()) {
        if ((v as number) === 2) {
          continue;
        }
        sum += v as number;
      }
      expect(sum).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_2400
     * @tc.name testUint16ArrayValues024
       * @tc.desc Confirm nested iterators each begin independently at the first entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2]);
      let count: number = 0;
      for (let v1 of arr.values()) {
        for (let v2 of arr.values()) {
          count++;
        }
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_2500
     * @tc.name testUint16ArrayValues025
       * @tc.desc Confirm for-of collection retains complete source sequencing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([7, 8, 9]);
      let collected: number[] = [];
      for (let v of arr.values()) {
        collected.push(v as number);
      }
      expect(collected.join(',')).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_2600
     * @tc.name testUint16ArrayValues026
       * @tc.desc Confirm advancing twice positions the iterator on the last entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([100, 200, 300]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      let last: IteratorResult<Number> = iter.next();
      expect(last.value).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_2700
     * @tc.name testUint16ArrayValues027
       * @tc.desc Confirm reading a singleton value reports an active iterator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([5]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_2800
     * @tc.name testUint16ArrayValues028
       * @tc.desc Confirm one read beyond a singleton reports completion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([7]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_2900
     * @tc.name testUint16ArrayValues029
       * @tc.desc Confirm completion is stable across repeated reads beyond the end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      let after1: IteratorResult<Number> = iter.next();
      let after2: IteratorResult<Number> = iter.next();
      expect(after1.done).assertTrue();
      expect(after2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_3000
     * @tc.name testUint16ArrayValues030
       * @tc.desc Confirm two prior reads position iteration on the middle entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      let mid: IteratorResult<Number> = iter.next();
      expect(mid.value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_3100
     * @tc.name testUint16ArrayValues031
       * @tc.desc Confirm a consumed singleton yields no value on the following read
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([3]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      let after: IteratorResult<Number> = iter.next();
      expect(after.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_3200
     * @tc.name testUint16ArrayValues032
      * @tc.desc Confirm an iterator created after mutation sees the replaced first entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      arr[0] = 99;
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_3300
     * @tc.name testUint16ArrayValues033
      * @tc.desc Confirm a pre-created iterator reads a mutation before its first access
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.values();
      arr[0] = 88;
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_3400
     * @tc.name testUint16ArrayValues034
       * @tc.desc Confirm iteration exposes entries initialized with fill
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(42);
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_3500
     * @tc.name testUint16ArrayValues035
       * @tc.desc Confirm iteration exposes entries populated through set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.set([10, 20], 0);
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_3600
     * @tc.name testUint16ArrayValues036
       * @tc.desc Confirm iteration reflects content relocated by copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 5);
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_3700
     * @tc.name testUint16ArrayValues037
       * @tc.desc Confirm a pending final entry is read after in-place replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      arr[2] = 99;
      let third: IteratorResult<Number> = iter.next();
      expect(third.value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_3800
     * @tc.name testUint16ArrayValues038
       * @tc.desc Confirm a pending middle entry is read after in-place replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      arr[1] = 77;
      let second: IteratorResult<Number> = iter.next();
      expect(second.value).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_3900
     * @tc.name testUint16ArrayValues039
      * @tc.desc Confirm a view iterator observes writes through an aliased view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr1: Uint16Array = new Uint16Array(buf);
      let arr2: Uint16Array = new Uint16Array(buf);
      arr1[0] = 10;
      let iter: IterableIterator<Number> = arr2.values();
      arr1[0] = 55;
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_4000
     * @tc.name testUint16ArrayValues040
       * @tc.desc Confirm a partially consumed iterator reads the reversed pending index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      arr.reverse();
      let second: IteratorResult<Number> = iter.next();
      expect(second.value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_4100
     * @tc.name testUint16ArrayValues041
      * @tc.desc Confirm independent iterators track separate progress on one array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let iter1: IterableIterator<Number> = arr.values();
      let iter2: IterableIterator<Number> = arr.values();
      iter1.next();
      iter1.next();
      let r1: IteratorResult<Number> = iter1.next();
      let r2: IteratorResult<Number> = iter2.next();
      expect(r1.value).assertEqual(3);
      expect(r1.done).assertFalse();
      expect(r2.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_4200
     * @tc.name testUint16ArrayValues042
      * @tc.desc Confirm advancing one iterator leaves another at its initial entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let iter1: IterableIterator<Number> = arr.values();
      let iter2: IterableIterator<Number> = arr.values();
      iter1.next();
      iter1.next();
      let r2: IteratorResult<Number> = iter2.next();
      expect(r2.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_4300
     * @tc.name testUint16ArrayValues043
       * @tc.desc Confirm exhausting one iterator does not exhaust its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2]);
      let iter1: IterableIterator<Number> = arr.values();
      let iter2: IterableIterator<Number> = arr.values();
      iter1.next();
      iter1.next();
      iter1.next();
      let r2: IteratorResult<Number> = iter2.next();
      expect(r2.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_4400
     * @tc.name testUint16ArrayValues044
       * @tc.desc Confirm iteration reads data stored in an ArrayBuffer-backed view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf);
      arr[0] = 100;
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_4500
     * @tc.name testUint16ArrayValues045
       * @tc.desc Confirm iteration reads the copied content of a cloned typed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = new Uint16Array([10, 20]);
      let arr: Uint16Array = new Uint16Array(src);
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_4600
     * @tc.name testUint16ArrayValues046
       * @tc.desc Confirm iteration starts correctly on an array created with of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_4700
     * @tc.name testUint16ArrayValues047
       * @tc.desc Confirm iteration starts correctly on an array created with from
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.from([50, 60, 70]);
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_4800
     * @tc.name testUint16ArrayValues048
       * @tc.desc Confirm a subarray iterator begins at the view offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let sub: Uint16Array = arr.subarray(1, 3);
      let iter: IterableIterator<Number> = sub.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_4900
     * @tc.name testUint16ArrayValues049
       * @tc.desc Confirm a sliced copy iterator begins at its copied start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([100, 200, 300]);
      let sliced: Uint16Array = arr.slice(1);
      let iter: IterableIterator<Number> = sliced.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_5000
     * @tc.name testUint16ArrayValues050
       * @tc.desc Confirm iteration exposes wraparound at one Uint16 range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([65536]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_5100
     * @tc.name testUint16ArrayValues051
       * @tc.desc Confirm iteration exposes unsigned conversion of a negative input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([-1]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_5200
     * @tc.name testUint16ArrayValues052
       * @tc.desc Confirm iteration exposes integer truncation of a fractional input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([3.14]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_5300
     * @tc.name testUint16ArrayValues053
       * @tc.desc Confirm iteration exposes zero conversion for NaN input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([Number.NaN]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_5400
     * @tc.name testUint16ArrayValues054
       * @tc.desc Confirm iteration exposes zero conversion for positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([Number.POSITIVE_INFINITY]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_5500
     * @tc.name testUint16ArrayValues055
       * @tc.desc Confirm iteration exposes zero conversion for negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([-Number.POSITIVE_INFINITY]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_5600
     * @tc.name testUint16ArrayValues056
       * @tc.desc Confirm iteration truncates a fraction at the Uint16 upper boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([65535.9]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_5700
     * @tc.name testUint16ArrayValues057
       * @tc.desc Confirm iteration applies modulo conversion across two Uint16 ranges
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([131072]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_5800
     * @tc.name testUint16ArrayValues058
       * @tc.desc Confirm hexadecimal syntax initializes the unsigned upper boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0xFFFF]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_5900
     * @tc.name testUint16ArrayValues059
       * @tc.desc Confirm hexadecimal syntax initializes the high-bit boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0x8000]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_6000
     * @tc.name testUint16ArrayValues060
       * @tc.desc Confirm octal syntax initializes the unsigned upper boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0o177777]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_6100
     * @tc.name testUint16ArrayValues061
       * @tc.desc Confirm binary syntax initializes the unsigned upper boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0b1111111111111111]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_6200
     * @tc.name testUint16ArrayValues062
       * @tc.desc Confirm scientific notation retains its integral numeric value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1e4]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_6300
     * @tc.name testUint16ArrayValues063
       * @tc.desc Confirm traversal covers a populated hundred-element allocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = i;
      }
      let count: number = 0;
      for (let v of arr.values()) {
        count++;
      }
      expect(count).assertEqual(100);
      expect(arr[0]).assertEqual(0);
      expect(arr[99]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_6400
     * @tc.name testUint16ArrayValues064
       * @tc.desc Confirm sequential reads preserve both endpoints of a 256-entry array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(256);
      for (let i: int = 0; i < 256; i++) {
        arr[i] = i;
      }
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(0);
      let last: IteratorResult<Number> = first;
      for (let i: int = 1; i < 256; i++) {
        last = iter.next();
      }
      expect(last.value).assertEqual(255);
      expect(last.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_6500
     * @tc.name testUint16ArrayValues065
       * @tc.desc Confirm for-of aggregates every member of a 256-entry range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(256);
      for (let i: int = 0; i < 256; i++) {
        arr[i] = i;
      }
      let sum: number = 0;
      for (let v of arr.values()) {
        sum += v as number;
      }
      expect(sum).assertEqual(32640);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_6600
     * @tc.name testUint16ArrayValues066
      * @tc.desc Confirm separate view iterators read identical shared-buffer storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr1: Uint16Array = new Uint16Array(buf, 0, 2);
      let arr2: Uint16Array = new Uint16Array(buf, 0, 2);
      arr1[0] = 10;
      arr1[1] = 20;
      let iter1: IterableIterator<Number> = arr1.values();
      let iter2: IterableIterator<Number> = arr2.values();
      iter1.next();
      let r2: IteratorResult<Number> = iter2.next();
      expect(r2.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_6700
     * @tc.name testUint16ArrayValues067
      * @tc.desc Confirm an iterator observes writes made through a sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr1: Uint16Array = new Uint16Array(buf);
      let arr2: Uint16Array = new Uint16Array(buf);
      arr1[0] = 5;
      arr2[0] = 25;
      let iter: IterableIterator<Number> = arr1.values();
      let result: IteratorResult<Number> = iter.next();
      expect(result.value).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_6800
     * @tc.name testUint16ArrayValues068
      * @tc.desc Confirm offset views iterate their own non-overlapping buffer regions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr1: Uint16Array = new Uint16Array(buf, 0, 1);
      let arr2: Uint16Array = new Uint16Array(buf, 2, 1);
      arr1[0] = 100;
      arr2[0] = 200;
      let iter1: IterableIterator<Number> = arr1.values();
      let iter2: IterableIterator<Number> = arr2.values();
      let r1: IteratorResult<Number> = iter1.next();
      let r2: IteratorResult<Number> = iter2.next();
      expect(r1.value).assertEqual(100);
      expect(r1.done).assertFalse();
      expect(r2.value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_6900
     * @tc.name testUint16ArrayValues069
       * @tc.desc Confirm iteration reflects an in-place reversal before creation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      arr.reverse();
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_7000
     * @tc.name testUint16ArrayValues070
       * @tc.desc Confirm iteration reflects ascending order after in-place sorting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([3, 1, 2]);
      arr.sort();
      let iter: IterableIterator<Number> = arr.values();
      let first: IteratorResult<Number> = iter.next();
      expect(first.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_7100
     * @tc.name testUint16ArrayValues071
      * @tc.desc Confirm three successive reads preserve construction order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(4, 5, 6);
      const iterator: IterableIterator<Number> = source.values();
      const first: IteratorResult<Number> = iterator.next();
      const second: IteratorResult<Number> = iterator.next();
      const third: IteratorResult<Number> = iterator.next();
      expect(first.value).assertEqual(4);
      expect(second.value).assertEqual(5);
      expect(third.value).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_7200
     * @tc.name testUint16ArrayValues072
      * @tc.desc Confirm the read after a singleton is marked complete
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(9);
      const iterator: IterableIterator<Number> = source.values();
      const first: IteratorResult<Number> = iterator.next();
      const done: IteratorResult<Number> = iterator.next();
      expect(first.done).assertFalse();
      expect(done.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_7300
     * @tc.name testUint16ArrayValues073
      * @tc.desc Confirm direct reading from a default array is complete
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = new Uint16Array();
      const result: IteratorResult<Number> = source.values().next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_7400
     * @tc.name testUint16ArrayValues074
      * @tc.desc Confirm concurrent iterators retain independent cursor positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(1, 2, 3);
      const firstIterator: IterableIterator<Number> = source.values();
      const secondIterator: IterableIterator<Number> = source.values();
      firstIterator.next();
      firstIterator.next();
      expect(firstIterator.next().value).assertEqual(3);
      expect(secondIterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_7500
     * @tc.name testUint16ArrayValues075
      * @tc.desc Confirm a mid-traversal replacement affects the pending entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(1, 2, 3);
      const iterator: IterableIterator<Number> = source.values();
      expect(iterator.next().value).assertEqual(1);
      source[1] = 22;
      expect(iterator.next().value).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_7600
     * @tc.name testUint16ArrayValues076
      * @tc.desc Confirm iteration is restricted to a nonzero-offset buffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      const full: Uint16Array = new Uint16Array(buffer);
      full.set(Uint16Array.of(9, 2, 4, 6, 8));
      const view: Uint16Array = new Uint16Array(buffer, 2, 3);
       let encoded: string = '';
       for (let value of view.values()) {
         encoded = encoded + value.toString() + ',';
       }
      expect(encoded).assertEqual('2,4,6,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_7700
     * @tc.name testUint16ArrayValues077
      * @tc.desc Confirm traversal exposes unsigned normalization for several inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = new Uint16Array([-1, 65536, 65537]);
       let encoded: string = '';
       for (let value of source.values()) {
         encoded = encoded + value.toString() + ',';
       }
      expect(encoded).assertEqual('65535,0,1,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_7800
     * @tc.name testUint16ArrayValues078
      * @tc.desc Confirm for-of visits each prime entry once while preserving total
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(2, 3, 5, 7);
       let count: int = 0;
       let sum: int = 0;
       for (let value of source.values()) {
         count++;
         sum = sum + value.toInt();
       }
      expect(count).assertEqual(4);
      expect(sum).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_7900
     * @tc.name testUint16ArrayValues079
      * @tc.desc Confirm completion remains stable after multiple exhausted reads
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(1);
      const iterator: IterableIterator<Number> = source.values();
      iterator.next();
      const firstDone: IteratorResult<Number> = iterator.next();
      const secondDone: IteratorResult<Number> = iterator.next();
      expect(firstDone.done).assertTrue();
      expect(secondDone.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUES_8000
     * @tc.name testUint16ArrayValues080
      * @tc.desc Confirm delayed reads observe the current value in shared storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValues080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(6);
      const source: Uint16Array = new Uint16Array(buffer);
      const alias: Uint16Array = new Uint16Array(buffer);
      source.set(Uint16Array.of(3, 4, 5));
      alias[2] = 55;
      const iterator: IterableIterator<Number> = source.values();
      iterator.next();
      iterator.next();
      expect(iterator.next().value).assertEqual(55);
    });

  });
}
