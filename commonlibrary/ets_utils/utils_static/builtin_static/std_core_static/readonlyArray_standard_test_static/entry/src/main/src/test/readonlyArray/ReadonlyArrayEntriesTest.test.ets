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
import Utils from './../Util.test';

function expectStringEntriesInOrder(arr: ReadonlyArray<string>): void {
  let count: int = 0;
  for (const entry of arr.entries()) {
    expect(entry[0]).assertEqual(count);
    expect(entry[1]).assertEqual(arr[count]);
    count++;
  }
  expect(count).assertEqual(arr.length);
}

export default function ReadonlyArrayEntriesTest(): void {
  describe('ReadonlyArrayEntriesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0010
     * @tc.name testReadonlyArrayEntries001
     * @tc.desc Verify ReadonlyArray.entries behavior: entries calling without parameters returns iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const iter = arr.entries();
      expect(iter != null).assertTrue();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value != null).assertTrue();
      expect(first.value![0]).assertEqual(0);
      expect(first.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0020
     * @tc.name testReadonlyArrayEntries002
     * @tc.desc Verify ReadonlyArray.entries behavior: entries returns IterableIterator for for - of iteration with index and value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const iter = arr.entries();
      let count = 0;
      for (const entry of iter) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0030
     * @tc.name testReadonlyArrayEntries003
     * @tc.desc Verify ReadonlyArray.entries behavior: empty array entries returns empty iterator with zero iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      const iter = arr.entries();
      let count = 0;
      for (const entry of iter) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0040
     * @tc.name testReadonlyArrayEntries004
     * @tc.desc Verify ReadonlyArray.entries behavior: single element array entries returns index 0 and element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [42];
      const iter = arr.entries();
      let count: int = 0;
      for (const entry of iter) {
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual(42);
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0050
     * @tc.name testReadonlyArrayEntries005
     * @tc.desc Verify ReadonlyArray.entries behavior: entries iterator traverses elements in ascending index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", "c", "d"];
      const iter = arr.entries();
      let expectedIndex = 0;
      for (const entry of iter) {
        expect(entry[0]).assertEqual(expectedIndex);
        expect(entry[1]).assertEqual(arr[expectedIndex]);
        expectedIndex++;
      }
      expect(expectedIndex).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0060
     * @tc.name testReadonlyArrayEntries006
     * @tc.desc Verify ReadonlyArray.entries behavior: ReadonlyArray<string> entries returns string index and value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["hello", "world"];
      const iter = arr.entries();
      let count: int = 0;
      for (const entry of iter) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0070
     * @tc.name testReadonlyArrayEntries007
     * @tc.desc Verify ReadonlyArray.entries behavior: ReadonlyArray<double> entries returns double index and value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, 2.2, 3.3];
      const iter = arr.entries();
      let count: int = 0;
      for (const entry of iter) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0080
     * @tc.name testReadonlyArrayEntries008
     * @tc.desc Verify ReadonlyArray.entries behavior: entries iterator supports next method returning index value tuple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const iter = arr.entries();
      const first = iter.next();
      const entry = first.value;
      expect(entry != null).assertTrue();
      expect(entry![0]).assertEqual(0);
      expect(entry![1]).assertEqual(10);
      expect(first.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0090
     * @tc.name testReadonlyArrayEntries009
     * @tc.desc Verify ReadonlyArray.entries behavior: entries iterator returns done true after all elements consumed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1];
      const iter = arr.entries();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value != null).assertTrue();
      expect(first.value![0]).assertEqual(0);
      expect(first.value![1]).assertEqual(1);
      const second = iter.next();
      expect(second.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0100
     * @tc.name testReadonlyArrayEntries010
     * @tc.desc Verify ReadonlyArray.entries behavior: entries return value exposes next function as IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      const iter = arr.entries();
      const r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0110
     * @tc.name testReadonlyArrayEntries011
     * @tc.desc Verify ReadonlyArray.entries behavior: large array with 1000 elements entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        source.push(i);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0120
     * @tc.name testReadonlyArrayEntries012
     * @tc.desc Verify ReadonlyArray.entries behavior: iterating entries does not modify the original ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const iter = arr.entries();
      let count: int = 0;
      for (const entry of iter) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0130
     * @tc.name testReadonlyArrayEntries013
     * @tc.desc Verify ReadonlyArray.entries behavior: ReadonlyArray<boolean> entries returns correct index and boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0140
     * @tc.name testReadonlyArrayEntries014
     * @tc.desc Verify ReadonlyArray.entries behavior: entries traverses array containing zero and negative int values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 5];
      let idx: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(idx);
        expect(entry[1]).assertEqual(arr[idx]);
        idx++;
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0150
     * @tc.name testReadonlyArrayEntries015
     * @tc.desc Verify ReadonlyArray.entries behavior: continue inside entries loop skips index and continues traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      let sum: int = 0;
      for (const entry of arr.entries()) {
        if (entry[0] === 1) {
          continue;
        }
        sum += entry[1];
      }
      expect(sum).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0160
     * @tc.name testReadonlyArrayEntries016
     * @tc.desc Verify ReadonlyArray.entries behavior: while loop with next consumes entries iterator step by step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const iter = arr.entries();
      let step = iter.next();
      expect(step.done).assertFalse();
      expect(step.value != null).assertTrue();
      expect(step.value![0]).assertEqual(0);
      expect(step.value![1]).assertEqual(10);
      step = iter.next();
      expect(step.value != null).assertTrue();
      expect(step.value![0]).assertEqual(1);
      expect(step.value![1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0170
     * @tc.name testReadonlyArrayEntries017
     * @tc.desc Verify ReadonlyArray.entries behavior: entries traverses int array with hex octal and binary literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      let idx: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(idx);
        expect(entry[1]).assertEqual(arr[idx]);
        idx++;
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0180
     * @tc.name testReadonlyArrayEntries018
     * @tc.desc Verify ReadonlyArray.entries behavior: entries iteration over int array with zero negative one and large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 1000000];
      let sum: int = 0;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        sum += entry[1];
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(sum).assertEqual(999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0190
     * @tc.name testReadonlyArrayEntries019
     * @tc.desc Verify ReadonlyArray.entries behavior: entries iteration over string array containing Unicode Chinese text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "\u4e2d\u6587";
      const arr: ReadonlyArray<string> = ["a", cn, "b"];
      let found: boolean = false;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        if (entry[1] === cn) {
          found = true;
        }
        count++;
      }
      expect(found).assertTrue();
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0200
     * @tc.name testReadonlyArrayEntries020
     * @tc.desc Verify ReadonlyArray.entries behavior: entries first yielded pair is index 0 and first element per API example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let firstIndex: int = -1;
      let firstValue: int = -1;
      for (const entry of values.entries()) {
        firstIndex = entry[0];
        firstValue = entry[1];
        break;
      }
      expect(firstIndex).assertEqual(0);
      expect(firstValue).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0210
     * @tc.name testReadonlyArrayEntries021
     * @tc.desc Verify ReadonlyArray.entries behavior: two independent entries calls each traverse from the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20];
      let count1: int = 0;
      for (const entry of values.entries()) {
        expect(entry[0]).assertEqual(count1);
        expect(entry[1]).assertEqual(values[count1]);
        count1++;
      }
      let count2: int = 0;
      for (const entry of values.entries()) {
        expect(entry[0]).assertEqual(count2);
        expect(entry[1]).assertEqual(values[count2]);
        count2++;
      }
      expect(count1).assertEqual(2);
      expect(count2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0220
     * @tc.name testReadonlyArrayEntries022
     * @tc.desc Verify ReadonlyArray.entries behavior: byte array entries iterator matches index to byte element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0230
     * @tc.name testReadonlyArrayEntries023
     * @tc.desc Verify ReadonlyArray.entries behavior: short array entries iterator matches index to short element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, -32768 as short, 32767 as short];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0240
     * @tc.name testReadonlyArrayEntries024
     * @tc.desc Verify ReadonlyArray.entries behavior: long array entries iterator matches index to long element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 9223372036854775807, -9223372036854775808];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0250
     * @tc.name testReadonlyArrayEntries025
     * @tc.desc Verify ReadonlyArray.entries behavior: float array entries iterator including positive infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [0.0f, 3.14f, Double.toFloat(Number.POSITIVE_INFINITY)];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0260
     * @tc.name testReadonlyArrayEntries026
     * @tc.desc Verify ReadonlyArray.entries behavior: char array entries iterator matches index to char element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\u4e2d', c'\u0000'];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0270
     * @tc.name testReadonlyArrayEntries027
     * @tc.desc Verify ReadonlyArray.entries behavior: string array with emoji entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "\uD83D\uDE00", "b"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0280
     * @tc.name testReadonlyArrayEntries028
     * @tc.desc Verify ReadonlyArray.entries behavior: string array with phone number entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["13800138000", "x", "y"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0290
     * @tc.name testReadonlyArrayEntries029
     * @tc.desc Verify ReadonlyArray.entries behavior: string array with Japanese text entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["テスト", "en", "cn"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0300
     * @tc.name testReadonlyArrayEntries030
     * @tc.desc Verify ReadonlyArray.entries behavior: boolean array entries iterator matches index to boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0310
     * @tc.name testReadonlyArrayEntries031
     * @tc.desc Verify ReadonlyArray.entries behavior: 100 element int array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      for (let i: int = 0; i < 100; i++) {
        (arr as Array<int>).push(i);
      }
      const collected: Array<int> = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(100);
      expect(collected[0]).assertEqual(0);
      expect(collected[99]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0320
     * @tc.name testReadonlyArrayEntries032
     * @tc.desc Verify ReadonlyArray.entries behavior: Korean string array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["테스트", "en"];
      const collected: string[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual("테스트");
      expect(collected[1]).assertEqual("en");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0330
     * @tc.name testReadonlyArrayEntries033
     * @tc.desc Verify ReadonlyArray.entries behavior: float array with negative zero entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f, 1.0f];
      const collected: float[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(-0.0f);
      expect(collected[1]).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0340
     * @tc.name testReadonlyArrayEntries034
     * @tc.desc Verify ReadonlyArray.entries behavior: byte boundary array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte, 127 as byte];
      const collected: byte[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(-128 as byte);
      expect(collected[arr.length - 1]).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0350
     * @tc.name testReadonlyArrayEntries035
     * @tc.desc Verify ReadonlyArray.entries behavior: short array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [0 as short, 100 as short, 200 as short];
      const collected: short[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0 as short);
      expect(collected[arr.length - 1]).assertEqual(200 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0360
     * @tc.name testReadonlyArrayEntries036
     * @tc.desc Verify ReadonlyArray.entries behavior: long array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 100, -1];
      const collected: long[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0);
      expect(collected[arr.length - 1]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0370
     * @tc.name testReadonlyArrayEntries037
     * @tc.desc Verify ReadonlyArray.entries behavior: char array with max char entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\uffff', c'a', c'b'];
      const collected: char[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(c'\uffff');
      expect(collected[arr.length - 1]).assertEqual(c'b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0380
     * @tc.name testReadonlyArrayEntries038
     * @tc.desc Verify ReadonlyArray.entries behavior: octal format string array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0123", "123"];
      const collected: string[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual("0123");
      expect(collected[1]).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0390
     * @tc.name testReadonlyArrayEntries039
     * @tc.desc Verify ReadonlyArray.entries behavior: binary format string array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0b1010", "1010"];
      const collected: string[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual("0b1010");
      expect(collected[1]).assertEqual("1010");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0400
     * @tc.name testReadonlyArrayEntries040
     * @tc.desc Verify ReadonlyArray.entries behavior: escaped backslash string array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["path\\to", "a"];
      const collected: string[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual("path\\to");
      expect(collected[1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0410
     * @tc.name testReadonlyArrayEntries041
     * @tc.desc Verify ReadonlyArray.entries behavior: mixed whitespace string array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["  test \t", "plain"];
      const collected: string[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual("  test \t");
      expect(collected[1]).assertEqual("plain");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0420
     * @tc.name testReadonlyArrayEntries042
     * @tc.desc Verify ReadonlyArray.entries behavior: alternating positive negative int array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, -1, 2, -2];
      const collected: int[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(1);
      expect(collected[arr.length - 1]).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0430
     * @tc.name testReadonlyArrayEntries043
     * @tc.desc Verify ReadonlyArray.entries behavior: zero width space string array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "\u200B", "c"];
      const collected: string[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual("a");
      expect(collected[1]).assertEqual("\u200B");
      expect(collected[arr.length - 1]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0440
     * @tc.name testReadonlyArrayEntries044
     * @tc.desc Verify ReadonlyArray.entries behavior: XSS string array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["safe", "<script>alert(1)</script>"];
      const collected: string[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual("safe");
      expect(collected[1]).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0450
     * @tc.name testReadonlyArrayEntries045
     * @tc.desc Verify ReadonlyArray.entries behavior: all false boolean array entries iterator completes fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [false, false];
      const collected: boolean[] = [];
      for (const entry of arr.entries()) {
        collected.push(entry[1]);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(false);
      expect(collected[1]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0460
     * @tc.name testReadonlyArrayEntries046
     * @tc.desc Verify ReadonlyArray.entries behavior: single int element array entries iterator yields one pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [42];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual(42);
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0470
     * @tc.name testReadonlyArrayEntries047
     * @tc.desc Verify ReadonlyArray.entries behavior: entries iterator yields float NaN value at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        if (entry[0] === 1) {
          expect(Number.isNaN(entry[1])).assertTrue();
        } else {
          expect(entry[1]).assertEqual(arr[count]);
        }
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0480
     * @tc.name testReadonlyArrayEntries048
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix byte boundary entries index and element value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte, 127 as byte];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0490
     * @tc.name testReadonlyArrayEntries049
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix short boundary entries index and element value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short, 0 as short, 32767 as short];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0500
     * @tc.name testReadonlyArrayEntries050
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix Unicode Chinese first element entries value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "tail"];
      expectStringEntriesInOrder(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0510
     * @tc.name testReadonlyArrayEntries051
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix emoji first element entries value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\uD83D\uDE00", "tail"];
      expectStringEntriesInOrder(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0520
     * @tc.name testReadonlyArrayEntries052
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix float NaN special float entries element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 3.0f];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        if (entry[0] === 1) {
          expect(Number.isNaN(entry[1])).assertTrue();
        } else {
          expect(entry[1]).assertEqual(arr[count]);
        }
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0530
     * @tc.name testReadonlyArrayEntries053
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix 1000 elements entries last index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        source.push(i);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(1000);
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0540
     * @tc.name testReadonlyArrayEntries054
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix byte independent second entries traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte];
      let c1: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(c1);
        expect(entry[1]).assertEqual(arr[c1]);
        c1++;
      }
      let c2: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(c2);
        expect(entry[1]).assertEqual(arr[c2]);
        c2++;
      }
      expect(c1).assertEqual(2);
      expect(c2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0550
     * @tc.name testReadonlyArrayEntries055
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix long second entries call returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [100, 200, 300];
      const ignored = arr.entries();
      const ignoredFirst = ignored.next();
      expect(ignoredFirst.value != null).assertTrue();
      expect(ignoredFirst.value![0]).assertEqual(0);
      expect(ignoredFirst.value![1]).assertEqual(100);
      let first: long = -1;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        if (entry[0] === 0) {
          first = entry[1];
        }
        count++;
      }
      expect(first).assertEqual(100);
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0560
     * @tc.name testReadonlyArrayEntries056
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix manual next protocol for entries iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [11, 22, 33];
      const iter = arr.entries();
      const first = iter.next();
      expect(first.value != null).assertTrue();
      expect(first.value![0]).assertEqual(0);
      expect(first.value![1]).assertEqual(11);
      const second = iter.next();
      expect(second.value != null).assertTrue();
      expect(second.value![0]).assertEqual(1);
      expect(second.value![1]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0570
     * @tc.name testReadonlyArrayEntries057
     * @tc.desc Verify ReadonlyArray.entries behavior: continuing to call next after iterator exhaustion keeps returning done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      const iter = arr.entries();
      iter.next();
      iter.next();
      const after1 = iter.next();
      const after2 = iter.next();
      const after3 = iter.next();
      expect(after1.done).assertTrue();
      expect(after2.done).assertTrue();
      expect(after3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0580
     * @tc.name testReadonlyArrayEntries058
     * @tc.desc Verify ReadonlyArray.entries behavior: ReadonlyArray<int | undefined> entries iterator yields undefined as a valid element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int | undefined> = [1, undefined, 3];
      const collected: Array<int | undefined> = [];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        collected.push(entry[1]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(undefined);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0590
     * @tc.name testReadonlyArrayEntries059
     * @tc.desc Verify ReadonlyArray.entries behavior: spread operator collects all [index, value] tuples in iteration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [11, 22, 33];
      const collected: Array<[int, int]> = [...arr.entries()];
      expect(collected.length).assertEqual(3);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual(11);
      expect(collected[1][0]).assertEqual(1);
      expect(collected[1][1]).assertEqual(22);
      expect(collected[2][0]).assertEqual(2);
      expect(collected[2][1]).assertEqual(33);
    });

  });
}
