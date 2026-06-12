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

class Person006 {
    name: string = ""
    age: int = 0
  }

export default function SparseArrayEntriesTest(): void {
  describe('SparseArrayEntriesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_0100
     * @tc.name testSparseArrayEntries001
     * @tc.desc Test SparseArray.entries returns non-null iterator for non-empty and empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        const strIterator = arr.entries();
        expect(strIterator !== null && strIterator !== undefined).assertTrue();

        const empty = new SparseArray<int>();
        const intIterator = empty.entries();
        expect(intIterator !== undefined && intIterator !== null).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_0200
     * @tc.name testSparseArrayEntries002
     * @tc.desc Test SparseArray.entries, verify method result (result.done equals false, pair[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const iterator = arr.entries();
        let result = iterator.next();
        let pair = result.value as [int, int];
        expect(result.done).assertEqual(false);
        expect(pair[0]).assertEqual(0);
        expect(pair[1]).assertEqual(1);
        result = iterator.next();
        pair = result.value as [int, int];
        expect(result.done).assertEqual(false);
        expect(pair[0]).assertEqual(1);
        expect(pair[1]).assertEqual(2);
        result = iterator.next();
        pair = result.value as [int, int];
        expect(result.done).assertEqual(false);
        expect(pair[0]).assertEqual(2);
        expect(pair[1]).assertEqual(3);
        result = iterator.next();
        expect(result.done).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_0300
     * @tc.name testSparseArrayEntries003
     * @tc.desc Test SparseArray.entries, verify method result (result!.done equals false, pair[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        const iterator = arr.entries();
        const result = iterator.next();
        const pair = result.value as [int, string];
        expect(result!.done).assertEqual(false);
        expect(pair[0]).assertEqual(0);
        expect(pair[1]).assertEqual("a");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_0400
     * @tc.name testSparseArrayEntries004
     * @tc.desc Test SparseArray.entries, verify method result (pairs.length equals 3, pairs[0][0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        const iterator = arr.entries();
        let pairs: Array<[int, int]> = [];
        let result = iterator.next();
        while (!result.done) {
          const pv = result.value as [int, int];
          pairs.push(pv);
          result = iterator.next();
        }
        expect(pairs.length).assertEqual(3);
        expect(pairs[0][0]).assertEqual(0);
        expect(pairs[0][1]).assertEqual(10);
        expect(pairs[1][0]).assertEqual(2);
        expect(pairs[1][1]).assertEqual(30);
        expect(pairs[2][0]).assertEqual(4);
        expect(pairs[2][1]).assertEqual(50);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_0500
     * @tc.name testSparseArrayEntries005
     * @tc.desc Test SparseArray.entries, verify method result (result!.done equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const iterator = arr.entries();
        const result = iterator.next();
        expect(result!.done).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_0600
     * @tc.name testSparseArrayEntries006
     * @tc.desc Test SparseArray.entries, verify method result (tup[1].name equals "Alice", tup[1].age equals 25)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person006>();
        const p1 = new Person006();
        p1.name = "Alice";
        p1.age = 25;
        arr.push(p1);
        const iterator = arr.entries();
        const result = iterator.next();
        const tup = result.value as [int, Person006];
        expect(tup[1].name).assertEqual("Alice");
        expect(tup[1].age).assertEqual(25);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_0700
     * @tc.name testSparseArrayEntries007
     * @tc.desc Test SparseArray.entries on single-arg constructor yields done immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(42);
        const iterator = arr.entries();
        const result1 = iterator.next();
        const result2 = iterator.next();
        expect(result1!.done).assertEqual(true);
        expect(result2!.done).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_0800
     * @tc.name testSparseArrayEntries008
     * @tc.desc Test SparseArray.entries, verify method result (count equals 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 1000; i++) {
          arr.push(i);
        }
        const iterator = arr.entries();
        let count = 0;
        let result = iterator.next();
        while (!result.done) {
          count++;
          result = iterator.next();
        }
        expect(count).assertEqual(1000);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_0900
     * @tc.name testSparseArrayEntries009
     * @tc.desc Test SparseArray.entries, verify method result (e1[0] equals 0, e1[1] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const iterator = arr.entries();
        const result1 = iterator.next();
        const result2 = iterator.next();
        const e1 = result1.value as [int, int];
        const e2 = result2.value as [int, int];
        expect(e1[0]).assertEqual(0);
        expect(e1[1]).assertEqual(1);
        expect(e2[0]).assertEqual(1);
        expect(e2[1]).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_1000
     * @tc.name testSparseArrayEntries010
     * @tc.desc Test SparseArray.entries, verify method result (a1[0] equals 0, a1[1] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const iterator1 = arr.entries();
        const iterator2 = arr.entries();
        const result1 = iterator1.next();
        const result2 = iterator2.next();
        const a1 = result1.value as [int, int];
        const a2 = result2.value as [int, int];
        const result3 = iterator1.next();
        const a3 = result3.value as [int, int];
        expect(a1[0]).assertEqual(0);
        expect(a1[1]).assertEqual(1);
        expect(a2[0]).assertEqual(0);
        expect(a2[1]).assertEqual(1);
        expect(a3[0]).assertEqual(1);
        expect(a3[1]).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_1100
     * @tc.name testSparseArrayEntries011
     * @tc.desc entries iterator on SparseArray<Map<string,int>> yields Map values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const map = new Map<string, int>();
        map.set("id", 42);
        const arr = new SparseArray<Map<string, int>>(map);
        const iterator = arr.entries();
        const result = iterator.next();
        const ent = result.value as [int, Map<string, int>];
        expect(ent[1].get("id")).assertEqual(42);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_1200
     * @tc.name testSparseArrayEntries012
     * @tc.desc entries iterator on SparseArray<long> yields index-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(100 as long, 200 as long);
        const iterator = arr.entries();
        const first = iterator.next().value as [int, long];
        expect(first[0]).assertEqual(0);
        expect(first[1]).assertEqual(100 as long);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ENTRIES_1300
     * @tc.name testSparseArrayEntries013
     * @tc.desc entries iterator yields index 0x2 with null element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEntries013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(0, 0, null);
        const it = arr.entries();
        let pair = it.next().value as [int, int | null];
        pair = it.next().value as [int, int | null];
        pair = it.next().value as [int, int | null];
        expect(pair[0]).assertEqual(0x2);
        expect(pair[1]).assertEqual(null);
    });


  });
}
