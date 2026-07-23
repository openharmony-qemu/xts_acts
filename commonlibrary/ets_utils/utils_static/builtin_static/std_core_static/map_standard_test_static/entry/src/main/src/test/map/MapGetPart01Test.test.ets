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
class KeyClass { value: int = 0; }
interface ValObj { name: string; }
interface PairKey { a: int; b: int; }

export default function mapGetPart01TestTest(): void {
  describe('MapGetPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0010
     * @tc.name mapGetPart01Test001
     * @tc.desc Verify get 1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let result: int | undefined = map.get('a');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0020
     * @tc.name mapGetPart01Test002
     * @tc.desc Verify string key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('hello', 42);
      let result: int | undefined = map.get('hello');
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0030
     * @tc.name mapGetPart01Test003
     * @tc.desc Verify string key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('hello', 42);
      let result: int | undefined = map.get('world');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0040
     * @tc.name mapGetPart01Test004
     * @tc.desc Verify "" key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 1);
      let result: int | undefined = map.get('');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0050
     * @tc.name mapGetPart01Test005
     * @tc.desc Verify "" key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let result: int | undefined = map.get('');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0060
     * @tc.name mapGetPart01Test006
     * @tc.desc Verify Unicode emoji key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('😀', 7);
      let result: int | undefined = map.get('😀');
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0070
     * @tc.name mapGetPart01Test007
     * @tc.desc Verify key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('​', 9);
      let result: int | undefined = map.get('​');
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0080
     * @tc.name mapGetPart01Test008
     * @tc.desc Verify XSS <script>alert(1)</script> key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('<script>alert(1)</script>', 5);
      let result: int | undefined = map.get('<script>alert(1)</script>');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0090
     * @tc.name mapGetPart01Test009
     * @tc.desc Verify 10000 key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let longKey: string = '';
      for (let i: int = 0; i < 5000; i++) {
        longKey = longKey + 'xy';
      }
      map.set(longKey, 3);
      let result: int | undefined = map.get(longKey);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0100
     * @tc.name mapGetPart01Test010
     * @tc.desc Verify \t key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let specialKey: string = 'line1\nline2\tend';
      map.set(specialKey, 11);
      let result: int | undefined = map.get(specialKey);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0110
     * @tc.name mapGetPart01Test011
     * @tc.desc Verify key key get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('ab', 1);
      map.set('abc', 2);
      let r1: int | undefined = map.get('ab');
      let r2: int | undefined = map.get('abc');
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0120
     * @tc.name mapGetPart01Test012
     * @tc.desc Verify int key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(42, 100);
      let result: int | undefined = map.get(42);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0130
     * @tc.name mapGetPart01Test013
     * @tc.desc Verify int key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(42, 100);
      let result: int | undefined = map.get(99);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0140
     * @tc.name mapGetPart01Test014
     * @tc.desc Verify int key = 0 get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(0, 50);
      let result: int | undefined = map.get(0);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0150
     * @tc.name mapGetPart01Test015
     * @tc.desc Verify int key = -1 get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(-1, 77);
      let result: int | undefined = map.get(-1);
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0160
     * @tc.name mapGetPart01Test016
     * @tc.desc Verify int key = 1 get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(1, 33);
      let result: int | undefined = map.get(1);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0170
     * @tc.name mapGetPart01Test017
     * @tc.desc Verify int key = 2147483647 (2147483647) get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(2147483647, 88);
      let result: int | undefined = map.get(2147483647);
      expect(result).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0180
     * @tc.name mapGetPart01Test018
     * @tc.desc Verify int key = (-2147483647 - 1) (-2147483648) get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(-2147483648, 66);
      let result: int | undefined = map.get(-2147483648);
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0190
     * @tc.name mapGetPart01Test019
     * @tc.desc Verify int key = 2147483647 Map get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(1, 10);
      let result: int | undefined = map.get(2147483647);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0200
     * @tc.name mapGetPart01Test020
     * @tc.desc Verify number key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(3.14, 10);
      let result: int | undefined = map.get(3.14);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0210
     * @tc.name mapGetPart01Test021
     * @tc.desc Verify number key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(3.14, 10);
      let result: int | undefined = map.get(2.71);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0220
     * @tc.name mapGetPart01Test022
     * @tc.desc Verify number key = NaN get NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(Number.NaN, 99);
      let result: int | undefined = map.get(Number.NaN);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0230
     * @tc.name mapGetPart01Test023
     * @tc.desc Verify number key = Number.POSITIVE_INFINITY get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(Number.POSITIVE_INFINITY, 55);
      let result: int | undefined = map.get(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0240
     * @tc.name mapGetPart01Test024
     * @tc.desc Verify number key = Number.NEGATIVE_INFINITY get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(Number.NEGATIVE_INFINITY, 44);
      let result: int | undefined = map.get(Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0250
     * @tc.name mapGetPart01Test025
     * @tc.desc Verify number key = -0.0 get V +0.0 -0.0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(-0.0, 70);
      map.set(0.0, 71);
      let r1: int | undefined = map.get(-0.0);
      let r2: int | undefined = map.get(0.0);
      expect(r1).assertEqual(71);
      expect(r2).assertEqual(71);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0260
     * @tc.name mapGetPart01Test026
     * @tc.desc Verify number key = Number.EPSILON get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(Number.EPSILON, 22);
      let result: int | undefined = map.get(Number.EPSILON);
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0270
     * @tc.name mapGetPart01Test027
     * @tc.desc Verify Map key=true get(true) V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 20);
      let result: int | undefined = map.get(true);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0280
     * @tc.name mapGetPart01Test028
     * @tc.desc Verify Map key=true get(false) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 20);
      let result: int | undefined = map.get(false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0290
     * @tc.name mapGetPart01Test029
     * @tc.desc Verify Map key=false get(false) V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(false, 30);
      let result: int | undefined = map.get(false);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0300
     * @tc.name mapGetPart01Test030
     * @tc.desc Verify Map true false get(true) V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 25);
      map.set(false, 35);
      let result: int | undefined = map.get(true);
      expect(result).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0310
     * @tc.name mapGetPart01Test031
     * @tc.desc Verify Map true false get(false) V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 25);
      map.set(false, 35);
      let result: int | undefined = map.get(false);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0320
     * @tc.name mapGetPart01Test032
     * @tc.desc Verify long key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(Int.toLong(42), 60);
      let result: int | undefined = map.get(Int.toLong(42));
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0330
     * @tc.name mapGetPart01Test033
     * @tc.desc Verify long key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(Int.toLong(42), 60);
      let result: int | undefined = map.get(Int.toLong(99));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0340
     * @tc.name mapGetPart01Test034
     * @tc.desc Verify long key = long.MAX (9223372036854775807n) get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(9223372036854775807, 90);
      let result: int | undefined = map.get(9223372036854775807);
      expect(result).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0350
     * @tc.name mapGetPart01Test035
     * @tc.desc Verify long key = long.MIN (-9223372036854775808n) get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set((-9223372036854775807 - 1), 80);
      let result: int | undefined = map.get((-9223372036854775807 - 1));
      expect(result).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0360
     * @tc.name mapGetPart01Test036
     * @tc.desc Verify byte key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      map.set(64 as byte, 15);
      let result: int | undefined = map.get(64 as byte);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0370
     * @tc.name mapGetPart01Test037
     * @tc.desc Verify byte key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      map.set(64 as byte, 15);
      let result: int | undefined = map.get(10 as byte);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0380
     * @tc.name mapGetPart01Test038
     * @tc.desc Verify byte key = 127 (byte.MAX) get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      map.set(127 as byte, 8);
      let result: int | undefined = map.get(127 as byte);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0390
     * @tc.name mapGetPart01Test039
     * @tc.desc Verify byte key = -128 (byte.MIN) get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      map.set(-128 as byte, 9);
      let result: int | undefined = map.get(-128 as byte);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0400
     * @tc.name mapGetPart01Test040
     * @tc.desc Verify short key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, int> = new Map<short, int>();
      map.set(1000 as short, 45);
      let result: int | undefined = map.get(1000 as short);
      expect(result).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0410
     * @tc.name mapGetPart01Test041
     * @tc.desc Verify short key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, int> = new Map<short, int>();
      map.set(1000 as short, 45);
      let result: int | undefined = map.get(2000 as short);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0420
     * @tc.name mapGetPart01Test042
     * @tc.desc Verify short key = 32767 (short.MAX) get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, int> = new Map<short, int>();
      map.set(32767 as short, 12);
      let result: int | undefined = map.get(32767 as short);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0430
     * @tc.name mapGetPart01Test043
     * @tc.desc Verify short key = -32768 (short.MIN) get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, int> = new Map<short, int>();
      map.set(-32768 as short, 13);
      let result: int | undefined = map.get(-32768 as short);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0440
     * @tc.name mapGetPart01Test044
     * @tc.desc Verify double key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, int> = new Map<double, int>();
      map.set(2.718281828, 31);
      let result: int | undefined = map.get(2.718281828);
      expect(result).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0450
     * @tc.name mapGetPart01Test045
     * @tc.desc Verify double key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, int> = new Map<double, int>();
      map.set(2.718281828, 31);
      let result: int | undefined = map.get(1.414213562);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0460
     * @tc.name mapGetPart01Test046
     * @tc.desc Verify double key = NaN get NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, int> = new Map<double, int>();
      map.set(Number.NaN, 17);
      let result: int | undefined = map.get(Number.NaN);
      expect(result).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0470
     * @tc.name mapGetPart01Test047
     * @tc.desc Verify double key = Infinity get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, int> = new Map<double, int>();
      map.set(Number.POSITIVE_INFINITY, 18);
      let result: int | undefined = map.get(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0480
     * @tc.name mapGetPart01Test048
     * @tc.desc Verify double key = -Infinity get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, int> = new Map<double, int>();
      map.set(-Number.POSITIVE_INFINITY, 19);
      let result: int | undefined = map.get(-Number.POSITIVE_INFINITY);
      expect(result).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0490
     * @tc.name mapGetPart01Test049
     * @tc.desc Verify bigint key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, int> = new Map<bigint, int>();
      let key: bigint = 9223372036854775807n;
      map.set(key, 40);
      let result: int | undefined = map.get(key);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0500
     * @tc.name mapGetPart01Test050
     * @tc.desc Verify bigint key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, int> = new Map<bigint, int>();
      let key1: bigint = 100n;
      let key2: bigint = 200n;
      map.set(key1, 40);
      let result: int | undefined = map.get(key2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0510
     * @tc.name mapGetPart01Test051
     * @tc.desc Verify float key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, int> = new Map<float, int>();
      map.set(1.5 as float, 23);
      let result: int | undefined = map.get(1.5 as float);
      expect(result).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0520
     * @tc.name mapGetPart01Test052
     * @tc.desc Verify float key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, int> = new Map<float, int>();
      map.set(1.5 as float, 23);
      let result: int | undefined = map.get(2.5 as float);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0530
     * @tc.name mapGetPart01Test053
     * @tc.desc Verify char key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<char, int> = new Map<char, int>();
      map.set(c'A', 55);
      let result: int | undefined = map.get(c'A');
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0540
     * @tc.name mapGetPart01Test054
     * @tc.desc Verify char key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<char, int> = new Map<char, int>();
      map.set(c'A', 55);
      let result: int | undefined = map.get(c'B');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0550
     * @tc.name mapGetPart01Test055
     * @tc.desc Verify Date key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(1000);
      const map: Map<Date, int> = new Map<Date, int>();
      map.set(d, 42);
      let result: int | undefined = map.get(d);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0560
     * @tc.name mapGetPart01Test056
     * @tc.desc Verify Date key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1000);
      let d2: Date = new Date(2000);
      const map: Map<Date, int> = new Map<Date, int>();
      map.set(d1, 42);
      let result: int | undefined = map.get(d2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0570
     * @tc.name mapGetPart01Test057
     * @tc.desc Verify Date Date get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(5000);
      let d2: Date = new Date(5000);
      const map: Map<Date, int> = new Map<Date, int>();
      map.set(d1, 99);
      let result: int | undefined = map.get(d2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0580
     * @tc.name mapGetPart01Test058
     * @tc.desc Verify Date get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(3000);
      const map: Map<Date, int> = new Map<Date, int>();
      map.set(d, 77);
      let result: int | undefined = map.get(d);
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0590
     * @tc.name mapGetPart01Test059
     * @tc.desc Verify object key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ObjKey = { id: 1 };
      const map: Map<ObjKey, int> = new Map<ObjKey, int>();
      map.set(o, 50);
      let result: int | undefined = map.get(o);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0600
     * @tc.name mapGetPart01Test060
     * @tc.desc Verify object key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: ObjKey = { id: 1 };
      let o2: ObjKey = { id: 2 };
      const map: Map<ObjKey, int> = new Map<ObjKey, int>();
      map.set(o1, 50);
      let result: int | undefined = map.get(o2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0610
     * @tc.name mapGetPart01Test061
     * @tc.desc Verify object object get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: ObjKey = { id: 5 };
      let o2: ObjKey = { id: 5 };
      const map: Map<ObjKey, int> = new Map<ObjKey, int>();
      map.set(o1, 88);
      let result: int | undefined = map.get(o2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0620
     * @tc.name mapGetPart01Test062
     * @tc.desc Verify object key get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ObjKey = { id: 7 };
      const map: Map<ObjKey, int> = new Map<ObjKey, int>();
      map.set(o, 33);
      let result: int | undefined = map.get(o);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0630
     * @tc.name mapGetPart01Test063
     * @tc.desc Verify RegExp key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('abc', 'g');
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      map.set(re, 60);
      let result: int | undefined = map.get(re);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0640
     * @tc.name mapGetPart01Test064
     * @tc.desc Verify RegExp key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re1: RegExp = new RegExp('abc', 'g');
      let re2: RegExp = new RegExp('xyz', 'i');
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      map.set(re1, 60);
      let result: int | undefined = map.get(re2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0650
     * @tc.name mapGetPart01Test065
     * @tc.desc Verify pattern flags RegExp RegExp get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re1: RegExp = new RegExp('hello', 'i');
      let re2: RegExp = new RegExp('hello', 'i');
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      map.set(re1, 70);
      let result: int | undefined = map.get(re2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0660
     * @tc.name mapGetPart01Test066
     * @tc.desc Verify RegExp key get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('test', 'g');
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      map.set(re, 80);
      let result: int | undefined = map.get(re);
      expect(result).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0670
     * @tc.name mapGetPart01Test067
     * @tc.desc Verify Error key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('test error');
      const map: Map<Error, int> = new Map<Error, int>();
      map.set(err, 30);
      let result: int | undefined = map.get(err);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0680
     * @tc.name mapGetPart01Test068
     * @tc.desc Verify Error key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error('error one');
      let err2: Error = new Error('error two');
      const map: Map<Error, int> = new Map<Error, int>();
      map.set(err1, 30);
      let result: int | undefined = map.get(err2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0690
     * @tc.name mapGetPart01Test069
     * @tc.desc Verify class key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k: KeyClass = new KeyClass();
      k.value = 10;
      const map: Map<KeyClass, int> = new Map<KeyClass, int>();
      map.set(k, 55);
      let result: int | undefined = map.get(k);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0700
     * @tc.name mapGetPart01Test070
     * @tc.desc Verify class key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: KeyClass = new KeyClass();
      let k2: KeyClass = new KeyClass();
      k1.value = 10;
      k2.value = 20;
      const map: Map<KeyClass, int> = new Map<KeyClass, int>();
      map.set(k1, 55);
      let result: int | undefined = map.get(k2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0710
     * @tc.name mapGetPart01Test071
     * @tc.desc Verify class get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: KeyClass = new KeyClass();
      let k2: KeyClass = new KeyClass();
      k1.value = 99;
      k2.value = 99;
      const map: Map<KeyClass, int> = new Map<KeyClass, int>();
      map.set(k1, 75);
      let result: int | undefined = map.get(k2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0720
     * @tc.name mapGetPart01Test072
     * @tc.desc Verify Array key get V , int>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      const map: Map<int[], int> = new Map<int[], int>();
      map.set(arr, 40);
      let result: int | undefined = map.get(arr);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0730
     * @tc.name mapGetPart01Test073
     * @tc.desc Verify Array key get undefined , int>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: int[] = [1, 2, 3];
      let arr2: int[] = [4, 5, 6];
      const map: Map<int[], int> = new Map<int[], int>();
      map.set(arr1, 40);
      let result: int | undefined = map.get(arr2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0740
     * @tc.name mapGetPart01Test074
     * @tc.desc Verify Array Array get undefined , int>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: int[] = [7, 8, 9];
      let arr2: int[] = [7, 8, 9];
      const map: Map<int[], int> = new Map<int[], int>();
      map.set(arr1, 55);
      let result: int | undefined = map.get(arr2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0750
     * @tc.name mapGetPart01Test075
     * @tc.desc Verify Map key get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Map<string, int> = new Map<string, int>();
      inner.set('x', 1);
      const outer: Map<Map<string, int>, int> = new Map<Map<string, int>, int>();
      outer.set(inner, 25);
      let result: int | undefined = outer.get(inner);
      expect(result).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0760
     * @tc.name mapGetPart01Test076
     * @tc.desc Verify Map key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1: Map<string, int> = new Map<string, int>();
      const m2: Map<string, int> = new Map<string, int>();
      m1.set('x', 1);
      m2.set('y', 2);
      const outer: Map<Map<string, int>, int> = new Map<Map<string, int>, int>();
      outer.set(m1, 25);
      let result: int | undefined = outer.get(m2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0770
     * @tc.name mapGetPart01Test077
     * @tc.desc Verify V = string get key string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('k', 'hello');
      let result: string | undefined = map.get('k');
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0780
     * @tc.name mapGetPart01Test078
     * @tc.desc Verify V = int get key int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('k', 123);
      let result: int | undefined = map.get('k');
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0790
     * @tc.name mapGetPart01Test079
     * @tc.desc Verify V = number get key number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('k', 3.14159);
      let result: number | undefined = map.get('k');
      expect(result).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0800
     * @tc.name mapGetPart01Test080
     * @tc.desc Verify V = boolean get key boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, boolean> = new Map<string, boolean>();
      map.set('k', true);
      let result: boolean | undefined = map.get('k');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0810
     * @tc.name mapGetPart01Test081
     * @tc.desc Verify V = long get key long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, long> = new Map<string, long>();
      map.set('k', Int.toLong(999999999));
      let result: long | undefined = map.get('k');
      expect(result).assertEqual(Int.toLong(999999999));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0820
     * @tc.name mapGetPart01Test082
     * @tc.desc Verify V = double get key double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, double> = new Map<string, double>();
      map.set('k', 1.41421);
      let result: double | undefined = map.get('k');
      expect(result).assertEqual(1.41421);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0830
     * @tc.name mapGetPart01Test083
     * @tc.desc Verify V = byte get key byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, byte> = new Map<string, byte>();
      map.set('k', 100 as byte);
      let result: byte | undefined = map.get('k');
      expect(result).assertEqual(100 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0840
     * @tc.name mapGetPart01Test084
     * @tc.desc Verify V = short get key short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, short> = new Map<string, short>();
      map.set('k', 300 as short);
      let result: short | undefined = map.get('k');
      expect(result).assertEqual(300 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0850
     * @tc.name mapGetPart01Test085
     * @tc.desc Verify V = float get key float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, float> = new Map<string, float>();
      map.set('k', 2.5 as float);
      let result: float | undefined = map.get('k');
      expect(result).assertEqual(2.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0860
     * @tc.name mapGetPart01Test086
     * @tc.desc Verify V = bigint get key bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, bigint> = new Map<bigint, bigint>();
      let key: bigint = 9876543210n;
      let val: bigint = 1234567890n;
      map.set(key, val);
      let result: bigint | undefined = map.get(key);
      expect(result).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0870
     * @tc.name mapGetPart01Test087
     * @tc.desc Verify V = Date value get Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(2000);
      const map: Map<string, Date> = new Map<string, Date>();
      map.set('k', d);
      let result: Date | undefined = map.get('k');
      expect(result).not().assertUndefined();
      expect(result!.getTime()).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0880
     * @tc.name mapGetPart01Test088
     * @tc.desc Verify V = object value get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ValObj = { name: 'test' };
      const map: Map<string, ValObj> = new Map<string, ValObj>();
      map.set('k', v);
      let result: ValObj | undefined = map.get('k');
      expect(result).not().assertUndefined();
      expect(result!.name).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0890
     * @tc.name mapGetPart01Test089
     * @tc.desc Verify V = RegExp value get RegExp pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('pattern', 'g');
      const map: Map<string, RegExp> = new Map<string, RegExp>();
      map.set('k', re);
      let result: RegExp | undefined = map.get('k');
      expect(map.has('k')).assertTrue();
      expect(result!.source).assertEqual(re.source);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0900
     * @tc.name mapGetPart01Test090
     * @tc.desc Verify null value get key null V null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>();
      map.set('k', null);
      let result: string | null | undefined = map.get('k');
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0910
     * @tc.name mapGetPart01Test091
     * @tc.desc Verify undefined value get key undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | undefined> = new Map<string, string | undefined>();
      map.set('k', undefined);
      let result: string | undefined = map.get('k');
      expect(map.has('k')).assertTrue();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0920
     * @tc.name mapGetPart01Test092
     * @tc.desc Verify key get undefined undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let result: int | undefined = map.get('nonexistent');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0930
     * @tc.name mapGetPart01Test093
     * @tc.desc Verify get Map size get size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      let sizeBefore: int = map.size;
      let result: int | undefined = map.get('a');
      let sizeAfter: int = map.size;
      expect(result).assertEqual(1);
      expect(sizeAfter).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0940
     * @tc.name mapGetPart01Test094
     * @tc.desc Verify get Map get keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      let result: int | undefined = map.get('a');
      expect(result).assertEqual(1);
      let keys: string[] = [];
      let it: IterableIterator<string> = map.keys();
      let entry: IteratorResult<string> = it.next();
      while (!entry.done) {
        keys.push(entry.value!);
        entry = it.next();
      }
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0950
     * @tc.name mapGetPart01Test095
     * @tc.desc Verify set key get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('a', 99);
      let result: int | undefined = map.get('a');
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0960
     * @tc.name mapGetPart01Test096
     * @tc.desc Verify delete key get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.delete('a');
      let result: int | undefined = map.get('a');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0970
     * @tc.name mapGetPart01Test097
     * @tc.desc Verify clear Map get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      let result: int | undefined = map.get('a');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0980
     * @tc.name mapGetPart01Test098
     * @tc.desc Verify Map get key key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('only', 5);
      let r1: int | undefined = map.get('only');
      let r2: int | undefined = map.get('missing');
      expect(r1).assertEqual(5);
      expect(r2).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_0990
     * @tc.name mapGetPart01Test099
     * @tc.desc Verify Map get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      for (let i: int = 0; i < 100; i++) {
        map.set(i, i * 10);
      }
      let result: int | undefined = map.get(50);
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_1000
     * @tc.name mapGetPart01Test100
     * @tc.desc Verify set get == 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 88);
      let r1: int | undefined = map.get('key');
      let r2: int | undefined = map.get('key');
      let r3: int | undefined = map.get('key');
      expect(r1).assertEqual(88);
      expect(r2).assertEqual(88);
      expect(r3).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_1010
     * @tc.name mapGetPart01Test101
     * @tc.desc Verify K=string V=number get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('pi', 3.14);
      map.set('e', 2.718);
      let result: number | undefined = map.get('pi');
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_1020
     * @tc.name mapGetPart01Test102
     * @tc.desc Verify K=int V=boolean get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, boolean> = new Map<int, boolean>();
      map.set(1, true);
      map.set(2, false);
      let result: boolean | undefined = map.get(2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_1030
     * @tc.name mapGetPart01Test103
     * @tc.desc Verify K=number V=long get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, long> = new Map<number, long>();
      map.set(1.1, Int.toLong(100));
      map.set(2.2, Int.toLong(200));
      let result: long | undefined = map.get(2.2);
      expect(result).assertEqual(Int.toLong(200));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_1040
     * @tc.name mapGetPart01Test104
     * @tc.desc Verify K=long V=double get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, double> = new Map<long, double>();
      map.set(Int.toLong(1), 1.5);
      map.set(Int.toLong(2), 3.0);
      let result: double | undefined = map.get(Int.toLong(1));
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_1050
     * @tc.name mapGetPart01Test105
     * @tc.desc Verify K=Date V=string key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(100);
      let d2: Date = new Date(200);
      const map: Map<Date, string> = new Map<Date, string>();
      map.set(d1, 'first');
      map.set(d2, 'second');
      let result: string | undefined = map.get(d1);
      expect(result).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_1060
     * @tc.name mapGetPart01Test106
     * @tc.desc Verify K=object V=Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pk: PairKey = { a: 1, b: 2 };
      let val: Date = new Date(500);
      const map: Map<PairKey, Date> = new Map<PairKey, Date>();
      map.set(pk, val);
      let result: Date | undefined = map.get(pk);
      expect(map.has(pk)).assertTrue();
      expect(result).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_1070
     * @tc.name mapGetPart01Test107
     * @tc.desc Verify K=RegExp V=boolean key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('^test', 'i');
      const map: Map<RegExp, boolean> = new Map<RegExp, boolean>();
      map.set(re, true);
      let result: boolean | undefined = map.get(re);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_1080
     * @tc.name mapGetPart01Test108
     * @tc.desc Verify K=byte V=short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, short> = new Map<byte, short>();
      map.set(1 as byte, 100 as short);
      map.set(2 as byte, 200 as short);
      let result: short | undefined = map.get(1 as byte);
      expect(result).assertEqual(100 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART01_1090
     * @tc.name mapGetPart01Test109
     * @tc.desc Verify K=bigint V=bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart01Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, bigint> = new Map<bigint, bigint>();
      let k: bigint = 1111111111111111111n;
      let v: bigint = 2222222222222222222n;
      map.set(k, v);
      let result: bigint | undefined = map.get(k);
      expect(result).assertEqual(v);
    });

  });
}
