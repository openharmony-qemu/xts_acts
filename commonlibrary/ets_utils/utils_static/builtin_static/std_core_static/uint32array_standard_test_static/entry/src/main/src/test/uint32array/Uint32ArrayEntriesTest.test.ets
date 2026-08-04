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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayEntriesTest(): void {
  describe('Uint32ArrayEntriesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_0100
     * @tc.name testUint32ArrayEntries001
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const iter = arr.entries();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value![0]).assertEqual(0);
      expect(first.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_0200
     * @tc.name testUint32ArrayEntries002
     * @tc.desc Verify entries() next() on [1,2] returns key-value pair [0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_0300
     * @tc.name testUint32ArrayEntries003
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      const iter = arr.entries();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value![0]).assertEqual(0);
      expect(first.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_0400
     * @tc.name testUint32ArrayEntries004
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_0500
     * @tc.name testUint32ArrayEntries005
     * @tc.desc Verify entries() next() value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value!.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_0600
     * @tc.name testUint32ArrayEntries006
     * @tc.desc Verify entries() next() r.value![0] typeof int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6);
      const iter = arr.entries();
      const r = iter.next();
      expect(typeof r.value![0]).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_0700
     * @tc.name testUint32ArrayEntries007
     * @tc.desc Verify entries() next() r.value![1] typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6);
      const iter = arr.entries();
      const r = iter.next();
      expect(typeof r.value![1]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_0800
     * @tc.name testUint32ArrayEntries008
     * @tc.desc Verify entries() next() done boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_0900
     * @tc.name testUint32ArrayEntries009
     * @tc.desc Verify entries() [0, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_1000
     * @tc.name testUint32ArrayEntries010
     * @tc.desc Verify entries() next() r.value![0]=1, r.value![1]=14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 14, 21);
      const iter = arr.entries();
      iter.next();
      const r = iter.next();
      expect(r.value![0]).assertEqual(1);
      expect(r.value![1]).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_1100
     * @tc.name testUint32ArrayEntries011
     * @tc.desc Verify entries() next() r.value![0]=2, r.value![1]=21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 14, 21);
      const iter = arr.entries();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.value![0]).assertEqual(2);
      expect(r.value![1]).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_1200
     * @tc.name testUint32ArrayEntries012
     * @tc.desc Verify entries() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_1300
     * @tc.name testUint32ArrayEntries013
     * @tc.desc Verify entries() index monotonic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33, 44);
      const iter = arr.entries();
      let first = iter.next().value![0];
      let second = iter.next().value![0];
      let third = iter.next().value![0];
      let fourth = iter.next().value![0];
      expect(first < second).assertTrue();
      expect(second < third).assertTrue();
      expect(third < fourth).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_1400
     * @tc.name testUint32ArrayEntries014
     * @tc.desc Verify entries() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      const iter = arr.entries();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_1500
     * @tc.name testUint32ArrayEntries015
     * @tc.desc Verify entries() next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_1600
     * @tc.name testUint32ArrayEntries016
     * @tc.desc Verify entries() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      const iter = arr.entries();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_1700
     * @tc.name testUint32ArrayEntries017
     * @tc.desc Verify entries() new Uint32Array(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      expect(arr.length).assertEqual(0);
      const iter = arr.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_1800
     * @tc.name testUint32ArrayEntries018
     * @tc.desc Verify entries() next() r.value![1]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_1900
     * @tc.name testUint32ArrayEntries019
     * @tc.desc Verify entries() next() r.value![1]=0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0xFFFFFFFF);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_2000
     * @tc.name testUint32ArrayEntries020
     * @tc.desc Verify entries() next() r.value![1]=0x7FFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0x7FFFFFFF);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_2100
     * @tc.name testUint32ArrayEntries021
     * @tc.desc Verify entries() next() r.value![1]=0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0x80000000);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_2200
     * @tc.name testUint32ArrayEntries022
     * @tc.desc Verify entries() 0, 1, 0xFFFFFFFF values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 0xFFFFFFFF);
      const iter = arr.entries();
      const a = iter.next().value![1];
      const b = iter.next().value![1];
      const c = iter.next().value![1];
      expect(a).assertEqual(0);
      expect(b).assertEqual(1);
      expect(c).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_2300
     * @tc.name testUint32ArrayEntries023
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      arr.entries();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_2400
     * @tc.name testUint32ArrayEntries024
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      arr.entries();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_2500
     * @tc.name testUint32ArrayEntries025
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const iter1 = arr.entries();
      const iter2 = arr.entries();
      iter1.next();
      const r2 = iter2.next();
      expect(r2.value![0]).assertEqual(0);
      expect(r2.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_2600
     * @tc.name testUint32ArrayEntries026
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const iter1 = arr.entries();
      const iter2 = arr.entries();
      expect(iter1.next().value![1]).assertEqual(1);
      expect(iter2.next().value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_2700
     * @tc.name testUint32ArrayEntries027
     * @tc.desc Verify entries() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9);
      const iter = arr.entries();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_2800
     * @tc.name testUint32ArrayEntries028
     * @tc.desc Verify entries() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9);
      const iter = arr.entries();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_2900
     * @tc.name testUint32ArrayEntries029
     * @tc.desc Verify entries() next value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9);
      const iter = arr.entries();
      iter.next();
      const r = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_3000
     * @tc.name testUint32ArrayEntries030
     * @tc.desc Verify entries() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22);
      const iter = arr.entries();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_3100
     * @tc.name testUint32ArrayEntries031
     * @tc.desc Verify entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const indices: Array<int> = [];
      for (const entry of arr.entries()) {
        indices.push(entry[0]);
      }
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_3200
     * @tc.name testUint32ArrayEntries032
     * @tc.desc Verify entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const values: Array<number> = [];
      for (const entry of arr.entries()) {
        values.push(entry[1]);
      }
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_3300
     * @tc.name testUint32ArrayEntries033
     * @tc.desc Verify entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      let count = 0;
      for (const entry of arr.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_3400
     * @tc.name testUint32ArrayEntries034
     * @tc.desc Verify entries() for...of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200, 300);
      let sum: number = 0;
      for (const entry of arr.entries()) {
        sum += entry[1];
        break;
      }
      expect(sum).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_3500
     * @tc.name testUint32ArrayEntries035
     * @tc.desc Verify entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(55);
      let count = 0;
      for (const entry of arr.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_3600
     * @tc.name testUint32ArrayEntries036
     * @tc.desc Verify entries() [index, value] index $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6, 7);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_3700
     * @tc.name testUint32ArrayEntries037
     * @tc.desc Verify entries() index=1 arr[1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6, 7);
      const iter = arr.entries();
      iter.next();
      const r = iter.next();
      expect(r.value![1]).assertEqual(arr.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_3800
     * @tc.name testUint32ArrayEntries038
     * @tc.desc Verify entries() at(index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(8, 9, 10);
      const iter = arr.entries();
      iter.next();
      const r = iter.next();
      expect(r.value![1]).assertEqual(arr.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_3900
     * @tc.name testUint32ArrayEntries039
     * @tc.desc Verify entries() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 4, 5, 6);
      const iter = arr.entries();
      const a = iter.next().value![0];
      const b = iter.next().value![0];
      expect(a).assertEqual(0);
      expect(b).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_4000
     * @tc.name testUint32ArrayEntries040
     * @tc.desc Verify entries() subarray entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const sub = arr.subarray(1, 3);
      const iter = sub.entries();
      const r = iter.next();
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_4100
     * @tc.name testUint32ArrayEntries041
     * @tc.desc Verify entries() subarray entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      const sub = arr.subarray(1, 4);
      let count = 0;
      for (const entry of sub.entries()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_4200
     * @tc.name testUint32ArrayEntries042
     * @tc.desc Verify entries() slice entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const s = arr.slice(1, 3);
      const iter = s.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_4300
     * @tc.name testUint32ArrayEntries043
     * @tc.desc Verify entries() snapshot value not affected by later $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const iter = arr.entries();
      const r = iter.next();
      arr.$_set(0, 999);
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_4400
     * @tc.name testUint32ArrayEntries044
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      arr.$_set(1, 888);
      const iter = arr.entries();
      iter.next();
      const r = iter.next();
      expect(r.value![1]).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_4500
     * @tc.name testUint32ArrayEntries045
     * @tc.desc Verify entries() count 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      let count = 0;
      for (const entry of arr.entries()) {
        count++;
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_4600
     * @tc.name testUint32ArrayEntries046
     * @tc.desc Verify entries() next() r.value![1]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(50);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_4700
     * @tc.name testUint32ArrayEntries047
     * @tc.desc Verify entries() length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(50);
      const iter = arr.entries();
      let last = iter.next();
      for (let i = 0; i < 49; i++) {
        last = iter.next();
      }
      expect(last.value![0]).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_4800
     * @tc.name testUint32ArrayEntries048
     * @tc.desc Verify entries() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(10);
      const iter = arr.entries();
      for (let i = 0; i < 10; i++) {
        iter.next();
      }
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_4900
     * @tc.name testUint32ArrayEntries049
     * @tc.desc Verify entries() FixedArray<int> entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20, 30];
      const arr = new Uint32Array(src);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_5000
     * @tc.name testUint32ArrayEntries050
     * @tc.desc Verify entries() number FixedArray entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.5, 2.5];
      const arr = new Uint32Array(src);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_5100
     * @tc.name testUint32ArrayEntries051
     * @tc.desc Verify entries() Uint32Array entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = Uint32Array.of(7, 8, 9);
      const arr = new Uint32Array(original);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_5200
     * @tc.name testUint32ArrayEntries052
     * @tc.desc Verify entries() length entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      const iter = arr.entries();
      const a = iter.next().value![1];
      const b = iter.next().value![1];
      const c = iter.next().value![1];
      expect(a).assertEqual(0);
      expect(b).assertEqual(0);
      expect(c).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_5300
     * @tc.name testUint32ArrayEntries053
     * @tc.desc Verify entries() ArrayBuffer entries() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint32Array(buf);
      view.$_set(0, 111);
      view.$_set(1, 222);
      const iter = view.entries();
      const a = iter.next().value![1];
      const b = iter.next().value![1];
      expect(a).assertEqual(111);
      expect(b).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_5400
     * @tc.name testUint32ArrayEntries054
     * @tc.desc Verify entries() next() r.value![1]=0 entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0);
      const iter = arr.entries();
      const a = iter.next().value![1];
      const b = iter.next().value![1];
      expect(a).assertEqual(0);
      expect(b).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_5500
     * @tc.name testUint32ArrayEntries055
     * @tc.desc Verify entries() next() r.value![1]=0xFFFFFFFF entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0xFFFFFFFF, 0xFFFFFFFF);
      const iter = arr.entries();
      const a = iter.next().value![1];
      const b = iter.next().value![1];
      expect(a).assertEqual(4294967295);
      expect(b).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_5600
     * @tc.name testUint32ArrayEntries056
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 7, 7);
      const iter = arr.entries();
      const a = iter.next().value![0];
      const b = iter.next().value![0];
      const c = iter.next().value![0];
      expect(a).assertEqual(0);
      expect(b).assertEqual(1);
      expect(c).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_5700
     * @tc.name testUint32ArrayEntries057
     * @tc.desc Verify entries() -1 ( 4294967295)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, -1);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_5800
     * @tc.name testUint32ArrayEntries058
     * @tc.desc Verify entries() 4294967296 ( 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, 4294967296);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_5900
     * @tc.name testUint32ArrayEntries059
     * @tc.desc Verify entries() -2147483648 ( 2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, -2147483648);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_6000
     * @tc.name testUint32ArrayEntries060
     * @tc.desc Verify entries() next() r.value![1]=0.5 entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, 0.5);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_6100
     * @tc.name testUint32ArrayEntries061
     * @tc.desc Verify entries() 1.7 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, 1.7);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_6200
     * @tc.name testUint32ArrayEntries062
     * @tc.desc Verify entries() NaN entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, Number.NaN);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_6300
     * @tc.name testUint32ArrayEntries063
     * @tc.desc Verify entries() Infinity entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_6400
     * @tc.name testUint32ArrayEntries064
     * @tc.desc Verify entries() -Infinity entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, -Number.POSITIVE_INFINITY);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_6500
     * @tc.name testUint32ArrayEntries065
     * @tc.desc Verify entries() next() r.value![1]=0x10 (16)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0x10);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_6600
     * @tc.name testUint32ArrayEntries066
     * @tc.desc Verify entries() next() r.value![1]=0o17 (15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0o17);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_6700
     * @tc.name testUint32ArrayEntries067
     * @tc.desc Verify entries() next() r.value![1]=0b1010 (10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0b1010);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_6800
     * @tc.name testUint32ArrayEntries068
     * @tc.desc Verify entries() 1e3 (1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1e3);
      const iter = arr.entries();
      const r = iter.next();
      expect(r.value![1]).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_6900
     * @tc.name testUint32ArrayEntries069
     * @tc.desc Verify entries() 255 == 0xFF entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(255);
      const b = Uint32Array.of(0xFF);
      const ra = a.entries().next().value![1];
      const rb = b.entries().next().value![1];
      expect(ra).assertEqual(rb);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_7000
     * @tc.name testUint32ArrayEntries070
     * @tc.desc Verify entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let total: number = 0;
      for (const entry of arr.entries()) {
        total += entry[0];
      }
      expect(total).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_7100
     * @tc.name testUint32ArrayEntries071
     * @tc.desc Verify entries() for...of value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let total: number = 0;
      for (const entry of arr.entries()) {
        total += entry[1];
      }
      expect(total).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_7200
     * @tc.name testUint32ArrayEntries072
     * @tc.desc Verify entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let marker: number = 0;
      for (const entry of arr.entries()) {
        marker = entry[0];
      }
      expect(marker).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_7300
     * @tc.name testUint32ArrayEntries073
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      const iter = arr.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_7400
     * @tc.name testUint32ArrayEntries074
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      arr.$_set(0, 0x1FFFFFFFF);
      arr.$_set(1, -0x1);
      const iter = arr.entries();
      const a = iter.next().value![1];
      const b = iter.next().value![1];
      expect(a).assertEqual(0xFFFFFFFF);
      expect(b).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ENTRIES_7500
     * @tc.name testUint32ArrayEntries075
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEntries075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      arr.$_set(0, 0);
      arr.$_set(1, 0x100000000);
      arr.$_set(2, 0xFFFFFFFF);
      const iter = arr.entries();
      const a = iter.next().value![1];
      const b = iter.next().value![1];
      const c = iter.next().value![1];
      expect(a).assertEqual(0);
      expect(b).assertEqual(0);
      expect(c).assertEqual(4294967295);
    });

  });
}
