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

interface Item { id: int; name: string; }
interface Item2 { id: int; }

interface Point { x: int; y: int; }
interface Tag { label: string; }

export default function mapSetPart01TestTest(): void {
  describe('MapSetPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_0100
     * @tc.name mapSetPart01Test001
     * @tc.desc Verify 2 (key,val) set Map key size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      expect(map.size).assertEqual(0);
      map.set('a', 1);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_0200
     * @tc.name mapSetPart01Test002
     * @tc.desc Verify 2 (key,val) set Map key size 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('first', 10);
      expect(map.size).assertEqual(1);
      map.set('second', 20);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_0300
     * @tc.name mapSetPart01Test003
     * @tc.desc Verify 2 (key,val) set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let sizeBefore: int = map.size;
      map.set('a', 999);
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_0400
     * @tc.name mapSetPart01Test004
     * @tc.desc Verify 2 set key val K V size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(2147483647, -2147483648);
      expect(map.size).assertEqual(1);
      expect(map.has(2147483647)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_0500
     * @tc.name mapSetPart01Test005
     * @tc.desc Verify K=string "hello" set key V=int size 0 1 has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('hello', 42);
      expect(map.size).assertEqual(1);
      expect(map.has('hello')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_0600
     * @tc.name mapSetPart01Test006
     * @tc.desc Verify K=string "hello" set key V int int size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('hello', 1);
      map.set('hello', 999);
      let result: int | undefined = map.get('hello');
      expect(result).assertEqual(999);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_0700
     * @tc.name mapSetPart01Test007
     * @tc.desc Verify K=string "" set key V=int size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 100);
      expect(map.size).assertEqual(1);
      expect(map.has('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_0800
     * @tc.name mapSetPart01Test008
     * @tc.desc Verify K=string "" set key V int int size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 1);
      map.set('', 200);
      let result: int | undefined = map.get('');
      expect(result).assertEqual(200);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_0900
     * @tc.name mapSetPart01Test009
     * @tc.desc Verify K=string Unicode emoji " " set key V=int size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('😀', 77);
      expect(map.size).assertEqual(1);
      expect(map.has('😀')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_1000
     * @tc.name mapSetPart01Test010
     * @tc.desc Verify K=string Unicode emoji " " set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('😀', 1);
      map.set('😀', 88);
      let result: int | undefined = map.get('😀');
      expect(result).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_1100
     * @tc.name mapSetPart01Test011
     * @tc.desc Verify K=string " " set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('​', 1);
      expect(map.size).assertEqual(1);
      expect(map.has('​')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_1200
     * @tc.name mapSetPart01Test012
     * @tc.desc Verify K=string XSS "<script>alert(1)</script>" set key V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('<script>alert(1)</script>', 999);
      expect(map.size).assertEqual(1);
      expect(map.has('<script>alert(1)</script>')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_1300
     * @tc.name mapSetPart01Test013
     * @tc.desc Verify K=string 10000 set key V=int size has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'x'.repeat(10000);
      const map: Map<string, int> = new Map<string, int>();
      map.set(longKey, 555);
      expect(map.size).assertEqual(1);
      expect(map.has(longKey)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_1400
     * @tc.name mapSetPart01Test014
     * @tc.desc Verify K=string 10000 set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'x'.repeat(10000);
      const map: Map<string, int> = new Map<string, int>();
      map.set(longKey, 1);
      map.set(longKey, 9999);
      let result: int | undefined = map.get(longKey);
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_1500
     * @tc.name mapSetPart01Test015
     * @tc.desc Verify K=int MAX=2147483647 set key V=string size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(2147483647, 'max');
      expect(map.size).assertEqual(1);
      expect(map.has(2147483647)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_1600
     * @tc.name mapSetPart01Test016
     * @tc.desc Verify K=int MAX set key V string string size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(2147483647, 'old');
      map.set(2147483647, 'new');
      let result: string | undefined = map.get(2147483647);
      expect(result).assertEqual('new');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_1700
     * @tc.name mapSetPart01Test017
     * @tc.desc Verify K=int MIN=-2147483648 set key V=string size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(-2147483648, 'min');
      expect(map.size).assertEqual(1);
      expect(map.has(-2147483648)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_1800
     * @tc.name mapSetPart01Test018
     * @tc.desc Verify K=int MIN set key V string string size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(-2147483648, 'oldmin');
      map.set(-2147483648, 'newmin');
      let result: string | undefined = map.get(-2147483648);
      expect(result).assertEqual('newmin');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_1900
     * @tc.name mapSetPart01Test019
     * @tc.desc Verify K=int 0 set key V=string size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'zero');
      expect(map.size).assertEqual(1);
      expect(map.has(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_2000
     * @tc.name mapSetPart01Test020
     * @tc.desc Verify K=int -1 set key V=string size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(-1, 'neg_one');
      expect(map.size).assertEqual(1);
      expect(map.has(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_2100
     * @tc.name mapSetPart01Test021
     * @tc.desc Verify K=int 0 set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'first');
      map.set(0, 'second');
      expect(map.size).assertEqual(1);
      let result: string | undefined = map.get(0);
      expect(result).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_2200
     * @tc.name mapSetPart01Test022
     * @tc.desc Verify K=int -1 set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(-1, 'a');
      map.set(-1, 'b');
      expect(map.size).assertEqual(1);
      let result: string | undefined = map.get(-1);
      expect(result).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_2300
     * @tc.name mapSetPart01Test023
     * @tc.desc Verify K=int 0x1A set key V=string size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0x1A, 'hex');
      expect(map.size).assertEqual(1);
      expect(map.has(0x1A)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_2400
     * @tc.name mapSetPart01Test024
     * @tc.desc Verify K=int 0x1A 26 key set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(0x1A, 100);
      map.set(26, 200);
      expect(map.size).assertEqual(1);
      let result: int | undefined = map.get(0x1A);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_2500
     * @tc.name mapSetPart01Test025
     * @tc.desc Verify K=long MAX=9223372036854775807n set key V=string size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(9223372036854775807, 'longmax');
      expect(map.size).assertEqual(1);
      expect(map.has(9223372036854775807)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_2600
     * @tc.name mapSetPart01Test026
     * @tc.desc Verify K=long MAX set key V string size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(9223372036854775807, 'old');
      map.set(9223372036854775807, 'new');
      let result: string | undefined = map.get(9223372036854775807);
      expect(result).assertEqual('new');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_2700
     * @tc.name mapSetPart01Test027
     * @tc.desc Verify K=long MIN=-9223372036854775808n set key V=string size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set((-9223372036854775807 - 1), 'longmin');
      expect(map.size).assertEqual(1);
      expect(map.has((-9223372036854775807 - 1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_2800
     * @tc.name mapSetPart01Test028
     * @tc.desc Verify K=long MIN set key V string size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set((-9223372036854775807 - 1), 'oldmin');
      map.set((-9223372036854775807 - 1), 'newmin');
      let result: string | undefined = map.get((-9223372036854775807 - 1));
      expect(result).assertEqual('newmin');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_2900
     * @tc.name mapSetPart01Test029
     * @tc.desc Verify K=long 0n set key V=string size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(0), 'zero');
      expect(map.size).assertEqual(1);
      expect(map.has(Int.toLong(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_3000
     * @tc.name mapSetPart01Test030
     * @tc.desc Verify K=long -1n set key V=string size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(-1), 'neg_one');
      expect(map.size).assertEqual(1);
      expect(map.has(Int.toLong(-1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_3100
     * @tc.name mapSetPart01Test031
     * @tc.desc Verify K=long 0n set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(0), 'a');
      map.set(Int.toLong(0), 'b');
      expect(map.size).assertEqual(1);
      let result: string | undefined = map.get(Int.toLong(0));
      expect(result).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_3200
     * @tc.name mapSetPart01Test032
     * @tc.desc Verify K=long -1n set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(-1), 'x');
      map.set(Int.toLong(-1), 'y');
      expect(map.size).assertEqual(1);
      let result: string | undefined = map.get(Int.toLong(-1));
      expect(result).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_3300
     * @tc.name mapSetPart01Test033
     * @tc.desc Verify K=Date set key V=int size 0 1 has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(1000000);
      const map: Map<Date, int> = new Map<Date, int>();
      map.set(d, 42);
      expect(map.size).assertEqual(1);
      expect(map.has(d)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_3400
     * @tc.name mapSetPart01Test034
     * @tc.desc Verify K=Date set key V int int size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(5000);
      const map: Map<Date, int> = new Map<Date, int>();
      map.set(d, 1);
      map.set(d, 999);
      let result: int | undefined = map.get(d);
      expect(result).assertEqual(999);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_3500
     * @tc.name mapSetPart01Test035
     * @tc.desc Verify K=Date set set set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(2000);
      let d2: Date = new Date(2000);
      const map: Map<Date, int> = new Map<Date, int>();
      map.set(d1, 100);
      map.set(d2, 200);
      expect(map.size).assertEqual(2);
      let result: int | undefined = map.get(d1);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_3600
     * @tc.name mapSetPart01Test036
     * @tc.desc Verify K=Date Date set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1000);
      let d2: Date = new Date(9999);
      const map: Map<Date, int> = new Map<Date, int>();
      map.set(d1, 10);
      map.set(d2, 20);
      expect(map.size).assertEqual(2);
      expect(map.has(d1)).assertTrue();
      expect(map.has(d2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_3700
     * @tc.name mapSetPart01Test037
     * @tc.desc Verify K=Date key set key size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(3000);
      const map: Map<Date, string> = new Map<Date, string>();
      expect(map.size).assertEqual(0);
      map.set(d, 'dateval');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_3800
     * @tc.name mapSetPart01Test038
     * @tc.desc Verify K=RegExp set key V=int size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: RegExp = new RegExp('abc', 'g');
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      map.set(r, 100);
      expect(map.size).assertEqual(1);
      expect(map.has(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_3900
     * @tc.name mapSetPart01Test039
     * @tc.desc Verify K=RegExp set key V int int size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: RegExp = new RegExp('test', 'i');
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      map.set(r, 10);
      map.set(r, 20);
      let result: int | undefined = map.get(r);
      expect(result).assertEqual(20);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_4000
     * @tc.name mapSetPart01Test040
     * @tc.desc Verify K=RegExp pattern set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('foo', 'g');
      let r2: RegExp = new RegExp('foo', 'g');
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      map.set(r1, 111);
      map.set(r2, 222);
      let sz: int = map.size;
      expect(sz).assertEqual(2);
      let val: int | undefined = map.get(r1);
      expect(val).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_4100
     * @tc.name mapSetPart01Test041
     * @tc.desc Verify K=RegExp pattern RegExp set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('alpha', 'g');
      let r2: RegExp = new RegExp('beta', 'i');
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      map.set(r1, 1);
      map.set(r2, 2);
      expect(map.size).assertEqual(2);
      expect(map.has(r1)).assertTrue();
      expect(map.has(r2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_4200
     * @tc.name mapSetPart01Test042
     * @tc.desc Verify K=RegExp set key size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: RegExp = new RegExp('\\d+', 'g');
      const map: Map<RegExp, string> = new Map<RegExp, string>();
      expect(map.size).assertEqual(0);
      map.set(r, 'digits');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_4300
     * @tc.name mapSetPart01Test043
     * @tc.desc Verify K=object(interface) set key V=int size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Point = { x: 1, y: 2 };
      const map: Map<Point, int> = new Map<Point, int>();
      map.set(p, 99);
      expect(map.size).assertEqual(1);
      expect(map.has(p)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_4400
     * @tc.name mapSetPart01Test044
     * @tc.desc Verify K=object set key V int int size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Point = { x: 5, y: 10 };
      const map: Map<Point, int> = new Map<Point, int>();
      map.set(p, 1);
      map.set(p, 999);
      let result: int | undefined = map.get(p);
      expect(result).assertEqual(999);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_4500
     * @tc.name mapSetPart01Test045
     * @tc.desc Verify K=object set set set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Item = { id: 1, name: 'same' };
      let obj2: Item = { id: 1, name: 'same' };
      const map: Map<Item, int> = new Map<Item, int>();
      map.set(obj1, 100);
      map.set(obj2, 200);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_4600
     * @tc.name mapSetPart01Test046
     * @tc.desc Verify K=object object set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objA: Item2 = { id: 10 };
      let objB: Item2 = { id: 20 };
      const map: Map<Item2, int> = new Map<Item2, int>();
      map.set(objA, 1);
      map.set(objB, 2);
      expect(map.size).assertEqual(2);
      expect(map.has(objA)).assertTrue();
      expect(map.has(objB)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_4700
     * @tc.name mapSetPart01Test047
     * @tc.desc Verify K=object set key size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: Tag = { label: 'test' };
      const map: Map<Tag, string> = new Map<Tag, string>();
      expect(map.size).assertEqual(0);
      map.set(t, 'tagval');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_4800
     * @tc.name mapSetPart01Test048
     * @tc.desc Verify K=boolean true set key V=int size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 10);
      expect(map.size).assertEqual(1);
      expect(map.has(true)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_4900
     * @tc.name mapSetPart01Test049
     * @tc.desc Verify K=boolean false set key V=int size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(false, 20);
      expect(map.size).assertEqual(1);
      expect(map.has(false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_5000
     * @tc.name mapSetPart01Test050
     * @tc.desc Verify K=boolean true set key V int size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 1);
      map.set(true, 999);
      let result: int | undefined = map.get(true);
      expect(result).assertEqual(999);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_5100
     * @tc.name mapSetPart01Test051
     * @tc.desc Verify K=boolean false set key V int size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(false, 5);
      map.set(false, 50);
      let result: int | undefined = map.get(false);
      expect(result).assertEqual(50);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_5200
     * @tc.name mapSetPart01Test052
     * @tc.desc Verify K=boolean true false key set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 100);
      map.set(false, 200);
      expect(map.size).assertEqual(2);
      expect(map.get(true)).assertEqual(100);
      expect(map.get(false)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_5300
     * @tc.name mapSetPart01Test053
     * @tc.desc Verify K=boolean 2 set true false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 1);
      map.set(false, 2);
      map.set(true, 11);
      map.set(true, 111);
      expect(map.size).assertEqual(2);
      expect(map.get(true)).assertEqual(111);
      expect(map.get(false)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_5400
     * @tc.name mapSetPart01Test054
     * @tc.desc Verify V=int=1 set key K=string get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 1);
      let result: int | undefined = map.get('key');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_5500
     * @tc.name mapSetPart01Test055
     * @tc.desc Verify V=int=MAX(2147483647) set key K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('maxkey', 2147483647);
      let result: int | undefined = map.get('maxkey');
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_5600
     * @tc.name mapSetPart01Test056
     * @tc.desc Verify V=int=MIN(-2147483648) set key K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('minkey', -2147483648);
      let result: int | undefined = map.get('minkey');
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_5700
     * @tc.name mapSetPart01Test057
     * @tc.desc Verify V=int=0 set key K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('zerokey', 0);
      let result: int | undefined = map.get('zerokey');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_5800
     * @tc.name mapSetPart01Test058
     * @tc.desc Verify V=int=-1 set key K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('negkey', -1);
      let result: int | undefined = map.get('negkey');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_5900
     * @tc.name mapSetPart01Test059
     * @tc.desc Verify V=int set key int int get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('cover', 10);
      map.set('cover', 20);
      let result: int | undefined = map.get('cover');
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_6000
     * @tc.name mapSetPart01Test060
     * @tc.desc Verify V=Date set key K=string get Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(50000);
      const map: Map<string, Date> = new Map<string, Date>();
      map.set('datekey', d);
      let result: Date | undefined = map.get('datekey');
      expect(result!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_6100
     * @tc.name mapSetPart01Test061
     * @tc.desc Verify V=Date K=string key Date Date get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1000);
      let d2: Date = new Date(9000);
      const map: Map<string, Date> = new Map<string, Date>();
      map.set('k', d1);
      map.set('k', d2);
      let result: Date | undefined = map.get('k');
      expect(result!).assertEqual(d2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_6200
     * @tc.name mapSetPart01Test062
     * @tc.desc Verify V=Date key set Date value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1111);
      let d2: Date = new Date(2222);
      const map: Map<string, Date> = new Map<string, Date>();
      map.set('a', d1);
      map.set('b', d2);
      expect(map.get('a')!).assertEqual(d1);
      expect(map.get('b')!).assertEqual(d2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_6300
     * @tc.name mapSetPart01Test063
     * @tc.desc Verify V=Date set key size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(3333);
      const map: Map<string, Date> = new Map<string, Date>();
      expect(map.size).assertEqual(0);
      map.set('newkey', d);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_6400
     * @tc.name mapSetPart01Test064
     * @tc.desc Verify V=null set key K=string size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>();
      map.set('nullkey', null);
      expect(map.size).assertEqual(1);
      expect(map.has('nullkey')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_6500
     * @tc.name mapSetPart01Test065
     * @tc.desc Verify V=null set key null String null size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>();
      map.set('k', 'hello');
      map.set('k', null);
      expect(map.size).assertEqual(1);
      let result: string | null | undefined = map.get('k');
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_6600
     * @tc.name mapSetPart01Test066
     * @tc.desc Verify V=null set get null key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>();
      map.set('hasNull', null);
      let found: string | null | undefined = map.get('hasNull');
      let missing: string | null | undefined = map.get('noSuchKey');
      expect(found).assertNull();
      expect(missing).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_6700
     * @tc.name mapSetPart01Test067
     * @tc.desc Verify V=null set null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>();
      map.set('k', null);
      map.set('k', 'restored');
      let result: string | null | undefined = map.get('k');
      expect(result).assertEqual('restored');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_6800
     * @tc.name mapSetPart01Test068
     * @tc.desc Verify V=undefined set key K=string size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | undefined> = new Map<string, string | undefined>();
      map.set('undefkey', undefined);
      expect(map.size).assertEqual(1);
      expect(map.has('undefkey')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_6900
     * @tc.name mapSetPart01Test069
     * @tc.desc Verify V=undefined set key undefined String undefined size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | undefined> = new Map<string, string | undefined>();
      map.set('k', 'value');
      map.set('k', undefined);
      expect(map.size).assertEqual(1);
      let result: string | undefined = map.get('k');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_7000
     * @tc.name mapSetPart01Test070
     * @tc.desc Verify V=undefined set has true key value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | undefined> = new Map<string, string | undefined>();
      map.set('uk', undefined);
      expect(map.has('uk')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_7100
     * @tc.name mapSetPart01Test071
     * @tc.desc Verify V=undefined set undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | undefined> = new Map<string, string | undefined>();
      map.set('k', undefined);
      map.set('k', 'definedNow');
      let result: string | undefined = map.get('k');
      expect(result).assertEqual('definedNow');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_7200
     * @tc.name mapSetPart01Test072
     * @tc.desc Verify set Map<K,V> this null undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const returned: Map<string, int> = map.set('a', 1);
      expect(returned).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_7300
     * @tc.name mapSetPart01Test073
     * @tc.desc Verify set this map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const returned: Map<string, int> = map.set('a', 1);
      expect(returned).assertEqual(map);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_7400
     * @tc.name mapSetPart01Test074
     * @tc.desc Verify set key this map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('x', 1);
      const returned: Map<string, int> = map.set('x', 2);
      expect(returned).assertEqual(map);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_7500
     * @tc.name mapSetPart01Test075
     * @tc.desc Verify set this get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let result: int | undefined = map.set('direct', 42).get('direct');
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_7600
     * @tc.name mapSetPart01Test076
     * @tc.desc Verify set == 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('safe', 1);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_7700
     * @tc.name mapSetPart01Test077
     * @tc.desc Verify set == 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 1);
      map.set('key', 2);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_7800
     * @tc.name mapSetPart01Test078
     * @tc.desc Verify set K=int V=string == 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      expect(map.size).assertEqual(0);
      map.set(1, 'one');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_7900
     * @tc.name mapSetPart01Test079
     * @tc.desc Verify V=int=MAX set get 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('imax', 2147483647);
      let result: int | undefined = map.get('imax');
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_8000
     * @tc.name mapSetPart01Test080
     * @tc.desc Verify V=int=MIN set get (-2147483647 - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('imin', -2147483648);
      let result: int | undefined = map.get('imin');
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_8100
     * @tc.name mapSetPart01Test081
     * @tc.desc Verify V=long=MAX set get long.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, long> = new Map<string, long>();
      map.set('lmax', 9223372036854775807);
      let result: long | undefined = map.get('lmax');
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_8200
     * @tc.name mapSetPart01Test082
     * @tc.desc Verify V=long=MIN set get long.MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, long> = new Map<string, long>();
      map.set('lmin', (-9223372036854775807 - 1));
      let result: long | undefined = map.get('lmin');
      expect(result).assertEqual((-9223372036854775807 - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_8300
     * @tc.name mapSetPart01Test083
     * @tc.desc Verify V=double=Number.EPSILON set get EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, double> = new Map<string, double>();
      map.set('eps', Number.EPSILON);
      let result: double | undefined = map.get('eps');
      expect(result).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_8400
     * @tc.name mapSetPart01Test084
     * @tc.desc Verify K=int, V=boolean set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, boolean> = new Map<int, boolean>();
      map.set(42, true);
      let result: boolean | undefined = map.get(42);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_8500
     * @tc.name mapSetPart01Test085
     * @tc.desc Verify K=long, V=double set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, double> = new Map<long, double>();
      map.set(Int.toLong(100), 3.14);
      let result: double | undefined = map.get(Int.toLong(100));
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_8600
     * @tc.name mapSetPart01Test086
     * @tc.desc Verify K=double, V=string set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(1.5, 'one_point_five');
      let result: string | undefined = map.get(1.5);
      expect(result).assertEqual('one_point_five');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART01_TEST_8700
     * @tc.name mapSetPart01Test087
     * @tc.desc Verify K=string, V=Array<int> V set key get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart01Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      const map: Map<string, int[]> = new Map<string, int[]>();
      map.set('arrkey', arr);
      let result: int[] | undefined = map.get('arrkey');
      expect(result!).assertEqual(arr);
    });

  });
}
