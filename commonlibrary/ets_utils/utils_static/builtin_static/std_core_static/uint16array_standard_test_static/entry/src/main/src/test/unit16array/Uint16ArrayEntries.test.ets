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

export default function uint16ArrayEntriesTest(): void {
  describe('Uint16ArrayEntriesTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_0100
     * @tc.name testUint16ArrayEntries001
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(1, 2, 3);
        const iter = arr.entries();
        const first = iter.next();
        expect(first.done).assertFalse();
        expect(first.value![0]).assertEqual(0);
        expect(first.value![1]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_0200
     * @tc.name testUint16ArrayEntries002
     * @tc.desc Verify entries() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(5);
        const iter = arr.entries();
        expect(iter.next().value![1]).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_0300
     * @tc.name testUint16ArrayEntries003
     * @tc.desc Verify empty array entries(): done=true, value=undefined, for...of count=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array();

        const iter = arr.entries();
        const first = iter.next();
        expect(first.done).assertEqual(true);
        expect(first.value).assertUndefined();
      }
      {
        const arr: Uint16Array = new Uint16Array();
        let count: number = 0;
        for (const entry of arr.entries()) {
          count++;
        }
        expect(count).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_0400
     * @tc.name testUint16ArrayEntries004
     * @tc.desc Verify next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const arr: Uint16Array = new Uint16Array();
        const iter = arr.entries();
        iter.next();
        expect(iter.next().done).assertEqual(true);
        expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_0500
     * @tc.name testUint16ArrayEntries005
     * @tc.desc Verify entries() with various values: 0, 100, 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0);
        let entry = arr.entries().next().value!;
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual(0);
      }
      {
        let arr: Uint16Array = Uint16Array.of(100);
        let entry = arr.entries().next().value!;
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual(100);
      }
      {
        let arr: Uint16Array = Uint16Array.of(65535);
        let entry = arr.entries().next().value!;
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_0600
     * @tc.name testUint16ArrayEntries006
     * @tc.desc Verify value=65536 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(65536);
        const entry = arr.entries().next().value!;
        expect(entry[1]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_0700
     * @tc.name testUint16ArrayEntries007
     * @tc.desc Verify value=-1 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(-1);
        const entry = arr.entries().next().value!;
        expect(entry[1]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_0800
     * @tc.name testUint16ArrayEntries008
     * @tc.desc Verify entry indices increment: 0, 1, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(10, 20, 30);
        const iter = arr.entries();
        expect(iter.next().value![0]).assertEqual(0);
        expect(iter.next().value![0]).assertEqual(1);
        expect(iter.next().value![0]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_0900
     * @tc.name testUint16ArrayEntries009
     * @tc.desc Verify entry[0] number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(5, 10);
        const entry = arr.entries().next().value!;
        expect(entry[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_1000
     * @tc.name testUint16ArrayEntries010
     * @tc.desc Verify entry[1] number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(5);
        const entry = arr.entries().next().value!;
        expect(entry[1]).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_1100
     * @tc.name testUint16ArrayEntries011
     * @tc.desc Verify [0, 65535]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(0, 65535);
        const iter = arr.entries();
        expect(iter.next().value![1]).assertEqual(0);
        expect(iter.next().value![1]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_1200
     * @tc.name testUint16ArrayEntries012
     * @tc.desc Verify float truncation: 3.14->3, 65535.9->65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(3.14);
        expect(arr.entries().next().value![1]).assertEqual(3);
      }
      {
        const arr: Uint16Array = Uint16Array.of(65535.9);
        expect(arr.entries().next().value![1]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_1300
     * @tc.name testUint16ArrayEntries013
     * @tc.desc Verify special numbers: Infinity, -Infinity, NaN all truncate to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(Number.POSITIVE_INFINITY);
        expect(arr.entries().next().value![1]).assertEqual(0);
      }
      {
        const arr: Uint16Array = Uint16Array.of(-Number.POSITIVE_INFINITY);
        expect(arr.entries().next().value![1]).assertEqual(0);
      }
      {
        const arr: Uint16Array = Uint16Array.of(Number.NaN);
        expect(arr.entries().next().value![1]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_1400
     * @tc.name testUint16ArrayEntries014
     * @tc.desc Verify numeric literal formats: 0xFFFF, 0b11111111, 0o777, 1e4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(0xFFFF);
        expect(arr.entries().next().value![1]).assertEqual(65535);
      }
      {
        const arr: Uint16Array = Uint16Array.of(0b11111111);
        expect(arr.entries().next().value![1]).assertEqual(255);
      }
      {
        const arr: Uint16Array = Uint16Array.of(0o777);
        expect(arr.entries().next().value![1]).assertEqual(511);
      }
      {
        const arr: Uint16Array = Uint16Array.of(1e4);
        expect(arr.entries().next().value![1]).assertEqual(10000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_1500
     * @tc.name testUint16ArrayEntries015
     * @tc.desc Verify for...of entries values and count matches arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(10, 20, 30);
        const results: number[] = [];
        for (const entry of arr.entries()) {
          results.push(entry[1]);
        }
        expect(results.at(0)!).assertEqual(10);
        expect(results.at(1)!).assertEqual(20);
        expect(results.at(2)!).assertEqual(30);
        expect(results.length).assertEqual(arr.length);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_1600
     * @tc.name testUint16ArrayEntries016
     * @tc.desc Verify for...of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        let count: number = 0;
        for (const entry of arr.entries()) {
          expect(entry[0]).assertEqual(count);
          expect(entry[1]).assertEqual(count + 1);
          count++;
          if (count === 2) {
            break;
          }
        }
        expect(count).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_1700
     * @tc.name testUint16ArrayEntries017
     * @tc.desc Verify for...of 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10);
        for (let i: int = 0; i < 10; i++) {
          arr[i] = i * 100;
        }
        let count: number = 0;
        for (const entry of arr.entries()) {
          expect(entry[0]).assertEqual(count);
          expect(entry[1]).assertEqual(count * 100);
          count++;
        }
        expect(count).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_1800
     * @tc.name testUint16ArrayEntries018
     * @tc.desc Verify for...of for...of entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(1, 2);
        let outerCount: number = 0;
        for (const outer of arr.entries()) {
          let innerCount: number = 0;
          for (const inner of arr.entries()) {
            innerCount++;
          }
          expect(innerCount).assertEqual(2);
          outerCount++;
        }
        expect(outerCount).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_1900
     * @tc.name testUint16ArrayEntries019
     * @tc.desc Verify .next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(42);
        const result = arr.entries().next();
        expect(result.value![0]).assertEqual(0);
        expect(result.value![1]).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_2000
     * @tc.name testUint16ArrayEntries020
     * @tc.desc Verify .next() done boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(42);
        const result = arr.entries().next();
        expect(result.done).assertFalse();
        expect(result.value![1]).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_2100
     * @tc.name testUint16ArrayEntries021
     * @tc.desc Verify iterator exhausted: done=true, value=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(1, 2);
        const iter = arr.entries();
        iter.next();
        iter.next();
        const result = iter.next();
        expect(result.done).assertEqual(true);
        expect(result.value).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_2200
     * @tc.name testUint16ArrayEntries022
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(10, 20, 30);
        const iter1 = arr.entries();
        const iter2 = arr.entries();
        iter1.next();
        expect(iter1.next().value![1]).assertEqual(20);
        expect(iter2.next().value![1]).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_2300
     * @tc.name testUint16ArrayEntries023
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(1, 2, 3);
        arr[1] = 99;
        const iter = arr.entries();
        iter.next();
        expect(iter.next().value![1]).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_2400
     * @tc.name testUint16ArrayEntries024
     * @tc.desc Verify next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(10, 20, 30);
        const iter = arr.entries();
        iter.next();
        arr[1] = 55;
        expect(iter.next().value![1]).assertEqual(55);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_2500
     * @tc.name testUint16ArrayEntries025
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(10, 20, 30);
        const iter = arr.entries();
        const first = iter.next().value!;
        arr[0] = 99;
        const second = iter.next().value!;
        expect(first[1]).assertEqual(10);
        expect(second[1]).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_2600
     * @tc.name testUint16ArrayEntries026
     * @tc.desc Verify entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(1, 2, 3);
        arr[0] = 0;
        arr[1] = 0;
        arr[2] = 0;
        let count: int = 0;
        for (const entry of arr.entries()) {
          expect(entry[0]).assertEqual(count);
          expect(entry[1]).assertEqual(0);
          count++;
        }
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_2700
     * @tc.name testUint16ArrayEntries027
     * @tc.desc Verify new Uint16Array([...]) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array([1, 2, 3]);
        const iter = arr.entries();
        expect(iter.next().value![1]).assertEqual(1);
        expect(iter.next().value![1]).assertEqual(2);
        expect(iter.next().value![1]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_2800
     * @tc.name testUint16ArrayEntries028
     * @tc.desc Verify Uint16Array.of() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(100, 200);
        const iter = arr.entries();
        expect(iter.next().value![1]).assertEqual(100);
        expect(iter.next().value![1]).assertEqual(200);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_2900
     * @tc.name testUint16ArrayEntries029
     * @tc.desc Verify Uint16Array.from() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.from([5, 10, 15]);
        const iter = arr.entries();
        expect(iter.next().value![1]).assertEqual(5);
        expect(iter.next().value![1]).assertEqual(10);
        expect(iter.next().value![1]).assertEqual(15);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_3000
     * @tc.name testUint16ArrayEntries030
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(42, 42, 42, 42);
        let count: int = 0;
        for (const entry of arr.entries()) {
          expect(entry[0]).assertEqual(count);
          expect(entry[1]).assertEqual(42);
          count++;
        }
        expect(count).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_3100
     * @tc.name testUint16ArrayEntries031
     * @tc.desc Verify [0, 65535, 0, 65535]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(0, 65535, 0, 65535);
        const iter = arr.entries();
        expect(iter.next().value![1]).assertEqual(0);
        expect(iter.next().value![1]).assertEqual(65535);
        expect(iter.next().value![1]).assertEqual(0);
        expect(iter.next().value![1]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_3200
     * @tc.name testUint16ArrayEntries032
     * @tc.desc Verify subarray entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        const sub = arr.subarray(1, 3);
        const iter = sub.entries();
        expect(iter.next().value![1]).assertEqual(2);
        expect(iter.next().value![1]).assertEqual(3);
        expect(iter.next().done).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_3300
     * @tc.name testUint16ArrayEntries033
     * @tc.desc Verify empty entries iterator is immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item = new Uint16Array().entries().next();
            expect(item.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_3400
     * @tc.name testUint16ArrayEntries034
     * @tc.desc Verify entries iterator remains done after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterator = Uint16Array.of(9).entries();
            iterator.next();
            expect(iterator.next().done).assertTrue();
            expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_3500
     * @tc.name testUint16ArrayEntries035
     * @tc.desc Verify entries iterator reports increasing indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterator = Uint16Array.of(8, 9, 10).entries();
            expect(iterator.next().value![0]).assertEqual(0);
            expect(iterator.next().value![0]).assertEqual(1);
            expect(iterator.next().value![0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_3600
     * @tc.name testUint16ArrayEntries036
     * @tc.desc Verify entries iterator observes mutation of an unconsumed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
            let iterator = arr.entries();
            iterator.next();
            arr[1] = 77;
            let item = iterator.next().value!;
            expect(item[0]).assertEqual(1);
            expect(item[1]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_3700
     * @tc.name testUint16ArrayEntries037
     * @tc.desc Verify entries iterator observes alias-view mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let arr: Uint16Array = new Uint16Array(buffer);
            arr.set([10, 20, 30]);
            let alias: Uint16Array = new Uint16Array(buffer);
            let iterator = arr.entries();
            iterator.next();
            alias[1] = 66;
            expect(iterator.next().value![1]).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_3800
     * @tc.name testUint16ArrayEntries038
     * @tc.desc Verify entries indices are relative to an offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(10);
            let all: Uint16Array = new Uint16Array(buffer);
            all.set([5, 10, 15, 20, 25]);
            let view: Uint16Array = new Uint16Array(buffer, 4, 2);
            let item = view.entries().next().value!;
            expect(item[0]).assertEqual(0);
            expect(item[1]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_3900
     * @tc.name testUint16ArrayEntries039
     * @tc.desc Verify two entries iterators have independent positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 4);
            let first = arr.entries();
            let second = arr.entries();
            first.next();
            expect(first.next().value![0]).assertEqual(1);
            expect(second.next().value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_4000
     * @tc.name testUint16ArrayEntries040
     * @tc.desc Verify entries iterator created before fill reads filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
            let iterator = arr.entries();
            iterator.next();
            arr.fill(50, 1);
            expect(iterator.next().value![1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_ENTRIES_4100
     * @tc.name testUint16ArrayEntries041
     * @tc.desc Verify an entries iterator preserves indices and observes copyWithin changes to unconsumed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      let iterator = array.entries();
      let first = iterator.next().value!;
      expect(first[0]).assertEqual(0);
      expect(first[1]).assertEqual(1);
      array.copyWithin(1, 2);
      let second = iterator.next().value!;
      let third = iterator.next().value!;
      expect(second[0]).assertEqual(1);
      expect(second[1]).assertEqual(3);
      expect(third[0]).assertEqual(2);
      expect(third[1]).assertEqual(4);
    });

  });
}
