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

export default function readonlyMapForEachPart02TestTest(): void {
  describe('ReadonlyMapForEachPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_0100
     * @tc.name readonlyMapForEachPart02Test001
     * @tc.desc Verify K=string V=int Map forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k1', 10], ['k2', 20]]);
      let result = m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_0200
     * @tc.name readonlyMapForEachPart02Test002
     * @tc.desc Verify K=int V=string Map forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[42, 'answer']]);
      let result = m.forEach((value: string, key: int, map: ReadonlyMap<int, string>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_0300
     * @tc.name readonlyMapForEachPart02Test003
     * @tc.desc Verify K=boolean V=int forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<boolean, int> = new Map<boolean, int>([[true, 100]]);
      let result = m.forEach((value: int, key: boolean, map: ReadonlyMap<boolean, int>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_0400
     * @tc.name readonlyMapForEachPart02Test004
     * @tc.desc Verify K=long V=int forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<long, int> = new Map<long, int>([[Int.toLong(1000), 5], [Int.toLong(2000), 10]]);
      let result = m.forEach((value: int, key: long, map: ReadonlyMap<long, int>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_0500
     * @tc.name readonlyMapForEachPart02Test005
     * @tc.desc Verify K=double V=number forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<double, number> = new Map<double, number>([[1.1, 2.2], [3.3, 4.4]]);
      let result = m.forEach((value: number, key: double, map: ReadonlyMap<double, number>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_0600
     * @tc.name readonlyMapForEachPart02Test006
     * @tc.desc Verify Map null entry forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string | null> = new Map<string, string | null>([['a', 'hello'], ['b', null]]);
      let result = m.forEach((value: string | null, key: string, map: ReadonlyMap<string, string | null>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_0700
     * @tc.name readonlyMapForEachPart02Test007
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['x', 1]]);
      let ret = m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      expect(ret).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_0800
     * @tc.name readonlyMapForEachPart02Test008
     * @tc.desc Verify Map forEach size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['only', 42]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_0900
     * @tc.name readonlyMapForEachPart02Test009
     * @tc.desc Verify Map forEach size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let before: int = m.size;
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      expect(m.size).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_1000
     * @tc.name readonlyMapForEachPart02Test010
     * @tc.desc Verify K=int V=string forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      let before: int = m.size;
      m.forEach((value: string, key: int, map: ReadonlyMap<int, string>): void => {});
      expect(m.size).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_1100
     * @tc.name readonlyMapForEachPart02Test011
     * @tc.desc Verify K=Date V=int forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(2020, 5, 10);
      let d2: Date = new Date(2021, 5, 10);
      const m: ReadonlyMap<Date, int> = new Map<Date, int>([[d1, 100], [d2, 200]]);
      let before: int = m.size;
      m.forEach((value: int, key: Date, map: ReadonlyMap<Date, int>): void => {});
      expect(m.size).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_1200
     * @tc.name readonlyMapForEachPart02Test012
     * @tc.desc Verify K=boolean V=int forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<boolean, int> = new Map<boolean, int>([[true, 1], [false, 0]]);
      let before: int = m.size;
      m.forEach((value: int, key: boolean, map: ReadonlyMap<boolean, int>): void => {});
      expect(m.size).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_1300
     * @tc.name readonlyMapForEachPart02Test013
     * @tc.desc Verify K=long V=int forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<long, int> = new Map<long, int>([[Int.toLong(10), 100], [Int.toLong(20), 200]]);
      let before: int = m.size;
      m.forEach((value: int, key: long, map: ReadonlyMap<long, int>): void => {});
      expect(m.size).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_1400
     * @tc.name readonlyMapForEachPart02Test014
     * @tc.desc Verify K=double V=number forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<double, number> = new Map<double, number>([[1.0, 10.0], [2.0, 20.0], [3.0, 30.0]]);
      let before: int = m.size;
      m.forEach((value: number, key: double, map: ReadonlyMap<double, number>): void => {});
      expect(m.size).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_1500
     * @tc.name readonlyMapForEachPart02Test015
     * @tc.desc Verify set key forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['a', 999]]);
      let before: int = m.size;
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      expect(m.size).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_1600
     * @tc.name readonlyMapForEachPart02Test016
     * @tc.desc Verify forEach has key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k1', 100], ['k2', 200]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      expect(m.has('k1')).assertTrue();
      expect(m.has('k2')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_1700
     * @tc.name readonlyMapForEachPart02Test017
     * @tc.desc Verify forEach has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k1', 100]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      expect(m.has('nonexistent')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_1800
     * @tc.name readonlyMapForEachPart02Test018
     * @tc.desc Verify forEach get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['x', 10], ['y', 20], ['z', 30]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      expect(m.get('x')).assertEqual(10);
      expect(m.get('y')).assertEqual(20);
      expect(m.get('z')).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_1900
     * @tc.name readonlyMapForEachPart02Test019
     * @tc.desc Verify forEach entires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['second', 2], ['third', 3]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      let iter: IterableIterator<[string, int]> = m.entries();
      let e1: IteratorResult<[string, int]> = iter.next();
      let e2: IteratorResult<[string, int]> = iter.next();
      let e3: IteratorResult<[string, int]> = iter.next();
      expect(e1.value![0]).assertEqual('first');
      expect(e2.value![0]).assertEqual('second');
      expect(e3.value![0]).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_2000
     * @tc.name readonlyMapForEachPart02Test020
     * @tc.desc Verify forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['one', 1], ['two', 2]]);
      let before: int = m.size;
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      let after: int = m.size;
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_2100
     * @tc.name readonlyMapForEachPart02Test021
     * @tc.desc Verify forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['p', 10], ['q', 20]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      expect(m.has('p')).assertTrue();
      expect(m.has('q')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_2200
     * @tc.name readonlyMapForEachPart02Test022
     * @tc.desc Verify K=Date forEach get Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(2023, 0, 1);
      let d2: Date = new Date(2023, 6, 1);
      const m: ReadonlyMap<Date, int> = new Map<Date, int>([[d1, 777], [d2, 888]]);
      m.forEach((value: int, key: Date, map: ReadonlyMap<Date, int>): void => {});
      expect(m.get(d1)).assertEqual(777);
      expect(m.get(d2)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_2300
     * @tc.name readonlyMapForEachPart02Test023
     * @tc.desc Verify K=boolean forEach has get boolean key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<boolean, int> = new Map<boolean, int>([[true, 111], [false, 222]]);
      m.forEach((value: int, key: boolean, map: ReadonlyMap<boolean, int>): void => {});
      expect(m.has(true)).assertTrue();
      expect(m.has(false)).assertTrue();
      expect(m.get(true)).assertEqual(111);
      expect(m.get(false)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_2400
     * @tc.name readonlyMapForEachPart02Test024
     * @tc.desc Verify set forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3], ['b', 999]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      let entries: IterableIterator<[string, int]> = m.entries();
      let first: IteratorResult<[string, int]> = entries.next();
      let second: IteratorResult<[string, int]> = entries.next();
      let third: IteratorResult<[string, int]> = entries.next();
      expect(first.value![0]).assertEqual('a');
      expect(second.value![0]).assertEqual('b');
      expect(third.value![0]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_2500
     * @tc.name readonlyMapForEachPart02Test025
     * @tc.desc Verify forEach values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['u', 3], ['v', 6]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      let vals: IterableIterator<int> = m.values();
      expect(vals.next().value!).assertEqual(3);
      expect(vals.next().value!).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_2600
     * @tc.name readonlyMapForEachPart02Test026
     * @tc.desc Verify forEach keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['alpha', 1], ['beta', 2]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      let keys: IterableIterator<string> = m.keys();
      expect(keys.next().value!).assertEqual('alpha');
      expect(keys.next().value!).assertEqual('beta');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_2700
     * @tc.name readonlyMapForEachPart02Test027
     * @tc.desc Verify forEach same true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let same: boolean = false;
      const m: ReadonlyMap<string, int> = new Map<string, int>([['ident', 1]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {
        if (map === m) { same = true; }
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_2800
     * @tc.name readonlyMapForEachPart02Test028
     * @tc.desc Verify map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizeInCb: int = -1;
      const m: ReadonlyMap<string, int> = new Map<string, int>([['s1', 11], ['s2', 22], ['s3', 33]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {
        sizeInCb = map.size;
      });
      expect(sizeInCb).assertEqual(m.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_2900
     * @tc.name readonlyMapForEachPart02Test029
     * @tc.desc Verify map get key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let match: boolean = true;
      const m: ReadonlyMap<string, int> = new Map<string, int>([['g1', 111], ['g2', 222]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {
        if (map.get(key) !== value) { match = false; }
      });
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_3000
     * @tc.name readonlyMapForEachPart02Test030
     * @tc.desc Verify map has key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allFound: boolean = true;
      const m: ReadonlyMap<string, int> = new Map<string, int>([['hk1', 8], ['hk2', 9]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {
        if (!map.has(key)) { allFound = false; }
      });
      expect(allFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_3100
     * @tc.name readonlyMapForEachPart02Test031
     * @tc.desc Verify map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let order: string[] = [];
      const m: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['second', 2]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {
        order.push(key);
      });
      let expected: string[] = ['first', 'second'];
      expect(order[0]).assertEqual(expected[0]);
      expect(order[1]).assertEqual(expected[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_3200
     * @tc.name readonlyMapForEachPart02Test032
     * @tc.desc Verify map toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tsInCb: string = '';
      const m: ReadonlyMap<string, int> = new Map<string, int>([['ts1', 7], ['ts2', 8]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {
        tsInCb = map.toString();
      });
      expect(tsInCb).assertEqual(m.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_3300
     * @tc.name readonlyMapForEachPart02Test033
     * @tc.desc Verify V=boolean value typeof boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, boolean> = new Map<string, boolean>([['vt3', true]]);
      m.forEach((value: boolean, key: string, map: ReadonlyMap<string, boolean>): void => {
        expect(value).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_3400
     * @tc.name readonlyMapForEachPart02Test034
     * @tc.desc Verify V=long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let passed: long = Int.toLong(0);
      const m: ReadonlyMap<string, long> = new Map<string, long>([['vt5', 9999999999]]);
      m.forEach((value: long, key: string, map: ReadonlyMap<string, long>): void => {
        passed = value;
      });
      expect(passed).assertEqual(9999999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_3500
     * @tc.name readonlyMapForEachPart02Test035
     * @tc.desc Verify V=double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let passed: double = 0.0;
      const m: ReadonlyMap<string, double> = new Map<string, double>([['vt6', 3.14159]]);
      m.forEach((value: double, key: string, map: ReadonlyMap<string, double>): void => {
        passed = value;
      });
      expect(passed).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_3600
     * @tc.name readonlyMapForEachPart02Test036
     * @tc.desc Verify V=byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let passed: byte = 0 as byte;
      const m: ReadonlyMap<string, byte> = new Map<string, byte>([['vt7', 100 as byte]]);
      m.forEach((value: byte, key: string, map: ReadonlyMap<string, byte>): void => {
        passed = value;
      });
      expect(passed).assertEqual(100 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_3700
     * @tc.name readonlyMapForEachPart02Test037
     * @tc.desc Verify K=long key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let passed: long = Int.toLong(0);
      const m: ReadonlyMap<long, int> = new Map<long, int>([[7777777777, 400]]);
      m.forEach((value: int, key: long, map: ReadonlyMap<long, int>): void => {
        passed = key;
      });
      expect(passed).assertEqual(7777777777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_3800
     * @tc.name readonlyMapForEachPart02Test038
     * @tc.desc Verify K=double key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let passed: double = 0.0;
      const m: ReadonlyMap<double, int> = new Map<double, int>([[88.88, 500]]);
      m.forEach((value: int, key: double, map: ReadonlyMap<double, int>): void => {
        passed = key;
      });
      expect(passed).assertEqual(88.88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_3900
     * @tc.name readonlyMapForEachPart02Test039
     * @tc.desc Verify K=char key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let passed: char = c'A';
      const m: ReadonlyMap<char, int> = new Map<char, int>([[c'Z', 600]]);
      m.forEach((value: int, key: char, map: ReadonlyMap<char, int>): void => {
        passed = key;
      });
      expect(passed).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_4000
     * @tc.name readonlyMapForEachPart02Test040
     * @tc.desc Verify K=bigint key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let passed: bigint = 0n;
      const m: ReadonlyMap<bigint, int> = new Map<bigint, int>([[123456789n, 700]]);
      m.forEach((value: int, key: bigint, map: ReadonlyMap<bigint, int>): void => {
        passed = key;
      });
      expect(passed).assertEqual(123456789n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_4100
     * @tc.name readonlyMapForEachPart02Test041
     * @tc.desc Verify value get(key) K=string V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allMatch: boolean = true;
      const m: ReadonlyMap<string, int> = new Map<string, int>([['match', 42], ['test', 84]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {
        if (value !== m.get(key)) { allMatch = false; }
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_4200
     * @tc.name readonlyMapForEachPart02Test042
     * @tc.desc Verify value get K=int V=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mismatch: boolean = false;
      const m: ReadonlyMap<int, string> = new Map<int, string>([[10, 'ten'], [20, 'twenty']]);
      m.forEach((value: string, key: int, map: ReadonlyMap<int, string>): void => {
        if (value !== m.get(key)) { mismatch = true; }
      });
      expect(mismatch).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_4300
     * @tc.name readonlyMapForEachPart02Test043
     * @tc.desc Verify forEach == 'insert1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keysOrder: string[] = [];
      const m: ReadonlyMap<string, int> = new Map<string, int>([['insert1', 100], ['insert2', 200], ['insert3', 300]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {
        keysOrder.push(key);
      });
      expect(keysOrder[0]).assertEqual('insert1');
      expect(keysOrder[1]).assertEqual('insert2');
      expect(keysOrder[2]).assertEqual('insert3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_4400
     * @tc.name readonlyMapForEachPart02Test044
     * @tc.desc Verify forEach false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundFake: boolean = false;
      const m: ReadonlyMap<string, int> = new Map<string, int>([['real', 1]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {
        if (key === 'fake') { foundFake = true; }
      });
      expect(foundFake).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_4500
     * @tc.name readonlyMapForEachPart02Test045
     * @tc.desc Verify forEach == 'pos1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positions: string[] = [];
      const m: ReadonlyMap<string, int> = new Map<string, int>([['pos1', 1], ['pos2', 2], ['pos3', 3], ['pos2', 222]]);
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {
        positions.push(key);
      });
      expect(positions[0]).assertEqual('pos1');
      expect(positions[1]).assertEqual('pos2');
      expect(positions[2]).assertEqual('pos3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_4600
     * @tc.name readonlyMapForEachPart02Test046
     * @tc.desc Verify Map forEach size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {
        called = true;
      });
      expect(called).assertFalse();
      expect(m.size).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_4700
     * @tc.name readonlyMapForEachPart02Test047
     * @tc.desc Verify forEach undefined forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['nc1', 1]]);
      let result = m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART02_TEST_4800
     * @tc.name readonlyMapForEachPart02Test048
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['nc2', 2]]);
      let result = m.forEach((value: int, key: string, map: ReadonlyMap<string, int>): void => {});
      let isMap: boolean = (result === m);
      expect(isMap).assertFalse();
    });

  });
}
