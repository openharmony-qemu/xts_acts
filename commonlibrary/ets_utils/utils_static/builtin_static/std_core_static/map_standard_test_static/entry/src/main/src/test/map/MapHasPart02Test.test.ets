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

interface ObjKey { id: int; }
interface ObjKey2 { id: int; name: string; }

export default function mapHasPart02TestTest(): void {
  describe('MapHasPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_0100
     * @tc.name mapHasPart02Test001
     * @tc.desc Verify typeof has string key 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      const r: boolean = m.has('a');
      expect(typeof r).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_0200
     * @tc.name mapHasPart02Test002
     * @tc.desc Verify has true for key with stored null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | null> = new Map<string, string | null>();
      m.set('k', null);
      const r: boolean = m.has('k');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_0300
     * @tc.name mapHasPart02Test003
     * @tc.desc Verify has true for key with stored undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | undefined> = new Map<string, string | undefined>();
      m.set('k', undefined);
      const r: boolean = m.has('k');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_0400
     * @tc.name mapHasPart02Test004
     * @tc.desc Verify has if (true )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 1]]);
      const r: boolean = m.has('k');
      let branch: string = 'init';
      if (r) {
        branch = 'true_branch';
      }
      expect(branch).assertEqual('true_branch');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_0500
     * @tc.name mapHasPart02Test005
     * @tc.desc Verify has if (false )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 1]]);
      const r: boolean = m.has('missing');
      let branch: string = 'init';
      if (r) {
        branch = 'true_branch';
      }
      expect(branch).assertEqual('init');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_0600
     * @tc.name mapHasPart02Test006
     * @tc.desc Verify has == 'negated'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 1]]);
      let branch: string = 'init';
      if (!m.has('missing')) {
        branch = 'negated';
      }
      expect(branch).assertEqual('negated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_0700
     * @tc.name mapHasPart02Test007
     * @tc.desc Verify int key 0 has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(0, 'zero');
      const r: boolean = m.has(0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_0800
     * @tc.name mapHasPart02Test008
     * @tc.desc Verify int key 1 has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(1, 'one');
      const r: boolean = m.has(1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_0900
     * @tc.name mapHasPart02Test009
     * @tc.desc Verify int key MAX(2147483647) has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(2147483647, 'max');
      const r: boolean = m.has(2147483647);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_1000
     * @tc.name mapHasPart02Test010
     * @tc.desc Verify int key MIN(-2147483648) has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(-2147483648, 'min');
      const r: boolean = m.has(-2147483648);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_1100
     * @tc.name mapHasPart02Test011
     * @tc.desc Verify int key -1 has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(-1, 'neg_one');
      const r: boolean = m.has(-1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_1200
     * @tc.name mapHasPart02Test012
     * @tc.desc Verify number( )key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>();
      m.set(3.14, 'pi');
      const r: boolean = m.has(3.14);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_1300
     * @tc.name mapHasPart02Test013
     * @tc.desc Verify boolean key true has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>();
      m.set(true, 't');
      const r: boolean = m.has(true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_1400
     * @tc.name mapHasPart02Test014
     * @tc.desc Verify boolean key false has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>();
      m.set(false, 'f');
      const r: boolean = m.has(false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_1500
     * @tc.name mapHasPart02Test015
     * @tc.desc Verify long key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>();
      m.set(Int.toLong(100), 'long_val');
      const r: boolean = m.has(Int.toLong(100));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_1600
     * @tc.name mapHasPart02Test016
     * @tc.desc Verify double key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>();
      m.set(2.718281828, 'e');
      const r: boolean = m.has(2.718281828);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_1700
     * @tc.name mapHasPart02Test017
     * @tc.desc Verify byte key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, string> = new Map<byte, string>();
      m.set(64 as byte, 'b');
      const r: boolean = m.has(64 as byte);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_1800
     * @tc.name mapHasPart02Test018
     * @tc.desc Verify short key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>();
      m.set(100 as short, 's');
      const r: boolean = m.has(100 as short);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_1900
     * @tc.name mapHasPart02Test019
     * @tc.desc Verify float key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, string> = new Map<float, string>();
      m.set(1.5 as float, 'f');
      const r: boolean = m.has(1.5 as float);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_2000
     * @tc.name mapHasPart02Test020
     * @tc.desc Verify bigint key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<bigint, string> = new Map<bigint, string>();
      m.set(999999999999n, 'big');
      const r: boolean = m.has(999999999999n);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_2100
     * @tc.name mapHasPart02Test021
     * @tc.desc Verify Date key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(1000);
      const m: Map<Date, int> = new Map<Date, int>();
      m.set(d, 1);
      const r: boolean = m.has(d);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_2200
     * @tc.name mapHasPart02Test022
     * @tc.desc Verify object key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: ObjKey = { id: 1 };
      const m: Map<ObjKey, string> = new Map<ObjKey, string>();
      m.set(o, 'obj_val');
      const r: boolean = m.has(o);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_2300
     * @tc.name mapHasPart02Test023
     * @tc.desc Verify Array key has true , string>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [1, 2, 3];
      const m: Map<int[], string> = new Map<int[], string>();
      m.set(arr, 'arr_val');
      const r: boolean = m.has(arr);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_2400
     * @tc.name mapHasPart02Test024
     * @tc.desc Verify string key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      const r: boolean = m.has('nonexistent');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_2500
     * @tc.name mapHasPart02Test025
     * @tc.desc Verify int key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(1, 'one');
      const r: boolean = m.has(999);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_2600
     * @tc.name mapHasPart02Test026
     * @tc.desc Verify number key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>();
      m.set(1.0, 'one');
      const r: boolean = m.has(99.99);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_2700
     * @tc.name mapHasPart02Test027
     * @tc.desc Verify boolean key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>();
      m.set(true, 't');
      const r: boolean = m.has(false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_2800
     * @tc.name mapHasPart02Test028
     * @tc.desc Verify long key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>();
      m.set(Int.toLong(1), 'one');
      const r: boolean = m.has(Int.toLong(999));
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_2900
     * @tc.name mapHasPart02Test029
     * @tc.desc Verify double key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>();
      m.set(1.0, 'one');
      const r: boolean = m.has(999.0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_3000
     * @tc.name mapHasPart02Test030
     * @tc.desc Verify byte key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, string> = new Map<byte, string>();
      m.set(1 as byte, 'one');
      const r: boolean = m.has(127 as byte);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_3100
     * @tc.name mapHasPart02Test031
     * @tc.desc Verify short key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>();
      m.set(1 as short, 'one');
      const r: boolean = m.has(999 as short);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_3200
     * @tc.name mapHasPart02Test032
     * @tc.desc Verify float key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, string> = new Map<float, string>();
      m.set(1.0 as float, 'one');
      const r: boolean = m.has(99.0 as float);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_3300
     * @tc.name mapHasPart02Test033
     * @tc.desc Verify bigint key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<bigint, string> = new Map<bigint, string>();
      m.set(1n, 'one');
      const r: boolean = m.has(999999n);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_3400
     * @tc.name mapHasPart02Test034
     * @tc.desc Verify Date key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(1000);
      const m: Map<Date, string> = new Map<Date, string>();
      m.set(d, 'val');
      const other: Date = new Date(2000);
      const r: boolean = m.has(other);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_3500
     * @tc.name mapHasPart02Test035
     * @tc.desc Verify object key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: ObjKey = { id: 1 };
      const other: ObjKey = { id: 2 };
      const m: Map<ObjKey, string> = new Map<ObjKey, string>();
      m.set(o, 'val');
      const r: boolean = m.has(other);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_3600
     * @tc.name mapHasPart02Test036
     * @tc.desc Verify string key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      m.delete('a');
      const r: boolean = m.has('a');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_3700
     * @tc.name mapHasPart02Test037
     * @tc.desc Verify int key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(42, 'val');
      m.delete(42);
      const r: boolean = m.has(42);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_3800
     * @tc.name mapHasPart02Test038
     * @tc.desc Verify number key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>();
      m.set(3.14, 'pi');
      m.delete(3.14);
      const r: boolean = m.has(3.14);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_3900
     * @tc.name mapHasPart02Test039
     * @tc.desc Verify boolean key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>();
      m.set(true, 't');
      m.delete(true);
      const r: boolean = m.has(true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_4000
     * @tc.name mapHasPart02Test040
     * @tc.desc Verify long key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>();
      m.set(Int.toLong(100), 'v');
      m.delete(Int.toLong(100));
      const r: boolean = m.has(Int.toLong(100));
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_4100
     * @tc.name mapHasPart02Test041
     * @tc.desc Verify double key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>();
      m.set(2.718281828, 'e');
      m.delete(2.718281828);
      const r: boolean = m.has(2.718281828);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_4200
     * @tc.name mapHasPart02Test042
     * @tc.desc Verify byte key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, string> = new Map<byte, string>();
      m.set(64 as byte, 'b');
      m.delete(64 as byte);
      const r: boolean = m.has(64 as byte);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_4300
     * @tc.name mapHasPart02Test043
     * @tc.desc Verify short key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>();
      m.set(100 as short, 's');
      m.delete(100 as short);
      const r: boolean = m.has(100 as short);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_4400
     * @tc.name mapHasPart02Test044
     * @tc.desc Verify float key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, string> = new Map<float, string>();
      m.set(1.5 as float, 'f');
      m.delete(1.5 as float);
      const r: boolean = m.has(1.5 as float);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_4500
     * @tc.name mapHasPart02Test045
     * @tc.desc Verify bigint key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<bigint, string> = new Map<bigint, string>();
      m.set(999999999999n, 'big');
      m.delete(999999999999n);
      const r: boolean = m.has(999999999999n);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_4600
     * @tc.name mapHasPart02Test046
     * @tc.desc Verify Date key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(5000);
      const m: Map<Date, string> = new Map<Date, string>();
      m.set(d, 'date_val');
      m.delete(d);
      const r: boolean = m.has(d);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_4700
     * @tc.name mapHasPart02Test047
     * @tc.desc Verify object key delete has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: ObjKey = { id: 100 };
      const m: Map<ObjKey, string> = new Map<ObjKey, string>();
      m.set(o, 'obj_val');
      m.delete(o);
      const r: boolean = m.has(o);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_4800
     * @tc.name mapHasPart02Test048
     * @tc.desc Verify string key clear has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      m.clear();
      const r: boolean = m.has('a');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_4900
     * @tc.name mapHasPart02Test049
     * @tc.desc Verify int key clear has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(1, 'one');
      m.set(2, 'two');
      m.clear();
      const r: boolean = m.has(1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_5000
     * @tc.name mapHasPart02Test050
     * @tc.desc Verify number key clear has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>();
      m.set(1.5, 'a');
      m.set(2.5, 'b');
      m.clear();
      const r: boolean = m.has(1.5);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_5100
     * @tc.name mapHasPart02Test051
     * @tc.desc Verify boolean key clear has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>();
      m.set(true, 't');
      m.clear();
      const r: boolean = m.has(true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_5200
     * @tc.name mapHasPart02Test052
     * @tc.desc Verify long key clear has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>();
      m.set(Int.toLong(1), 'a');
      m.set(Int.toLong(2), 'b');
      m.clear();
      const r: boolean = m.has(Int.toLong(1));
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_5300
     * @tc.name mapHasPart02Test053
     * @tc.desc Verify double key clear has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>();
      m.set(1.1, 'a');
      m.set(2.2, 'b');
      m.clear();
      const r: boolean = m.has(1.1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_5400
     * @tc.name mapHasPart02Test054
     * @tc.desc Verify byte key clear has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, string> = new Map<byte, string>();
      m.set(1 as byte, 'a');
      m.set(2 as byte, 'b');
      m.clear();
      const r: boolean = m.has(1 as byte);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_5500
     * @tc.name mapHasPart02Test055
     * @tc.desc Verify short key clear has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>();
      m.set(10 as short, 'a');
      m.set(20 as short, 'b');
      m.clear();
      const r: boolean = m.has(10 as short);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_5600
     * @tc.name mapHasPart02Test056
     * @tc.desc Verify float key clear has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, string> = new Map<float, string>();
      m.set(1.0 as float, 'a');
      m.set(2.0 as float, 'b');
      m.clear();
      const r: boolean = m.has(1.0 as float);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_5700
     * @tc.name mapHasPart02Test057
     * @tc.desc Verify Date key clear has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(3000);
      const m: Map<Date, string> = new Map<Date, string>();
      m.set(d, 'date_val');
      m.clear();
      const r: boolean = m.has(d);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_5800
     * @tc.name mapHasPart02Test058
     * @tc.desc Verify object key clear has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: ObjKey = { id: 200 };
      const m: Map<ObjKey, string> = new Map<ObjKey, string>();
      m.set(o, 'obj_val');
      m.clear();
      const r: boolean = m.has(o);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_5900
     * @tc.name mapHasPart02Test059
     * @tc.desc Verify Date has false( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(5000);
      const d2: Date = new Date(5000);
      const m: Map<Date, string> = new Map<Date, string>();
      m.set(d1, 'val');
      const r: boolean = m.has(d2);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_6000
     * @tc.name mapHasPart02Test060
     * @tc.desc Verify object has false( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ObjKey2 = { id: 1, name: 'same' };
      const o2: ObjKey2 = { id: 1, name: 'same' };
      const m: Map<ObjKey2, string> = new Map<ObjKey2, string>();
      m.set(o1, 'val');
      const r: boolean = m.has(o2);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_6100
     * @tc.name mapHasPart02Test061
     * @tc.desc Verify Array has false( ) , string>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: int[] = [1, 2, 3];
      const a2: int[] = [1, 2, 3];
      const m: Map<int[], string> = new Map<int[], string>();
      m.set(a1, 'arr_val');
      const r: boolean = m.has(a2);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_6200
     * @tc.name mapHasPart02Test062
     * @tc.desc Verify Date has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(9999);
      const d2: Date = new Date(9999);
      const m: Map<Date, string> = new Map<Date, string>();
      m.set(d1, 'val');
      const rSame: boolean = m.has(d1);
      const rDiff: boolean = m.has(d2);
      expect(rSame).assertTrue();
      expect(rDiff).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_6300
     * @tc.name mapHasPart02Test063
     * @tc.desc Verify object has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ObjKey = { id: 42 };
      const o2: ObjKey = { id: 42 };
      const m: Map<ObjKey, string> = new Map<ObjKey, string>();
      m.set(o1, 'val');
      const rSame: boolean = m.has(o1);
      const rDiff: boolean = m.has(o2);
      expect(rSame).assertTrue();
      expect(rDiff).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_6400
     * @tc.name mapHasPart02Test064
     * @tc.desc Verify Array has , string>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: int[] = [7, 8, 9];
      const a2: int[] = [7, 8, 9];
      const m: Map<int[], string> = new Map<int[], string>();
      m.set(a1, 'arr');
      const rSame: boolean = m.has(a1);
      const rDiff: boolean = m.has(a2);
      expect(rSame).assertTrue();
      expect(rDiff).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_6500
     * @tc.name mapHasPart02Test065
     * @tc.desc Verify has key size (1-entry Map)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 1]]);
      const sBefore: int = m.size;
      m.has('k');
      const sAfter: int = m.size;
      expect(sBefore).assertEqual(1);
      expect(sAfter).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_6600
     * @tc.name mapHasPart02Test066
     * @tc.desc Verify has key size (1-entry Map)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 1]]);
      const sBefore: int = m.size;
      m.has('missing');
      const sAfter: int = m.size;
      expect(sBefore).assertEqual(1);
      expect(sAfter).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_6700
     * @tc.name mapHasPart02Test067
     * @tc.desc Verify has key size ( entry Map)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const sBefore: int = m.size;
      m.has('b');
      const sAfter: int = m.size;
      expect(sBefore).assertEqual(3);
      expect(sAfter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_6800
     * @tc.name mapHasPart02Test068
     * @tc.desc Verify has key size ( entry Map)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const sBefore: int = m.size;
      m.has('z');
      const sAfter: int = m.size;
      expect(sBefore).assertEqual(3);
      expect(sAfter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_6900
     * @tc.name mapHasPart02Test069
     * @tc.desc Verify has size ( Map size=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const sBefore: int = m.size;
      m.has('any');
      const sAfter: int = m.size;
      expect(sBefore).assertEqual(0);
      expect(sAfter).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_7000
     * @tc.name mapHasPart02Test070
     * @tc.desc Verify has size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      m.has('a');
      const s1: int = m.size;
      m.has('missing');
      const s2: int = m.size;
      m.has('b');
      const s3: int = m.size;
      expect(s1).assertEqual(2);
      expect(s2).assertEqual(2);
      expect(s3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_7100
     * @tc.name mapHasPart02Test071
     * @tc.desc Verify has delete key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      m.delete('a');
      const sBefore: int = m.size;
      m.has('a');
      const sAfter: int = m.size;
      expect(sBefore).assertEqual(1);
      expect(sAfter).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_7200
     * @tc.name mapHasPart02Test072
     * @tc.desc Verify has clear size( 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      m.clear();
      const sBefore: int = m.size;
      m.has('a');
      const sAfter: int = m.size;
      expect(sBefore).assertEqual(0);
      expect(sAfter).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_7300
     * @tc.name mapHasPart02Test073
     * @tc.desc Verify has get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 100]]);
      m.has('k');
      const v: int | undefined = m.get('k');
      expect(v).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_7400
     * @tc.name mapHasPart02Test074
     * @tc.desc Verify has entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      m.has('b');
      let count: int = 0;
      const it: IterableIterator<[string, int]> = m.entries();
      let entry: IteratorResult<[string, int]> = it.next();
      while (!entry.done) {
        count = count + 1;
        entry = it.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_7500
     * @tc.name mapHasPart02Test075
     * @tc.desc Verify has keys key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1], ['y', 2], ['z', 3]]);
      m.has('y');
      let count: int = 0;
      const it: IterableIterator<string> = m.keys();
      let entry: IteratorResult<string> = it.next();
      while (!entry.done) {
        count = count + 1;
        entry = it.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_7600
     * @tc.name mapHasPart02Test076
     * @tc.desc Verify has values value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['p', 10], ['q', 20], ['r', 30]]);
      m.has('q');
      let count: int = 0;
      const it: IterableIterator<int> = m.values();
      let entry: IteratorResult<int> = it.next();
      while (!entry.done) {
        count = count + 1;
        entry = it.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_7700
     * @tc.name mapHasPart02Test077
     * @tc.desc Verify has forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      m.has('a');
      let count: int = 0;
      m.forEach((value: int, key: string): void => {
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_7800
     * @tc.name mapHasPart02Test078
     * @tc.desc Verify has == r2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['key', 1]]);
      const r1: boolean = m.has('key');
      const r2: boolean = m.has('key');
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_7900
     * @tc.name mapHasPart02Test079
     * @tc.desc Verify has set entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      m.has('a');
      m.set('b', 2);
      expect(m.has('b')).assertTrue();
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_8000
     * @tc.name mapHasPart02Test080
     * @tc.desc Verify has delete entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      m.has('a');
      const deleted: boolean = m.delete('a');
      expect(deleted).assertTrue();
      expect(m.has('a')).assertFalse();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_8100
     * @tc.name mapHasPart02Test081
     * @tc.desc Verify has clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      m.has('a');
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_8200
     * @tc.name mapHasPart02Test082
     * @tc.desc Verify keys iterator == keys[idx]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('first', 1);
      m.set('second', 2);
      m.set('third', 3);
      m.has('second');
      const keys: string[] = ['first', 'second', 'third'];
      let idx: int = 0;
      const it: IterableIterator<string> = m.keys();
      let entry: IteratorResult<string> = it.next();
      while (!entry.done) {
        expect(entry.value!).assertEqual(keys[idx]);
        idx = idx + 1;
        entry = it.next();
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART02_8300
     * @tc.name mapHasPart02Test083
     * @tc.desc Verify has Map entry get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 10], ['b', 20], ['c', 30]]);
      m.has('b');
      expect(m.get('a')).assertEqual(10);
      expect(m.get('b')).assertEqual(20);
      expect(m.get('c')).assertEqual(30);
    });

  });
}
