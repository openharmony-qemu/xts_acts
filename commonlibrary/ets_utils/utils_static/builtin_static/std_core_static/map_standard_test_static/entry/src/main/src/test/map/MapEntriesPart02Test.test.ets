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

export default function mapEntriesPart02TestTest(): void {
  describe('MapEntriesPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_0100
     * @tc.name mapEntriesPart02Test001
     * @tc.desc Verify entries() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_0200
     * @tc.name mapEntriesPart02Test002
     * @tc.desc Verify typeof entries() 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_0300
     * @tc.name mapEntriesPart02Test003
     * @tc.desc Verify entries() next 'function'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      expect(typeof iter.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_0400
     * @tc.name mapEntriesPart02Test004
     * @tc.desc Verify entries() $_iterator 'function'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      expect(iter.$_iterator() instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_0500
     * @tc.name mapEntriesPart02Test005
     * @tc.desc Verify Map entries() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<[string, int]> = m.entries();
      expect(m.size).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_0600
     * @tc.name mapEntriesPart02Test006
     * @tc.desc Verify next() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 10]]);
      let r: IteratorResult<[string, int]> = m.entries().next();
      expect(m.size).assertEqual(1);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_0700
     * @tc.name mapEntriesPart02Test007
     * @tc.desc Verify typeof next().done 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 10]]);
      let r: IteratorResult<[string, int]> = m.entries().next();
      expect(typeof r.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_0800
     * @tc.name mapEntriesPart02Test008
     * @tc.desc Verify typeof next().value 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 10]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(typeof r.value).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_0900
     * @tc.name mapEntriesPart02Test009
     * @tc.desc Verify K=string entry typeof 'string'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('hello', 100);
      let entry: [string, int] = m.entries().next().value!;
      expect(typeof entry[0]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_1000
     * @tc.name mapEntriesPart02Test010
     * @tc.desc Verify K=int entry typeof 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(42, 'v');
      let entry: [int, string] = m.entries().next().value!;
      expect(typeof entry[0]).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_1100
     * @tc.name mapEntriesPart02Test011
     * @tc.desc Verify K=number entry typeof 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(3.14, 1);
      let entry: [number, int] = m.entries().next().value!;
      expect(typeof entry[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_1200
     * @tc.name mapEntriesPart02Test012
     * @tc.desc Verify K=boolean entry typeof 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>();
      m.set(true, 'yes');
      let entry: [boolean, string] = m.entries().next().value!;
      expect(typeof entry[0]).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_1300
     * @tc.name mapEntriesPart02Test013
     * @tc.desc Verify K=long entry typeof 'bigint'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>();
      m.set(Int.toLong(1), 'v');
      let entry: [long, string] = m.entries().next().value!;
      expect(typeof entry[0]).assertEqual('long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_1400
     * @tc.name mapEntriesPart02Test014
     * @tc.desc Verify K=byte entry typeof 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, string> = new Map<byte, string>();
      m.set(1 as byte, 'v');
      let entry: [byte, string] = m.entries().next().value!;
      expect(typeof entry[0]).assertEqual('byte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_1500
     * @tc.name mapEntriesPart02Test015
     * @tc.desc Verify K=short entry typeof 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>();
      m.set(10 as short, 'v');
      let entry: [short, string] = m.entries().next().value!;
      expect(typeof entry[0]).assertEqual('short');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_1600
     * @tc.name mapEntriesPart02Test016
     * @tc.desc Verify K=float entry typeof 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, string> = new Map<float, string>();
      m.set(1.0, 'v');
      let entry: [float, string] = m.entries().next().value!;
      expect(typeof entry[0]).assertEqual('float');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_1700
     * @tc.name mapEntriesPart02Test017
     * @tc.desc Verify K=char entry typeof 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<char, string> = new Map<char, string>();
      m.set(c'A', 'v');
      let entry: [char, string] = m.entries().next().value!;
      expect(typeof entry[0]).assertEqual('char');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_1800
     * @tc.name mapEntriesPart02Test018
     * @tc.desc Verify K=bigint entry typeof 'bigint'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<bigint, string> = new Map<bigint, string>();
      m.set(100n, 'v');
      let entry: [bigint, string] = m.entries().next().value!;
      expect(typeof entry[0]).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_1900
     * @tc.name mapEntriesPart02Test019
     * @tc.desc Verify K=undefined entry typeof 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | undefined, int> = new Map<string | undefined, int>();
      m.set(undefined, 1);
      let entry: [string | undefined, int] = m.entries().next().value!;
      expect(typeof entry[0]).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_2000
     * @tc.name mapEntriesPart02Test020
     * @tc.desc Verify V=Date entry instanceof Date true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Date> = new Map<string, Date>();
      let d: Date = new Date(2024, 0, 1);
      m.set('k', d);
      let entry: [string, Date] = m.entries().next().value!;
      expect(entry[1] instanceof Date).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_2100
     * @tc.name mapEntriesPart02Test021
     * @tc.desc Verify V=RegExp entry instanceof RegExp true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, RegExp> = new Map<string, RegExp>();
      let re: RegExp = new RegExp('abc', 'g');
      m.set('k', re);
      let entry: [string, RegExp] = m.entries().next().value!;
      expect(entry[1] instanceof RegExp).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_2200
     * @tc.name mapEntriesPart02Test022
     * @tc.desc Verify V=Error entry instanceof Error true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Error> = new Map<string, Error>();
      let err: Error = new Error('test');
      m.set('k', err);
      let entry: [string, Error] = m.entries().next().value!;
      expect(entry[1] instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_2300
     * @tc.name mapEntriesPart02Test023
     * @tc.desc Verify Map entries map.size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let count: int = 0;
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(m.size);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_2400
     * @tc.name mapEntriesPart02Test024
     * @tc.desc Verify Map entries map.size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['only', 1]]);
      let count: int = 0;
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(m.size);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_2500
     * @tc.name mapEntriesPart02Test025
     * @tc.desc Verify Map entries map.size 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let count: int = 0;
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(m.size);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_2600
     * @tc.name mapEntriesPart02Test026
     * @tc.desc Verify Map entries map.size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      let count: int = 0;
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(m.size);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_2700
     * @tc.name mapEntriesPart02Test027
     * @tc.desc Verify Map entries map.size 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      m.set('d', 4);
      m.set('e', 5);
      let count: int = 0;
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(m.size);
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_2800
     * @tc.name mapEntriesPart02Test028
     * @tc.desc Verify entries() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let sizeBefore: int = m.size;
      m.entries();
      expect(m.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_2900
     * @tc.name mapEntriesPart02Test029
     * @tc.desc Verify entries() Map size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.entries();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_3000
     * @tc.name mapEntriesPart02Test030
     * @tc.desc Verify entries() Map.get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      m.entries();
      expect(m.get('x')).assertEqual(10);
      expect(m.get('y')).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_3100
     * @tc.name mapEntriesPart02Test031
     * @tc.desc Verify entries() Map.has()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 1]]);
      m.entries();
      expect(m.has('k')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_3200
     * @tc.name mapEntriesPart02Test032
     * @tc.desc Verify entries() Map.delete()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['del', 99]]);
      m.entries();
      let deleted: boolean = m.delete('del');
      expect(deleted).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_3300
     * @tc.name mapEntriesPart02Test033
     * @tc.desc Verify entries Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let sizeBefore: int = m.size;
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      expect(m.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_3400
     * @tc.name mapEntriesPart02Test034
     * @tc.desc Verify entries Map.get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      expect(m.get('a')).assertEqual(1);
      expect(m.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_3500
     * @tc.name mapEntriesPart02Test035
     * @tc.desc Verify entries Map.has()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      expect(m.has('x')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_3600
     * @tc.name mapEntriesPart02Test036
     * @tc.desc Verify entries Map.forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      let forEachCount: int = 0;
      m.forEach((value: int, key: string): void => {
        forEachCount = forEachCount + 1;
      });
      expect(forEachCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_3700
     * @tc.name mapEntriesPart02Test037
     * @tc.desc Verify Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let sizeBefore: int = m.size;
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      expect(m.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_3800
     * @tc.name mapEntriesPart02Test038
     * @tc.desc Verify entries iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      expect(m.get('a')).assertEqual(1);
      expect(m.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_3900
     * @tc.name mapEntriesPart02Test039
     * @tc.desc Verify entries iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 100]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      expect(m.has('k')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_4000
     * @tc.name mapEntriesPart02Test040
     * @tc.desc Verify break Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3], ['d', 4]]);
      let sizeBefore: int = m.size;
      for (let entry of m.entries()) {
        if (entry[0] === 'b') {
          break;
        }
      }
      expect(m.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_4100
     * @tc.name mapEntriesPart02Test041
     * @tc.desc Verify break Map.get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      for (let entry of m.entries()) {
        if (entry[0] === 'b') {
          break;
        }
      }
      expect(m.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_4200
     * @tc.name mapEntriesPart02Test042
     * @tc.desc Verify break Map.has()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20], ['z', 30]]);
      for (let entry of m.entries()) {
        if (entry[0] === 'x') {
          break;
        }
      }
      expect(m.has('z')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_4300
     * @tc.name mapEntriesPart02Test043
     * @tc.desc Verify break Map.forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      for (let entry of m.entries()) {
        if (entry[0] === 'a') {
          break;
        }
      }
      let forEachCount: int = 0;
      m.forEach((value: int, key: string): void => {
        forEachCount = forEachCount + 1;
      });
      expect(forEachCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_4400
     * @tc.name mapEntriesPart02Test044
     * @tc.desc Verify entries Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let sizeBefore: int = m.size;
      let iter1: IterableIterator<[string, int]> = m.entries();
      let r1: IteratorResult<[string, int]> = iter1.next();
      while (!r1.done) {
        r1 = iter1.next();
      }
      let iter2: IterableIterator<[string, int]> = m.entries();
      let r2: IteratorResult<[string, int]> = iter2.next();
      while (!r2.done) {
        r2 = iter2.next();
      }
      expect(m.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_4500
     * @tc.name mapEntriesPart02Test045
     * @tc.desc Verify entries iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      let iter1: IterableIterator<[string, int]> = m.entries();
      let r1: IteratorResult<[string, int]> = iter1.next();
      while (!r1.done) {
        r1 = iter1.next();
      }
      let iter2: IterableIterator<[string, int]> = m.entries();
      let r2: IteratorResult<[string, int]> = iter2.next();
      while (!r2.done) {
        r2 = iter2.next();
      }
      expect(m.get('x')).assertEqual(10);
      expect(m.get('y')).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_4600
     * @tc.name mapEntriesPart02Test046
     * @tc.desc Verify entries != iterB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iterA: IterableIterator<[string, int]> = m.entries();
      let iterB: IterableIterator<[string, int]> = m.entries();
      expect(iterA).not().assertEqual(iterB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_4700
     * @tc.name mapEntriesPart02Test047
     * @tc.desc Verify entries iterator == 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iterA: IterableIterator<[string, int]> = m.entries();
      let iterB: IterableIterator<[string, int]> = m.entries();
      iterA.next();
      let entryB: [string, int] = iterB.next().value!;
      expect(entryB[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_4800
     * @tc.name mapEntriesPart02Test048
     * @tc.desc Verify entries iterator ra.done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iterA: IterableIterator<[string, int]> = m.entries();
      let iterB: IterableIterator<[string, int]> = m.entries();
      let ra: IteratorResult<[string, int]> = iterA.next();
      while (!ra.done) {
        ra = iterA.next();
      }
      let rb: IteratorResult<[string, int]> = iterB.next();
      while (!rb.done) {
        rb = iterB.next();
      }
      expect(ra.done).assertTrue();
      expect(rb.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_4900
     * @tc.name mapEntriesPart02Test049
     * @tc.desc Verify entries iterator == 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iterA: IterableIterator<[string, int]> = m.entries();
      let iterB: IterableIterator<[string, int]> = m.entries();
      let iterC: IterableIterator<[string, int]> = m.entries();
      let entryA: [string, int] = iterA.next().value!;
      iterB.next();
      let entryC: [string, int] = iterC.next().value!;
      expect(entryA[0]).assertEqual('a');
      expect(entryC[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_5000
     * @tc.name mapEntriesPart02Test050
     * @tc.desc Verify $_iterator() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      let inner: IterableIterator<[string, int]> = iter.$_iterator();
      expect(inner).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_5100
     * @tc.name mapEntriesPart02Test051
     * @tc.desc Verify $_iterator() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      let inner: IterableIterator<[string, int]> = iter.$_iterator();
      let count: int = 0;
      for (let entry of inner) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_5200
     * @tc.name mapEntriesPart02Test052
     * @tc.desc Verify $_iterator() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      let inner: IterableIterator<[string, int]> = iter.$_iterator();
      let r: IteratorResult<[string, int]> = inner.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_5300
     * @tc.name mapEntriesPart02Test053
     * @tc.desc Verify entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1], ['y', 2]]);
      let sum: int = 0;
      for (let entry of m.entries()) {
        sum = sum + (entry[1] as int);
      }
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_5400
     * @tc.name mapEntriesPart02Test054
     * @tc.desc Verify Map entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let visited: boolean = false;
      for (let entry of m.entries()) {
        visited = true;
      }
      expect(visited).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_5500
     * @tc.name mapEntriesPart02Test055
     * @tc.desc Verify entries() for...of K=boolean V=long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, long> = new Map<boolean, long>();
      m.set(true, Int.toLong(100));
      m.set(false, Int.toLong(200));
      let count: int = 0;
      for (let entry of m.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_5600
     * @tc.name mapEntriesPart02Test056
     * @tc.desc Verify entries() for...of K=int V=Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, Date> = new Map<int, Date>();
      m.set(1, new Date(2024, 0, 1));
      m.set(2, new Date(2024, 6, 1));
      let count: int = 0;
      for (let entry of m.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_5700
     * @tc.name mapEntriesPart02Test057
     * @tc.desc Verify Map entry entry entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['pair', 42]]);
      let entry: [string, int] = m.entries().next().value!;
      expect(entry[0]).assertEqual('pair');
      expect(entry[1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_5800
     * @tc.name mapEntriesPart02Test058
     * @tc.desc Verify Map entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('alpha', 100);
      m.set('beta', 200);
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      let entry: [string, int] = iter.next().value!;
      expect(entry[0]).assertEqual('beta');
      expect(entry[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_5900
     * @tc.name mapEntriesPart02Test059
     * @tc.desc Verify entries allKeysOk true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let allKeysOk: boolean = true;
      for (let entry of m.entries()) {
        if (entry[0] === undefined) {
          allKeysOk = false;
        }
      }
      expect(allKeysOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART02_6000
     * @tc.name mapEntriesPart02Test060
     * @tc.desc Verify entries allValuesOk true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let allValuesOk: boolean = true;
      for (let entry of m.entries()) {
        if (entry[1] === undefined) {
          allValuesOk = false;
        }
      }
      expect(allValuesOk).assertTrue();
    });

  });
}
