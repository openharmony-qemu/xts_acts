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

export default function mapDeletePart02TestTest(): void {
  describe('MapDeletePart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_0100
     * @tc.name mapDeletePart02Test001
     * @tc.desc Verify 1 key delete boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(1, 100);
      let result: boolean = map.delete(1);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_0200
     * @tc.name mapDeletePart02Test002
     * @tc.desc Verify 1 delete key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(1, 100);
      let result: boolean = map.delete(1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_0300
     * @tc.name mapDeletePart02Test003
     * @tc.desc Verify 1 delete key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      let result: boolean = map.delete(999);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_0400
     * @tc.name mapDeletePart02Test004
     * @tc.desc Verify (-2147483647 - 1) key entry true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      const MIN_KEY: int = -2147483648;
      map.set(MIN_KEY, 'min');
      let result: boolean = map.delete(MIN_KEY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_0500
     * @tc.name mapDeletePart02Test005
     * @tc.desc Verify (-2147483647 - 1) key entry size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      const MIN_KEY: int = -2147483648;
      map.set(MIN_KEY, 'min');
      map.set(0, 'zero');
      let sizeBefore: int = map.size;
      map.delete(MIN_KEY);
      expect(map.size).assertEqual(sizeBefore - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_0600
     * @tc.name mapDeletePart02Test006
     * @tc.desc Verify (-2147483647 - 1) key entry get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      const MIN_KEY: int = -2147483648;
      map.set(MIN_KEY, 'min');
      map.delete(MIN_KEY);
      let v: string | undefined = map.get(MIN_KEY);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_0700
     * @tc.name mapDeletePart02Test007
     * @tc.desc Verify (-2147483647 - 1) key entry has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      const MIN_KEY: int = -2147483648;
      map.set(MIN_KEY, 'min');
      map.delete(MIN_KEY);
      expect(map.has(MIN_KEY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_0800
     * @tc.name mapDeletePart02Test008
     * @tc.desc Verify (-2147483647 - 1) key Map false size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      const MIN_KEY: int = -2147483648;
      let result: boolean = map.delete(MIN_KEY);
      expect(result).assertFalse();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_0900
     * @tc.name mapDeletePart02Test009
     * @tc.desc Verify (-2147483647 - 1) key Map false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      const MIN_KEY: int = -2147483648;
      map.set(MIN_KEY, 'min');
      map.delete(MIN_KEY);
      let result: boolean = map.delete(MIN_KEY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_1000
     * @tc.name mapDeletePart02Test010
     * @tc.desc Verify byte.MIN key entry true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      const MIN_BYTE: byte = -128 as byte;
      map.set(MIN_BYTE, 1);
      let result: boolean = map.delete(MIN_BYTE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_1100
     * @tc.name mapDeletePart02Test011
     * @tc.desc Verify byte.MIN key entry false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      map.set(0 as byte, 100);
      const MIN_BYTE: byte = -128 as byte;
      let result: boolean = map.delete(MIN_BYTE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_1200
     * @tc.name mapDeletePart02Test012
     * @tc.desc Verify byte.MIN key entry size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      map.set(0 as byte, 100);
      map.set(1 as byte, 200);
      let sizeBefore: int = map.size;
      const MIN_BYTE: byte = -128 as byte;
      map.delete(MIN_BYTE);
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_1300
     * @tc.name mapDeletePart02Test013
     * @tc.desc Verify byte.MIN key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      const MIN_BYTE: byte = -128 as byte;
      map.set(MIN_BYTE, 50);
      map.delete(MIN_BYTE);
      expect(map.has(MIN_BYTE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_1400
     * @tc.name mapDeletePart02Test014
     * @tc.desc Verify Number.NEGATIVE_INFINITY key entry true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.NEGATIVE_INFINITY, 'negInf');
      let result: boolean = map.delete(Number.NEGATIVE_INFINITY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_1500
     * @tc.name mapDeletePart02Test015
     * @tc.desc Verify Number.NEGATIVE_INFINITY key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.NEGATIVE_INFINITY, 'negInf');
      map.set(42, 'normal');
      let sizeBefore: int = map.size;
      map.delete(Number.NEGATIVE_INFINITY);
      expect(map.size).assertEqual(sizeBefore - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_1600
     * @tc.name mapDeletePart02Test016
     * @tc.desc Verify Number.NEGATIVE_INFINITY key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.NEGATIVE_INFINITY, 'negInf');
      map.delete(Number.NEGATIVE_INFINITY);
      let v: string | undefined = map.get(Number.NEGATIVE_INFINITY);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_1700
     * @tc.name mapDeletePart02Test017
     * @tc.desc Verify Number.NEGATIVE_INFINITY key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.NEGATIVE_INFINITY, 'negInf');
      map.delete(Number.NEGATIVE_INFINITY);
      expect(map.has(Number.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_1800
     * @tc.name mapDeletePart02Test018
     * @tc.desc Verify Number.NEGATIVE_INFINITY key Map false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      let result: boolean = map.delete(Number.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_1900
     * @tc.name mapDeletePart02Test019
     * @tc.desc Verify Number.EPSILON key entry true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(Number.EPSILON, 1);
      let result: boolean = map.delete(Number.EPSILON);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_2000
     * @tc.name mapDeletePart02Test020
     * @tc.desc Verify Number.EPSILON key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(Number.EPSILON, 1);
      map.set(0, 0);
      let sizeBefore: int = map.size;
      map.delete(Number.EPSILON);
      expect(map.size).assertEqual(sizeBefore - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_2100
     * @tc.name mapDeletePart02Test021
     * @tc.desc Verify Number.EPSILON key entry false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(1, 10);
      let result: boolean = map.delete(Number.EPSILON);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_2200
     * @tc.name mapDeletePart02Test022
     * @tc.desc Verify Number.EPSILON key Map false size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      let result: boolean = map.delete(Number.EPSILON);
      expect(result).assertFalse();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_2300
     * @tc.name mapDeletePart02Test023
     * @tc.desc Verify "" key entry true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 42);
      let result: boolean = map.delete('');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_2400
     * @tc.name mapDeletePart02Test024
     * @tc.desc Verify "" key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 42);
      map.set('hello', 100);
      let sizeBefore: int = map.size;
      map.delete('');
      expect(map.size).assertEqual(sizeBefore - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_2500
     * @tc.name mapDeletePart02Test025
     * @tc.desc Verify "" key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 42);
      map.delete('');
      let v: int | undefined = map.get('');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_2600
     * @tc.name mapDeletePart02Test026
     * @tc.desc Verify "" key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 42);
      map.delete('');
      expect(map.has('')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_2700
     * @tc.name mapDeletePart02Test027
     * @tc.desc Verify "" key Map false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let result: boolean = map.delete('');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_2800
     * @tc.name mapDeletePart02Test028
     * @tc.desc Verify "" key entry entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let result: boolean = map.delete('');
      expect(result).assertFalse();
      expect(map.has('a')).assertTrue();
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_2900
     * @tc.name mapDeletePart02Test029
     * @tc.desc Verify key string|null null key entry true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | null, int> = new Map<string | null, int>();
      map.set(null, 99);
      let result: boolean = map.delete(null);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_3000
     * @tc.name mapDeletePart02Test030
     * @tc.desc Verify null key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | null, int> = new Map<string | null, int>();
      map.set(null, 99);
      map.set('x', 1);
      let sizeBefore: int = map.size;
      map.delete(null);
      expect(map.size).assertEqual(sizeBefore - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_3100
     * @tc.name mapDeletePart02Test031
     * @tc.desc Verify null key get(null) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | null, int> = new Map<string | null, int>();
      map.set(null, 99);
      map.delete(null);
      let v: int | undefined = map.get(null);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_3200
     * @tc.name mapDeletePart02Test032
     * @tc.desc Verify null key has(null) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | null, int> = new Map<string | null, int>();
      map.set(null, 99);
      map.delete(null);
      expect(map.has(null)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_3300
     * @tc.name mapDeletePart02Test033
     * @tc.desc Verify null key Map false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | null, int> = new Map<string | null, int>();
      let result: boolean = map.delete(null);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_3400
     * @tc.name mapDeletePart02Test034
     * @tc.desc Verify null key entry null entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | null, int> = new Map<string | null, int>();
      map.set('k1', 1);
      let result: boolean = map.delete(null);
      expect(result).assertFalse();
      expect(map.has('k1')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_3500
     * @tc.name mapDeletePart02Test035
     * @tc.desc Verify RegExp key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      let re: RegExp = new RegExp('abc', 'g');
      map.set(re, 100);
      let result: boolean = map.delete(re);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_3600
     * @tc.name mapDeletePart02Test036
     * @tc.desc Verify RegExp size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      let re: RegExp = new RegExp('test', 'i');
      map.set(re, 50);
      map.set(new RegExp('other', 'g'), 60);
      let sizeBefore: int = map.size;
      map.delete(re);
      expect(map.size).assertEqual(sizeBefore - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_3700
     * @tc.name mapDeletePart02Test037
     * @tc.desc Verify RegExp get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      let re: RegExp = new RegExp('abc', 'g');
      map.set(re, 100);
      map.delete(re);
      let v: int | undefined = map.get(re);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_3800
     * @tc.name mapDeletePart02Test038
     * @tc.desc Verify pattern RegExp entry false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      let re1: RegExp = new RegExp('abc', 'g');
      map.set(re1, 100);
      let re2: RegExp = new RegExp('abc', 'g');
      let result: boolean = map.delete(re2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_3900
     * @tc.name mapDeletePart02Test039
     * @tc.desc Verify pattern flags RegExp key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      let re1: RegExp = new RegExp('abc', 'g');
      let re2: RegExp = new RegExp('abc', 'i');
      map.set(re1, 1);
      map.set(re2, 2);
      let firstDeleted: boolean = map.delete(re1);
      let secondDeleted: boolean = map.delete(re2);
      expect(firstDeleted).assertTrue();
      expect(secondDeleted).assertTrue();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_4000
     * @tc.name mapDeletePart02Test040
     * @tc.desc Verify RegExp key false size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      let re: RegExp = new RegExp('never', 'g');
      let result: boolean = map.delete(re);
      expect(result).assertFalse();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_4100
     * @tc.name mapDeletePart02Test041
     * @tc.desc Verify (-2147483647 - 1) key delete true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      const MIN_KEY: int = -2147483648;
      map.set(MIN_KEY, 'val');
      expect(map.delete(MIN_KEY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_4200
     * @tc.name mapDeletePart02Test042
     * @tc.desc Verify byte.MIN key delete true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, double> = new Map<byte, double>();
      const MIN_BYTE: byte = -128 as byte;
      map.set(MIN_BYTE, 1.5);
      expect(map.delete(MIN_BYTE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_4300
     * @tc.name mapDeletePart02Test043
     * @tc.desc Verify Number.NEGATIVE_INFINITY key delete true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(Number.NEGATIVE_INFINITY, -1);
      expect(map.delete(Number.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_4400
     * @tc.name mapDeletePart02Test044
     * @tc.desc Verify Number.EPSILON key delete true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, boolean> = new Map<number, boolean>();
      map.set(Number.EPSILON, false);
      expect(map.delete(Number.EPSILON)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_4500
     * @tc.name mapDeletePart02Test045
     * @tc.desc Verify key delete true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('', 3.14);
      expect(map.delete('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_4600
     * @tc.name mapDeletePart02Test046
     * @tc.desc Verify null key delete true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | null, int> = new Map<string | null, int>();
      map.set(null, 777);
      expect(map.delete(null)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_4700
     * @tc.name mapDeletePart02Test047
     * @tc.desc Verify RegExp key delete true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<RegExp, string> = new Map<RegExp, string>();
      let re: RegExp = new RegExp('del', 'g');
      map.set(re, 'value');
      expect(map.delete(re)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_4800
     * @tc.name mapDeletePart02Test048
     * @tc.desc Verify Map true size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(42, 100);
      let result: boolean = map.delete(42);
      expect(result).assertTrue();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_4900
     * @tc.name mapDeletePart02Test049
     * @tc.desc Verify Map true size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(1, 10);
      map.set(2, 20);
      map.set(3, 30);
      let result: boolean = map.delete(2);
      expect(result).assertTrue();
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_5000
     * @tc.name mapDeletePart02Test050
     * @tc.desc Verify key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      expect(map.delete('a')).assertTrue();
      expect(map.delete('b')).assertTrue();
      expect(map.delete('c')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_5100
     * @tc.name mapDeletePart02Test051
     * @tc.desc Verify (-2147483647 - 1) key delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'zero');
      const MIN_KEY: int = -2147483648;
      expect(map.delete(MIN_KEY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_5200
     * @tc.name mapDeletePart02Test052
     * @tc.desc Verify byte.MIN key delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      map.set(0 as byte, 1);
      const MIN_BYTE: byte = -128 as byte;
      expect(map.delete(MIN_BYTE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_5300
     * @tc.name mapDeletePart02Test053
     * @tc.desc Verify Number.NEGATIVE_INFINITY key delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(100, 1);
      expect(map.delete(Number.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_5400
     * @tc.name mapDeletePart02Test054
     * @tc.desc Verify Number.EPSILON key delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(0, 'zero');
      expect(map.delete(Number.EPSILON)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_5500
     * @tc.name mapDeletePart02Test055
     * @tc.desc Verify key delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('hello', 1);
      expect(map.delete('')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_5600
     * @tc.name mapDeletePart02Test056
     * @tc.desc Verify null key Map null key delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | null, int> = new Map<string | null, int>();
      map.set('x', 1);
      expect(map.delete(null)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_5700
     * @tc.name mapDeletePart02Test057
     * @tc.desc Verify key delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(10, 'ten');
      map.delete(10);
      expect(map.delete(10)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_5800
     * @tc.name mapDeletePart02Test058
     * @tc.desc Verify Map delete key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      expect(map.delete(1)).assertFalse();
      expect(map.delete(Number.EPSILON)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_5900
     * @tc.name mapDeletePart02Test059
     * @tc.desc Verify delete true size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(1, 10);
      map.set(2, 20);
      let sizeBefore: int = map.size;
      let result: boolean = map.delete(1);
      expect(result).assertTrue();
      expect(map.has(1)).assertFalse();
      expect(map.size).assertEqual(sizeBefore - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_6000
     * @tc.name mapDeletePart02Test060
     * @tc.desc Verify delete false size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let sizeBefore: int = map.size;
      let result: boolean = map.delete('nonexistent');
      expect(result).assertFalse();
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_6100
     * @tc.name mapDeletePart02Test061
     * @tc.desc Verify size=1 Map true size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(99, 'only');
      let result: boolean = map.delete(99);
      expect(result).assertTrue();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_6200
     * @tc.name mapDeletePart02Test062
     * @tc.desc Verify size Map size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(1, 1);
      map.set(2, 2);
      map.set(3, 3);
      map.set(4, 4);
      map.set(5, 5);
      let sizeBefore: int = map.size;
      let result: boolean = map.delete(3);
      expect(result).assertTrue();
      expect(map.size).assertEqual(sizeBefore - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_6300
     * @tc.name mapDeletePart02Test063
     * @tc.desc Verify size N 0 delete true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('x', 1);
      map.set('y', 2);
      map.set('z', 3);
      let initialSize: int = map.size;
      let count: int = 0;
      if (map.delete('x')) { count = count + 1; }
      if (map.delete('y')) { count = count + 1; }
      if (map.delete('z')) { count = count + 1; }
      expect(count).assertEqual(initialSize);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_6400
     * @tc.name mapDeletePart02Test064
     * @tc.desc Verify delete true get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.EPSILON, 'eps');
      let result: boolean = map.delete(Number.EPSILON);
      expect(result).assertTrue();
      let v: string | undefined = map.get(Number.EPSILON);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_6500
     * @tc.name mapDeletePart02Test065
     * @tc.desc Verify delete true has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      const MIN_BYTE: byte = -128 as byte;
      map.set(MIN_BYTE, 10);
      let result: boolean = map.delete(MIN_BYTE);
      expect(result).assertTrue();
      expect(map.has(MIN_BYTE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_6600
     * @tc.name mapDeletePart02Test066
     * @tc.desc Verify delete false key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(7, 'seven');
      let result: boolean = map.delete(99);
      expect(result).assertFalse();
      expect(map.get(7)).assertEqual('seven');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_6700
     * @tc.name mapDeletePart02Test067
     * @tc.desc Verify delete false key has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('keep', 1);
      let result: boolean = map.delete('gone');
      expect(result).assertFalse();
      expect(map.has('keep')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_6800
     * @tc.name mapDeletePart02Test068
     * @tc.desc Verify delete true set key delete true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(1, 10);
      map.delete(1);
      map.set(1, 20);
      expect(map.delete(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_6900
     * @tc.name mapDeletePart02Test069
     * @tc.desc Verify delete key key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      let result: boolean = map.delete('b');
      expect(result).assertTrue();
      expect(map.has('b')).assertFalse();
      expect(map.get('a')).assertEqual(1);
      expect(map.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_7000
     * @tc.name mapDeletePart02Test070
     * @tc.desc Verify delete key key has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      map.set(2, 'two');
      map.set(3, 'three');
      let result: boolean = map.delete(2);
      expect(result).assertTrue();
      expect(map.has(2)).assertFalse();
      expect(map.has(1)).assertTrue();
      expect(map.has(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_7100
     * @tc.name mapDeletePart02Test071
     * @tc.desc Verify delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 42);
      const ref: Map<string, int> = map;
      let result: boolean = map.delete('key');
      expect(result).assertTrue();
      expect(ref.has('key')).assertFalse();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_7200
     * @tc.name mapDeletePart02Test072
     * @tc.desc Verify delete set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'a');
      let deleted: boolean = map.delete(1);
      expect(deleted).assertTrue();
      expect(map.has(1)).assertFalse();
      map.set(2, 'b');
      expect(map.has(2)).assertTrue();
      expect(map.get(2)).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_7300
     * @tc.name mapDeletePart02Test073
     * @tc.desc Verify delete key set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(Number.EPSILON, 100);
      let deleted: boolean = map.delete(Number.EPSILON);
      expect(deleted).assertTrue();
      expect(map.has(Number.EPSILON)).assertFalse();
      map.set(Number.EPSILON, 200);
      expect(map.get(Number.EPSILON)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_7400
     * @tc.name mapDeletePart02Test074
     * @tc.desc Verify delete key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let result: boolean = map.delete('nonexistent');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_7500
     * @tc.name mapDeletePart02Test075
     * @tc.desc Verify delete key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      map.delete(1);
      let result: boolean = map.delete(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_7600
     * @tc.name mapDeletePart02Test076
     * @tc.desc Verify Map delete key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      let result: boolean = map.delete(Number.EPSILON);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_7700
     * @tc.name mapDeletePart02Test077
     * @tc.desc Verify (-2147483647 - 1) delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      const MIN_KEY: int = -2147483648;
      map.set(MIN_KEY, -1);
      map.set(0, 0);
      let deleted: boolean = map.delete(MIN_KEY);
      expect(deleted).assertTrue();
      expect(map.has(MIN_KEY)).assertFalse();
      expect(map.has(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_7800
     * @tc.name mapDeletePart02Test078
     * @tc.desc Verify byte.MIN delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      const MIN_BYTE: byte = -128 as byte;
      map.set(MIN_BYTE, 'minByte');
      map.set(0 as byte, 'zero');
      map.delete(MIN_BYTE);
      expect(map.has(MIN_BYTE)).assertFalse();
      expect(map.has(0 as byte)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_7900
     * @tc.name mapDeletePart02Test079
     * @tc.desc Verify long.MAX 64 32 delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const MAX_LONG: long = 9223372036854775807;
      map.set(MAX_LONG, 1);
      map.set(100, 2);
      let deleted: boolean = map.delete(MAX_LONG);
      expect(deleted).assertTrue();
      expect(map.has(MAX_LONG)).assertFalse();
      expect(map.has(100)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_8000
     * @tc.name mapDeletePart02Test080
     * @tc.desc Verify long.MIN 64 delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      const MIN_LONG: long = -9223372036854775807 - 1;
      map.set(MIN_LONG, 'minLong');
      map.set(0, 'zero');
      map.delete(MIN_LONG);
      expect(map.has(MIN_LONG)).assertFalse();
      expect(map.has(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_8100
     * @tc.name mapDeletePart02Test081
     * @tc.desc Verify boolean true/false delete key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 1);
      map.set(false, 0);
      let deleted: boolean = map.delete(true);
      expect(deleted).assertTrue();
      expect(map.has(true)).assertFalse();
      expect(map.has(false)).assertTrue();
      expect(map.get(false)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_8200
     * @tc.name mapDeletePart02Test082
     * @tc.desc Verify boolean delete false true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(true, 'yes');
      map.set(false, 'no');
      let deleted: boolean = map.delete(false);
      expect(deleted).assertTrue();
      expect(map.has(false)).assertFalse();
      expect(map.has(true)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_8300
     * @tc.name mapDeletePart02Test083
     * @tc.desc Verify int delete key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'a');
      map.set(1001, 'b');
      map.set(2001, 'c');
      let deleted: boolean = map.delete(1001);
      expect(deleted).assertTrue();
      expect(map.has(1)).assertTrue();
      expect(map.has(2001)).assertTrue();
      expect(map.has(1001)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_8400
     * @tc.name mapDeletePart02Test084
     * @tc.desc Verify K=byte delete boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      map.set(100 as byte, 200);
      let r: boolean = map.delete(100 as byte);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_8500
     * @tc.name mapDeletePart02Test085
     * @tc.desc Verify K=long delete boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, double> = new Map<long, double>();
      map.set(500, 2.5);
      let r: boolean = map.delete(500);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_8600
     * @tc.name mapDeletePart02Test086
     * @tc.desc Verify K=boolean delete boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(false, 'f');
      let r: boolean = map.delete(false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_8700
     * @tc.name mapDeletePart02Test087
     * @tc.desc Verify K=number delete boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(3.14, 10);
      let r: boolean = map.delete(3.14);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_8800
     * @tc.name mapDeletePart02Test088
     * @tc.desc Verify K=double delete boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(1.5, 'half');
      let r: boolean = map.delete(1.5);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_8900
     * @tc.name mapDeletePart02Test089
     * @tc.desc Verify K=short delete boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, int> = new Map<short, int>();
      map.set(100 as short, 1);
      let r: boolean = map.delete(100 as short);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_9000
     * @tc.name mapDeletePart02Test090
     * @tc.desc Verify K=char delete boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<char, int> = new Map<char, int>();
      map.set(c'A', 1);
      let r: boolean = map.delete(c'A');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_9100
     * @tc.name mapDeletePart02Test091
     * @tc.desc Verify K=Date delete boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, string> = new Map<Date, string>();
      let d: Date = new Date(2024, 1, 1);
      map.set(d, 'date');
      let r: boolean = map.delete(d);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART02_TEST_9200
     * @tc.name mapDeletePart02Test092
     * @tc.desc Verify K=float delete boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeletePart02Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, int> = new Map<float, int>();
      map.set(2.5 as float, 10);
      let r: boolean = map.delete(2.5 as float);
      expect(r).assertTrue();
    });

  });
}
