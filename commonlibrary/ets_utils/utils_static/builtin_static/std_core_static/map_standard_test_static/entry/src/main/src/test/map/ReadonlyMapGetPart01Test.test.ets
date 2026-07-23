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

interface Item { id: int; label: string; }

export default function readonlyMapGetPart01TestTest(): void {
  describe('ReadonlyMapGetPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_0100
     * @tc.name readonlyMapGetPart01Test001
     * @tc.desc Verify 1 get Map key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let result: int | undefined = map.get('b');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_0200
     * @tc.name readonlyMapGetPart01Test002
     * @tc.desc Verify 1 get Map size=0 key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      let result: int | undefined = map.get('anykey');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_0300
     * @tc.name readonlyMapGetPart01Test003
     * @tc.desc Verify string key "hello" V=string get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string> = new Map<string, string>([['hello', 'world']]);
      let result: string | undefined = map.get('hello');
      expect(result).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_0400
     * @tc.name readonlyMapGetPart01Test004
     * @tc.desc Verify string key "hello" V=boolean true get true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, boolean> = new Map<string, boolean>([['hello', true]]);
      let result: boolean | undefined = map.get('hello');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_0500
     * @tc.name readonlyMapGetPart01Test005
     * @tc.desc Verify string key "hello" V=null get null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string | null> = new Map<string, string | null>([['hello', null]]);
      let result: string | null | undefined = map.get('hello');
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_0600
     * @tc.name readonlyMapGetPart01Test006
     * @tc.desc Verify string key "hello" V=undefined get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string | undefined> = new Map<string, string | undefined>([['hello', undefined]]);
      let result: string | undefined = map.get('hello');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_0700
     * @tc.name readonlyMapGetPart01Test007
     * @tc.desc Verify string key "hello" V=Date get Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(1000);
      const map: ReadonlyMap<string, Date> = new Map<string, Date>([['hello', d]]);
      let result: Date | undefined = map.get('hello');
      expect(result!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_0800
     * @tc.name readonlyMapGetPart01Test008
     * @tc.desc Verify string key "hello" V=object interface get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Item = { id: 1, label: 'test' };
      const map: ReadonlyMap<string, Item> = new Map<string, Item>([['hello', obj]]);
      let result: Item | undefined = map.get('hello');
      expect(result!.id).assertEqual(1);
      expect(result!.label).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_0900
     * @tc.name readonlyMapGetPart01Test009
     * @tc.desc Verify string key "hello" V=Array<int> get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      const map: ReadonlyMap<string, int[]> = new Map<string, int[]>([['hello', arr]]);
      let result: int[] | undefined = map.get('hello');
      expect(result!).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_1000
     * @tc.name readonlyMapGetPart01Test010
     * @tc.desc Verify string key "hello" key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['world', 99]]);
      let result: int | undefined = map.get('hello');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_1100
     * @tc.name readonlyMapGetPart01Test011
     * @tc.desc Verify string key get returns value and preserves size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['hello', 100]]);
      expect(map.size).assertEqual(1);
      let result: int | undefined = map.get('hello');
      expect(result).assertEqual(100);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_1200
     * @tc.name readonlyMapGetPart01Test012
     * @tc.desc Verify 10000 string key V=int get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'x'.repeat(10000);
      const map: ReadonlyMap<string, int> = new Map<string, int>([[longKey, 777]]);
      let result: int | undefined = map.get(longKey);
      expect(result).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_1300
     * @tc.name readonlyMapGetPart01Test013
     * @tc.desc Verify 10000 string key V=string get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'x'.repeat(10000);
      const map: ReadonlyMap<string, string> = new Map<string, string>([[longKey, 'value10000']]);
      let result: string | undefined = map.get(longKey);
      expect(result).assertEqual('value10000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_1400
     * @tc.name readonlyMapGetPart01Test014
     * @tc.desc Verify 10000 string key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'x'.repeat(10000);
      let otherKey: string = 'y'.repeat(10000);
      const map: ReadonlyMap<string, int> = new Map<string, int>([[longKey, 1]]);
      let result: int | undefined = map.get(otherKey);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_1500
     * @tc.name readonlyMapGetPart01Test015
     * @tc.desc Verify 10000 string key Map get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'x'.repeat(10000);
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      let result: int | undefined = map.get(longKey);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_1600
     * @tc.name readonlyMapGetPart01Test016
     * @tc.desc Verify 10000 string key Map key get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'x'.repeat(10000);
      const map: ReadonlyMap<string, int> = new Map<string, int>([['short', 1], [longKey, 999], ['another', 2]]);
      let result: int | undefined = map.get(longKey);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_1700
     * @tc.name readonlyMapGetPart01Test017
     * @tc.desc Verify int key=MIN V=string get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[-2147483648, 'minval']]);
      let result: string | undefined = map.get(-2147483648);
      expect(result).assertEqual('minval');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_1800
     * @tc.name readonlyMapGetPart01Test018
     * @tc.desc Verify int key=MIN V=int get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, int> = new Map<int, int>([[-2147483648, 1]]);
      let result: int | undefined = map.get(-2147483648);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_1900
     * @tc.name readonlyMapGetPart01Test019
     * @tc.desc Verify int key=MIN V=boolean false get false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, boolean> = new Map<int, boolean>([[-2147483648, false]]);
      let result: boolean | undefined = map.get(-2147483648);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_2000
     * @tc.name readonlyMapGetPart01Test020
     * @tc.desc Verify int key=MIN V=null get null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string | null> = new Map<int, string | null>([[-2147483648, null]]);
      let result: string | null | undefined = map.get(-2147483648);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_2100
     * @tc.name readonlyMapGetPart01Test021
     * @tc.desc Verify int key=MIN V=double get double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, double> = new Map<int, double>([[-2147483648, -0.0]]);
      let result: double | undefined = map.get(-2147483648);
      expect(result).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_2200
     * @tc.name readonlyMapGetPart01Test022
     * @tc.desc Verify int key=MIN Map int key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[0, 'zero'], [1, 'one']]);
      let result: string | undefined = map.get(-2147483648);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_2300
     * @tc.name readonlyMapGetPart01Test023
     * @tc.desc Verify int key=MIN Map get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>();
      let result: string | undefined = map.get(-2147483648);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_2400
     * @tc.name readonlyMapGetPart01Test024
     * @tc.desc Verify int key=MIN int key MAX undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[2147483647, 'max']]);
      let result: string | undefined = map.get(-2147483648);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_2500
     * @tc.name readonlyMapGetPart01Test025
     * @tc.desc Verify long key=MIN V=string get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[(-9223372036854775807 - 1), 'longmin']]);
      let result: string | undefined = map.get((-9223372036854775807 - 1));
      expect(result).assertEqual('longmin');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_2600
     * @tc.name readonlyMapGetPart01Test026
     * @tc.desc Verify long key=MIN V=int get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, int> = new Map<long, int>([[(-9223372036854775807 - 1), 42]]);
      let result: int | undefined = map.get((-9223372036854775807 - 1));
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_2700
     * @tc.name readonlyMapGetPart01Test027
     * @tc.desc Verify long key=MIN V=boolean true get true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, boolean> = new Map<long, boolean>([[(-9223372036854775807 - 1), true]]);
      let result: boolean | undefined = map.get((-9223372036854775807 - 1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_2800
     * @tc.name readonlyMapGetPart01Test028
     * @tc.desc Verify long key=MIN Map long key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(0), 'zero'], [Int.toLong(1), 'one']]);
      let result: string | undefined = map.get((-9223372036854775807 - 1));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_2900
     * @tc.name readonlyMapGetPart01Test029
     * @tc.desc Verify long key=MIN Map get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>();
      let result: string | undefined = map.get((-9223372036854775807 - 1));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_3000
     * @tc.name readonlyMapGetPart01Test030
     * @tc.desc Verify long key=MIN long key MAX undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[9223372036854775807, 'max']]);
      let result: string | undefined = map.get((-9223372036854775807 - 1));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_3100
     * @tc.name readonlyMapGetPart01Test031
     * @tc.desc Verify double key=-0.0 V=string get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[-0.0, 'negzero']]);
      let result: string | undefined = map.get(-0.0);
      expect(result).assertEqual('negzero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_3200
     * @tc.name readonlyMapGetPart01Test032
     * @tc.desc Verify double key=-0.0 V=int get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, int> = new Map<double, int>([[-0.0, 999]]);
      let result: int | undefined = map.get(-0.0);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_3300
     * @tc.name readonlyMapGetPart01Test033
     * @tc.desc Verify double key=-0.0 V=boolean get boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, boolean> = new Map<double, boolean>([[-0.0, false]]);
      let result: boolean | undefined = map.get(-0.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_3400
     * @tc.name readonlyMapGetPart01Test034
     * @tc.desc Verify double key=-0.0 Map get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>();
      let result: string | undefined = map.get(-0.0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_3500
     * @tc.name readonlyMapGetPart01Test035
     * @tc.desc Verify double key=-0.0 Map double key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[1.5, 'onehalf']]);
      let result: string | undefined = map.get(-0.0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_3600
     * @tc.name readonlyMapGetPart01Test036
     * @tc.desc Verify double key=-0.0 +0.0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[-0.0, 'negzero']]);
      let result: string | undefined = map.get(0.0);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_3700
     * @tc.name readonlyMapGetPart01Test037
     * @tc.desc Verify double key=+0.0 -0.0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[0.0, 'poszero']]);
      let result: string | undefined = map.get(-0.0);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_3800
     * @tc.name readonlyMapGetPart01Test038
     * @tc.desc Verify boolean key=false V=string get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[false, 'falsy']]);
      let result: string | undefined = map.get(false);
      expect(result).assertEqual('falsy');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_3900
     * @tc.name readonlyMapGetPart01Test039
     * @tc.desc Verify boolean key=false V=int get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, int> = new Map<boolean, int>([[false, 0]]);
      let result: int | undefined = map.get(false);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_4000
     * @tc.name readonlyMapGetPart01Test040
     * @tc.desc Verify boolean key=false V=boolean true get boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, boolean> = new Map<boolean, boolean>([[false, true]]);
      let result: boolean | undefined = map.get(false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_4100
     * @tc.name readonlyMapGetPart01Test041
     * @tc.desc Verify boolean key=false Map get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>();
      let result: string | undefined = map.get(false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_4200
     * @tc.name readonlyMapGetPart01Test042
     * @tc.desc Verify boolean key=false true undefined boolean key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[false, 'falsy']]);
      let result: string | undefined = map.get(true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_4300
     * @tc.name readonlyMapGetPart01Test043
     * @tc.desc Verify boolean key=true false undefined boolean key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 'truthy']]);
      let result: string | undefined = map.get(false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_4400
     * @tc.name readonlyMapGetPart01Test044
     * @tc.desc Verify boolean key=false Map get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, int> = new Map<boolean, int>();
      let result: int | undefined = map.get(false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_4500
     * @tc.name readonlyMapGetPart01Test045
     * @tc.desc Verify null key V=string get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, string> = new Map<string | null, string>([[null, 'nullval']]);
      let result: string | undefined = map.get(null);
      expect(result).assertEqual('nullval');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_4600
     * @tc.name readonlyMapGetPart01Test046
     * @tc.desc Verify null key V=int get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, int> = new Map<string | null, int>([[null, 123]]);
      let result: int | undefined = map.get(null);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_4700
     * @tc.name readonlyMapGetPart01Test047
     * @tc.desc Verify null key V=boolean get boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, boolean> = new Map<string | null, boolean>([[null, true]]);
      let result: boolean | undefined = map.get(null);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_4800
     * @tc.name readonlyMapGetPart01Test048
     * @tc.desc Verify null key Map key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, int> = new Map<string | null, int>([['somekey', 99]]);
      let result: int | undefined = map.get(null);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_4900
     * @tc.name readonlyMapGetPart01Test049
     * @tc.desc Verify null key Map get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, int> = new Map<string | null, int>();
      let result: int | undefined = map.get(null);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_5000
     * @tc.name readonlyMapGetPart01Test050
     * @tc.desc Verify null key "null" null "null" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, int> = new Map<string | null, int>([[null, 777]]);
      let result: int | undefined = map.get('null');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_5100
     * @tc.name readonlyMapGetPart01Test051
     * @tc.desc Verify null key undefined null undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null | undefined, int> = new Map<string | null | undefined, int>([[null, 888]]);
      let result: int | undefined = map.get(undefined);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_5200
     * @tc.name readonlyMapGetPart01Test052
     * @tc.desc Verify short key=MIN V=string get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[-32768 as short, 'shortmin']]);
      let result: string | undefined = map.get(-32768 as short);
      expect(result).assertEqual('shortmin');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_5300
     * @tc.name readonlyMapGetPart01Test053
     * @tc.desc Verify short key=MIN V=int get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, int> = new Map<short, int>([[-32768 as short, 999]]);
      let result: int | undefined = map.get(-32768 as short);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_5400
     * @tc.name readonlyMapGetPart01Test054
     * @tc.desc Verify short key=MIN Map short key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[0 as short, 'zero'], [32767 as short, 'max']]);
      let result: string | undefined = map.get(-32768 as short);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_5500
     * @tc.name readonlyMapGetPart01Test055
     * @tc.desc Verify short key=MIN Map get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>();
      let result: string | undefined = map.get(-32768 as short);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_5600
     * @tc.name readonlyMapGetPart01Test056
     * @tc.desc Verify short key=0 short MIN short key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[0 as short, 'zero']]);
      let result: string | undefined = map.get(-32768 as short);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_5700
     * @tc.name readonlyMapGetPart01Test057
     * @tc.desc Verify int hex key=0x1A V=string get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[0x1A, 'hexval']]);
      let result: string | undefined = map.get(0x1A);
      expect(result).assertEqual('hexval');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_5800
     * @tc.name readonlyMapGetPart01Test058
     * @tc.desc Verify int hex key=0x1A V=int get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, int> = new Map<int, int>([[0x1A, 99]]);
      let result: int | undefined = map.get(0x1A);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_5900
     * @tc.name readonlyMapGetPart01Test059
     * @tc.desc Verify int hex key=0x1A 26 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, int> = new Map<int, int>([[0x1A, 100]]);
      let result: int | undefined = map.get(26);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_6000
     * @tc.name readonlyMapGetPart01Test060
     * @tc.desc Verify int 26 hex 0x1A key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, int> = new Map<int, int>([[26, 200]]);
      let result: int | undefined = map.get(0x1A);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_6100
     * @tc.name readonlyMapGetPart01Test061
     * @tc.desc Verify int hex key=0x1A Map get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>();
      let result: string | undefined = map.get(0x1A);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_6200
     * @tc.name readonlyMapGetPart01Test062
     * @tc.desc Verify int hex key=0x1A Map int key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[100, 'hundred']]);
      let result: string | undefined = map.get(0x1A);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_6300
     * @tc.name readonlyMapGetPart01Test063
     * @tc.desc Verify key set value get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['key', 1], ['key', 999]]);
      let result: int | undefined = map.get('key');
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_6400
     * @tc.name readonlyMapGetPart01Test064
     * @tc.desc Verify key value size get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['a', 100]]);
      const sizeBefore: int = map.size;
      map.get('a');
      const sizeAfter: int = map.size;
      expect(sizeAfter).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_6500
     * @tc.name readonlyMapGetPart01Test065
     * @tc.desc Verify key key get key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['a', 10], ['b', 2]]);
      let result: int | undefined = map.get('a');
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_6600
     * @tc.name readonlyMapGetPart01Test066
     * @tc.desc Verify key get set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 1], ['x', 2], ['x', 3], ['x', 4]]);
      let result: int | undefined = map.get('x');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_6700
     * @tc.name readonlyMapGetPart01Test067
     * @tc.desc Verify Map get key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['second', 2], ['third', 3]]);
      let result: int | undefined = map.get('first');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_6800
     * @tc.name readonlyMapGetPart01Test068
     * @tc.desc Verify Map get key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['second', 2], ['third', 3]]);
      let result: int | undefined = map.get('third');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_6900
     * @tc.name readonlyMapGetPart01Test069
     * @tc.desc Verify Map get key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['middle', 5], ['last', 9]]);
      let result: int | undefined = map.get('middle');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART01_TEST_7000
     * @tc.name readonlyMapGetPart01Test070
     * @tc.desc Verify key set get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['original', 42], ['other', 99]]);
      let result: int | undefined = map.get('original');
      expect(result).assertEqual(42);
    });


  });
}
