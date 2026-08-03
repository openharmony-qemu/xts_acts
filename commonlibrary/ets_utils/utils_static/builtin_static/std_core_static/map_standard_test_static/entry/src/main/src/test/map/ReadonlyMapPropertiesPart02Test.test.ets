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

interface Payload { id: number; name: string; }

export default function readonlyMapPropertiesPart02TestTest(): void {
  describe('ReadonlyMapPropertiesPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_0100
     * @tc.name readonlyMapPropertiesPart02Test001
     * @tc.desc Verify size == 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      const sz: int = map.size;
      expect(sz).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_0200
     * @tc.name readonlyMapPropertiesPart02Test002
     * @tc.desc Verify size == 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 1]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_0300
     * @tc.name readonlyMapPropertiesPart02Test003
     * @tc.desc Verify size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['k', 10]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_0400
     * @tc.name readonlyMapPropertiesPart02Test004
     * @tc.desc Verify size 1 number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(1, 'one');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_0500
     * @tc.name readonlyMapPropertiesPart02Test005
     * @tc.desc Verify size == 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_0600
     * @tc.name readonlyMapPropertiesPart02Test006
     * @tc.desc Verify Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_0700
     * @tc.name readonlyMapPropertiesPart02Test007
     * @tc.desc Verify null entries size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>(null);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_0800
     * @tc.name readonlyMapPropertiesPart02Test008
     * @tc.desc Verify entries size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: [string, int][] = [];
      const map: ReadonlyMap<string, int> = new Map<string, int>(entries);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_0900
     * @tc.name readonlyMapPropertiesPart02Test009
     * @tc.desc Verify bucketsCount size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>(16);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_1000
     * @tc.name readonlyMapPropertiesPart02Test010
     * @tc.desc Verify 3 entries size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_1100
     * @tc.name readonlyMapPropertiesPart02Test011
     * @tc.desc Verify key entries size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 1], ['x', 2], ['y', 3]]);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_1200
     * @tc.name readonlyMapPropertiesPart02Test012
     * @tc.desc Verify null entries size null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: ([string, int] | null)[] = [['a', 1], null, ['b', 2]];
      const map: ReadonlyMap<string, int> = new Map<string, int>(entries);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_1300
     * @tc.name readonlyMapPropertiesPart02Test013
     * @tc.desc Verify undefined entries size undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: ([string, int] | undefined)[] = [['a', 1], undefined, ['b', 2]];
      const map: ReadonlyMap<string, int> = new Map<string, int>(entries);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_1400
     * @tc.name readonlyMapPropertiesPart02Test014
     * @tc.desc Verify copy size Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ReadonlyMap<string, int> = new Map<string, int>([['p', 10], ['q', 20]]);
      const copy: ReadonlyMap<string, int> = new Map<string, int>(source);
      expect(copy.size).assertEqual(source.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_1500
     * @tc.name readonlyMapPropertiesPart02Test015
     * @tc.desc Verify entries size Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const copied: ReadonlyMap<string, int> = new Map<string, int>(source.entries());
      expect(copied.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_1600
     * @tc.name readonlyMapPropertiesPart02Test016
     * @tc.desc Verify Array size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixedArr: Array<[string, int]> = [['m', 5], ['n', 6], ['o', 7]];
      const map: ReadonlyMap<string, int> = new Map<string, int>(fixedArr);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_1700
     * @tc.name readonlyMapPropertiesPart02Test017
     * @tc.desc Verify Map set size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 100);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_1800
     * @tc.name readonlyMapPropertiesPart02Test018
     * @tc.desc Verify key set size 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('first', 1);
      map.set('second', 2);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_1900
     * @tc.name readonlyMapPropertiesPart02Test019
     * @tc.desc Verify set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      map.set('a', 999);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_2000
     * @tc.name readonlyMapPropertiesPart02Test020
     * @tc.desc Verify key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['k', 1]]);
      map.set('k', 2);
      map.set('k', 3);
      map.set('k', 4);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_2100
     * @tc.name readonlyMapPropertiesPart02Test021
     * @tc.desc Verify key set size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('x', 1);
      map.set('y', 2);
      map.set('z', 3);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_2200
     * @tc.name readonlyMapPropertiesPart02Test022
     * @tc.desc Verify set key size key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1).set('b', 2).set('a', 10).set('c', 3);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_2300
     * @tc.name readonlyMapPropertiesPart02Test023
     * @tc.desc Verify set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 0);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_2400
     * @tc.name readonlyMapPropertiesPart02Test024
     * @tc.desc Verify set key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'k'.repeat(10000);
      const map: Map<string, int> = new Map<string, int>();
      map.set(longKey, 42);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_2500
     * @tc.name readonlyMapPropertiesPart02Test025
     * @tc.desc Verify set 2147483647 key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(2147483647, 'max');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_2600
     * @tc.name readonlyMapPropertiesPart02Test026
     * @tc.desc Verify set (-2147483647 - 1) key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(-2147483648, 'min');
      expect(map.size).assertEqual(1);
    });












    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_2700
     * @tc.name readonlyMapPropertiesPart02Test027
     * @tc.desc Verify key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.set('a', 10);
      map.set('b', 20);
      map.set('c', 30);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_2800
     * @tc.name readonlyMapPropertiesPart02Test028
     * @tc.desc Verify set == 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.set('a', 10);
      map.set('c', 3);
      map.set('b', 20);
      map.set('d', 4);
      expect(map.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_2900
     * @tc.name readonlyMapPropertiesPart02Test029
     * @tc.desc Verify 100 key size 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      for (let i: int = 0; i < 100; i++) {
        map.set(i, i * 2);
      }
      expect(map.size).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_3000
     * @tc.name readonlyMapPropertiesPart02Test030
     * @tc.desc Verify set K=int V=string == 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'a');
      map.set(2, 'b');
      map.set(3, 'c');
      map.set(4, 'd');
      map.set(5, 'e');
      expect(map.size % 2).assertEqual(1);
      expect(map.size).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_3100
     * @tc.name readonlyMapPropertiesPart02Test031
     * @tc.desc Verify set K=int V=string == 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'a');
      map.set(2, 'b');
      map.set(3, 'c');
      map.set(4, 'd');
      expect(map.size % 2).assertEqual(0);
      expect(map.size).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_3200
     * @tc.name readonlyMapPropertiesPart02Test032
     * @tc.desc Verify int key Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'zero');
      map.set(1, 'one');
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_3300
     * @tc.name readonlyMapPropertiesPart02Test033
     * @tc.desc Verify number key Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, boolean> = new Map<number, boolean>();
      map.set(1.5, true);
      map.set(2.5, false);
      map.set(3.5, true);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_3400
     * @tc.name readonlyMapPropertiesPart02Test034
     * @tc.desc Verify boolean key Map size true/false key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(true, 'T');
      map.set(false, 'F');
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_3500
     * @tc.name readonlyMapPropertiesPart02Test035
     * @tc.desc Verify long key Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(1), 'one');
      map.set(Int.toLong(2), 'two');
      map.set(Int.toLong(3), 'three');
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_3600
     * @tc.name readonlyMapPropertiesPart02Test036
     * @tc.desc Verify Date key Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1000);
      const d2: Date = new Date(2000);
      const d3: Date = new Date(3000);
      const map: Map<Date, string> = new Map<Date, string>();
      map.set(d1, 'first');
      map.set(d2, 'second');
      map.set(d3, 'third');
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_3700
     * @tc.name readonlyMapPropertiesPart02Test037
     * @tc.desc Verify int value Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 10], ['b', 20]]);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_3800
     * @tc.name readonlyMapPropertiesPart02Test038
     * @tc.desc Verify string value Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      map.set(2, 'two');
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_3900
     * @tc.name readonlyMapPropertiesPart02Test039
     * @tc.desc Verify boolean value Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, boolean> = new Map<string, boolean>();
      map.set('x', true);
      map.set('y', false);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_4000
     * @tc.name readonlyMapPropertiesPart02Test040
     * @tc.desc Verify double value Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('pi', 3.14159);
      map.set('e', 2.71828);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_4100
     * @tc.name readonlyMapPropertiesPart02Test041
     * @tc.desc Verify value Map size interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Payload> = new Map<string, Payload>();
      const p1: Payload = { id: 1, name: 'alpha' };
      const p2: Payload = { id: 2, name: 'beta' };
      map.set('a', p1);
      map.set('b', p2);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_4200
     * @tc.name readonlyMapPropertiesPart02Test042
     * @tc.desc Verify Array value Map size >]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string[]> = new Map<string, string[]>();
      map.set('nums', ['1', '2']);
      map.set('letters', ['a', 'b', 'c']);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_4300
     * @tc.name readonlyMapPropertiesPart02Test043
     * @tc.desc Verify Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_4400
     * @tc.name readonlyMapPropertiesPart02Test044
     * @tc.desc Verify size get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      const sz: int = map.size;
      expect(sz).assertEqual(1);
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_4500
     * @tc.name readonlyMapPropertiesPart02Test045
     * @tc.desc Verify size has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['k', 5]]);
      const sz: int = map.size;
      expect(sz).assertEqual(1);
      expect(map.has('k')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_4600
     * @tc.name readonlyMapPropertiesPart02Test046
     * @tc.desc Verify size entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const sz: int = map.size;
      const iter = map.entries();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(sz).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_4700
     * @tc.name readonlyMapPropertiesPart02Test047
     * @tc.desc Verify size keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      const sz: int = map.size;
      const iter = map.keys();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(sz).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_4800
     * @tc.name readonlyMapPropertiesPart02Test048
     * @tc.desc Verify size values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['p', 100], ['q', 200]]);
      const sz: int = map.size;
      const iter = map.values();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(sz).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_4900
     * @tc.name readonlyMapPropertiesPart02Test049
     * @tc.desc Verify size forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const sz: int = map.size;
      let count: number = 0;
      map.forEach((value: int, key: string) => {
        count = count + 1;
      });
      expect(count).assertEqual(sz);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_5000
     * @tc.name readonlyMapPropertiesPart02Test050
     * @tc.desc Verify entries size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const sz: int = map.size;
      let entryCount: number = 0;
      const iter = map.entries();
      let result = iter.next();
      while (!result.done) {
        entryCount = entryCount + 1;
        result = iter.next();
      }
      expect(entryCount).assertEqual(sz);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_5100
     * @tc.name readonlyMapPropertiesPart02Test051
     * @tc.desc Verify keys size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 10], ['y', 20], ['z', 30]]);
      const sz: int = map.size;
      let keyCount: number = 0;
      const iter = map.keys();
      let result = iter.next();
      while (!result.done) {
        keyCount = keyCount + 1;
        result = iter.next();
      }
      expect(keyCount).assertEqual(sz);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_5200
     * @tc.name readonlyMapPropertiesPart02Test052
     * @tc.desc Verify values size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['p', 100], ['q', 200], ['r', 300]]);
      const sz: int = map.size;
      let valCount: number = 0;
      const iter = map.values();
      let result = iter.next();
      while (!result.done) {
        valCount = valCount + 1;
        result = iter.next();
      }
      expect(valCount).assertEqual(sz);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_5300
     * @tc.name readonlyMapPropertiesPart02Test053
     * @tc.desc Verify forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let capturedSizes: int[] = [];
      map.forEach((value: int, key: string) => {
        capturedSizes.push(map.size);
      });
      expect(capturedSizes.length).assertEqual(2);
      expect(capturedSizes[0]).assertEqual(2);
      expect(capturedSizes[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_5400
     * @tc.name readonlyMapPropertiesPart02Test054
     * @tc.desc Verify size get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['key', 42]]);
      const sz: int = map.size;
      const valAfter: int | undefined = map.get('key');
      expect(valAfter).assertEqual(42);
      expect(sz).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_5500
     * @tc.name readonlyMapPropertiesPart02Test055
     * @tc.desc Verify size has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      const sz: int = map.size;
      const hasAfter: boolean = map.has('a');
      expect(hasAfter).assertTrue();
      expect(sz).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_5600
     * @tc.name readonlyMapPropertiesPart02Test056
     * @tc.desc Verify size entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const sz: int = map.size;
      let entryCount: number = 0;
      const iter = map.entries();
      let result = iter.next();
      while (!result.done) {
        entryCount = entryCount + 1;
        result = iter.next();
      }
      expect(entryCount).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_5700
     * @tc.name readonlyMapPropertiesPart02Test057
     * @tc.desc Verify entries == map2.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const map2: ReadonlyMap<string, int> = new Map<string, int>(map1);
      const mapFromIter: ReadonlyMap<string, int> = new Map<string, int>(map1.entries());
      expect(map1.size).assertEqual(map2.size);
      expect(map2.size).assertEqual(mapFromIter.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_5800
     * @tc.name readonlyMapPropertiesPart02Test058
     * @tc.desc Verify Map size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1: ReadonlyMap<string, int> = new Map<string, int>();
      const map2: ReadonlyMap<string, int> = new Map<string, int>(null);
      const map3: ReadonlyMap<string, int> = new Map<string, int>(8);
      expect(map1.size).assertEqual(0);
      expect(map2.size).assertEqual(0);
      expect(map3.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_5900
     * @tc.name readonlyMapPropertiesPart02Test059
     * @tc.desc Verify ReadonlyMap shared state source modification visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>([['a', 1]]);
      const ro: Map<string, int> = source as Map<string, int>;
      source.set('b', 2);
      expect(ro.size).assertEqual(2);
      expect(ro.has('b')).assertTrue();
      source.delete('a');
      expect(ro.size).assertEqual(1);
      expect(ro.has('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_6000
     * @tc.name readonlyMapPropertiesPart02Test060
     * @tc.desc Verify forEach callback third param identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ro: ReadonlyMap<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      let identityConfirmed: boolean = false;
      ro.forEach((value: int, key: string, m: ReadonlyMap<string, int>): void => {
        if (!identityConfirmed) {
          expect(m).assertEqual(ro);
          identityConfirmed = true;
        }
      });
      expect(identityConfirmed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART02_TEST_6100
     * @tc.name readonlyMapPropertiesPart02Test061
     * @tc.desc Verify ReadonlyMap forEach identity after source modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>([['before', 1]]);
      const ro: Map<string, int> = source as Map<string, int>;
      source.set('after', 2);
      let count: int = 0;
      ro.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(m).assertEqual(ro);
        count++;
      });
      expect(count).assertEqual(2);
    });

  });
}
