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

class KeyClass {
  id: int;
  constructor(id: int) {
    this.id = id;
  }
}
interface ObjKey {
  id: int;
  name: string;
}
interface ObjKeySame {
  x: int;
  y: int;
}
class ValClass {
  label: string;
  constructor(label: string) {
    this.label = label;
  }
}
interface ValObj {
  code: int;
  text: string;
}

export default function readonlyMapEntriesPart01TestTest(): void {
  describe('ReadonlyMapEntriesPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_0100
     * @tc.name readonlyMapEntriesPart01Test001
     * @tc.desc Verify entries() 0 IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let it: IterableIterator<[string, int]> = m.entries();
      expect(m.size).assertEqual(2);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_0200
     * @tc.name readonlyMapEntriesPart01Test002
     * @tc.desc Verify entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let it1: IterableIterator<[string, int]> = m.entries();
      let it2: IterableIterator<[string, int]> = m.entries();
      expect(m.size).assertEqual(2);
      expect(it1.next().done).assertFalse();
      expect(m.size).assertEqual(2);
      expect(it2.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_0300
     * @tc.name readonlyMapEntriesPart01Test003
     * @tc.desc Verify K=string entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['alpha', 10], ['beta', 20]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('alpha');
      expect(r.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_0400
     * @tc.name readonlyMapEntriesPart01Test004
     * @tc.desc Verify K=int entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[1, 'one'], [2, 'two']]);
      let it: IterableIterator<[int, string]> = m.entries();
      let r: IteratorResult<[int, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(1);
      expect(r.value![1]).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_0500
     * @tc.name readonlyMapEntriesPart01Test005
     * @tc.desc Verify K=number entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[3.14, 100], [2.71, 200]]);
      let it: IterableIterator<[number, int]> = m.entries();
      let r: IteratorResult<[number, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(3.14);
      expect(r.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_0600
     * @tc.name readonlyMapEntriesPart01Test006
     * @tc.desc Verify K=boolean entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      let it: IterableIterator<[boolean, string]> = m.entries();
      let r: IteratorResult<[boolean, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertTrue();
      expect(r.value![1]).assertEqual('yes');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_0700
     * @tc.name readonlyMapEntriesPart01Test007
     * @tc.desc Verify K=long entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<long, int> = new Map<long, int>([[Int.toLong(1), 10], [Int.toLong(2), 20]]);
      let it: IterableIterator<[long, int]> = m.entries();
      let r: IteratorResult<[long, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(Int.toLong(1));
      expect(r.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_0800
     * @tc.name readonlyMapEntriesPart01Test008
     * @tc.desc Verify K=double entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<double, string> = new Map<double, string>([[1.5, 'a'], [2.5, 'b']]);
      let it: IterableIterator<[double, string]> = m.entries();
      let r: IteratorResult<[double, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(1.5);
      expect(r.value![1]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_0900
     * @tc.name readonlyMapEntriesPart01Test009
     * @tc.desc Verify K=byte entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<byte, int> = new Map<byte, int>([[1 as byte, 100], [2 as byte, 200]]);
      let it: IterableIterator<[byte, int]> = m.entries();
      let r: IteratorResult<[byte, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(1 as byte);
      expect(r.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_1000
     * @tc.name readonlyMapEntriesPart01Test010
     * @tc.desc Verify K=short entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<short, string> = new Map<short, string>([[10 as short, 'ten'], [20 as short, 'twenty']]);
      let it: IterableIterator<[short, string]> = m.entries();
      let r: IteratorResult<[short, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(10 as short);
      expect(r.value![1]).assertEqual('ten');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_1100
     * @tc.name readonlyMapEntriesPart01Test011
     * @tc.desc Verify K=float entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<float, int> = new Map<float, int>([[1.0, 10], [2.0, 20]]);
      let it: IterableIterator<[float, int]> = m.entries();
      let r: IteratorResult<[float, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(1.0);
      expect(r.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_1200
     * @tc.name readonlyMapEntriesPart01Test012
     * @tc.desc Verify K=char entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<char, string> = new Map<char, string>([[c'X', 'letterX'], [c'Y', 'letterY']]);
      let it: IterableIterator<[char, string]> = m.entries();
      let r: IteratorResult<[char, string]> = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_1300
     * @tc.name readonlyMapEntriesPart01Test013
     * @tc.desc Verify K=bigint entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<bigint, int> = new Map<bigint, int>([[100n, 1], [200n, 2]]);
      let it: IterableIterator<[bigint, int]> = m.entries();
      let r: IteratorResult<[bigint, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(100n);
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_1400
     * @tc.name readonlyMapEntriesPart01Test014
     * @tc.desc Verify K=Date entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: Date = new Date(2024, 0, 1);
      let k2: Date = new Date(2024, 6, 1);
      const m: ReadonlyMap<Date, int> = new Map<Date, int>([[k1, 1], [k2, 2]]);
      let it: IterableIterator<[Date, int]> = m.entries();
      let r: IteratorResult<[Date, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_1500
     * @tc.name readonlyMapEntriesPart01Test015
     * @tc.desc Verify entries K=Date V=int iterator false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: Date = new Date(2024, 0, 1);
      let k2: Date = new Date(2024, 0, 1);
      const m: ReadonlyMap<Date, int> = new Map<Date, int>([[k1, 10], [k2, 20]]);
      let it: IterableIterator<[Date, int]> = m.entries();
      let r: IteratorResult<[Date, int]> = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_1600
     * @tc.name readonlyMapEntriesPart01Test016
     * @tc.desc Verify K=RegExp entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: RegExp = new RegExp('abc', 'g');
      let k2: RegExp = new RegExp('def', 'i');
      const m: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[k1, 1], [k2, 2]]);
      let it: IterableIterator<[RegExp, int]> = m.entries();
      let r: IteratorResult<[RegExp, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_1700
     * @tc.name readonlyMapEntriesPart01Test017
     * @tc.desc Verify K=RegExp pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: RegExp = new RegExp('abc', 'g');
      let k2: RegExp = new RegExp('abc', 'g');
      const m: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[k1, 10], [k2, 20]]);
      let it: IterableIterator<[RegExp, int]> = m.entries();
      let r: IteratorResult<[RegExp, int]> = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_1800
     * @tc.name readonlyMapEntriesPart01Test018
     * @tc.desc Verify K=Error entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: Error = new Error('err1');
      let k2: Error = new Error('err2');
      const m: ReadonlyMap<Error, int> = new Map<Error, int>([[k1, 1], [k2, 2]]);
      let it: IterableIterator<[Error, int]> = m.entries();
      let r: IteratorResult<[Error, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_1900
     * @tc.name readonlyMapEntriesPart01Test019
     * @tc.desc Verify K= class entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: KeyClass = new KeyClass(1);
      let k2: KeyClass = new KeyClass(2);
      const m: ReadonlyMap<KeyClass, int> = new Map<KeyClass, int>([[k1, 100], [k2, 200]]);
      let it: IterableIterator<[KeyClass, int]> = m.entries();
      let r: IteratorResult<[KeyClass, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_2000
     * @tc.name readonlyMapEntriesPart01Test020
     * @tc.desc Verify K=object(interface) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: ObjKey = { id: 1, name: 'a' };
      let k2: ObjKey = { id: 2, name: 'b' };
      const m: ReadonlyMap<ObjKey, int> = new Map<ObjKey, int>([[k1, 10], [k2, 20]]);
      let it: IterableIterator<[ObjKey, int]> = m.entries();
      let r: IteratorResult<[ObjKey, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_2100
     * @tc.name readonlyMapEntriesPart01Test021
     * @tc.desc Verify entries K=ObjKeySame V=int iterator false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: ObjKeySame = { x: 1, y: 2 };
      let k2: ObjKeySame = { x: 1, y: 2 };
      const m: ReadonlyMap<ObjKeySame, int> = new Map<ObjKeySame, int>([[k1, 100], [k2, 200]]);
      let it: IterableIterator<[ObjKeySame, int]> = m.entries();
      let r: IteratorResult<[ObjKeySame, int]> = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_2200
     * @tc.name readonlyMapEntriesPart01Test022
     * @tc.desc Verify K=Array\<int\> entries() , string>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: int[] = [10, 20];
      let k2: int[] = [30, 40];
      const m: ReadonlyMap<int[], string> = new Map<int[], string>([[k1, 'first'], [k2, 'second']]);
      let it: IterableIterator<[int[], string]> = m.entries();
      let r: IteratorResult<[int[], string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![1]).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_2300
     * @tc.name readonlyMapEntriesPart01Test023
     * @tc.desc Verify K=Set\<int\> entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: Set<int> = new Set<int>();
      k1.add(1);
      let k2: Set<int> = new Set<int>();
      k2.add(2);
      const m: ReadonlyMap<Set<int>, int> = new Map<Set<int>, int>([[k1, 10], [k2, 20]]);
      let it: IterableIterator<[Set<int>, int]> = m.entries();
      let r: IteratorResult<[Set<int>, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_2400
     * @tc.name readonlyMapEntriesPart01Test024
     * @tc.desc Verify V=string entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[1, 'alpha'], [2, 'beta']]);
      let it: IterableIterator<[int, string]> = m.entries();
      let r: IteratorResult<[int, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(1);
      expect(r.value![1]).assertEqual('alpha');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_2500
     * @tc.name readonlyMapEntriesPart01Test025
     * @tc.desc Verify V=int entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['x', 100], ['y', 200]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('x');
      expect(r.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_2600
     * @tc.name readonlyMapEntriesPart01Test026
     * @tc.desc Verify V=number entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['pi', 3.14159], ['e', 2.71828]]);
      let it: IterableIterator<[string, number]> = m.entries();
      let r: IteratorResult<[string, number]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('pi');
      expect(r.value![1]).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_2700
     * @tc.name readonlyMapEntriesPart01Test027
     * @tc.desc Verify V=boolean entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, boolean> = new Map<string, boolean>([['enabled', true], ['visible', false]]);
      let it: IterableIterator<[string, boolean]> = m.entries();
      let r: IteratorResult<[string, boolean]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('enabled');
      expect(r.value![1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_2800
     * @tc.name readonlyMapEntriesPart01Test028
     * @tc.desc Verify V=long entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, long> = new Map<string, long>([['small', Int.toLong(1)], ['large', 9223372036854775807]]);
      let it: IterableIterator<[string, long]> = m.entries();
      let r: IteratorResult<[string, long]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('small');
      expect(r.value![1]).assertEqual(Int.toLong(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_2900
     * @tc.name readonlyMapEntriesPart01Test029
     * @tc.desc Verify V=double entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, double> = new Map<string, double>([['a', 1.7976931348623157e308], ['b', 2.2250738585072014e-308]]);
      let it: IterableIterator<[string, double]> = m.entries();
      let r: IteratorResult<[string, double]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_3000
     * @tc.name readonlyMapEntriesPart01Test030
     * @tc.desc Verify V=byte entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, byte> = new Map<string, byte>([['min', -128 as byte], ['max', 127 as byte]]);
      let it: IterableIterator<[string, byte]> = m.entries();
      let r: IteratorResult<[string, byte]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('min');
      expect(r.value![1]).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_3100
     * @tc.name readonlyMapEntriesPart01Test031
     * @tc.desc Verify V=short entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, short> = new Map<string, short>([['a', 100 as short], ['b', 200 as short]]);
      let it: IterableIterator<[string, short]> = m.entries();
      let r: IteratorResult<[string, short]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('a');
      expect(r.value![1]).assertEqual(100 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_3200
     * @tc.name readonlyMapEntriesPart01Test032
     * @tc.desc Verify V=float entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, float> = new Map<string, float>([['one', 1.5], ['two', 2.5]]);
      let it: IterableIterator<[string, float]> = m.entries();
      let r: IteratorResult<[string, float]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('one');
      expect(r.value![1]).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_3300
     * @tc.name readonlyMapEntriesPart01Test033
     * @tc.desc Verify V=char entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, char> = new Map<string, char>([['A', c'A'], ['B', c'B']]);
      let it: IterableIterator<[string, char]> = m.entries();
      let r: IteratorResult<[string, char]> = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_3400
     * @tc.name readonlyMapEntriesPart01Test034
     * @tc.desc Verify V=bigint entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, bigint> = new Map<string, bigint>([['huge', 999999999999n], ['tiny', 1n]]);
      let it: IterableIterator<[string, bigint]> = m.entries();
      let r: IteratorResult<[string, bigint]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('huge');
      expect(r.value![1]).assertEqual(999999999999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_3500
     * @tc.name readonlyMapEntriesPart01Test035
     * @tc.desc Verify V=Date entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstEntry: Date = new Date(2024, 0, 1);
      let secondEntry: Date = new Date(2024, 6, 1);
      const m: ReadonlyMap<string, Date> = new Map<string, Date>([['start', firstEntry], ['mid', secondEntry]]);
      let it: IterableIterator<[string, Date]> = m.entries();
      let r: IteratorResult<[string, Date]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('start');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_3600
     * @tc.name readonlyMapEntriesPart01Test036
     * @tc.desc Verify V=RegExp entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstEntry: RegExp = new RegExp('\\d+', 'g');
      let secondEntry: RegExp = new RegExp('\\w+', 'i');
      const m: ReadonlyMap<string, RegExp> = new Map<string, RegExp>([['digits', firstEntry], ['words', secondEntry]]);
      let it: IterableIterator<[string, RegExp]> = m.entries();
      let r: IteratorResult<[string, RegExp]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('digits');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_3700
     * @tc.name readonlyMapEntriesPart01Test037
     * @tc.desc Verify V=Error entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstEntry: Error = new Error('not found');
      let secondEntry: Error = new Error('timeout');
      const m: ReadonlyMap<string, Error> = new Map<string, Error>([['err1', firstEntry], ['err2', secondEntry]]);
      let it: IterableIterator<[string, Error]> = m.entries();
      let r: IteratorResult<[string, Error]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('err1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_3800
     * @tc.name readonlyMapEntriesPart01Test038
     * @tc.desc Verify V= class entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstEntry: ValClass = new ValClass('first');
      let secondEntry: ValClass = new ValClass('second');
      const m: ReadonlyMap<string, ValClass> = new Map<string, ValClass>([['a', firstEntry], ['b', secondEntry]]);
      let it: IterableIterator<[string, ValClass]> = m.entries();
      let r: IteratorResult<[string, ValClass]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_3900
     * @tc.name readonlyMapEntriesPart01Test039
     * @tc.desc Verify V=object(interface) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstEntry: ValObj = { code: 200, text: 'OK' };
      let secondEntry: ValObj = { code: 404, text: 'Not Found' };
      const m: ReadonlyMap<string, ValObj> = new Map<string, ValObj>([['success', firstEntry], ['fail', secondEntry]]);
      let it: IterableIterator<[string, ValObj]> = m.entries();
      let r: IteratorResult<[string, ValObj]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('success');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_4000
     * @tc.name readonlyMapEntriesPart01Test040
     * @tc.desc Verify V=Array\<int\> entries() >]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstEntry: int[] = [10, 20, 30];
      let secondEntry: int[] = [40, 50, 60];
      const m: ReadonlyMap<string, int[]> = new Map<string, int[]>([['list1', firstEntry], ['list2', secondEntry]]);
      let it: IterableIterator<[string, int[]]> = m.entries();
      let r: IteratorResult<[string, int[]]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('list1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_4100
     * @tc.name readonlyMapEntriesPart01Test041
     * @tc.desc Verify V=Map\<string,int\> entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstEntry: Map<string, int> = new Map<string, int>([['inner', 1]]);
      const secondEntry: Map<string, int> = new Map<string, int>([['inner', 2]]);
      const m: ReadonlyMap<string, Map<string, int>> = new Map<string, Map<string, int>>([['outer1', firstEntry], ['outer2', secondEntry]]);
      const it: IterableIterator<[string, Map<string, int>]> = m.entries();
      const r: IteratorResult<[string, Map<string, int>]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('outer1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_4200
     * @tc.name readonlyMapEntriesPart01Test042
     * @tc.desc Verify V=Set\<int\> entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Set<int> = new Set<int>();
      s1.add(1);
      let s2: Set<int> = new Set<int>();
      s2.add(2);
      const m: ReadonlyMap<string, Set<int>> = new Map<string, Set<int>>([['s1', s1], ['s2', s2]]);
      let it: IterableIterator<[string, Set<int>]> = m.entries();
      let r: IteratorResult<[string, Set<int>]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('s1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_4300
     * @tc.name readonlyMapEntriesPart01Test043
     * @tc.desc Verify V=null( ) entries() value null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string | null> = new Map<string, string | null>([['hasValue', 'hello'], ['noValue', null]]);
      let it: IterableIterator<[string, string | null]> = m.entries();
      let r: IteratorResult<[string, string | null]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('hasValue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_4400
     * @tc.name readonlyMapEntriesPart01Test044
     * @tc.desc Verify Map entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('a');
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_4500
     * @tc.name readonlyMapEntriesPart01Test045
     * @tc.desc Verify Map Map entries() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const m: ReadonlyMap<string, int> = new Map<string, int>(src.entries());
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('a');
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_4600
     * @tc.name readonlyMapEntriesPart01Test046
     * @tc.desc Verify Map entries key entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['dup', 1], ['dup', 2]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('dup');
      expect(r.value![1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_4700
     * @tc.name readonlyMapEntriesPart01Test047
     * @tc.desc Verify Map entries entries() next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_4800
     * @tc.name readonlyMapEntriesPart01Test048
     * @tc.desc Verify Map key=2147483647 entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[2147483647, 'maxInt'], [0, 'zero']]);
      let it: IterableIterator<[int, string]> = m.entries();
      let r: IteratorResult<[int, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(2147483647);
      expect(r.value![1]).assertEqual('maxInt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_4900
     * @tc.name readonlyMapEntriesPart01Test049
     * @tc.desc Verify Map key=(-2147483647 - 1) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[-2147483648, 'minInt'], [1, 'one']]);
      let it: IterableIterator<[int, string]> = m.entries();
      let r: IteratorResult<[int, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(-2147483648);
      expect(r.value![1]).assertEqual('minInt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_5000
     * @tc.name readonlyMapEntriesPart01Test050
     * @tc.desc Verify Map key=0 entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[0, 'zero'], [1, 'one']]);
      let it: IterableIterator<[int, string]> = m.entries();
      let r: IteratorResult<[int, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_5100
     * @tc.name readonlyMapEntriesPart01Test051
     * @tc.desc Verify Map key=-1 entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[-1, 'negOne'], [0, 'zero']]);
      let it: IterableIterator<[int, string]> = m.entries();
      let r: IteratorResult<[int, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(-1);
      expect(r.value![1]).assertEqual('negOne');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_5200
     * @tc.name readonlyMapEntriesPart01Test052
     * @tc.desc Verify Map key=long.MAX entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<long, string> = new Map<long, string>([[9223372036854775807, 'maxLong'], [Int.toLong(0), 'zero']]);
      let it: IterableIterator<[long, string]> = m.entries();
      let r: IteratorResult<[long, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(9223372036854775807);
      expect(r.value![1]).assertEqual('maxLong');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_5300
     * @tc.name readonlyMapEntriesPart01Test053
     * @tc.desc Verify Map key=long.MIN entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<long, string> = new Map<long, string>([[(-9223372036854775807 - 1), 'minLong'], [Int.toLong(1), 'one']]);
      let it: IterableIterator<[long, string]> = m.entries();
      let r: IteratorResult<[long, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual((-9223372036854775807 - 1));
      expect(r.value![1]).assertEqual('minLong');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_5400
     * @tc.name readonlyMapEntriesPart01Test054
     * @tc.desc Verify Map key= entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['', 0], ['nonempty', 1]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('');
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_5500
     * @tc.name readonlyMapEntriesPart01Test055
     * @tc.desc Verify Map key= entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'a'.repeat(10000);
      const m: ReadonlyMap<string, int> = new Map<string, int>([[longKey, 999], ['short', 1]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![1]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_5600
     * @tc.name readonlyMapEntriesPart01Test056
     * @tc.desc Verify Map key=Unicode emoji entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['😀', 1], ['🚀', 2]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('😀');
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_5700
     * @tc.name readonlyMapEntriesPart01Test057
     * @tc.desc Verify Map key= entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['​', 100], ['normal', 200]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('​');
      expect(r.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_5800
     * @tc.name readonlyMapEntriesPart01Test058
     * @tc.desc Verify Map value=NaN entries() value NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['nanKey', Number.NaN], ['normalKey', 1.0]]);
      let it: IterableIterator<[string, number]> = m.entries();
      let r: IteratorResult<[string, number]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('nanKey');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_5900
     * @tc.name readonlyMapEntriesPart01Test059
     * @tc.desc Verify Map value=Infinity entries() value Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['posInf', Number.POSITIVE_INFINITY], ['normal', 1.0]]);
      let it: IterableIterator<[string, number]> = m.entries();
      let r: IteratorResult<[string, number]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('posInf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_6000
     * @tc.name readonlyMapEntriesPart01Test060
     * @tc.desc Verify Map value=-Infinity entries() value -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['negInf', Number.NEGATIVE_INFINITY], ['normal', 1.0]]);
      let it: IterableIterator<[string, number]> = m.entries();
      let r: IteratorResult<[string, number]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('negInf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_6100
     * @tc.name readonlyMapEntriesPart01Test061
     * @tc.desc Verify Map value=-0.0 entries() value -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['negZero', -0.0], ['posZero', 0.0]]);
      let it: IterableIterator<[string, number]> = m.entries();
      let r: IteratorResult<[string, number]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('negZero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_6200
     * @tc.name readonlyMapEntriesPart01Test062
     * @tc.desc Verify Map value=Number.EPSILON entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['eps', Number.EPSILON], ['one', 1.0]]);
      let it: IterableIterator<[string, number]> = m.entries();
      let r: IteratorResult<[string, number]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('eps');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_6300
     * @tc.name readonlyMapEntriesPart01Test063
     * @tc.desc Verify Map int entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[1, 0], [2, 0], [3, 0]]);
      let it: IterableIterator<[int, int]> = m.entries();
      let r: IteratorResult<[int, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(1);
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_6400
     * @tc.name readonlyMapEntriesPart01Test064
     * @tc.desc Verify Map key entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[0, 100], [16, 200], [32, 300]]);
      let it: IterableIterator<[int, int]> = m.entries();
      let r1: IteratorResult<[int, int]> = it.next();
      expect(r1.done).assertFalse();
      let r2: IteratorResult<[int, int]> = it.next();
      expect(r2.done).assertFalse();
      let r3: IteratorResult<[int, int]> = it.next();
      expect(r3.done).assertFalse();
      let r4: IteratorResult<[int, int]> = it.next();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_6500
     * @tc.name readonlyMapEntriesPart01Test065
     * @tc.desc Verify Map key byte.MAX=127 entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<byte, string> = new Map<byte, string>([[127 as byte, 'maxByte'], [0 as byte, 'zero']]);
      let it: IterableIterator<[byte, string]> = m.entries();
      let r: IteratorResult<[byte, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(127 as byte);
      expect(r.value![1]).assertEqual('maxByte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_6600
     * @tc.name readonlyMapEntriesPart01Test066
     * @tc.desc Verify Map key byte.MIN=-128 entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<byte, string> = new Map<byte, string>([[-128 as byte, 'minByte'], [0 as byte, 'zero']]);
      let it: IterableIterator<[byte, string]> = m.entries();
      let r: IteratorResult<[byte, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(-128 as byte);
      expect(r.value![1]).assertEqual('minByte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_6700
     * @tc.name readonlyMapEntriesPart01Test067
     * @tc.desc Verify Map key short.MAX=32767 entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<short, string> = new Map<short, string>([[32767 as short, 'maxShort'], [0 as short, 'zero']]);
      let it: IterableIterator<[short, string]> = m.entries();
      let r: IteratorResult<[short, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(32767 as short);
      expect(r.value![1]).assertEqual('maxShort');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_6800
     * @tc.name readonlyMapEntriesPart01Test068
     * @tc.desc Verify Map key short.MIN=-32768 entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<short, string> = new Map<short, string>([[-32768 as short, 'minShort'], [0 as short, 'zero']]);
      let it: IterableIterator<[short, string]> = m.entries();
      let r: IteratorResult<[short, string]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual(-32768 as short);
      expect(r.value![1]).assertEqual('minShort');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_6900
     * @tc.name readonlyMapEntriesPart01Test069
     * @tc.desc Verify Map key XSS entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['<script>alert(1)</script>', 99], ['safe', 1]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('<script>alert(1)</script>');
      expect(r.value![1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_7000
     * @tc.name readonlyMapEntriesPart01Test070
     * @tc.desc Verify entries() set key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['key', 1], ['key', 999]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('key');
      expect(r.value![1]).assertEqual(999);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_7100
     * @tc.name readonlyMapEntriesPart01Test071
     * @tc.desc Verify entries() value K value V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      let entry: [string, int] = r.value!;
      let k: string = entry[0];
      let v: int = entry[1];
      expect(k).assertEqual('a');
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_7200
     * @tc.name readonlyMapEntriesPart01Test072
     * @tc.desc Verify entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['second', 2], ['third', 3]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('first');
      r = it.next();
      expect(r.value![0]).assertEqual('second');
      r = it.next();
      expect(r.value![0]).assertEqual('third');
      r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART01_TEST_7300
     * @tc.name readonlyMapEntriesPart01Test073
     * @tc.desc Verify entries() size entries count Map.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let it: IterableIterator<[string, int]> = m.entries();
      let count: int = 0;
      let r: IteratorResult<[string, int]> = it.next();
      while (!r.done) {
        count = count + 1;
        r = it.next();
      }
      expect(count).assertEqual(m.size);
    });


  });
}
