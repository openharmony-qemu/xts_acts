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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16Array$IteratorTest(): void {
  describe('Uint16Array$IteratorTest', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0001
     * @tc.name testUint16Array$Iterator001
     * @tc.desc Verify values() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([42]);
      let iter = arr.values();
      let result = iter.next().value;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0002
     * @tc.name testUint16Array$Iterator002
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(0);
      let count = 0;
      for (let v of arr) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0003
     * @tc.name testUint16Array$Iterator003
     * @tc.desc Verify values() next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(0);
      let iter = arr.values();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0004
     * @tc.name testUint16Array$Iterator004
     * @tc.desc Verify values() next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(0);
      let iter = arr.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0005
     * @tc.name testUint16Array$Iterator005
     * @tc.desc Verify [0] for...of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0006
     * @tc.name testUint16Array$Iterator006
     * @tc.desc Verify [1] for...of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0007
     * @tc.name testUint16Array$Iterator007
     * @tc.desc Verify [65535] for...of 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([65535]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0008
     * @tc.name testUint16Array$Iterator008
     * @tc.desc Verify [0xFF] for...of 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0xFF]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0009
     * @tc.name testUint16Array$Iterator009
     * @tc.desc Verify [65535] Uint16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([65535]);
      let result = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0010
     * @tc.name testUint16Array$Iterator010
     * @tc.desc Verify [0] Uint16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0]);
      let result = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0011
     * @tc.name testUint16Array$Iterator011
     * @tc.desc Verify [1,2] for...of 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2]);
      let results: number[] = [];
      for (let v of arr) {
        results.push(v);
      }
      expect(results.at(0)).assertEqual(1);
      expect(results.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0012
     * @tc.name testUint16Array$Iterator012
     * @tc.desc Verify [10,20,30] for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([10, 20, 30]);
      let results: number[] = [];
      for (let v of arr) {
        results.push(v);
      }
      expect(results.at(0)).assertEqual(10);
      expect(results.at(1)).assertEqual(20);
      expect(results.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0013
     * @tc.name testUint16Array$Iterator013
     * @tc.desc Verify [0,32768,65535] for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0, 32768, 65535]);
      let results: number[] = [];
      for (let v of arr) {
        results.push(v);
      }
      expect(results.at(0)).assertEqual(0);
      expect(results.at(1)).assertEqual(32768);
      expect(results.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0014
     * @tc.name testUint16Array$Iterator014
     * @tc.desc Verify 100 for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      let count = 0;
      let first: number = -1;
      let last: number = -1;
      for (let v of arr) {
        if (count === 0) {
          first = v;
        }
        last = v;
        count++;
      }
      expect(first).assertEqual(0);
      expect(last).assertEqual(99);
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0015
     * @tc.name testUint16Array$Iterator015
     * @tc.desc Verify [1,2,3,4,5] Uint16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
      expect(result.at(2)).assertEqual(3);
      expect(result.at(3)).assertEqual(4);
      expect(result.at(4)).assertEqual(5);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0016
     * @tc.name testUint16Array$Iterator016
     * @tc.desc Verify 3.14 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([3.14]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0017
     * @tc.name testUint16Array$Iterator017
     * @tc.desc Verify NaN 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([Number.NaN]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0018
     * @tc.name testUint16Array$Iterator018
     * @tc.desc Verify -1 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([-1]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0019
     * @tc.name testUint16Array$Iterator019
     * @tc.desc Verify 65536 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([65536]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0020
     * @tc.name testUint16Array$Iterator020
     * @tc.desc Verify -0.5 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([-0.5]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0021
     * @tc.name testUint16Array$Iterator021
     * @tc.desc Verify Infinity 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([Number.POSITIVE_INFINITY]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0022
     * @tc.name testUint16Array$Iterator022
     * @tc.desc Verify -Infinity 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([-Number.POSITIVE_INFINITY]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0023
     * @tc.name testUint16Array$Iterator023
     * @tc.desc Verify 65535.9 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([65535.9]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0024
     * @tc.name testUint16Array$Iterator024
     * @tc.desc Verify for...of values() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(0);
      let count1 = 0;
      for (let v of arr) {
        count1++;
      }
      let count2 = 0;
      for (let v of arr.values()) {
        count2++;
      }
      expect(count1).assertEqual(0);
      expect(count2).assertEqual(0);
      expect(count1).assertEqual(count2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0025
     * @tc.name testUint16Array$Iterator025
     * @tc.desc Verify for...of values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([42]);
      let v1: number = -1;
      for (let v of arr) {
        v1 = v;
      }
      let v2: number = -1;
      for (let v of arr.values()) {
        v2 = v;
      }
      expect(v1).assertEqual(42);
      expect(v2).assertEqual(42);
      expect(v1).assertEqual(v2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0026
     * @tc.name testUint16Array$Iterator026
     * @tc.desc Verify for...of values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2, 3]);
      let r1: number[] = [];
      for (let v of arr) {
        r1.push(v);
      }
      let r2: number[] = [];
      for (let v of arr.values()) {
        r2.push(v);
      }
      expect(r1.length).assertEqual(3);
      expect(r2.length).assertEqual(3);
      expect(r1.at(0)).assertEqual(1);
      expect(r1.at(1)).assertEqual(2);
      expect(r1.at(2)).assertEqual(3);
      expect(r2.at(0)).assertEqual(1);
      expect(r2.at(1)).assertEqual(2);
      expect(r2.at(2)).assertEqual(3);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.at(0)).assertEqual(r2[0]);
      expect(r1.at(1)).assertEqual(r2[1]);
      expect(r1.at(2)).assertEqual(r2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0027
     * @tc.name testUint16Array$Iterator027
     * @tc.desc Verify for...of values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0, 32768, 65535]);
      let r1: number[] = [];
      for (let v of arr) {
        r1.push(v);
      }
      let r2: number[] = [];
      for (let v of arr.values()) {
        r2.push(v);
      }
      expect(r1.at(0)).assertEqual(0);
      expect(r1.at(1)).assertEqual(32768);
      expect(r1.at(2)).assertEqual(65535);
      expect(r2.at(0)).assertEqual(0);
      expect(r2.at(1)).assertEqual(32768);
      expect(r2.at(2)).assertEqual(65535);
      expect(r1.at(0)).assertEqual(r2[0]);
      expect(r1.at(1)).assertEqual(r2[1]);
      expect(r1.at(2)).assertEqual(r2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0028
     * @tc.name testUint16Array$Iterator028
     * @tc.desc Verify for...of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2, 3, 4, 5]);
      let count = 0;
      for (let v of arr) {
        count++;
        if (v === 3) {
          break;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0029
     * @tc.name testUint16Array$Iterator029
     * @tc.desc Verify for...of continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2, 3]);
      let sum = 0;
      for (let v of arr) {
        if (v === 2) {
          continue;
        }
        sum += v;
      }
      expect(sum).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0030
     * @tc.name testUint16Array$Iterator030
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2]);
      let outerCount = 0;
      for (let v1 of arr) {
        for (let v2 of arr) {
          outerCount++;
        }
      }
      expect(outerCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0031
     * @tc.name testUint16Array$Iterator031
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([10, 20]);
      let count1 = 0;
      for (let v of arr) {
        count1++;
      }
      let count2 = 0;
      for (let v of arr) {
        count2++;
      }
      expect(count1).assertEqual(2);
      expect(count2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0032
     * @tc.name testUint16Array$Iterator032
     * @tc.desc Verify values() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([100, 200]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0033
     * @tc.name testUint16Array$Iterator033
     * @tc.desc Verify values() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([100, 200]);
      let iter = arr.values();
      iter.next();
      expect(iter.next().value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0034
     * @tc.name testUint16Array$Iterator034
     * @tc.desc Verify values() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2]);
      let iter = arr.values();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0035
     * @tc.name testUint16Array$Iterator035
     * @tc.desc Verify values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1]);
      let iter = arr.values();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0036
     * @tc.name testUint16Array$Iterator036
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2, 3]);
      let iter1 = arr.values();
      let iter2 = arr.values();
      iter1.next();
      iter1.next();
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0037
     * @tc.name testUint16Array$Iterator037
     * @tc.desc Verify next() done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([5]);
      let iter = arr.values();
      let ret = iter.next();
      expect(ret.done).assertFalse();
      expect(ret.value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0038
     * @tc.name testUint16Array$Iterator038
     * @tc.desc Verify values() next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(0);
      let iter = arr.values();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0039
     * @tc.name testUint16Array$Iterator039
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2, 3]);
      let count = 0;
      let values: number[] = [];
      for (let v of arr) {
        values.push(v);
        count++;
      }
      expect(values.at(0)).assertEqual(1);
      expect(values.at(1)).assertEqual(2);
      expect(values.at(2)).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0040
     * @tc.name testUint16Array$Iterator040
     * @tc.desc Verify [0,0,0] for...of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0, 0, 0]);
      let sum = 0;
      let count = 0;
      let values: number[] = [];
      for (let v of arr) {
        values.push(v);
        sum += v;
        count++;
      }
      expect(values.at(0)).assertEqual(0);
      expect(values.at(1)).assertEqual(0);
      expect(values.at(2)).assertEqual(0);
      expect(sum).assertEqual(0);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0041
     * @tc.name testUint16Array$Iterator041
     * @tc.desc Verify [65535,65535] for...of 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([65535, 65535]);
      let sum = 0;
      let values: number[] = [];
      for (let v of arr) {
        values.push(v);
        sum += v;
      }
      expect(values.at(0)).assertEqual(65535);
      expect(values.at(1)).assertEqual(65535);
      expect(sum).assertEqual(131070);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0042
     * @tc.name testUint16Array$Iterator042
     * @tc.desc Verify [0,65535,32768,255] for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0, 65535, 32768, 255]);
      let results: number[] = [];
      for (let v of arr) {
        results.push(v);
      }
      expect(results.at(0)).assertEqual(0);
      expect(results.at(1)).assertEqual(65535);
      expect(results.at(2)).assertEqual(32768);
      expect(results.at(3)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0043
     * @tc.name testUint16Array$Iterator043
     * @tc.desc Verify [1,2,3,4,5] for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2, 3, 4, 5]);
      let results: number[] = [];
      for (let v of arr) {
        results.push(v);
      }
      expect(results.at(0)).assertEqual(1);
      expect(results.at(1)).assertEqual(2);
      expect(results.at(2)).assertEqual(3);
      expect(results.at(3)).assertEqual(4);
      expect(results.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0044
     * @tc.name testUint16Array$Iterator044
     * @tc.desc Verify [5,4,3,2,1] for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([5, 4, 3, 2, 1]);
      let results: number[] = [];
      for (let v of arr) {
        results.push(v);
      }
      expect(results.at(0)).assertEqual(5);
      expect(results.at(1)).assertEqual(4);
      expect(results.at(2)).assertEqual(3);
      expect(results.at(3)).assertEqual(2);
      expect(results.at(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0045
     * @tc.name testUint16Array$Iterator045
     * @tc.desc Verify [0x10, 0x100, 0x1000] for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0x10, 0x100, 0x1000]);
      let results: number[] = [];
      for (let v of arr) {
        results.push(v);
      }
      expect(results.at(0)).assertEqual(16);
      expect(results.at(1)).assertEqual(256);
      expect(results.at(2)).assertEqual(4096);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0046
     * @tc.name testUint16Array$Iterator046
     * @tc.desc Verify [0o377] for...of 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0o377]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0047
     * @tc.name testUint16Array$Iterator047
     * @tc.desc Verify [0b11111111] for...of 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0b11111111]);
      let result: number = -1;
      for (let v of arr) {
        result = v;
      }
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0048
     * @tc.name testUint16Array$Iterator048
     * @tc.desc Verify default iteration observes mutation of an unvisited element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2, 3]);
      let sum = 0;
      for (let v of arr) {
        sum += v;
        if (v === 2) {
          arr[2] = 100;
        }
      }
      expect(sum).assertEqual(103);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0049
     * @tc.name testUint16Array$Iterator049
     * @tc.desc Verify Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(0);
      let result = Array.from(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0050
     * @tc.name testUint16Array$Iterator050
     * @tc.desc Verify Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([42]);
      let result = Array.from(arr);
      expect(result.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0051
     * @tc.name testUint16Array$Iterator051
     * @tc.desc Verify Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = Array.from(arr);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
      expect(result.at(2)).assertEqual(30);
      expect(result.at(3)).assertEqual(40);
      expect(result.at(4)).assertEqual(50);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0052
     * @tc.name testUint16Array$Iterator052
     * @tc.desc Verify Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0, 65535]);
      let result = Array.from(arr);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0053
     * @tc.name testUint16Array$Iterator053
     * @tc.desc Verify empty values iterator is immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
            let item = arr.values().next();
            expect(item.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0054
     * @tc.name testUint16Array$Iterator054
     * @tc.desc Verify values iterator remains done after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterator = Uint16Array.of(7).values();
            iterator.next();
            expect(iterator.next().done).assertTrue();
            expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0055
     * @tc.name testUint16Array$Iterator055
     * @tc.desc Verify values iterator observes a later source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
            let iterator = arr.values();
            expect(iterator.next().value).assertEqual(10);
            arr[1] = 99;
            expect(iterator.next().value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0056
     * @tc.name testUint16Array$Iterator056
     * @tc.desc Verify values iterator observes mutation through an alias view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let arr: Uint16Array = new Uint16Array(buffer);
            arr.set([1, 2, 3]);
            let alias: Uint16Array = new Uint16Array(buffer, 2, 2);
            let iterator = arr.values();
            iterator.next();
            alias[0] = 88;
            expect(iterator.next().value).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0057
     * @tc.name testUint16Array$Iterator057
     * @tc.desc Verify values iterator over an offset view starts at the view first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(10);
            let all: Uint16Array = new Uint16Array(buffer);
            all.set([5, 10, 15, 20, 25]);
            let view: Uint16Array = new Uint16Array(buffer, 4, 2);
            let iterator = view.values();
            expect(iterator.next().value).assertEqual(15);
            expect(iterator.next().value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0058
     * @tc.name testUint16Array$Iterator058
     * @tc.desc Verify two values iterators maintain independent positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(4, 5);
            let first = arr.values();
            let second = arr.values();
            first.next();
            expect(first.next().value).assertEqual(5);
            expect(second.next().value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0059
     * @tc.name testUint16Array$Iterator059
     * @tc.desc Verify default iteration preserves Uint16 boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 32768, 65535);
            let values: Array<number> = [];
            for (let value of arr) { values.push(value); }
            expect(values.at(0)).assertEqual(0);
            expect(values.at(1)).assertEqual(32768);
            expect(values.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0060
     * @tc.name testUint16Array$Iterator060
     * @tc.desc Verify iterator created before copyWithin reads the copied values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            let iterator = arr.values();
            expect(iterator.next().value).assertEqual(1);
            arr.copyWithin(1, 2);
            expect(iterator.next().value).assertEqual(3);
            expect(iterator.next().value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0061
     * @tc.name testUint16Array$Iterator061
     * @tc.desc Verify default iteration over an offset view yields only the visible view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(5, 10, 15, 20, 25);
      let view: Uint16Array = new Uint16Array(backing.buffer, 4, 2);
      let values: Array<number> = [];
      for (let value of view) {
        values.push(value);
      }
      expect(values.length).assertEqual(2);
      expect(values.at(0)).assertEqual(15);
      expect(values.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_ITERATOR_0062
     * @tc.name testUint16Array$Iterator062
     * @tc.desc Verify a values iterator observes fill changes to unconsumed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Iterator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array: Uint16Array = Uint16Array.of(1, 2, 3);
      let iterator = array.values();
      expect(iterator.next().value).assertEqual(1);
      array.fill(9, 1);
      expect(iterator.next().value).assertEqual(9);
      expect(iterator.next().value).assertEqual(9);
    });

  });
}
