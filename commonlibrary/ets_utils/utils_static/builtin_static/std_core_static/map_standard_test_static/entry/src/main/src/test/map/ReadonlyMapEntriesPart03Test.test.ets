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

interface ObjKey {
  id: number;
}
class KeyClass {
  val: int = 0;
}
class ValClass {
  data: string = 'hello';
}

export default function readonlyMapEntriesPart03TestTest(): void {
  describe('ReadonlyMapEntriesPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_0100
     * @tc.name readonlyMapEntriesPart03Test001
     * @tc.desc Verify entries null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let it: IterableIterator<[string, int]> = map.entries();
      expect(map.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_0200
     * @tc.name readonlyMapEntriesPart03Test002
     * @tc.desc Verify entries next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['k', 5]]);
      let it = map.entries();
      let r = it.next();
      let hasDone: boolean = r.done !== undefined;
      expect(hasDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_0300
     * @tc.name readonlyMapEntriesPart03Test003
     * @tc.desc Verify entries next value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['hello', 42]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_0400
     * @tc.name readonlyMapEntriesPart03Test004
     * @tc.desc Verify Map entries next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[1, 'one']]);
      let it = map.entries();
      let r = it.next();
      let isBool: boolean = typeof r.done === 'boolean';
      expect(isBool).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_0500
     * @tc.name readonlyMapEntriesPart03Test005
     * @tc.desc Verify Map null entries next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>(null);
      let it = map.entries();
      let r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_0600
     * @tc.name readonlyMapEntriesPart03Test006
     * @tc.desc Verify Map entries next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([]);
      let it = map.entries();
      let r = it.next();
      expect(r.done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_0700
     * @tc.name readonlyMapEntriesPart03Test007
     * @tc.desc Verify Map entries 3 next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      let it = map.entries();
      let r1 = it.next();
      let r2 = it.next();
      let r3 = it.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_0800
     * @tc.name readonlyMapEntriesPart03Test008
     * @tc.desc Verify Map entries 10 next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      let it = map.entries();
      let allDone: boolean = true;
      for (let i: int = 0; i < 10; i++) {
        if (it.next().done !== true) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_0900
     * @tc.name readonlyMapEntriesPart03Test009
     * @tc.desc Verify Map entries next value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      let it = map.entries();
      let r = it.next();
      let isUndefined: boolean = r.value === undefined;
      expect(isUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_1000
     * @tc.name readonlyMapEntriesPart03Test010
     * @tc.desc Verify Map next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['delta', 400]]);
      let it = map.entries();
      it.next();
      it.next();
      let r3 = it.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_1100
     * @tc.name readonlyMapEntriesPart03Test011
     * @tc.desc Verify Map for of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['epsilon', 500]]);
      for (let entry of map.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_1200
     * @tc.name readonlyMapEntriesPart03Test012
     * @tc.desc Verify Map for of entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['zeta', 600]]);
      for (let entry of map.entries()) {
        expect(entry[0]).assertEqual('zeta');
        expect(entry[1]).assertEqual(600);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_1300
     * @tc.name readonlyMapEntriesPart03Test013
     * @tc.desc Verify value Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['k1', 0], ['k2', 0], ['k3', 0]]);
      for (let entry of map.entries()) {
        expect(entry[1]).assertEqual(0);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_1400
     * @tc.name readonlyMapEntriesPart03Test014
     * @tc.desc Verify value Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<string, string> = new Map<string, string>([['a', ''], ['b', ''], ['c', '']]);
      for (let entry of map.entries()) {
        expect(entry[1]).assertEqual('');
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_1500
     * @tc.name readonlyMapEntriesPart03Test015
     * @tc.desc Verify value false Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<string, boolean> = new Map<string, boolean>([['x', false], ['y', false]]);
      for (let entry of map.entries()) {
        expect(entry[1]).assertFalse();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_1600
     * @tc.name readonlyMapEntriesPart03Test016
     * @tc.desc Verify value null Map entries null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<string, string | null> = new Map<string, string | null>([['n1', null], ['n2', null]]);
      for (let entry of map.entries()) {
        let isNull: boolean = entry[1] === null;
        expect(isNull).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_1700
     * @tc.name readonlyMapEntriesPart03Test017
     * @tc.desc Verify value true Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let total: int = 0;
      const map: ReadonlyMap<int, boolean> = new Map<int, boolean>([[1, true], [2, true], [3, true], [4, true]]);
      for (let entry of map.entries()) {
        total++;
      }
      expect(total).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_1800
     * @tc.name readonlyMapEntriesPart03Test018
     * @tc.desc Verify Map next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let it = map.entries();
      it.next();
      it.next();
      it.next();
      let r4 = it.next();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_1900
     * @tc.name readonlyMapEntriesPart03Test019
     * @tc.desc Verify 5 next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['one', 1], ['two', 2]]);
      let it = map.entries();
      it.next();
      it.next();
      let allDone: boolean = true;
      for (let i: int = 0; i < 5; i++) {
        if (it.next().done !== true) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_2000
     * @tc.name readonlyMapEntriesPart03Test020
     * @tc.desc Verify 50 next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['solo', 99]]);
      let it = map.entries();
      it.next();
      let allDone: boolean = true;
      for (let i: int = 0; i < 50; i++) {
        if (it.next().done !== true) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_2100
     * @tc.name readonlyMapEntriesPart03Test021
     * @tc.desc Verify entries iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['key1', 10], ['key2', 20]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      iter.next();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_2200
     * @tc.name readonlyMapEntriesPart03Test022
     * @tc.desc Verify next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 7], ['y', 8]]);
      let it = map.entries();
      it.next();
      it.next();
      it.next();
      it.next();
      it.next();
      expect(map.get('x')).assertEqual(7);
      expect(map.get('y')).assertEqual(8);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_2300
     * @tc.name readonlyMapEntriesPart03Test023
     * @tc.desc Verify entries iterator false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['p', 1], ['q', 2]]);
      let it1 = map.entries();
      it1.next();
      it1.next();
      it1.next();
      let it2 = map.entries();
      let r = it2.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('p');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_2400
     * @tc.name readonlyMapEntriesPart03Test024
     * @tc.desc Verify entries iterator false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      for (let entry of map.entries()) {}
      let itNew = map.entries();
      let first = itNew.next();
      expect(first.done).assertFalse();
      expect(first.value![0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_2500
     * @tc.name readonlyMapEntriesPart03Test025
     * @tc.desc Verify next value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['item', 55]]);
      let it = map.entries();
      it.next();
      let rExhausted = it.next();
      let valIsUndefined: boolean = rExhausted.value === undefined;
      expect(valIsUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_2600
     * @tc.name readonlyMapEntriesPart03Test026
     * @tc.desc Verify Map NaN entries NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[Number.NaN, 'nan_val']]);
      let it = map.entries();
      let r = it.next();
      let keyIsNaN: boolean = isNaN(r.value![0]);
      expect(keyIsNaN).assertTrue();
      expect(r.value![1]).assertEqual('nan_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_2700
     * @tc.name readonlyMapEntriesPart03Test027
     * @tc.desc Verify Map Infinity entries Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[Number.POSITIVE_INFINITY, 'inf_val']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![0]).assertEqual(Number.POSITIVE_INFINITY);
      expect(r.value![1]).assertEqual('inf_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_2800
     * @tc.name readonlyMapEntriesPart03Test028
     * @tc.desc Verify Map Infinity entries Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[Number.NEGATIVE_INFINITY, 'neg_inf']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![0]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_2900
     * @tc.name readonlyMapEntriesPart03Test029
     * @tc.desc Verify Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[-0.0, 'neg_zero']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('neg_zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_3000
     * @tc.name readonlyMapEntriesPart03Test030
     * @tc.desc Verify Map 2147483647 entries 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[2147483647, 'max_int']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![0]).assertEqual(2147483647);
      expect(r.value![1]).assertEqual('max_int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_3100
     * @tc.name readonlyMapEntriesPart03Test031
     * @tc.desc Verify Map (-2147483647 - 1) entries (-2147483647 - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[-2147483648, 'min_int']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![0]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_3200
     * @tc.name readonlyMapEntriesPart03Test032
     * @tc.desc Verify Map byte.MAX entries byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, string> = new Map<byte, string>([[127 as byte, 'max_byte']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('max_byte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_3300
     * @tc.name readonlyMapEntriesPart03Test033
     * @tc.desc Verify Map byte.MIN entries byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, string> = new Map<byte, string>([[-128 as byte, 'min_byte']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('min_byte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_3400
     * @tc.name readonlyMapEntriesPart03Test034
     * @tc.desc Verify Map double.MAX_VALUE entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[1.7976931348623157e308, 'max_double']]);
      let it = map.entries();
      let r = it.next();
      let hasEntry: boolean = r.done === false;
      expect(hasEntry).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_3500
     * @tc.name readonlyMapEntriesPart03Test035
     * @tc.desc Verify Map Number.EPSILON entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[Number.EPSILON, 'epsilon']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('epsilon');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_3600
     * @tc.name readonlyMapEntriesPart03Test036
     * @tc.desc Verify Map NaN entries NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['nan_key', Number.NaN]]);
      let it = map.entries();
      let r = it.next();
      let valIsNaN: boolean = isNaN(r.value![1]);
      expect(valIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_3700
     * @tc.name readonlyMapEntriesPart03Test037
     * @tc.desc Verify Map Infinity entries Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['inf_key', Number.POSITIVE_INFINITY]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_3800
     * @tc.name readonlyMapEntriesPart03Test038
     * @tc.desc Verify Map Infinity entries Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['ninf_key', Number.NEGATIVE_INFINITY]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_3900
     * @tc.name readonlyMapEntriesPart03Test039
     * @tc.desc Verify Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['nz_key', -0.0]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![0]).assertEqual('nz_key');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_4000
     * @tc.name readonlyMapEntriesPart03Test040
     * @tc.desc Verify Map 2147483647 entries 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['max', 2147483647]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_4100
     * @tc.name readonlyMapEntriesPart03Test041
     * @tc.desc Verify Map (-2147483647 - 1) entries (-2147483647 - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['min', -2147483648]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_4200
     * @tc.name readonlyMapEntriesPart03Test042
     * @tc.desc Verify Map Number.EPSILON entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['eps', Number.EPSILON]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_4300
     * @tc.name readonlyMapEntriesPart03Test043
     * @tc.desc Verify Map Number.MAX_VALUE entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['maxv', Number.MAX_VALUE]]);
      let it = map.entries();
      let r = it.next();
      let hasEntry: boolean = r.done === false;
      expect(hasEntry).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_4400
     * @tc.name readonlyMapEntriesPart03Test044
     * @tc.desc Verify Map null entries null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, int> = new Map<string | null, int>([[null, 42]]);
      let it = map.entries();
      let r = it.next();
      let keyIsNull: boolean = r.value![0] === null;
      expect(keyIsNull).assertTrue();
      expect(r.value![1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_4500
     * @tc.name readonlyMapEntriesPart03Test045
     * @tc.desc Verify Map undefined entries undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | undefined, int> = new Map<string | undefined, int>([[undefined, 77]]);
      let it = map.entries();
      let r = it.next();
      let keyIsUndef: boolean = r.value![0] === undefined;
      expect(keyIsUndef).assertTrue();
      expect(r.value![1]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_4600
     * @tc.name readonlyMapEntriesPart03Test046
     * @tc.desc Verify Map null entries null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int | null> = new Map<string, int | null>([['nullable', null]]);
      let it = map.entries();
      let r = it.next();
      let valIsNull: boolean = r.value![1] === null;
      expect(valIsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_4700
     * @tc.name readonlyMapEntriesPart03Test047
     * @tc.desc Verify Map undefined entries undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int | undefined> = new Map<string, int | undefined>([['undef_val', undefined]]);
      let it = map.entries();
      let r = it.next();
      let valIsUndef: boolean = r.value![1] === undefined;
      expect(valIsUndef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_4800
     * @tc.name readonlyMapEntriesPart03Test048
     * @tc.desc Verify Map null undefined entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<string | null | undefined, int> = new Map<string | null | undefined, int>([[null, 1], [undefined, 2]]);
      for (let entry of map.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_4900
     * @tc.name readonlyMapEntriesPart03Test049
     * @tc.desc Verify Map null undefined entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nullCount: int = 0;
      let undefCount: int = 0;
      const map: ReadonlyMap<string, int | null | undefined> = new Map<string, int | null | undefined>([['n', null], ['u', undefined]]);
      for (let entry of map.entries()) {
        if (entry[1] === null) {
          nullCount++;
        }
        if (entry[1] === undefined) {
          undefCount++;
        }
      }
      expect(nullCount).assertEqual(1);
      expect(undefCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_5000
     * @tc.name readonlyMapEntriesPart03Test050
     * @tc.desc Verify Map Date entries Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(1609459200000);
      const map: ReadonlyMap<Date, string> = new Map<Date, string>([[d, 'date_val']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('date_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_5100
     * @tc.name readonlyMapEntriesPart03Test051
     * @tc.desc Verify Map RegExp entries RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('test', 'g');
      const map: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[re, 999]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_5200
     * @tc.name readonlyMapEntriesPart03Test052
     * @tc.desc Verify Map Error entries Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('test error');
      const map: ReadonlyMap<Error, string> = new Map<Error, string>([[err, 'error_key']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('error_key');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_5300
     * @tc.name readonlyMapEntriesPart03Test053
     * @tc.desc Verify Map int entries , string>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      const map: ReadonlyMap<int[], string> = new Map<int[], string>([[arr, 'array_val']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('array_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_5400
     * @tc.name readonlyMapEntriesPart03Test054
     * @tc.desc Verify Date entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1000000);
      let d2: Date = new Date(1000000);
      let count: int = 0;
      const map: ReadonlyMap<Date, int> = new Map<Date, int>([[d1, 1], [d2, 2]]);
      for (let entry of map.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_5500
     * @tc.name readonlyMapEntriesPart03Test055
     * @tc.desc Verify RegExp entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re1: RegExp = new RegExp('abc', 'i');
      let re2: RegExp = new RegExp('abc', 'i');
      let count: int = 0;
      const map: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[re1, 10], [re2, 20]]);
      for (let entry of map.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_5600
     * @tc.name readonlyMapEntriesPart03Test056
     * @tc.desc Verify entries K=ObjKey V=int == 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: ObjKey = { id: 1 };
      let o2: ObjKey = { id: 1 };
      let count: int = 0;
      const map: ReadonlyMap<ObjKey, int> = new Map<ObjKey, int>([[o1, 100], [o2, 200]]);
      for (let entry of map.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_5700
     * @tc.name readonlyMapEntriesPart03Test057
     * @tc.desc Verify Map class entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: KeyClass = new KeyClass();
      k1.val = 5;
      let k2: KeyClass = new KeyClass();
      k2.val = 5;
      const map: ReadonlyMap<KeyClass, string> = new Map<KeyClass, string>([[k1, 'first'], [k2, 'second']]);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_5800
     * @tc.name readonlyMapEntriesPart03Test058
     * @tc.desc Verify Map Date entries Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dv: Date = new Date(1700000000000);
      const map: ReadonlyMap<string, Date> = new Map<string, Date>([['d', dv]]);
      let it = map.entries();
      let r = it.next();
      let valIsDate: boolean = r.value![1] instanceof Date;
      expect(valIsDate).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_5900
     * @tc.name readonlyMapEntriesPart03Test059
     * @tc.desc Verify Map RegExp entries RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rv: RegExp = new RegExp('pattern', 'g');
      const map: ReadonlyMap<string, RegExp> = new Map<string, RegExp>([['r', rv]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_6000
     * @tc.name readonlyMapEntriesPart03Test060
     * @tc.desc Verify Map Error entries Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ev: Error = new Error('value_error');
      const map: ReadonlyMap<string, Error> = new Map<string, Error>([['e', ev]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_6100
     * @tc.name readonlyMapEntriesPart03Test061
     * @tc.desc Verify Map int entries >]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let av: int[] = [10, 20, 30];
      const map: ReadonlyMap<string, int[]> = new Map<string, int[]>([['arr', av]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_6200
     * @tc.name readonlyMapEntriesPart03Test062
     * @tc.desc Verify Map Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerMap: Map<string, int> = new Map<string, int>([['inner', 99]]);
      const outerMap: ReadonlyMap<string, Map<string, int>> = new Map<string, Map<string, int>>([['nested', innerMap]]);
      let it = outerMap.entries();
      let r = it.next();
      expect(r.value![1]).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_6300
     * @tc.name readonlyMapEntriesPart03Test063
     * @tc.desc Verify Map class entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vc: ValClass = new ValClass();
      const map: ReadonlyMap<string, ValClass> = new Map<string, ValClass>([['vc', vc]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_6400
     * @tc.name readonlyMapEntriesPart03Test064
     * @tc.desc Verify entries iterator == 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let it1 = map.entries();
      let it2 = map.entries();
      let r1 = it1.next();
      let r2 = it2.next();
      expect(r1.value![0]).assertEqual('a');
      expect(r2.value![0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_6500
     * @tc.name readonlyMapEntriesPart03Test065
     * @tc.desc Verify entries iterator false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 10], ['y', 20], ['z', 30]]);
      let it1 = map.entries();
      it1.next();
      it1.next();
      it1.next();
      let it2 = map.entries();
      let r = it2.next();
      expect(r.done).assertFalse();
      expect(r.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_6600
     * @tc.name readonlyMapEntriesPart03Test066
     * @tc.desc Verify entries iterator == 'p'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['p', 1], ['q', 2], ['r', 3], ['s', 4]]);
      let itA = map.entries();
      let itB = map.entries();
      let a1 = itA.next();
      let b1 = itB.next();
      let a2 = itA.next();
      let b2 = itB.next();
      expect(a1.value![0]).assertEqual('p');
      expect(b1.value![0]).assertEqual('p');
      expect(a2.value![0]).assertEqual('q');
      expect(b2.value![0]).assertEqual('q');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_6700
     * @tc.name readonlyMapEntriesPart03Test067
     * @tc.desc Verify entries iterator == 'k1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['k1', 1], ['k2', 2]]);
      let it1 = map.entries();
      let it2 = map.entries();
      let it3 = map.entries();
      it1.next();
      it1.next();
      let r2 = it2.next();
      let r3 = it3.next();
      expect(r2.value![0]).assertEqual('k1');
      expect(r3.value![0]).assertEqual('k1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_6800
     * @tc.name readonlyMapEntriesPart03Test068
     * @tc.desc Verify entries iterator == 'm'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count1: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['m', 5], ['n', 6], ['o', 7]]);
      for (let entry of map.entries()) {
        count1++;
        if (count1 === 2) {
          break;
        }
      }
      let itNew = map.entries();
      let firstNew = itNew.next();
      expect(firstNew.value![0]).assertEqual('m');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_6900
     * @tc.name readonlyMapEntriesPart03Test069
     * @tc.desc Verify entries iterator == 'aa'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['aa', 11], ['bb', 22], ['cc', 33], ['dd', 44]]);
      let itHalf = map.entries();
      itHalf.next();
      itHalf.next();
      let itFull = map.entries();
      let firstFull = itFull.next();
      expect(firstFull.value![0]).assertEqual('aa');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_7000
     * @tc.name readonlyMapEntriesPart03Test070
     * @tc.desc Verify entries iterator == 'keyA'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['keyA', 100], ['keyB', 200]]);
      let itOld = map.entries();
      itOld.next();
      itOld.next();
      itOld.next();
      let itFresh = map.entries();
      let r = itFresh.next();
      expect(r.value![0]).assertEqual('keyA');
      expect(r.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_7100
     * @tc.name readonlyMapEntriesPart03Test071
     * @tc.desc Verify entries == 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerCount: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['u', 1], ['v', 2]]);
      for (let outerEntry of map.entries()) {
        let innerCount: int = 0;
        for (let innerEntry of map.entries()) {
          innerCount++;
        }
        expect(innerCount).assertEqual(2);
        outerCount++;
      }
      expect(outerCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_7200
     * @tc.name readonlyMapEntriesPart03Test072
     * @tc.desc Verify key entries entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['dup', 1], ['dup', 2], ['dup', 3]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(3);
      let r2 = it.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_7300
     * @tc.name readonlyMapEntriesPart03Test073
     * @tc.desc Verify set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['second', 2], ['third', 3], ['second', 222]]);
      let it = map.entries();
      let r1 = it.next();
      let r2 = it.next();
      let r3 = it.next();
      expect(r2.value![0]).assertEqual('second');
      expect(r2.value![1]).assertEqual(222);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_7400
     * @tc.name readonlyMapEntriesPart03Test074
     * @tc.desc Verify Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [];
      for (let i: int = 0; i < 100; i++) {
        entries.push(['k' + i.toString(), i]);
      }
      let count: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>(entries);
      for (let entry of map.entries()) {
        count++;
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_7500
     * @tc.name readonlyMapEntriesPart03Test075
     * @tc.desc Verify Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'a'.repeat(10000);
      const map: ReadonlyMap<string, int> = new Map<string, int>([[longKey, 1]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_7600
     * @tc.name readonlyMapEntriesPart03Test076
     * @tc.desc Verify unicode emoji Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['😀', 1], ['🎉', 2]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_7700
     * @tc.name readonlyMapEntriesPart03Test077
     * @tc.desc Verify XSS Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['<script>alert(1)</script>', 999]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_7800
     * @tc.name readonlyMapEntriesPart03Test078
     * @tc.desc Verify Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['', 0], ['a', 1]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![0]).assertEqual('');
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_7900
     * @tc.name readonlyMapEntriesPart03Test079
     * @tc.desc Verify Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['​', 42]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_8000
     * @tc.name readonlyMapEntriesPart03Test080
     * @tc.desc Verify Map int entries int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[1, 'one'], [2, 'two']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![0]).assertEqual(1);
      expect(r.value![1]).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_8100
     * @tc.name readonlyMapEntriesPart03Test081
     * @tc.desc Verify Map boolean entries boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      for (let entry of map.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_8200
     * @tc.name readonlyMapEntriesPart03Test082
     * @tc.desc Verify Map long entries long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[9223372036854775807, 'max_long']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('max_long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_8300
     * @tc.name readonlyMapEntriesPart03Test083
     * @tc.desc Verify Map double entries double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[3.141592653589793, 'pi']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('pi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_8400
     * @tc.name readonlyMapEntriesPart03Test084
     * @tc.desc Verify Map byte entries byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, string> = new Map<byte, string>([[0 as byte, 'zero_byte']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('zero_byte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_8500
     * @tc.name readonlyMapEntriesPart03Test085
     * @tc.desc Verify Map short entries short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[1 as short, 'one_short']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('one_short');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_8600
     * @tc.name readonlyMapEntriesPart03Test086
     * @tc.desc Verify Map float entries float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> = new Map<float, string>([[1.5 as float, 'float_val']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('float_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_8700
     * @tc.name readonlyMapEntriesPart03Test087
     * @tc.desc Verify Map char entries char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<char, string> = new Map<char, string>([[c'A', 'char_A']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('char_A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_8800
     * @tc.name readonlyMapEntriesPart03Test088
     * @tc.desc Verify Map long entries long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[9223372036854775807, 'big']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual('big');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_8900
     * @tc.name readonlyMapEntriesPart03Test089
     * @tc.desc Verify Map number entries number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['pi', 3.14], ['e', 2.718]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_9000
     * @tc.name readonlyMapEntriesPart03Test090
     * @tc.desc Verify Map boolean entries boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<int, boolean> = new Map<int, boolean>([[0, false], [1, true]]);
      for (let entry of map.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_9100
     * @tc.name readonlyMapEntriesPart03Test091
     * @tc.desc Verify Map long entries long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, long> = new Map<string, long>([['long_max', 9223372036854775807]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_9200
     * @tc.name readonlyMapEntriesPart03Test092
     * @tc.desc Verify Map double entries double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, double> = new Map<string, double>([['d', 2.718281828459045]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(2.718281828459045);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_9300
     * @tc.name readonlyMapEntriesPart03Test093
     * @tc.desc Verify Map byte entries byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, byte> = new Map<string, byte>([['b', 64 as byte]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(64 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_9400
     * @tc.name readonlyMapEntriesPart03Test094
     * @tc.desc Verify Map short entries short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, short> = new Map<string, short>([['s', 100 as short]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(100 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_9500
     * @tc.name readonlyMapEntriesPart03Test095
     * @tc.desc Verify Map float entries float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, float> = new Map<string, float>([['f', 2.5 as float]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(2.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_9600
     * @tc.name readonlyMapEntriesPart03Test096
     * @tc.desc Verify Map char entries char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, char> = new Map<string, char>([['c', c'Z']]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART03_TEST_9700
     * @tc.name readonlyMapEntriesPart03Test097
     * @tc.desc Verify Map long entries long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart03Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, long> = new Map<string, long>([['bg', 9876543210]]);
      let it = map.entries();
      let r = it.next();
      expect(r.value![1]).assertEqual(9876543210);
    });





  });
}
