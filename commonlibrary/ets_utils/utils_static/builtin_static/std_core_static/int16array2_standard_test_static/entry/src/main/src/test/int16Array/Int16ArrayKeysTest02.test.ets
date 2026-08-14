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

export default function int16ArrayKeysTestTwoTest(): void {
  describe('Int16ArrayKeysTestTwoTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_0100
     * @tc.name testInt16ArrayKeysTestTwo001
     * @tc.desc Verify keys() next() result value is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let iter = arr.keys();
      let r = iter.next();
      expect(r.value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_0200
     * @tc.name testInt16ArrayKeysTestTwo002
     * @tc.desc Verify keys() next() done is false initially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let iter = arr.keys();
      let r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_0300
     * @tc.name testInt16ArrayKeysTestTwo003
     * @tc.desc Verify keys/next (assertFalse)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let iter = arr.keys();
      let r = iter.next();
      let actual1: boolean = r.done;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_0400
     * @tc.name testInt16ArrayKeysTestTwo004
     * @tc.desc Verify keys/next (assertTrue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      let r = iter.next();
      let actual1: boolean = r.done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_0500
     * @tc.name testInt16ArrayKeysTestTwo005
     * @tc.desc Verify keys (assertFalse)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let iter = arr.keys();
      let actual1: boolean = iter === arr;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_0600
     * @tc.name testInt16ArrayKeysTestTwo006
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42, 99]);
      let iter = arr.keys();
      let key: int = iter.next().value!;
      expect(key).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_0700
     * @tc.name testInt16ArrayKeysTestTwo007
     * @tc.desc Verify keys (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int16Array(3);
      let arr2 = Int16Array.of(1, 2, 3);
      let iter1 = arr1.keys();
      let iter2 = arr2.keys();
      let actual1: int = iter1.next().value!;
      let expected1: int = iter2.next().value!;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_0800
     * @tc.name testInt16ArrayKeysTestTwo008
     * @tc.desc Verify new Int16Array(0) keys next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let iter = arr.keys();
      let r = iter.next();
      let actual1: boolean = r.done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_0900
     * @tc.name testInt16ArrayKeysTestTwo009
     * @tc.desc Verify Int16Array.of() keys next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of();
      let iter = arr.keys();
      let r = iter.next();
      let actual1: boolean = r.done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_1000
     * @tc.name testInt16ArrayKeysTestTwo010
     * @tc.desc Verify keys next() value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(99);
      let iter = arr.keys();
      let r = iter.next();
      let actual1: int = r.value!;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_1100
     * @tc.name testInt16ArrayKeysTestTwo011
     * @tc.desc Verify keys next() done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(99);
      let iter = arr.keys();
      let r = iter.next();
      let actual1: boolean = r.done;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_1200
     * @tc.name testInt16ArrayKeysTestTwo012
     * @tc.desc Verify keys next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(99);
      let iter = arr.keys();
      iter.next();
      let r = iter.next();
      let actual1: boolean = r.done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_1300
     * @tc.name testInt16ArrayKeysTestTwo013
     * @tc.desc Verify keys 0, 1, 2, 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      let iter = arr.keys();
      let actual1: int = iter.next().value!;
      expect(actual1).assertEqual(0);
      let actual2: int = iter.next().value!;
      expect(actual2).assertEqual(1);
      let actual3: int = iter.next().value!;
      expect(actual3).assertEqual(2);
      let actual4: int = iter.next().value!;
      expect(actual4).assertEqual(3);
      let actual5: int = iter.next().value!;
      expect(actual5).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_1400
     * @tc.name testInt16ArrayKeysTestTwo014
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(8);
      let iter = arr.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_1500
     * @tc.name testInt16ArrayKeysTestTwo015
     * @tc.desc Verify keys/next (assertTrue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(6);
      let iter = arr.keys();
      let prev = -1;
      let sequential = true;
      let r = iter.next();
      while (!r.done) {
        if (r.value! !== prev + 1) {
          sequential = false;
        }
        prev = r.value!;
        r = iter.next();
      }
      expect(sequential).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_1600
     * @tc.name testInt16ArrayKeysTestTwo016
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = 128;
      let arr = new Int16Array(len);
      let iter = arr.keys();
      let count = 0;
      let maxKey = -1;
      let r = iter.next();
      while (!r.done) {
        count++;
        maxKey = r.value!;
        r = iter.next();
      }
      expect(count).assertEqual(len);
      expect(maxKey).assertEqual(len - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_1700
     * @tc.name testInt16ArrayKeysTestTwo017
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(3);
      let iter = arr.keys();
      let actual1: int = iter.next().value!;
      expect(actual1).assertEqual(0);
      let actual2: int = iter.next().value!;
      expect(actual2).assertEqual(1);
      let actual3: int = iter.next().value!;
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_1800
     * @tc.name testInt16ArrayKeysTestTwo018
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767, 32767, 32767);
      let iter = arr.keys();
      let actual1: int = iter.next().value!;
      expect(actual1).assertEqual(0);
      let actual2: int = iter.next().value!;
      expect(actual2).assertEqual(1);
      let actual3: int = iter.next().value!;
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_1900
     * @tc.name testInt16ArrayKeysTestTwo019
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768, -32768, -32768);
      let iter = arr.keys();
      let actual1: int = iter.next().value!;
      expect(actual1).assertEqual(0);
      let actual2: int = iter.next().value!;
      expect(actual2).assertEqual(1);
      let actual3: int = iter.next().value!;
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_2000
     * @tc.name testInt16ArrayKeysTestTwo020
     * @tc.desc Verify keys/iteration (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(5);
      let count = 0;
      for (const key of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_2100
     * @tc.name testInt16ArrayKeysTestTwo021
     * @tc.desc Verify keys/iteration (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(3);
      let sum = 0;
      for (const key of arr.keys()) {
        let k: int = key;
        sum = sum + k;
      }
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_2200
     * @tc.name testInt16ArrayKeysTestTwo022
     * @tc.desc Verify keys/iteration (assertTrue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(4);
      let prev = -1;
      let ok = true;
      for (const key of arr.keys()) {
        if (key !== prev + 1) {
          ok = false;
        }
        prev = key;
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_2300
     * @tc.name testInt16ArrayKeysTestTwo023
     * @tc.desc Verify keys/iteration (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(10);
      let count = 0;
      for (const key of arr.keys()) {
        count++;
        if (key >= 3) {
          break;
        }
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_2400
     * @tc.name testInt16ArrayKeysTestTwo024
     * @tc.desc Verify keys/iteration (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(5);
      let count = 0;
      for (const key of arr.keys()) {
        if (key === 2) {
          continue;
        }
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_2500
     * @tc.name testInt16ArrayKeysTestTwo025
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(4);
      let byteLenBefore = arr.byteLength;
      let iter = arr.keys();
      let r = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      let actual1: int = arr.byteLength;
      let expected1: int = byteLenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_2600
     * @tc.name testInt16ArrayKeysTestTwo026
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(4);
      let bpe = arr.BYTES_PER_ELEMENT;
      let iter = arr.keys();
      let r = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      let actual1: int = arr.BYTES_PER_ELEMENT;
      let expected1: int = bpe;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_2700
     * @tc.name testInt16ArrayKeysTestTwo027
     * @tc.desc Verify keys BYTES_PER_ELEMENT byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(6);
      let iter = arr.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      let actual1: int = count * arr.BYTES_PER_ELEMENT;
      let expected1: int = arr.byteLength;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_2800
     * @tc.name testInt16ArrayKeysTestTwo028
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(5);
      let origLen = arr.length;
      let iter = arr.keys();
      iter.next();
      iter.next();
      let actual1: int = arr.length;
      let expected1: int = origLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_2900
     * @tc.name testInt16ArrayKeysTestTwo029
     * @tc.desc Verify keys (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(7);
      let origLen = arr.length;
      let iter = arr.keys();
      let actual1: int = arr.length;
      let expected1: int = origLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_3000
     * @tc.name testInt16ArrayKeysTestTwo030
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(4);
      let origLen = arr.length;
      let iter = arr.keys();
      let r = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      let actual1: int = arr.length;
      let expected1: int = origLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_3100
     * @tc.name testInt16ArrayKeysTestTwo031
     * @tc.desc Verify keys/$_get/$_get (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 200, 300);
      let iter = arr.keys();
      let r = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(100);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(200);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_3200
     * @tc.name testInt16ArrayKeysTestTwo032
     * @tc.desc Verify keys/iteration (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(6);
      let origLen = arr.length;
      for (const key of arr.keys()) {
      }
      let actual1: int = arr.length;
      let expected1: int = origLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_3300
     * @tc.name testInt16ArrayKeysTestTwo033
     * @tc.desc Verify keys/$_get/$_get (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(7, 14, 21);
      let iter = arr.keys();
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(7);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(14);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_3400
     * @tc.name testInt16ArrayKeysTestTwo034
     * @tc.desc Verify keys() iterator values() iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 200, 300);
      let kit = arr.keys();
      let vit = arr.values();
      kit.next();
      let actual1: number = vit.next().value!;
      expect(actual1).assertEqual(100);
      let actual2: int = kit.next().value!;
      expect(actual2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_3500
     * @tc.name testInt16ArrayKeysTestTwo035
     * @tc.desc Verify keys/next (assertTrue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1);
      let iter = arr.keys();
      iter.next();
      iter.next();
      let actual1: boolean = iter.next().done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_3600
     * @tc.name testInt16ArrayKeysTestTwo036
     * @tc.desc Verify keys() after 10 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2);
      let iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      let allDone = true;
      for (let i = 0; i < 10; i++) {
        if (!iter.next().done) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_3700
     * @tc.name testInt16ArrayKeysTestTwo037
     * @tc.desc Verify spread keys length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(5);
      let keysArr: int[] = [];
      for (const key of arr.keys()) {
        keysArr.push(key);
      }
      let actual1: int = keysArr.length;
      let expected1: int = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_3800
     * @tc.name testInt16ArrayKeysTestTwo038
     * @tc.desc Verify new Int16Array(N) keys 0 N-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(4);
      let iter = arr.keys();
      let actual1: int = iter.next().value!;
      expect(actual1).assertEqual(0);
      let actual2: int = iter.next().value!;
      expect(actual2).assertEqual(1);
      let actual3: int = iter.next().value!;
      expect(actual3).assertEqual(2);
      let actual4: int = iter.next().value!;
      expect(actual4).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_3900
     * @tc.name testInt16ArrayKeysTestTwo039
     * @tc.desc Verify Int16Array.from(source) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [5, 10, 15, 20];
      let arr = Int16Array.from(src);
      let iter = arr.keys();
      let actual1: int = iter.next().value!;
      expect(actual1).assertEqual(0);
      let actual2: int = iter.next().value!;
      expect(actual2).assertEqual(1);
      let actual3: int = iter.next().value!;
      expect(actual3).assertEqual(2);
      let actual4: int = iter.next().value!;
      expect(actual4).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_4000
     * @tc.name testInt16ArrayKeysTestTwo040
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr = new Int16Array(buf, 0, 3);
      let iter = arr.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_4100
     * @tc.name testInt16ArrayKeysTestTwo041
     * @tc.desc Verify keys/next (assertTrue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let iter = arr.keys();
      let actual1: boolean = iter.next().done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_4200
     * @tc.name testInt16ArrayKeysTestTwo042
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5, 6);
      let sub = arr.subarray(1, 4);
      let iter = sub.keys();
      let actual1: int = iter.next().value!;
      expect(actual1).assertEqual(0);
      let actual2: int = iter.next().value!;
      expect(actual2).assertEqual(1);
      let actual3: int = iter.next().value!;
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_4300
     * @tc.name testInt16ArrayKeysTestTwo043
     * @tc.desc Verify subarray() keys subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5, 6);
      let sub = arr.subarray(1, 4);
      let iter = sub.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(sub.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_4400
     * @tc.name testInt16ArrayKeysTestTwo044
     * @tc.desc Verify subarray() keys keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let sub = arr.subarray(0, 3);
      let iter = sub.keys();
      let actual1: int = iter.next().value!;
      expect(actual1).assertEqual(0);
      let actual2: int = iter.next().value!;
      expect(actual2).assertEqual(1);
      let actual3: int = iter.next().value!;
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_4500
     * @tc.name testInt16ArrayKeysTestTwo045
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr1 = new Int16Array(buf, 0, 2);
      let arr2 = new Int16Array(buf, 4, 2);
      let iter1 = arr1.keys();
      let iter2 = arr2.keys();
      let c1 = 0;
      let c2 = 0;
      let r1 = iter1.next();
      while (!r1.done) {
        c1++;
        r1 = iter1.next();
      }
      let r2 = iter2.next();
      while (!r2.done) {
        c2++;
        r2 = iter2.next();
      }
      expect(c1).assertEqual(2);
      expect(c2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_4600
     * @tc.name testInt16ArrayKeysTestTwo046
     * @tc.desc Verify keys/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(4);
      let bufBefore = arr.buffer;
      let iter = arr.keys();
      iter.next();
      iter.next();
      let actual1: boolean = arr.buffer === bufBefore;
      expect(actual1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_TWO_4700
     * @tc.name testInt16ArrayKeysTestTwo047
     * @tc.desc Verify keys/next (assertTrue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int16Array(buf, 0, 4);
      let iter = arr.keys();
      let r = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      let actual1: boolean = ArrayBuffer.isView(arr);
      expect(actual1).assertTrue();
    });
  });
}
