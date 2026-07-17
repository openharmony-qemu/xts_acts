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

interface ObjKey { id: number; name: string; }
interface ObjKey2 { id: number; }

export default function mapHasPart01TestTest(): void {
  describe('MapHasPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_0100
     * @tc.name mapHasPart01Test001
     * @tc.desc Verify has() 1 arity=1 Map key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      expect(map.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_0200
     * @tc.name mapHasPart01Test002
     * @tc.desc Verify K=string ASCII key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['hello', 1]]);
      expect(map.has('hello')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_0300
     * @tc.name mapHasPart01Test003
     * @tc.desc Verify K=string ASCII key Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['hello', 1]]);
      expect(map.has('world')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_0400
     * @tc.name mapHasPart01Test004
     * @tc.desc Verify K=string "" key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['', 1]]);
      expect(map.has('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_0500
     * @tc.name mapHasPart01Test005
     * @tc.desc Verify K=string "" key Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['hello', 1]]);
      expect(map.has('')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_0600
     * @tc.name mapHasPart01Test006
     * @tc.desc Verify K=string Unicode key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['😀', 1]]);
      expect(map.has('😀')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_0700
     * @tc.name mapHasPart01Test007
     * @tc.desc Verify K=string key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['​', 1]]);
      expect(map.has('​')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_0800
     * @tc.name mapHasPart01Test008
     * @tc.desc Verify K=string XSS \<script\>alert(1)\</script\> key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['<script>alert(1)</script>', 1]]);
      expect(map.has('<script>alert(1)</script>')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_0900
     * @tc.name mapHasPart01Test009
     * @tc.desc Verify K=string 10000 key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'x'.repeat(10000);
      const map: Map<string, int> = new Map<string, int>();
      map.set(longKey, 1);
      expect(map.has(longKey)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_1000
     * @tc.name mapHasPart01Test010
     * @tc.desc Verify K=string \n key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a\nb', 1]]);
      expect(map.has('a\nb')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_1100
     * @tc.name mapHasPart01Test011
     * @tc.desc Verify K=string \t key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a\tb', 1]]);
      expect(map.has('a\tb')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_1200
     * @tc.name mapHasPart01Test012
     * @tc.desc Verify K=string " " key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['   ', 1]]);
      expect(map.has('   ')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_1300
     * @tc.name mapHasPart01Test013
     * @tc.desc Verify K=string Map key has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['Key', 1], ['key', 2]]);
      expect(map.has('Key')).assertTrue();
      expect(map.has('key')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_1400
     * @tc.name mapHasPart01Test014
     * @tc.desc Verify K=int key=0 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'zero');
      expect(map.has(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_1500
     * @tc.name mapHasPart01Test015
     * @tc.desc Verify K=int key=0 Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      expect(map.has(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_1600
     * @tc.name mapHasPart01Test016
     * @tc.desc Verify K=int key=1 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      expect(map.has(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_1700
     * @tc.name mapHasPart01Test017
     * @tc.desc Verify K=int key=-1 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(-1, 'neg');
      expect(map.has(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_1800
     * @tc.name mapHasPart01Test018
     * @tc.desc Verify K=int key=2147483647 2147483647 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(2147483647, 'max');
      expect(map.has(2147483647)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_1900
     * @tc.name mapHasPart01Test019
     * @tc.desc Verify K=int key=(-2147483647 - 1) -2147483648 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(-2147483648, 'min');
      expect(map.has(-2147483648)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_2000
     * @tc.name mapHasPart01Test020
     * @tc.desc Verify K=int key=42 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(42, 'normal');
      expect(map.has(42)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_2100
     * @tc.name mapHasPart01Test021
     * @tc.desc Verify K=int key=42 Map Map key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      map.set(-1, 'neg');
      expect(map.has(42)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_2200
     * @tc.name mapHasPart01Test022
     * @tc.desc Verify K=number key=NaN Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.NaN, 'nan');
      expect(map.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_2300
     * @tc.name mapHasPart01Test023
     * @tc.desc Verify K=number Map NaN key has(NaN) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(1.0, 'one');
      expect(map.has(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_2400
     * @tc.name mapHasPart01Test024
     * @tc.desc Verify K=number key=Number.POSITIVE_INFINITY Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.POSITIVE_INFINITY, 'inf');
      expect(map.has(Number.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_2500
     * @tc.name mapHasPart01Test025
     * @tc.desc Verify K=number key=Number.NEGATIVE_INFINITY Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.NEGATIVE_INFINITY, 'ninf');
      expect(map.has(Number.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_2600
     * @tc.name mapHasPart01Test026
     * @tc.desc Verify K=number key=-0.0 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(-0.0, 'negzero');
      expect(map.has(-0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_2700
     * @tc.name mapHasPart01Test027
     * @tc.desc Verify K=number key=3.14 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(3.14, 'pi');
      expect(map.has(3.14)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_2800
     * @tc.name mapHasPart01Test028
     * @tc.desc Verify K=number key=3.14 Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(2.71, 'e');
      expect(map.has(3.14)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_2900
     * @tc.name mapHasPart01Test029
     * @tc.desc Verify K=boolean key=true Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(true, 't');
      expect(map.has(true)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_3000
     * @tc.name mapHasPart01Test030
     * @tc.desc Verify K=boolean key=true Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(false, 'f');
      expect(map.has(true)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_3100
     * @tc.name mapHasPart01Test031
     * @tc.desc Verify K=boolean key=false Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(false, 'f');
      expect(map.has(false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_3200
     * @tc.name mapHasPart01Test032
     * @tc.desc Verify K=boolean key=false Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(true, 't');
      expect(map.has(false)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_3300
     * @tc.name mapHasPart01Test033
     * @tc.desc Verify K=long key=0n Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(0), 'zero');
      expect(map.has(Int.toLong(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_3400
     * @tc.name mapHasPart01Test034
     * @tc.desc Verify K=long key=0n Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(1), 'one');
      expect(map.has(Int.toLong(0))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_3500
     * @tc.name mapHasPart01Test035
     * @tc.desc Verify K=long key=1n Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(1), 'one');
      expect(map.has(Int.toLong(1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_3600
     * @tc.name mapHasPart01Test036
     * @tc.desc Verify K=long key=-1n Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(-1), 'neg');
      expect(map.has(Int.toLong(-1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_3700
     * @tc.name mapHasPart01Test037
     * @tc.desc Verify K=long key=9223372036854775807n long.MAX Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(9223372036854775807, 'max');
      expect(map.has(9223372036854775807)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_3800
     * @tc.name mapHasPart01Test038
     * @tc.desc Verify K=long key=-9223372036854775808n long.MIN Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set((-9223372036854775807 - 1), 'min');
      expect(map.has((-9223372036854775807 - 1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_3900
     * @tc.name mapHasPart01Test039
     * @tc.desc Verify K=long long key=42n Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(42), 'normal');
      expect(map.has(Int.toLong(42))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_4000
     * @tc.name mapHasPart01Test040
     * @tc.desc Verify K=double key=NaN Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(Number.NaN, 'nan');
      expect(map.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_4100
     * @tc.name mapHasPart01Test041
     * @tc.desc Verify K=double key=Infinity Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(Number.POSITIVE_INFINITY, 'inf');
      expect(map.has(Number.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_4200
     * @tc.name mapHasPart01Test042
     * @tc.desc Verify K=double key=-Infinity Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(-Number.POSITIVE_INFINITY, 'ninf');
      expect(map.has(-Number.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_4300
     * @tc.name mapHasPart01Test043
     * @tc.desc Verify K=double key=Number.EPSILON Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(Number.EPSILON, 'eps');
      expect(map.has(Number.EPSILON)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_4400
     * @tc.name mapHasPart01Test044
     * @tc.desc Verify K=double double key=2.718 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(2.718, 'e');
      expect(map.has(2.718)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_4500
     * @tc.name mapHasPart01Test045
     * @tc.desc Verify K=double double key=2.718 Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(3.14, 'pi');
      expect(map.has(2.718)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_4600
     * @tc.name mapHasPart01Test046
     * @tc.desc Verify K=byte key=0 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(0 as byte, 'zero');
      expect(map.has(0 as byte)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_4700
     * @tc.name mapHasPart01Test047
     * @tc.desc Verify K=byte key=127 byte.MAX Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(127 as byte, 'max');
      expect(map.has(127 as byte)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_4800
     * @tc.name mapHasPart01Test048
     * @tc.desc Verify K=byte key=-128 byte.MIN Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(-128 as byte, 'min');
      expect(map.has(-128 as byte)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_4900
     * @tc.name mapHasPart01Test049
     * @tc.desc Verify K=byte key=1 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(1 as byte, 'one');
      expect(map.has(1 as byte)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_5000
     * @tc.name mapHasPart01Test050
     * @tc.desc Verify K=byte key=-1 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(-1 as byte, 'neg');
      expect(map.has(-1 as byte)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_5100
     * @tc.name mapHasPart01Test051
     * @tc.desc Verify K=short key=0 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(0 as short, 'zero');
      expect(map.has(0 as short)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_5200
     * @tc.name mapHasPart01Test052
     * @tc.desc Verify K=short key=32767 short.MAX Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(32767 as short, 'max');
      expect(map.has(32767 as short)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_5300
     * @tc.name mapHasPart01Test053
     * @tc.desc Verify K=short key=-32768 short.MIN Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(-32768 as short, 'min');
      expect(map.has(-32768 as short)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_5400
     * @tc.name mapHasPart01Test054
     * @tc.desc Verify K=short key=1 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(1 as short, 'one');
      expect(map.has(1 as short)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_5500
     * @tc.name mapHasPart01Test055
     * @tc.desc Verify K=short key=-1 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(-1 as short, 'neg');
      expect(map.has(-1 as short)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_5600
     * @tc.name mapHasPart01Test056
     * @tc.desc Verify K=float key=NaN Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      map.set(Float.NaN, 'nan');
      expect(map.has(Float.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_5700
     * @tc.name mapHasPart01Test057
     * @tc.desc Verify K=float key=Infinity Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      map.set(Float.POSITIVE_INFINITY, 'inf');
      expect(map.has(Float.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_5800
     * @tc.name mapHasPart01Test058
     * @tc.desc Verify K=float key=-Infinity Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      map.set(-Float.POSITIVE_INFINITY, 'ninf');
      expect(map.has(-Float.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_5900
     * @tc.name mapHasPart01Test059
     * @tc.desc Verify K=float key=-0.0 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      map.set(Double.toFloat(-0.0), 'negzero');
      expect(map.has(Double.toFloat(-0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_6000
     * @tc.name mapHasPart01Test060
     * @tc.desc Verify K=float float key=1.5 Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      map.set(1.5, 'normal');
      expect(map.has(1.5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_6100
     * @tc.name mapHasPart01Test061
     * @tc.desc Verify K=char char key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<char, string> = new Map<char, string>();
      map.set(c'A', 'A');
      expect(map.has(c'A')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_6200
     * @tc.name mapHasPart01Test062
     * @tc.desc Verify K=char char key Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<char, string> = new Map<char, string>();
      map.set(c'A', 'A');
      expect(map.has(c'B')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_6300
     * @tc.name mapHasPart01Test063
     * @tc.desc Verify K=bigint bigint key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, string> = new Map<bigint, string>();
      map.set(123n, 'val');
      expect(map.has(123n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_6400
     * @tc.name mapHasPart01Test064
     * @tc.desc Verify K=bigint bigint key Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, string> = new Map<bigint, string>();
      map.set(123n, 'val');
      expect(map.has(999n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_6500
     * @tc.name mapHasPart01Test065
     * @tc.desc Verify K=Date Date key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(1609459200000);
      const map: Map<Date, string> = new Map<Date, string>();
      map.set(d, 'date');
      expect(map.has(d)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_6600
     * @tc.name mapHasPart01Test066
     * @tc.desc Verify K=Date Date has SDK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1609459200000);
      const d2: Date = new Date(1609459200000);
      const map: Map<Date, string> = new Map<Date, string>();
      map.set(d1, 'date');
      expect(map.has(d2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_6700
     * @tc.name mapHasPart01Test067
     * @tc.desc Verify K=Date Date has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1609459200000);
      const d2: Date = new Date(1609459300000);
      const map: Map<Date, string> = new Map<Date, string>();
      map.set(d1, 'date');
      expect(map.has(d2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_6800
     * @tc.name mapHasPart01Test068
     * @tc.desc Verify K=Date Date Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(1609459200000);
      const map: Map<Date, string> = new Map<Date, string>();
      expect(map.has(d)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_6900
     * @tc.name mapHasPart01Test069
     * @tc.desc Verify K=object interface key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ObjKey = { id: 1, name: 'test' };
      const map: Map<ObjKey, string> = new Map<ObjKey, string>();
      map.set(obj, 'val');
      expect(map.has(obj)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_7000
     * @tc.name mapHasPart01Test070
     * @tc.desc Verify K=object has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ObjKey = { id: 1, name: 'test' };
      const obj2: ObjKey = { id: 1, name: 'test' };
      const map: Map<ObjKey, string> = new Map<ObjKey, string>();
      map.set(obj1, 'val');
      expect(map.has(obj2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_7100
     * @tc.name mapHasPart01Test071
     * @tc.desc Verify K=object Object Map Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ObjKey2 = { id: 1 };
      const map: Map<ObjKey2, string> = new Map<ObjKey2, string>();
      expect(map.has(obj)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_7200
     * @tc.name mapHasPart01Test072
     * @tc.desc Verify K=RegExp RegExp key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp('abc', 'g');
      const map: Map<RegExp, string> = new Map<RegExp, string>();
      map.set(re, 'regex');
      expect(map.has(re)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_7300
     * @tc.name mapHasPart01Test073
     * @tc.desc Verify K=RegExp RegExp pattern flags has SDK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re1: RegExp = new RegExp('abc', 'g');
      const re2: RegExp = new RegExp('abc', 'g');
      const map: Map<RegExp, string> = new Map<RegExp, string>();
      map.set(re1, 'regex');
      expect(map.has(re2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART01_7400
     * @tc.name mapHasPart01Test074
     * @tc.desc Verify K=RegExp RegExp Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapHasPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp('abc', 'g');
      const map: Map<RegExp, string> = new Map<RegExp, string>();
      expect(map.has(re)).assertFalse();
    });

  });
}
