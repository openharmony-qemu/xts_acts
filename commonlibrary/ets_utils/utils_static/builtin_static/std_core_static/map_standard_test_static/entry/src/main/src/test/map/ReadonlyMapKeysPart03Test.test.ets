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

class BoxKey3 { id: number = 0; }
interface Pkg { name: string; ver: number; }
interface EqChk { a: number; b: number; }

export default function readonlyMapKeysPart03TestTest(): void {
  describe('ReadonlyMapKeysPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_0100
     * @tc.name readonlyMapKeysPart03Test001
     * @tc.desc Verify Map keys() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      let res: IteratorResult<string> = iter.next();
      expect(res.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_0200
     * @tc.name readonlyMapKeysPart03Test002
     * @tc.desc Verify Map keys() next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      let res: IteratorResult<string> = iter.next();
      expect(res.done).assertTrue();
      expect(res.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_0300
     * @tc.name readonlyMapKeysPart03Test003
     * @tc.desc Verify Map keys() next() done false value key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['single', 1]]);
      let iter: IterableIterator<string> = m.keys();
      let res: IteratorResult<string> = iter.next();
      expect(res.done).assertFalse();
      expect(res.value!).assertEqual('single');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_0400
     * @tc.name readonlyMapKeysPart03Test004
     * @tc.desc Verify Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['only', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      let res: IteratorResult<string> = iter.next();
      expect(res.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_0500
     * @tc.name readonlyMapKeysPart03Test005
     * @tc.desc Verify Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k1', 1], ['k2', 2], ['k3', 3]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      iter.next();
      iter.next();
      let res: IteratorResult<string> = iter.next();
      expect(res.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_0600
     * @tc.name readonlyMapKeysPart03Test006
     * @tc.desc Verify next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      let r3: IteratorResult<string> = iter.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_0700
     * @tc.name readonlyMapKeysPart03Test007
     * @tc.desc Verify 5 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[1 as int, 100]]);
      let iter: IterableIterator<int> = m.keys();
      iter.next();
      let allDone: boolean = true;
      for (let i = 0; i < 5; i++) {
        let r: IteratorResult<int> = iter.next();
        if (!r.done) { allDone = false; }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_0800
     * @tc.name readonlyMapKeysPart03Test008
     * @tc.desc Verify value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['x', 1], ['y', 2]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      iter.next();
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_0900
     * @tc.name readonlyMapKeysPart03Test009
     * @tc.desc Verify entries null Map size=0 keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>(null);
      let iter: IterableIterator<string> = m.keys();
      let res: IteratorResult<string> = iter.next();
      expect(res.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_1000
     * @tc.name readonlyMapKeysPart03Test010
     * @tc.desc Verify entries Map size=0 keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [];
      const m: ReadonlyMap<string, int> = new Map<string, int>(entries);
      let iter: IterableIterator<string> = m.keys();
      let res: IteratorResult<string> = iter.next();
      expect(res.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_1100
     * @tc.name readonlyMapKeysPart03Test011
     * @tc.desc Verify Map null key keys() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string | null, int> = new Map<string | null, int>([[null, 1]]);
      let iter: IterableIterator<string | null> = m.keys();
      let res: IteratorResult<string | null> = iter.next();
      expect(res.done).assertFalse();
      expect(res.value).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_1200
     * @tc.name readonlyMapKeysPart03Test012
     * @tc.desc Verify Map undefined key keys() undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string | undefined, int> = new Map<string | undefined, int>([[undefined, 1]]);
      let iter: IterableIterator<string | undefined> = m.keys();
      let res: IteratorResult<string | undefined> = iter.next();
      expect(res.done).assertFalse();
      expect(res.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_1300
     * @tc.name readonlyMapKeysPart03Test013
     * @tc.desc Verify Map NaN number key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[Number.NaN, 1]]);
      let iter: IterableIterator<number> = m.keys();
      let res: IteratorResult<number> = iter.next();
      expect(res.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_1400
     * @tc.name readonlyMapKeysPart03Test014
     * @tc.desc Verify Map Number.POSITIVE_INFINITY key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[Number.POSITIVE_INFINITY, 1]]);
      let iter: IterableIterator<number> = m.keys();
      let res: IteratorResult<number> = iter.next();
      expect(res.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_1500
     * @tc.name readonlyMapKeysPart03Test015
     * @tc.desc Verify Map Number.NEGATIVE_INFINITY key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[Number.NEGATIVE_INFINITY, 1]]);
      let iter: IterableIterator<number> = m.keys();
      let res: IteratorResult<number> = iter.next();
      expect(res.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_1600
     * @tc.name readonlyMapKeysPart03Test016
     * @tc.desc Verify Map -0.0 number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[-0.0, 1]]);
      let iter: IterableIterator<number> = m.keys();
      let res: IteratorResult<number> = iter.next();
      expect(res.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_1700
     * @tc.name readonlyMapKeysPart03Test017
     * @tc.desc Verify Map null undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string | null | undefined, int> = new Map<string | null | undefined, int>([[null, 1], [undefined, 2]]);
      let iter: IterableIterator<string | null | undefined> = m.keys();
      let r1: IteratorResult<string | null | undefined> = iter.next();
      let r2: IteratorResult<string | null | undefined> = iter.next();
      expect(r1.value).assertNull();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_1800
     * @tc.name readonlyMapKeysPart03Test018
     * @tc.desc Verify Map NaN number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[Number.NaN, 1], [42.0, 2]]);
      let iter: IterableIterator<number> = m.keys();
      let count: int = 0;
      let r1: IteratorResult<number> = iter.next();
      let r2: IteratorResult<number> = iter.next();
      let r3: IteratorResult<number> = iter.next();
      if (!r1.done) { count = (count as int) + 1 as int; }
      if (!r2.done) { count = (count as int) + 1 as int; }
      expect(count).assertEqual(2 as int);
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_1900
     * @tc.name readonlyMapKeysPart03Test019
     * @tc.desc Verify Map Infinity -Infinity key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[Number.POSITIVE_INFINITY, 1], [Number.NEGATIVE_INFINITY, 2]]);
      let iter: IterableIterator<number> = m.keys();
      let r1: IteratorResult<number> = iter.next();
      let r2: IteratorResult<number> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_2000
     * @tc.name readonlyMapKeysPart03Test020
     * @tc.desc Verify Map 0.0 -0.0 number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[0.0, 1], [-0.0, 2]]);
      let iter: IterableIterator<number> = m.keys();
      iter.next();
      iter.next();
      let r3: IteratorResult<number> = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_2100
     * @tc.name readonlyMapKeysPart03Test021
     * @tc.desc Verify Map for...of keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      for (const key of iter) {
        count = (count as int) + 1 as int;
      }
      expect(count).assertEqual(0 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_2200
     * @tc.name readonlyMapKeysPart03Test022
     * @tc.desc Verify Map for...of keys size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['p', 1], ['q', 2], ['r', 3], ['s', 4]]);
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      for (const key of iter) {
        count = (count as int) + 1 as int;
      }
      expect(count).assertEqual(4 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_2300
     * @tc.name readonlyMapKeysPart03Test023
     * @tc.desc Verify key set key size=1 keys() 1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['dup', 1], ['dup', 2], ['dup', 3]]);
      let iter: IterableIterator<string> = m.keys();
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_2400
     * @tc.name readonlyMapKeysPart03Test024
     * @tc.desc Verify Map keys() next().done true value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>();
      let iter: IterableIterator<int> = m.keys();
      let res: IteratorResult<int> = iter.next();
      expect(res.done).assertTrue();
      expect(res.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_2500
     * @tc.name readonlyMapKeysPart03Test025
     * @tc.desc Verify Map keys() 1 next() done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[42 as int, 100]]);
      let iter: IterableIterator<int> = m.keys();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_2600
     * @tc.name readonlyMapKeysPart03Test026
     * @tc.desc Verify 1 Map set for...of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['only', 1], ['only', 999]]);
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      for (const key of iter) {
        count = (count as int) + 1 as int;
      }
      expect(count).assertEqual(1 as int);
    });










    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_2700
     * @tc.name readonlyMapKeysPart03Test027
     * @tc.desc Verify Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter1: IterableIterator<string> = m.keys();
      let iter2: IterableIterator<string> = m.keys();
      expect(iter1).not().assertEqual(iter2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_2800
     * @tc.name readonlyMapKeysPart03Test028
     * @tc.desc Verify iter1 iter2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k1', 1], ['k2', 2], ['k3', 3]]);
      let iter1: IterableIterator<string> = m.keys();
      let iter2: IterableIterator<string> = m.keys();
      iter1.next();
      iter1.next();
      let r2: IteratorResult<string> = iter2.next();
      expect(r2.value!).assertEqual('k1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_2900
     * @tc.name readonlyMapKeysPart03Test029
     * @tc.desc Verify iter1 iter2 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter1: IterableIterator<string> = m.keys();
      let iter2: IterableIterator<string> = m.keys();
      iter1.next();
      iter1.next();
      iter1.next();
      let r: IteratorResult<string> = iter2.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_3000
     * @tc.name readonlyMapKeysPart03Test030
     * @tc.desc Verify iter1 iter2 next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['p', 1], ['q', 2], ['r', 3]]);
      let iter1: IterableIterator<string> = m.keys();
      let iter2: IterableIterator<string> = m.keys();
      let v1a: IteratorResult<string> = iter1.next();
      let v2a: IteratorResult<string> = iter2.next();
      let v1b: IteratorResult<string> = iter1.next();
      let v2b: IteratorResult<string> = iter2.next();
      expect(v1a.value!).assertEqual('p');
      expect(v2a.value!).assertEqual('p');
      expect(v1b.value!).assertEqual('q');
      expect(v2b.value!).assertEqual('q');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_3100
     * @tc.name readonlyMapKeysPart03Test031
     * @tc.desc Verify keys iterator == 'x'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['x', 1], ['y', 2]]);
      let iter1: IterableIterator<string> = m.keys();
      let iter2: IterableIterator<string> = m.keys();
      let iter3: IterableIterator<string> = m.keys();
      iter1.next();
      iter1.next();
      let r2: IteratorResult<string> = iter2.next();
      let r3: IteratorResult<string> = iter3.next();
      expect(r2.value!).assertEqual('x');
      expect(r3.value!).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_3200
     * @tc.name readonlyMapKeysPart03Test032
     * @tc.desc Verify for...of for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['m', 1], ['n', 2]]);
      let iter1: IterableIterator<string> = m.keys();
      let iter2: IterableIterator<string> = m.keys();
      let c1: int = 0;
      for (const key of iter1) {
        c1 = (c1 as int) + 1 as int;
      }
      let c2: int = 0;
      for (const key of iter2) {
        c2 = (c2 as int) + 1 as int;
      }
      expect(c1).assertEqual(2 as int);
      expect(c2).assertEqual(2 as int);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_3300
     * @tc.name readonlyMapKeysPart03Test033
     * @tc.desc Verify for...of Map keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>();
      let iter: IterableIterator<int> = m.keys();
      let executed: boolean = false;
      for (const key of iter) {
        executed = true;
      }
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_3400
     * @tc.name readonlyMapKeysPart03Test034
     * @tc.desc Verify for...of keys next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<string> = m.keys();
      for (const key of iter) {
      }
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_3500
     * @tc.name readonlyMapKeysPart03Test035
     * @tc.desc Verify for...of break break next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['1st', 1], ['2nd', 2], ['3rd', 3]]);
      let iter: IterableIterator<string> = m.keys();
      for (const key of iter) {
        if (key === '2nd') {
          break;
        }
      }
      let r: IteratorResult<string> = iter.next();
      expect(r.value!).assertEqual('3rd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_3600
     * @tc.name readonlyMapKeysPart03Test036
     * @tc.desc Verify for...of keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['second', 2]]);
      let iter1: IterableIterator<string> = m.keys();
      for (const key of iter1) {
      }
      let iter2: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter2.next();
      expect(r.value!).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_3700
     * @tc.name readonlyMapKeysPart03Test037
     * @tc.desc Verify for...of keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['x', 1], ['y', 2]]);
      let outerIter: IterableIterator<string> = m.keys();
      let outerCount: int = 0;
      for (const outerKey of outerIter) {
        outerCount = (outerCount as int) + 1 as int;
        let innerIter: IterableIterator<string> = m.keys();
        let innerCount: int = 0;
        for (const innerKey of innerIter) {
          innerCount = (innerCount as int) + 1 as int;
        }
        expect(innerCount).assertEqual(2 as int);
      }
      expect(outerCount).assertEqual(2 as int);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_3800
     * @tc.name readonlyMapKeysPart03Test038
     * @tc.desc Verify for...of Map<K,V> K string K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['hello', 1], ['world', 2]]);
      let iter: IterableIterator<string> = m.keys();
      let allString: boolean = true;
      for (const key of iter) {
        if (typeof key !== 'string') {
          allString = false;
        }
      }
      expect(allString).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_3900
     * @tc.name readonlyMapKeysPart03Test039
     * @tc.desc Verify for...of keys const
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[10 as int, 100], [20 as int, 200]]);
      let iter: IterableIterator<int> = m.keys();
      let sum: int = 0;
      for (const key of iter) {
        sum = (sum as int) + key;
      }
      expect(sum).assertEqual(30 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_4000
     * @tc.name readonlyMapKeysPart03Test040
     * @tc.desc Verify next() done Map next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<string> = m.keys();
      let res: IteratorResult<string> = iter.next();
      expect(res.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_4100
     * @tc.name readonlyMapKeysPart03Test041
     * @tc.desc Verify next() done true value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[99 as int, 1]]);
      let iter: IterableIterator<int> = m.keys();
      iter.next();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      expect(r1.done).assertTrue();
      expect(r1.value).assertUndefined();
      expect(r2.done).assertTrue();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_4200
     * @tc.name readonlyMapKeysPart03Test042
     * @tc.desc Verify keys() IterableIterator<K> typeof object next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['t', 1]]);
      let iter: IterableIterator<string> = m.keys();
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_4300
     * @tc.name readonlyMapKeysPart03Test043
     * @tc.desc Verify Map next() done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[7 as int, 70]]);
      let iter: IterableIterator<int> = m.keys();
      let res: IteratorResult<int> = iter.next();
      expect(res.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_4400
     * @tc.name readonlyMapKeysPart03Test044
     * @tc.desc Verify Map next() done true value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>();
      let iter: IterableIterator<number> = m.keys();
      let res: IteratorResult<number> = iter.next();
      expect(res.done).assertTrue();
      expect(res.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_4500
     * @tc.name readonlyMapKeysPart03Test045
     * @tc.desc Verify N Map N next() done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<string> = m.keys();
      let allFalse: boolean = true;
      for (let i = 0; i < 3; i++) {
        let r: IteratorResult<string> = iter.next();
        if (r.done) { allFalse = false; }
      }
      expect(allFalse).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_4600
     * @tc.name readonlyMapKeysPart03Test046
     * @tc.desc Verify Date key next().value set Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keyDate: Date = new Date();
      const m: ReadonlyMap<Date, int> = new Map<Date, int>([[keyDate, 1]]);
      let iter: IterableIterator<Date> = m.keys();
      let r: IteratorResult<Date> = iter.next();
      expect(r.value!).assertEqual(keyDate);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_4700
     * @tc.name readonlyMapKeysPart03Test047
     * @tc.desc Verify RegExp key next().value set RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keyRe: RegExp = new RegExp('test', 'i');
      const m: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[keyRe, 1]]);
      let iter: IterableIterator<RegExp> = m.keys();
      let r: IteratorResult<RegExp> = iter.next();
      expect(r.value!).assertEqual(keyRe);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_4800
     * @tc.name readonlyMapKeysPart03Test048
     * @tc.desc Verify class key next().value set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: BoxKey3 = new BoxKey3();
      box.id = 42;
      const m: ReadonlyMap<BoxKey3, int> = new Map<BoxKey3, int>([[box, 1]]);
      let iter: IterableIterator<BoxKey3> = m.keys();
      let r: IteratorResult<BoxKey3> = iter.next();
      expect(r.value!).assertEqual(box);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_4900
     * @tc.name readonlyMapKeysPart03Test049
     * @tc.desc Verify Array key next().value set Array , int>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      const m: ReadonlyMap<int[], int> = new Map<int[], int>([[arr, 1]]);
      let iter: IterableIterator<int[]> = m.keys();
      let r: IteratorResult<int[]> = iter.next();
      expect(r.value!).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_5000
     * @tc.name readonlyMapKeysPart03Test050
     * @tc.desc Verify object(interface) key next().value set object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Pkg = { name: 'lib', ver: 1 };
      const m: ReadonlyMap<Pkg, int> = new Map<Pkg, int>([[p, 100]]);
      let iter: IterableIterator<Pkg> = m.keys();
      let r: IteratorResult<Pkg> = iter.next();
      expect(r.value!).assertEqual(p);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_5100
     * @tc.name readonlyMapKeysPart03Test051
     * @tc.desc Verify key Map set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: EqChk = { a: 1, b: 2 };
      let o2: EqChk = { a: 1, b: 2 };
      const m: ReadonlyMap<EqChk, int> = new Map<EqChk, int>([[o1, 10], [o2, 20]]);
      let iter: IterableIterator<EqChk> = m.keys();
      let count: int = 0;
      let r: IteratorResult<EqChk> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(2 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_5200
     * @tc.name readonlyMapKeysPart03Test052
     * @tc.desc Verify Date Map key 2 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date();
      let d2: Date = new Date();
      const m: ReadonlyMap<Date, int> = new Map<Date, int>([[d1, 1], [d2, 2]]);
      let iter: IterableIterator<Date> = m.keys();
      let r1: IteratorResult<Date> = iter.next();
      let r2: IteratorResult<Date> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART03_TEST_5300
     * @tc.name readonlyMapKeysPart03Test053
     * @tc.desc Verify pattern RegExp Map key 2 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ra: RegExp = new RegExp('abc', 'g');
      let rb: RegExp = new RegExp('abc', 'g');
      const m: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[ra, 1], [rb, 2]]);
      let iter: IterableIterator<RegExp> = m.keys();
      let r1: IteratorResult<RegExp> = iter.next();
      let r2: IteratorResult<RegExp> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
    });

  });
}
