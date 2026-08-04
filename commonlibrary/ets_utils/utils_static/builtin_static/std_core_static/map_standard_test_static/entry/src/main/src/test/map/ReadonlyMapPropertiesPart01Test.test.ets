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

export default function readonlyMapPropertiesPart01TestTest(): void {
  describe('ReadonlyMapPropertiesPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_0100
     * @tc.name readonlyMapPropertiesPart01Test001
     * @tc.desc Verify 1 Map size Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const map: ReadonlyMap<string, int> = new Map<string, int>(source);
      expect(map.size).assertEqual(source.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_0200
     * @tc.name readonlyMapPropertiesPart01Test002
     * @tc.desc Verify entries size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = new Map<string, int>(empty.entries());
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_0300
     * @tc.name readonlyMapPropertiesPart01Test003
     * @tc.desc Verify entries 1 size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['key', 100]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_0400
     * @tc.name readonlyMapPropertiesPart01Test004
     * @tc.desc Verify entries key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['a', 2], ['a', 3]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_0500
     * @tc.name readonlyMapPropertiesPart01Test005
     * @tc.desc Verify entries key size key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['a', 3]]);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_0600
     * @tc.name readonlyMapPropertiesPart01Test006
     * @tc.desc Verify entries key size key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 10], ['y', 20], ['x', 30], ['z', 40], ['y', 50]]);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_0700
     * @tc.name readonlyMapPropertiesPart01Test007
     * @tc.desc Verify entries key null size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, int> = new Map<string | null, int>([[null, 1]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_0800
     * @tc.name readonlyMapPropertiesPart01Test008
     * @tc.desc Verify entries key undefined size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | undefined, int> = new Map<string | undefined, int>([[undefined, 1]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_0900
     * @tc.name readonlyMapPropertiesPart01Test009
     * @tc.desc Verify entries null key key size=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, int> = new Map<string | null, int>([[null, 1], ['a', 2]]);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_1000
     * @tc.name readonlyMapPropertiesPart01Test010
     * @tc.desc Verify entries key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['', 1]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_1100
     * @tc.name readonlyMapPropertiesPart01Test011
     * @tc.desc Verify entries key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['​', 1]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_1200
     * @tc.name readonlyMapPropertiesPart01Test012
     * @tc.desc Verify entries key emoji size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['😀', 1]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_1300
     * @tc.name readonlyMapPropertiesPart01Test013
     * @tc.desc Verify entries key XSS size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['<script>alert(1)</script>', 1]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_1400
     * @tc.name readonlyMapPropertiesPart01Test014
     * @tc.desc Verify entries key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk' +
        'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk' +
        'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
      const map: ReadonlyMap<string, int> = new Map<string, int>([[longKey, 1]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_1500
     * @tc.name readonlyMapPropertiesPart01Test015
     * @tc.desc Verify entries value null size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int | null> = new Map<string, int | null>([['a', null]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_1600
     * @tc.name readonlyMapPropertiesPart01Test016
     * @tc.desc Verify entries value undefined size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int | undefined> = new Map<string, int | undefined>([['a', undefined]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_1700
     * @tc.name readonlyMapPropertiesPart01Test017
     * @tc.desc Verify entries key int size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[0, 'zero']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_1800
     * @tc.name readonlyMapPropertiesPart01Test018
     * @tc.desc Verify entries key int -1 size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[-1, 'minus_one']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_1900
     * @tc.name readonlyMapPropertiesPart01Test019
     * @tc.desc Verify entries key 2147483647 size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[2147483647, 'max']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_2000
     * @tc.name readonlyMapPropertiesPart01Test020
     * @tc.desc Verify entries key (-2147483647 - 1) size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[-2147483648, 'min']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_2100
     * @tc.name readonlyMapPropertiesPart01Test021
     * @tc.desc Verify entries key 0x int size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[0x1A, 'hex']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_2200
     * @tc.name readonlyMapPropertiesPart01Test022
     * @tc.desc Verify entries key 0b int size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[0b1010, 'bin']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_2300
     * @tc.name readonlyMapPropertiesPart01Test023
     * @tc.desc Verify entries key 0o int size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[0o77, 'oct']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_2400
     * @tc.name readonlyMapPropertiesPart01Test024
     * @tc.desc Verify entries key number size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[3.14, 'pi']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_2500
     * @tc.name readonlyMapPropertiesPart01Test025
     * @tc.desc Verify entries key number NaN size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[Number.NaN, 'nan']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_2600
     * @tc.name readonlyMapPropertiesPart01Test026
     * @tc.desc Verify entries key Number.POSITIVE_INFINITY size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[Number.POSITIVE_INFINITY, 'inf']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_2700
     * @tc.name readonlyMapPropertiesPart01Test027
     * @tc.desc Verify entries key Number.NEGATIVE_INFINITY size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[Number.NEGATIVE_INFINITY, 'ninf']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_2800
     * @tc.name readonlyMapPropertiesPart01Test028
     * @tc.desc Verify entries key -0.0 size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[-0.0, 'neg_zero']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_2900
     * @tc.name readonlyMapPropertiesPart01Test029
     * @tc.desc Verify entries key boolean true size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 'true_val']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_3000
     * @tc.name readonlyMapPropertiesPart01Test030
     * @tc.desc Verify entries key boolean false size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[false, 'false_val']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_3100
     * @tc.name readonlyMapPropertiesPart01Test031
     * @tc.desc Verify entries true false key size 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 't'], [false, 'f']]);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_3200
     * @tc.name readonlyMapPropertiesPart01Test032
     * @tc.desc Verify entries key long size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(1), 'one']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_3300
     * @tc.name readonlyMapPropertiesPart01Test033
     * @tc.desc Verify entries key long.MAX size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[9223372036854775807, 'lmax']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_3400
     * @tc.name readonlyMapPropertiesPart01Test034
     * @tc.desc Verify entries key long.MIN size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[(-9223372036854775807 - 1), 'lmin']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_3500
     * @tc.name readonlyMapPropertiesPart01Test035
     * @tc.desc Verify entries Map entries size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const map: ReadonlyMap<string, int> = new Map<string, int>(source.entries());
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_3600
     * @tc.name readonlyMapPropertiesPart01Test036
     * @tc.desc Verify entries key Map entries size key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>([['a', 1], ['a', 2], ['b', 3]]);
      const map: ReadonlyMap<string, int> = new Map<string, int>(source.entries());
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_3700
     * @tc.name readonlyMapPropertiesPart01Test037
     * @tc.desc Verify entries 100 key size 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: Array<[int, int]> = [];
      for (let i = 0; i < 100; i++) {
        entries.push([i, i * 10]);
      }
      const map: ReadonlyMap<int, int> = new Map<int, int>(entries);
      expect(map.size).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_3800
     * @tc.name readonlyMapPropertiesPart01Test038
     * @tc.desc Verify Map size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = new Map<string, int>(source);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_3900
     * @tc.name readonlyMapPropertiesPart01Test039
     * @tc.desc Verify Map size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>([['a', 1]]);
      const map: ReadonlyMap<string, int> = new Map<string, int>(source);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_4000
     * @tc.name readonlyMapPropertiesPart01Test040
     * @tc.desc Verify Map size size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3], ['d', 4]]);
      const map: ReadonlyMap<string, int> = new Map<string, int>(source);
      expect(map.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_4100
     * @tc.name readonlyMapPropertiesPart01Test041
     * @tc.desc Verify key Map size key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>([['x', 1], ['x', 2], ['y', 3]]);
      const map: ReadonlyMap<string, int> = new Map<string, int>(source);
      expect(map.size).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_4200
     * @tc.name readonlyMapPropertiesPart01Test042
     * @tc.desc Verify bucketsCount=256 Map size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>(256);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_4300
     * @tc.name readonlyMapPropertiesPart01Test043
     * @tc.desc Verify bucketsCount=(-2147483647 - 1) Map size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>(-2147483648);
      expect(map.size).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_4400
     * @tc.name readonlyMapPropertiesPart01Test044
     * @tc.desc Verify size K=int V=string == 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_4500
     * @tc.name readonlyMapPropertiesPart01Test045
     * @tc.desc Verify entries null size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, boolean> = new Map<number, boolean>(null);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_4600
     * @tc.name readonlyMapPropertiesPart01Test046
     * @tc.desc Verify entries Array< > size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['k1', 10], ['k2', 20], ['k3', 30]]);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_4700
     * @tc.name readonlyMapPropertiesPart01Test047
     * @tc.desc Verify Map size Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, string> = new Map<long, string>([[Int.toLong(1), 'a'], [Int.toLong(2), 'b']]);
      const map: ReadonlyMap<long, string> = new Map<long, string>(src);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_4800
     * @tc.name readonlyMapPropertiesPart01Test048
     * @tc.desc Verify bucketsCount size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>(128);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_4900
     * @tc.name readonlyMapPropertiesPart01Test049
     * @tc.desc Verify entries Array size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed: Array<[string, int]> = [['f1', 1], ['f2', 2]];
      const map: ReadonlyMap<string, int> = new Map<string, int>(fixed);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_5000
     * @tc.name readonlyMapPropertiesPart01Test050
     * @tc.desc Verify Array key size key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed: Array<[string, int]> = [['dup', 1], ['dup', 2]];
      const map: ReadonlyMap<string, int> = new Map<string, int>(fixed);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_PROPERTIES_PART01_TEST_5100
     * @tc.name readonlyMapPropertiesPart01Test051
     * @tc.desc Verify entries size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapPropertiesPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readonlyEntries: readonly [string, int][] = [['r1', 1], ['r2', 2]];
      const map: ReadonlyMap<string, int> = new Map<string, int>(readonlyEntries);
      expect(map.size).assertEqual(2);
    });

  });
}
