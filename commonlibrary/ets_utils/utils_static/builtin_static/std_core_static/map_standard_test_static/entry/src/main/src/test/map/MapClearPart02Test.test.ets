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

class ObjVal {
  name: string = '';
}

export default function mapClearPart02TestTest(): void {
  describe('MapClearPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_0100
     * @tc.name mapClearPart02Test001
     * @tc.desc Verify typeof clear() undefined Map<string, int> clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['alpha', 10], ['beta', 20]]);
      let ret = m.clear();
      expect(ret).assertUndefined();
      expect(m.size).assertEqual(0);
      expect(typeof m.clear()).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_0200
     * @tc.name mapClearPart02Test002
     * @tc.desc Verify clear size 0 Map<string, int> entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_0300
     * @tc.name mapClearPart02Test003
     * @tc.desc Verify clear size 0 Map clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_0400
     * @tc.name mapClearPart02Test004
     * @tc.desc Verify clear size 0 Map<int, int> int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>([[2147483647, 1], [(-2147483648), 2], [0, 3]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_0500
     * @tc.name mapClearPart02Test005
     * @tc.desc Verify clear size 0 Map<boolean, int> true false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>([[true, 1], [false, 0]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_0600
     * @tc.name mapClearPart02Test006
     * @tc.desc Verify clear size 0 Map key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['', 0], ['nonempty', 1]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_0700
     * @tc.name mapClearPart02Test007
     * @tc.desc Verify clear size 0 Map unicode emoji key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['😀', 1], ['🚀', 2]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_0800
     * @tc.name mapClearPart02Test008
     * @tc.desc Verify clear size 0 Map key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'x'.repeat(10000);
      const m: Map<string, int> = new Map<string, int>([[longKey, 999]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_0900
     * @tc.name mapClearPart02Test009
     * @tc.desc Verify clear size 0 Map key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['​', 1], ['visible', 2]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_1000
     * @tc.name mapClearPart02Test010
     * @tc.desc Verify clear size 0 Map XSS key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['<script>alert(1)</script>', 1]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_1100
     * @tc.name mapClearPart02Test011
     * @tc.desc Verify clear size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[42, 'answer']]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_1200
     * @tc.name mapClearPart02Test012
     * @tc.desc Verify clear set entry size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['old', 100]]);
      m.clear();
      m.set('new', 200);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_1300
     * @tc.name mapClearPart02Test013
     * @tc.desc Verify clear set entry size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      m.clear();
      m.set('x', 10);
      m.set('y', 20);
      m.set('z', 30);
      expect(m.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_1400
     * @tc.name mapClearPart02Test014
     * @tc.desc Verify clear size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      m.clear();
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_1500
     * @tc.name mapClearPart02Test015
     * @tc.desc Verify clear size 0 Map null undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int | null | undefined> = new Map<string, int | null | undefined>();
      m.set('a', 1);
      m.set('b', null);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_1600
     * @tc.name mapClearPart02Test016
     * @tc.desc Verify clear Map null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_1700
     * @tc.name mapClearPart02Test017
     * @tc.desc Verify clear Map clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const other: Map<string, int> = new Map<string, int>([['x', 9]]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(other.size).assertEqual(1);
      expect(other.get('x')).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_1800
     * @tc.name mapClearPart02Test018
     * @tc.desc Verify clear Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>([[1.5, 'a'], [2.5, 'b']]);
      m.clear();
      expect(m instanceof Map).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_1900
     * @tc.name mapClearPart02Test019
     * @tc.desc Verify clear Map has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['key', 100]]);
      m.clear();
      let result: boolean = m.has('key');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_2000
     * @tc.name mapClearPart02Test020
     * @tc.desc Verify clear Map get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k1', 11], ['k2', 22]]);
      m.clear();
      let result: int | undefined = m.get('k1');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_2100
     * @tc.name mapClearPart02Test021
     * @tc.desc Verify clear Map set entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['before', 1]]);
      m.clear();
      m.set('after', 2);
      expect(m.get('after')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_2200
     * @tc.name mapClearPart02Test022
     * @tc.desc Verify clear Map delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['item', 5]]);
      m.clear();
      let deleted: boolean = m.delete('item');
      expect(deleted).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_2300
     * @tc.name mapClearPart02Test023
     * @tc.desc Verify clear Map forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1], ['y', 2]]);
      m.clear();
      let callCount: int = 0;
      m.forEach((_value: int, _key: string): void => {
        callCount++;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_2400
     * @tc.name mapClearPart02Test024
     * @tc.desc Verify clear then set new entry size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['chainTest', 1]]);
      m.clear();
      m.set('newKey', 42);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_2500
     * @tc.name mapClearPart02Test025
     * @tc.desc Verify clear() void typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['v', 1], ['w', 2]]);
      m.clear();
      let ret = m.clear();
      expect(typeof ret).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_2600
     * @tc.name mapClearPart02Test026
     * @tc.desc Verify clear undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['p', 1], ['q', 2]]);
      m.clear();
      let r1 = m.clear();
      let r2 = m.clear();
      expect(r1).assertUndefined();
      expect(r2).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_2700
     * @tc.name mapClearPart02Test027
     * @tc.desc Verify clear() Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['self', 1]]);
      m.clear();
      let ret = m.clear();
      expect(ret).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_2800
     * @tc.name mapClearPart02Test028
     * @tc.desc Verify clear() Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['old_a', 10], ['old_b', 20]]);
      m.clear();
      m.set('fresh', 30);
      expect(m.get('old_a')).assertUndefined();
      expect(m.get('fresh')).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_2900
     * @tc.name mapClearPart02Test029
     * @tc.desc Verify clear Map 2147483647 value size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['maxVal', 2147483647]]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('maxVal')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_3000
     * @tc.name mapClearPart02Test030
     * @tc.desc Verify clear Map (-2147483647 - 1) value size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['minVal', (-2147483648)]]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('minVal')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_3100
     * @tc.name mapClearPart02Test031
     * @tc.desc Verify clear Map 2147483647 key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[2147483647, 'maxKey']]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(2147483647)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_3200
     * @tc.name mapClearPart02Test032
     * @tc.desc Verify clear Map (-2147483647 - 1) key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[(-2147483648), 'minKey']]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(-2147483648)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_3300
     * @tc.name mapClearPart02Test033
     * @tc.desc Verify clear Map NaN key NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>([[Number.NaN, 999]]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_3400
     * @tc.name mapClearPart02Test034
     * @tc.desc Verify clear Map Infinity key Infinity key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>([[Number.POSITIVE_INFINITY, 1]]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(Number.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_3500
     * @tc.name mapClearPart02Test035
     * @tc.desc Verify clear Map -Infinity key -Infinity key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>([[Number.NEGATIVE_INFINITY, 1]]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(Number.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_3600
     * @tc.name mapClearPart02Test036
     * @tc.desc Verify clear Map -0.0 key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>([[-0.0, 1], [0.0, 2]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_3700
     * @tc.name mapClearPart02Test037
     * @tc.desc Verify clear Map null key null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | null, int> = new Map<string | null, int>();
      m.set('a', 1);
      m.set(null, 2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(null)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_3800
     * @tc.name mapClearPart02Test038
     * @tc.desc Verify clear Map double key double.MAX_VALUE double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>([[1.7976931348623157e308, 1], [5e-324, 2]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_3900
     * @tc.name mapClearPart02Test039
     * @tc.desc Verify clear Map long.MAX key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>([[9223372036854775807, 'lmax']]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(9223372036854775807)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_4000
     * @tc.name mapClearPart02Test040
     * @tc.desc Verify clear Map long.MIN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>([[((-9223372036854775807 - 1)), 'lmin']]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has((-9223372036854775807 - 1))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_4100
     * @tc.name mapClearPart02Test041
     * @tc.desc Verify clear Map byte.MAX byte.MIN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, int> = new Map<byte, int>([[127 as byte, 10], [(-128) as byte, 20]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_4200
     * @tc.name mapClearPart02Test042
     * @tc.desc Verify clear Map short.MAX short.MIN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>([[32767 as short, 'max'], [(-32768) as short, 'min']]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_4300
     * @tc.name mapClearPart02Test043
     * @tc.desc Verify clear Map boolean key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>([[true, 1], [false, 0]]);
      m.clear();
      m.set(true, 10);
      m.set(false, 20);
      expect(m.size).assertEqual(2);
      expect(m.get(true)).assertEqual(10);
      expect(m.get(false)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_4400
     * @tc.name mapClearPart02Test044
     * @tc.desc Verify clear key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.clear();
      for (let i: int = 0; i < 1000; i++) {
        m.set('k' + i.toString(), i);
      }
      expect(m.size).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_4500
     * @tc.name mapClearPart02Test045
     * @tc.desc Verify clear Map 0 -0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>([[-0.0, 1], [0.0, 2]]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(-0.0)).assertFalse();
      expect(m.has(0.0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_4600
     * @tc.name mapClearPart02Test046
     * @tc.desc Verify clear Map set/delete clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.delete('a');
      m.set('c', 3);
      m.delete('c');
      m.set('d', 4);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has('d')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_4700
     * @tc.name mapClearPart02Test047
     * @tc.desc Verify clear Map Date key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(2025, 0, 1);
      let d2: Date = new Date(2025, 0, 1);
      const m: Map<Date, int> = new Map<Date, int>();
      m.set(d1, 100);
      m.set(d2, 200);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(d1)).assertFalse();
      expect(m.has(d2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_4800
     * @tc.name mapClearPart02Test048
     * @tc.desc Verify clear Map RegExp key pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('test');
      let r2: RegExp = new RegExp('test');
      const m: Map<RegExp, string> = new Map<RegExp, string>();
      m.set(r1, 'first');
      m.set(r2, 'second');
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_4900
     * @tc.name mapClearPart02Test049
     * @tc.desc Verify clear Map bigint key bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<bigint, int> = new Map<bigint, int>([[9223372036854775807n, 1]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_5000
     * @tc.name mapClearPart02Test050
     * @tc.desc Verify clear Map 2147483647 entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['fill1', 1], ['fill2', 2], ['fill3', 3]]);
      m.clear();
      for (let i: int = 0; i < 500; i++) {
        m.set('idx' + i.toString(), i);
      }
      expect(m.size).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_5100
     * @tc.name mapClearPart02Test051
     * @tc.desc Verify clear Map float NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, int> = new Map<float, int>();
      m.set(Float.NaN, 99);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_5200
     * @tc.name mapClearPart02Test052
     * @tc.desc Verify clear Map double NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>();
      m.set(Number.NaN, 'nanVal');
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_5300
     * @tc.name mapClearPart02Test053
     * @tc.desc Verify clear Map entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x1', 1], ['x2', 2], ['x3', 3]]);
      m.clear();
      m.set('y1', 10);
      m.set('y2', 20);
      m.set('y3', 30);
      expect(m.size).assertEqual(3);
      expect(m.get('y2')).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_5400
     * @tc.name mapClearPart02Test054
     * @tc.desc Verify clear char key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<char, string> = new Map<char, string>([[c'A', 'Alpha'], [c'B', 'Beta']]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_5500
     * @tc.name mapClearPart02Test055
     * @tc.desc Verify clear float key float.MAX_VALUE float.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, int> = new Map<float, int>([[Float.MAX_VALUE, 1], [Double.toFloat(1.4e-45), 2]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_5600
     * @tc.name mapClearPart02Test056
     * @tc.desc Verify clear 0x int key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[0xFF, 'hex'], [0o77, 'oct'], [0b1010, 'bin']]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_5700
     * @tc.name mapClearPart02Test057
     * @tc.desc Verify clear number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>([[1e10, 10], [2.5e-3, 20]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_5800
     * @tc.name mapClearPart02Test058
     * @tc.desc Verify clear Map 1 null value value null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | null> = new Map<string, string | null>([['nullable', null]]);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has('nullable')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART02_TEST_5900
     * @tc.name mapClearPart02Test059
     * @tc.desc Verify clear Map value clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ObjVal = new ObjVal();
      obj.name = 'cyclic';
      const m: Map<string, ObjVal> = new Map<string, ObjVal>();
      m.set('obj', obj);
      m.clear();
      expect(m.size).assertEqual(0);
    });

  });
}
