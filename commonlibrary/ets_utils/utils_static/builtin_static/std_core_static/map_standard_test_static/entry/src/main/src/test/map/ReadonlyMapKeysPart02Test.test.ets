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

export default function readonlyMapKeysPart02TestTest(): void {
  describe('ReadonlyMapKeysPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_0100
     * @tc.name readonlyMapKeysPart02Test001
     * @tc.desc Verify Map\<string, int\>.keys() typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 1]]);
      let iter = m.keys();
      expect(iter.next().value).assertEqual('k');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_0200
     * @tc.name readonlyMapKeysPart02Test002
     * @tc.desc Verify Map keys() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let iter = m.keys();
      expect(m.size).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_0300
     * @tc.name readonlyMapKeysPart02Test003
     * @tc.desc Verify Map\<int, string\>.keys() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[0, 'zero']]);
      let iter = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_0400
     * @tc.name readonlyMapKeysPart02Test004
     * @tc.desc Verify keys() next null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['x', 1]]);
      let iter = m.keys();
      let r = iter.next();
      expect(r).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_0500
     * @tc.name readonlyMapKeysPart02Test005
     * @tc.desc Verify typeof keys().next function (K=string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let iter = m.keys();
      expect(iter.next().value).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_0600
     * @tc.name readonlyMapKeysPart02Test006
     * @tc.desc Verify Map next() done boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['hello', 99]]);
      let iter = m.keys();
      let r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_0700
     * @tc.name readonlyMapKeysPart02Test007
     * @tc.desc Verify Map next() value string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['data', 77]]);
      let iter = m.keys();
      let r = iter.next();
      expect(typeof r.value!).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_0800
     * @tc.name readonlyMapKeysPart02Test008
     * @tc.desc Verify Map next() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let iter = m.keys();
      let r = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_0900
     * @tc.name readonlyMapKeysPart02Test009
     * @tc.desc Verify Map next().done === false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k1', 11]]);
      let iter = m.keys();
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_1000
     * @tc.name readonlyMapKeysPart02Test010
     * @tc.desc Verify next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['last', 50]]);
      let iter = m.keys();
      iter.next();
      let r = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_1100
     * @tc.name readonlyMapKeysPart02Test011
     * @tc.desc Verify next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['item', 1]]);
      let iter = m.keys();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_1200
     * @tc.name readonlyMapKeysPart02Test012
     * @tc.desc Verify Map (K=int) next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>();
      let iter = m.keys();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_1300
     * @tc.name readonlyMapKeysPart02Test013
     * @tc.desc Verify Map (K=number) next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>();
      let iter = m.keys();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_1400
     * @tc.name readonlyMapKeysPart02Test014
     * @tc.desc Verify Map next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let iter = m.keys();
      iter.next();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_1500
     * @tc.name readonlyMapKeysPart02Test015
     * @tc.desc Verify Map next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let iter = m.keys();
      expect(iter.next().value).assertUndefined();
      expect(iter.next().value).assertUndefined();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_1600
     * @tc.name readonlyMapKeysPart02Test016
     * @tc.desc Verify K=string Map next().value key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['uniqueKey', 12345]]);
      let iter = m.keys();
      expect(iter.next().value!).assertEqual('uniqueKey');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_1700
     * @tc.name readonlyMapKeysPart02Test017
     * @tc.desc Verify K=int Map next().value int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[789, 'intVal']]);
      let iter = m.keys();
      expect(iter.next().value!).assertEqual(789);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_1800
     * @tc.name readonlyMapKeysPart02Test018
     * @tc.desc Verify K=int ( ) Map next().value key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[-1, 'negative']]);
      let iter = m.keys();
      expect(iter.next().value!).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_1900
     * @tc.name readonlyMapKeysPart02Test019
     * @tc.desc Verify K=number ( ) Map next().value key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, string> = new Map<number, string>([[4.5, 'half']]);
      let iter = m.keys();
      expect(iter.next().value!).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_2000
     * @tc.name readonlyMapKeysPart02Test020
     * @tc.desc Verify K=boolean (true) Map next().value === true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<boolean, int> = new Map<boolean, int>([[true, 1]]);
      let iter = m.keys();
      expect(iter.next().value!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_2100
     * @tc.name readonlyMapKeysPart02Test021
     * @tc.desc Verify K=boolean (false) Map next().value === false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<boolean, int> = new Map<boolean, int>([[false, 0]]);
      let iter = m.keys();
      expect(iter.next().value!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_2200
     * @tc.name readonlyMapKeysPart02Test022
     * @tc.desc Verify K=long Map next().value long key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(100), 'big']]);
      let iter = m.keys();
      expect(iter.next().value!).assertEqual(Int.toLong(100));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_2300
     * @tc.name readonlyMapKeysPart02Test023
     * @tc.desc Verify K=Date Map next().value Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(2025, 11, 31);
      const m: ReadonlyMap<Date, int> = new Map<Date, int>([[d, 365]]);
      let iter = m.keys();
      expect(iter.next().value!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_2400
     * @tc.name readonlyMapKeysPart02Test024
     * @tc.desc Verify 2 Map (K=string) next().value key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['second', 2]]);
      let iter = m.keys();
      expect(iter.next().value!).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_2500
     * @tc.name readonlyMapKeysPart02Test025
     * @tc.desc Verify 2 Map (K=string) next().value key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['alpha', 10], ['beta', 20]]);
      let iter = m.keys();
      iter.next();
      expect(iter.next().value!).assertEqual('beta');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_2600
     * @tc.name readonlyMapKeysPart02Test026
     * @tc.desc Verify 2 Map (K=int) int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[10, 'ten'], [20, 'twenty']]);
      let iter = m.keys();
      expect(iter.next().value!).assertEqual(10);
      expect(iter.next().value!).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_2700
     * @tc.name readonlyMapKeysPart02Test027
     * @tc.desc Verify 3 Map (K=string) key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['apple', 1], ['banana', 2], ['cherry', 3]]);
      let iter = m.keys();
      expect(iter.next().value!).assertEqual('apple');
      expect(iter.next().value!).assertEqual('banana');
      expect(iter.next().value!).assertEqual('cherry');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_2800
     * @tc.name readonlyMapKeysPart02Test028
     * @tc.desc Verify 4 Map (K=string) key done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['north', 1], ['south', 2], ['east', 3], ['west', 4]]);
      let iter = m.keys();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_2900
     * @tc.name readonlyMapKeysPart02Test029
     * @tc.desc Verify Map key Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['p', 1], ['q', 2], ['r', 3], ['s', 4]]);
      let iter = m.keys();
      let count: int = 0;
      let r = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(m.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_3000
     * @tc.name readonlyMapKeysPart02Test030
     * @tc.desc Verify 3 Map (K=number) number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, string> = new Map<number, string>([[1.1, 'one'], [2.2, 'two'], [3.3, 'three']]);
      let iter = m.keys();
      expect(iter.next().value!).assertEqual(1.1);
      expect(iter.next().value!).assertEqual(2.2);
      expect(iter.next().value!).assertEqual(3.3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_3100
     * @tc.name readonlyMapKeysPart02Test031
     * @tc.desc Verify 5 Map (K=string) set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['v1', 1], ['v2', 2], ['v3', 3], ['v4', 4], ['v5', 5]]);
      let iter = m.keys();
      expect(iter.next().value!).assertEqual('v1');
      expect(iter.next().value!).assertEqual('v2');
      expect(iter.next().value!).assertEqual('v3');
      expect(iter.next().value!).assertEqual('v4');
      expect(iter.next().value!).assertEqual('v5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_3200
     * @tc.name readonlyMapKeysPart02Test032
     * @tc.desc Verify Map keys() size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let iter = m.keys();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_3300
     * @tc.name readonlyMapKeysPart02Test033
     * @tc.desc Verify Map keys() size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['solo', 777]]);
      let iter = m.keys();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_3400
     * @tc.name readonlyMapKeysPart02Test034
     * @tc.desc Verify Map keys() has(key) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['target', 999]]);
      let iter = m.keys();
      expect(m.has('target')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_3500
     * @tc.name readonlyMapKeysPart02Test035
     * @tc.desc Verify Map keys() get(key) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['keystone', 500]]);
      let iter = m.keys();
      expect(m.get('keystone')).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_3600
     * @tc.name readonlyMapKeysPart02Test036
     * @tc.desc Verify Map keys() size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a1', 1], ['a2', 2], ['a3', 3]]);
      let sizeBefore: int = m.size;
      let iter = m.keys();
      expect(m.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_3700
     * @tc.name readonlyMapKeysPart02Test037
     * @tc.desc Verify Map keys() key has() true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k1', 101], ['k2', 202], ['k3', 303]]);
      let iter = m.keys();
      expect(m.has('k1')).assertTrue();
      expect(m.has('k2')).assertTrue();
      expect(m.has('k3')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_3800
     * @tc.name readonlyMapKeysPart02Test038
     * @tc.desc Verify Map keys() key get() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['g1', 11], ['g2', 22], ['g3', 33]]);
      let iter = m.keys();
      expect(m.get('g1')).assertEqual(11);
      expect(m.get('g2')).assertEqual(22);
      expect(m.get('g3')).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_3900
     * @tc.name readonlyMapKeysPart02Test039
     * @tc.desc Verify Map get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['cnt', 100]]);
      let iter = m.keys();
      let firstKey = iter.next().value!;
      expect(m.get('cnt')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_4000
     * @tc.name readonlyMapKeysPart02Test040
     * @tc.desc Verify Map has()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['post', 999]]);
      let iter = m.keys();
      iter.next();
      iter.next();
      expect(m.has('post')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_4100
     * @tc.name readonlyMapKeysPart02Test041
     * @tc.desc Verify Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['h1', 1], ['h2', 2], ['h3', 3], ['h4', 4]]);
      let iter = m.keys();
      iter.next();
      iter.next();
      expect(m.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_4200
     * @tc.name readonlyMapKeysPart02Test042
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['stable', 42]]);
      let iter1 = m.keys();
      let iter2 = m.keys();
      let iter3 = m.keys();
      expect(m.size).assertEqual(1);
      expect(m.get('stable')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_4300
     * @tc.name readonlyMapKeysPart02Test043
     * @tc.desc Verify Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['x', 1], ['y', 2]]);
      let iter1 = m.keys();
      let iter2 = m.keys();
      iter1.next();
      expect(iter2.next().value!).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_4400
     * @tc.name readonlyMapKeysPart02Test044
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['A', 1], ['B', 2], ['C', 3], ['D', 4]]);
      let iter1 = m.keys();
      let iter2 = m.keys();
      iter1.next();
      iter1.next();
      expect(iter2.next().value!).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_4500
     * @tc.name readonlyMapKeysPart02Test045
     * @tc.desc Verify keys iterator == 'one'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['one', 1], ['two', 2]]);
      let iterA = m.keys();
      let iterB = m.keys();
      let a1 = iterA.next().value!;
      let b1 = iterB.next().value!;
      let a2 = iterA.next().value!;
      let b2 = iterB.next().value!;
      expect(a1).assertEqual('one');
      expect(b1).assertEqual('one');
      expect(a2).assertEqual('two');
      expect(b2).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_4600
     * @tc.name readonlyMapKeysPart02Test046
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['head', 1], ['tail', 2]]);
      let iter1 = m.keys();
      iter1.next();
      iter1.next();
      expect(iter1.next().done).assertTrue();
      let iter2 = m.keys();
      expect(iter2.next().value!).assertEqual('head');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_4700
     * @tc.name readonlyMapKeysPart02Test047
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['p', 10], ['q', 20], ['r', 30]]);
      let i1 = m.keys();
      let i2 = m.keys();
      let i3 = m.keys();
      i1.next();
      i2.next();
      i2.next();
      expect(i1.next().value!).assertEqual('q');
      expect(i2.next().value!).assertEqual('r');
      expect(i3.next().value!).assertEqual('p');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_4800
     * @tc.name readonlyMapKeysPart02Test048
     * @tc.desc Verify A B next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['start', 0], ['mid', 50], ['end', 100]]);
      let iterA = m.keys();
      let iterB = m.keys();
      iterA.next();
      iterA.next();
      expect(iterB.next().value!).assertEqual('start');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_4900
     * @tc.name readonlyMapKeysPart02Test049
     * @tc.desc Verify A B next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['XX', 1], ['YY', 2]]);
      let iterA = m.keys();
      iterA.next();
      iterA.next();
      let iterB = m.keys();
      expect(iterB.next().value!).assertEqual('XX');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_5000
     * @tc.name readonlyMapKeysPart02Test050
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['L1', 1], ['L2', 2], ['L3', 3]]);
      let existing = m.keys();
      existing.next();
      let created: IterableIterator<string> = m.keys();
      expect(created.next().value!).assertEqual('L1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_5100
     * @tc.name readonlyMapKeysPart02Test051
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 10], ['b', 20], ['c', 30]]);
      let i1 = m.keys();
      let i2 = m.keys();
      expect(i1.next().value!).assertEqual('a');
      expect(i1.next().value!).assertEqual('b');
      expect(i1.next().value!).assertEqual('c');
      expect(i2.next().value!).assertEqual('a');
      expect(i2.next().value!).assertEqual('b');
      expect(i2.next().value!).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_5200
     * @tc.name readonlyMapKeysPart02Test052
     * @tc.desc Verify done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['u', 1], ['v', 2]]);
      let iter1 = m.keys();
      let iter2 = m.keys();
      iter1.next();
      iter1.next();
      iter2.next();
      iter2.next();
      expect(iter1.next().done).assertTrue();
      expect(iter2.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_5300
     * @tc.name readonlyMapKeysPart02Test053
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['m1', 1], ['m2', 2]]);
      let iterA = m.keys();
      iterA.next();
      iterA.next();
      let iterB = m.keys();
      expect(iterB.next().value!).assertEqual('m1');
      expect(iterB.next().value!).assertEqual('m2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART02_TEST_5400
     * @tc.name readonlyMapKeysPart02Test054
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['z1', 1], ['z2', 2], ['z3', 3]]);
      let x = m.keys();
      let y = m.keys();
      expect(x.next().value!).assertEqual('z1');
      expect(y.next().value!).assertEqual('z1');
      expect(x.next().value!).assertEqual('z2');
      expect(y.next().value!).assertEqual('z2');
      expect(x.next().value!).assertEqual('z3');
      expect(y.next().value!).assertEqual('z3');
    });

  });
}
