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
interface Payload { code: number; msg: string; }

export default function mapGetPart02TestTest(): void {
  describe('MapGetPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0010
     * @tc.name mapGetPart02Test001
     * @tc.desc Verify 2 key Map def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let result: int = map.get('b', 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0020
     * @tc.name mapGetPart02Test002
     * @tc.desc Verify 2 Map key def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let result: int = map.get('anyKey', -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0030
     * @tc.name mapGetPart02Test003
     * @tc.desc Verify K=string key"hello" V=int get int def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('hello', 100);
      let result: int = map.get('hello', 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0040
     * @tc.name mapGetPart02Test004
     * @tc.desc Verify K=string "" V=string get string def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('', 'emptyVal');
      let result: string = map.get('', 'default');
      expect(result).assertEqual('emptyVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0050
     * @tc.name mapGetPart02Test005
     * @tc.desc Verify K=string Unicode emoji" " V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('😀', 10);
      let result: int = map.get('😀', -1);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0060
     * @tc.name mapGetPart02Test006
     * @tc.desc Verify K=string XSS "<script>alert(1)</script>" V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('<script>alert(1)</script>', 'xssVal');
      let result: string = map.get('<script>alert(1)</script>', 'safe');
      expect(result).assertEqual('xssVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0070
     * @tc.name mapGetPart02Test007
     * @tc.desc Verify K=string (10000 ) V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'a'.repeat(10000);
      const map: Map<string, int> = new Map<string, int>();
      map.set(longKey, 777);
      let result: int = map.get(longKey, 0);
      expect(result).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0080
     * @tc.name mapGetPart02Test008
     * @tc.desc Verify K=string " " V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('​', 'zwsp');
      let result: string = map.get('​', 'default');
      expect(result).assertEqual('zwsp');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0090
     * @tc.name mapGetPart02Test009
     * @tc.desc Verify K=int 0 V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'zeroVal');
      let result: string = map.get(0, 'def');
      expect(result).assertEqual('zeroVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0100
     * @tc.name mapGetPart02Test010
     * @tc.desc Verify K=int MAX(2147483647) V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(2147483647, 888);
      let result: int = map.get(2147483647, -1);
      expect(result).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0110
     * @tc.name mapGetPart02Test011
     * @tc.desc Verify K=int MIN(-2147483648) V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(-2147483648, 'minVal');
      let result: string = map.get(-2147483648, 'def');
      expect(result).assertEqual('minVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0120
     * @tc.name mapGetPart02Test012
     * @tc.desc Verify K=number NaN V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(Number.NaN, 55);
      let result: int = map.get(Number.NaN, -99);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0130
     * @tc.name mapGetPart02Test013
     * @tc.desc Verify K=number Infinity V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.POSITIVE_INFINITY, 'infVal');
      let result: string = map.get(Number.POSITIVE_INFINITY, 'def');
      expect(result).assertEqual('infVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0140
     * @tc.name mapGetPart02Test014
     * @tc.desc Verify K=number -Infinity V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(Number.NEGATIVE_INFINITY, 300);
      let result: int = map.get(Number.NEGATIVE_INFINITY, 0);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0150
     * @tc.name mapGetPart02Test015
     * @tc.desc Verify K=number -0.0 V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(-0.0, 'negZero');
      let result: string = map.get(-0.0, 'def');
      expect(result).assertEqual('negZero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0160
     * @tc.name mapGetPart02Test016
     * @tc.desc Verify K=boolean true V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 500);
      let result: int = map.get(true, 0);
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0170
     * @tc.name mapGetPart02Test017
     * @tc.desc Verify K=boolean false V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(false, 'falseVal');
      let result: string = map.get(false, 'trueVal');
      expect(result).assertEqual('falseVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0180
     * @tc.name mapGetPart02Test018
     * @tc.desc Verify K=long V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(100), 'longVal');
      let result: string = map.get(Int.toLong(100), 'def');
      expect(result).assertEqual('longVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0190
     * @tc.name mapGetPart02Test019
     * @tc.desc Verify K=long MAX(9223372036854775807n) V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(9223372036854775807, 999);
      let result: int = map.get(9223372036854775807, -1);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0200
     * @tc.name mapGetPart02Test020
     * @tc.desc Verify K=long MIN(-9223372036854775808n) V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set((-9223372036854775807 - 1), 'minLong');
      let result: string = map.get((-9223372036854775807 - 1), 'def');
      expect(result).assertEqual('minLong');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0210
     * @tc.name mapGetPart02Test021
     * @tc.desc Verify K=double NaN V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, int> = new Map<double, int>();
      map.set(Double.NaN, 404);
      let result: int = map.get(Double.NaN, 0);
      expect(result).assertEqual(404);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0220
     * @tc.name mapGetPart02Test022
     * @tc.desc Verify K=double Infinity V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(Double.POSITIVE_INFINITY, 'dInf');
      let result: string = map.get(Double.POSITIVE_INFINITY, 'def');
      expect(result).assertEqual('dInf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0230
     * @tc.name mapGetPart02Test023
     * @tc.desc Verify K=byte V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(127 as byte, 'maxByte');
      let result: string = map.get(127 as byte, 'def');
      expect(result).assertEqual('maxByte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0240
     * @tc.name mapGetPart02Test024
     * @tc.desc Verify K=byte MIN(-128) V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, int> = new Map<byte, int>();
      map.set(-128 as byte, 200);
      let result: int = map.get(-128 as byte, 0);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0250
     * @tc.name mapGetPart02Test025
     * @tc.desc Verify K=short V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(32767 as short, 'maxShort');
      let result: string = map.get(32767 as short, 'def');
      expect(result).assertEqual('maxShort');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0260
     * @tc.name mapGetPart02Test026
     * @tc.desc Verify K=short MIN(-32768) V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, int> = new Map<short, int>();
      map.set(-32768 as short, 150);
      let result: int = map.get(-32768 as short, 0);
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0270
     * @tc.name mapGetPart02Test027
     * @tc.desc Verify K=float NaN V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      map.set(Float.NaN, 'fNaN');
      let result: string = map.get(Float.NaN, 'def');
      expect(result).assertEqual('fNaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0280
     * @tc.name mapGetPart02Test028
     * @tc.desc Verify K=float Infinity V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, int> = new Map<float, int>();
      map.set(Float.POSITIVE_INFINITY as float, 600);
      let result: int = map.get(Float.POSITIVE_INFINITY as float, 0);
      expect(result).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0290
     * @tc.name mapGetPart02Test029
     * @tc.desc Verify K=char V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<char, int> = new Map<char, int>();
      map.set(c'A', 65);
      let result: int = map.get(c'A', -1);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0300
     * @tc.name mapGetPart02Test030
     * @tc.desc Verify K=bigint V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, string> = new Map<bigint, string>();
      map.set(12345n, 'bigVal');
      let result: string = map.get(12345n, 'def');
      expect(result).assertEqual('bigVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0310
     * @tc.name mapGetPart02Test031
     * @tc.desc Verify K=Date V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, int> = new Map<Date, int>();
      let keyDate: Date = new Date(1700000000000);
      map.set(keyDate, 750);
      let result: int = map.get(keyDate, 0);
      expect(result).assertEqual(750);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0320
     * @tc.name mapGetPart02Test032
     * @tc.desc Verify K=Date V=string get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, string> = new Map<Date, string>();
      let ts: int = 1700000000;
      let key1: Date = new Date(ts);
      let key2: Date = new Date(ts);
      map.set(key1, 'found');
      let result: string = map.get(key2, 'default');
      expect(result).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0330
     * @tc.name mapGetPart02Test033
     * @tc.desc Verify K=object(interface ) V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<ObjKey, int> = new Map<ObjKey, int>();
      let key: ObjKey = { id: 1, name: 'a' } as ObjKey;
      map.set(key, 333);
      let result: int = map.get(key, -1);
      expect(result).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0340
     * @tc.name mapGetPart02Test034
     * @tc.desc Verify K=RegExp V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<RegExp, string> = new Map<RegExp, string>();
      let keyPat: RegExp = new RegExp('test', 'g');
      map.set(keyPat, 'regexVal');
      let result: string = map.get(keyPat, 'def');
      expect(result).assertEqual('regexVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0350
     * @tc.name mapGetPart02Test035
     * @tc.desc Verify K=Error V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Error, int> = new Map<Error, int>();
      let keyErr: Error = new Error('test error');
      map.set(keyErr, 911);
      let result: int = map.get(keyErr, 0);
      expect(result).assertEqual(911);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0360
     * @tc.name mapGetPart02Test036
     * @tc.desc Verify K=string "" Map V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      let result: string = map.get('', 'myDefault');
      expect(result).assertEqual('myDefault');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0370
     * @tc.name mapGetPart02Test037
     * @tc.desc Verify K=string Unicode emoji" " V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('x', 1);
      let result: int = map.get('😀', -99);
      expect(result).assertEqual(-99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0380
     * @tc.name mapGetPart02Test038
     * @tc.desc Verify K=string XSS V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('normal', 'val');
      let result: string = map.get('<script>alert(1)</script>', 'safeDefault');
      expect(result).assertEqual('safeDefault');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0390
     * @tc.name mapGetPart02Test039
     * @tc.desc Verify K=string (10000 ) V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('short', 1);
      let result: int = map.get('a'.repeat(10000), 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0400
     * @tc.name mapGetPart02Test040
     * @tc.desc Verify K=int V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      let result: string = map.get(2, 'defaultVal');
      expect(result).assertEqual('defaultVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0410
     * @tc.name mapGetPart02Test041
     * @tc.desc Verify K=int MAX V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(0, 0);
      let result: int = map.get(2147483647, -2147483648);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0420
     * @tc.name mapGetPart02Test042
     * @tc.desc Verify K=int MIN V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'zero');
      let result: string = map.get(-2147483648, 'defMin');
      expect(result).assertEqual('defMin');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0430
     * @tc.name mapGetPart02Test043
     * @tc.desc Verify K=number NaN key Map key key def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(1.5, 200);
      let result: int = map.get(Number.NaN, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0440
     * @tc.name mapGetPart02Test044
     * @tc.desc Verify K=number Infinity V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(0, 'zero');
      let result: string = map.get(Number.POSITIVE_INFINITY, 'infDef');
      expect(result).assertEqual('infDef');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0450
     * @tc.name mapGetPart02Test045
     * @tc.desc Verify K=number -0.0 Map +0.0 V=int get def 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(0.0, 100);
      let result: int = map.get(-0.0, -50);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0460
     * @tc.name mapGetPart02Test046
     * @tc.desc Verify K=boolean Map false true V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(false, 10);
      let result: int = map.get(true, 20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0470
     * @tc.name mapGetPart02Test047
     * @tc.desc Verify K=boolean Map true false V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(true, 't');
      let result: string = map.get(false, 'fDefault');
      expect(result).assertEqual('fDefault');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0480
     * @tc.name mapGetPart02Test048
     * @tc.desc Verify K=long V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(1), 'one');
      let result: string = map.get(Int.toLong(999), 'longDef');
      expect(result).assertEqual('longDef');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0490
     * @tc.name mapGetPart02Test049
     * @tc.desc Verify K=double NaN V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, int> = new Map<double, int>();
      map.set(3.14, 314);
      let result: int = map.get(Double.NaN, -404);
      expect(result).assertEqual(-404);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0500
     * @tc.name mapGetPart02Test050
     * @tc.desc Verify K=byte V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(0 as byte, 'zero');
      let result: string = map.get(100 as byte, 'byteDef');
      expect(result).assertEqual('byteDef');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0510
     * @tc.name mapGetPart02Test051
     * @tc.desc Verify K=short V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, int> = new Map<short, int>();
      map.set(1 as short, 1);
      let result: int = map.get(999 as short, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0520
     * @tc.name mapGetPart02Test052
     * @tc.desc Verify K=float NaN V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      map.set(1.0 as float, 'one');
      let result: string = map.get(Float.NaN, 'fDef');
      expect(result).assertEqual('fDef');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0530
     * @tc.name mapGetPart02Test053
     * @tc.desc Verify K=char V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<char, int> = new Map<char, int>();
      map.set(c'X', 88);
      let result: int = map.get(c'Z', -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0540
     * @tc.name mapGetPart02Test054
     * @tc.desc Verify K=bigint V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, string> = new Map<bigint, string>();
      map.set(1n, 'one');
      let result: string = map.get(99999n, 'bigDef');
      expect(result).assertEqual('bigDef');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0550
     * @tc.name mapGetPart02Test055
     * @tc.desc Verify K=Date V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, int> = new Map<Date, int>();
      map.set(new Date(1000000), 1);
      let result: int = map.get(new Date(9999999), -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0560
     * @tc.name mapGetPart02Test056
     * @tc.desc Verify K=object V=int get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<ObjKey, int> = new Map<ObjKey, int>();
      let key1: ObjKey = { id: 1, name: 'a' } as ObjKey;
      let key2: ObjKey = { id: 1, name: 'a' } as ObjKey;
      map.set(key1, 555);
      let result: int = map.get(key2, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0570
     * @tc.name mapGetPart02Test057
     * @tc.desc Verify K=RegExp pattern V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<RegExp, string> = new Map<RegExp, string>();
      let pat1: RegExp = new RegExp('abc', 'i');
      let pat2: RegExp = new RegExp('abc', 'i');
      map.set(pat1, 'hit');
      let result: string = map.get(pat2, 'miss');
      expect(result).assertEqual('miss');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0580
     * @tc.name mapGetPart02Test058
     * @tc.desc Verify K=Error V=string get def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Error, string> = new Map<Error, string>();
      map.set(new Error('e1'), 'first');
      let result: string = map.get(new Error('e2'), 'defErr');
      expect(result).assertEqual('defErr');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0590
     * @tc.name mapGetPart02Test059
     * @tc.desc Verify def=int 0 key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let result: int = map.get('missing', 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0600
     * @tc.name mapGetPart02Test060
     * @tc.desc Verify def=int MAX(2147483647) key MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let result: int = map.get('missing', 2147483647);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0610
     * @tc.name mapGetPart02Test061
     * @tc.desc Verify def=int MIN(-2147483648) key MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let result: int = map.get('missing', -2147483648);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0620
     * @tc.name mapGetPart02Test062
     * @tc.desc Verify def=int -1 key -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let result: int = map.get('missing', -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0630
     * @tc.name mapGetPart02Test063
     * @tc.desc Verify def=string "" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      let result: string = map.get('missing', '');
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0640
     * @tc.name mapGetPart02Test064
     * @tc.desc Verify def=string Unicode emoji key emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      let result: string = map.get('missing', '😀😀');
      expect(result).assertEqual('😀😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0650
     * @tc.name mapGetPart02Test065
     * @tc.desc Verify def=string XSS key XSS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      let result: string = map.get('missing', '<img src=x onerror=alert(1)>');
      expect(result).assertEqual('<img src=x onerror=alert(1)>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0660
     * @tc.name mapGetPart02Test066
     * @tc.desc Verify def=string key def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longDef: string = 'x'.repeat(5000);
      const map: Map<string, string> = new Map<string, string>();
      let result: string = map.get('missing', longDef);
      expect(result).assertEqual(longDef);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0670
     * @tc.name mapGetPart02Test067
     * @tc.desc Verify def=string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      let result: string = map.get('missing', '​');
      expect(result).assertEqual('​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0680
     * @tc.name mapGetPart02Test068
     * @tc.desc Verify def=number NaN key NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      let result: number = map.get('missing', Number.NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0690
     * @tc.name mapGetPart02Test069
     * @tc.desc Verify def=number Infinity key Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      let result: number = map.get('missing', Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0700
     * @tc.name mapGetPart02Test070
     * @tc.desc Verify def=number -Infinity key -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      let result: number = map.get('missing', Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0710
     * @tc.name mapGetPart02Test071
     * @tc.desc Verify def=number Number.EPSILON key EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      let result: number = map.get('missing', Number.EPSILON);
      expect(result).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0720
     * @tc.name mapGetPart02Test072
     * @tc.desc Verify def=boolean true key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, boolean> = new Map<string, boolean>();
      let result: boolean = map.get('missing', true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0730
     * @tc.name mapGetPart02Test073
     * @tc.desc Verify def=boolean false key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, boolean> = new Map<string, boolean>();
      let result: boolean = map.get('missing', false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0740
     * @tc.name mapGetPart02Test074
     * @tc.desc Verify def=Date key Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Date> = new Map<string, Date>();
      let defDate: Date = new Date(1700000000000);
      let result: Date = map.get('missing', defDate);
      expect(result).assertEqual(defDate);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0750
     * @tc.name mapGetPart02Test075
     * @tc.desc Verify def=long MAX key long MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, long> = new Map<string, long>();
      let result: long = map.get('missing', 9223372036854775807);
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0760
     * @tc.name mapGetPart02Test076
     * @tc.desc Verify def=double NaN key double NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, double> = new Map<string, double>();
      let result: double = map.get('missing', Double.NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0770
     * @tc.name mapGetPart02Test077
     * @tc.desc Verify def=byte 0 key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, byte> = new Map<string, byte>();
      let result: byte = map.get('missing', 0 as byte);
      expect(result).assertEqual(0 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0780
     * @tc.name mapGetPart02Test078
     * @tc.desc Verify def=short MIN(-32768) key -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, short> = new Map<string, short>();
      let result: short = map.get('missing', -32768 as short);
      expect(result).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0790
     * @tc.name mapGetPart02Test079
     * @tc.desc Verify def=float Infinity key float Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, float> = new Map<string, float>();
      let result: float = map.get('missing', Float.POSITIVE_INFINITY as float);
      expect(result).assertEqual(Float.POSITIVE_INFINITY as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0800
     * @tc.name mapGetPart02Test080
     * @tc.desc Verify def=bigint key bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, bigint> = new Map<string, bigint>();
      let result: bigint = map.get('missing', 0n);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0810
     * @tc.name mapGetPart02Test081
     * @tc.desc Verify def=null V string|null key null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>();
      let result: string | null = map.get('missing', null);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0820
     * @tc.name mapGetPart02Test082
     * @tc.desc Verify key 1 def=0 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let result: int = map.get('a', 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0830
     * @tc.name mapGetPart02Test083
     * @tc.desc Verify key "stored" def="default" "stored" "default"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('key', 'stored');
      let result: string = map.get('key', 'default');
      expect(result).assertEqual('stored');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0840
     * @tc.name mapGetPart02Test084
     * @tc.desc Verify key true def=false true false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, boolean> = new Map<string, boolean>();
      map.set('flag', true);
      let result: boolean = map.get('flag', false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0850
     * @tc.name mapGetPart02Test085
     * @tc.desc Verify key false def=true false true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, boolean> = new Map<string, boolean>();
      map.set('flag', false);
      let result: boolean = map.get('flag', true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0860
     * @tc.name mapGetPart02Test086
     * @tc.desc Verify key int MAX def=MIN MAX MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('maxKey', 2147483647);
      let result: int = map.get('maxKey', -2147483648);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0870
     * @tc.name mapGetPart02Test087
     * @tc.desc Verify key NaN def=0 NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('nanKey', Number.NaN);
      let result: number = map.get('nanKey', 0);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0880
     * @tc.name mapGetPart02Test088
     * @tc.desc Verify key Infinity def=MAX Infinity MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('infKey', Number.POSITIVE_INFINITY);
      let result: number = map.get('infKey', 2147483647);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0890
     * @tc.name mapGetPart02Test089
     * @tc.desc Verify key long MAX def=0n MAX 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, long> = new Map<string, long>();
      map.set('longKey', 9223372036854775807);
      let result: long = map.get('longKey', Int.toLong(0));
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0900
     * @tc.name mapGetPart02Test090
     * @tc.desc Verify key byte def byte byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, byte> = new Map<string, byte>();
      map.set('byteKey', 100 as byte);
      let result: byte = map.get('byteKey', -1 as byte);
      expect(result).assertEqual(100 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0910
     * @tc.name mapGetPart02Test091
     * @tc.desc Verify key Date def Date Date def Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Date> = new Map<string, Date>();
      let storedDate: Date = new Date(1000000);
      let defDate: Date = new Date(9999999);
      map.set('dateKey', storedDate);
      let result: Date = map.get('dateKey', defDate);
      expect(result).assertEqual(storedDate);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0920
     * @tc.name mapGetPart02Test092
     * @tc.desc Verify key V Date Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Date> = new Map<string, Date>();
      let stored: Date = new Date(1700000000000);
      map.set('d', stored);
      let result: Date = map.get('d', new Date(0));
      expect(result).assertEqual(stored);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0930
     * @tc.name mapGetPart02Test093
     * @tc.desc Verify key def Date get Date def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Date> = new Map<string, Date>();
      let defDate: Date = new Date(1600000000000);
      let result: Date = map.get('missing', defDate);
      expect(result).assertEqual(defDate);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0940
     * @tc.name mapGetPart02Test094
     * @tc.desc Verify key V interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Payload> = new Map<string, Payload>();
      let stored: Payload = { code: 200, msg: 'ok' } as Payload;
      let def: Payload = { code: 500, msg: 'err' } as Payload;
      map.set('p', stored);
      let result: Payload = map.get('p', def);
      expect(result.code).assertEqual(200);
      expect(result.msg).assertEqual('ok');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0950
     * @tc.name mapGetPart02Test095
     * @tc.desc Verify key def interface def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Payload> = new Map<string, Payload>();
      let def: Payload = { code: 500, msg: 'err' } as Payload;
      let result: Payload = map.get('missing', def);
      expect(result.code).assertEqual(500);
      expect(result.msg).assertEqual('err');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0960
     * @tc.name mapGetPart02Test096
     * @tc.desc Verify get Map size key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let sizeBefore: number = map.size;
      let result: int = map.get('a', -1);
      expect(result).assertEqual(1);
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0970
     * @tc.name mapGetPart02Test097
     * @tc.desc Verify get Map size key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let sizeBefore: number = map.size;
      let result: int = map.get('b', -1);
      expect(result).assertEqual(-1);
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0980
     * @tc.name mapGetPart02Test098
     * @tc.desc Verify get Map key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('x', 50);
      let result: int = map.get('x', 999);
      expect(result).assertEqual(50);
      let secondGet: int = map.get('x', -1);
      expect(secondGet).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_0990
     * @tc.name mapGetPart02Test099
     * @tc.desc Verify get(key, def) key def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let r1: int = map.get('nope', 42);
      let r2: int = map.get('nope', 42);
      expect(r1).assertEqual(42);
      expect(r2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_1000
     * @tc.name mapGetPart02Test100
     * @tc.desc Verify Map get( key, def) def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('only', 'one');
      let result: string = map.get('other', 'fallback');
      expect(result).assertEqual('fallback');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_1010
     * @tc.name mapGetPart02Test101
     * @tc.desc Verify clear get( key, def) def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.clear();
      let result: int = map.get('a', 500);
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_1020
     * @tc.name mapGetPart02Test102
     * @tc.desc Verify delete get( key, def) def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.delete('a');
      let result: int = map.get('a', 77);
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_1030
     * @tc.name mapGetPart02Test103
     * @tc.desc Verify Map key def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      for (let i: int = 0; i < 100; i++) {
        map.set(i, i * 10);
      }
      let result: int = map.get(999, -500);
      expect(result).assertEqual(-500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_1040
     * @tc.name mapGetPart02Test104
     * @tc.desc Verify get V def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, double> = new Map<string, double>();
      let result: double = map.get('missing', 3.14);
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_1050
     * @tc.name mapGetPart02Test105
     * @tc.desc Verify key null K null get( null key, def) def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | null, int> = new Map<string | null, int>();
      map.set('a', 1);
      let result: int = map.get(null, 99);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_1060
     * @tc.name mapGetPart02Test106
     * @tc.desc Verify get(key, def) falls back to default when stored value is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>();
      map.set('k', null);
      let result: string | null = map.get('k', 'default');
      expect(result).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART02_1070
     * @tc.name mapGetPart02Test107
     * @tc.desc Verify get(key, def) falls back to default when stored value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapGetPart02Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | undefined> = new Map<string, string | undefined>();
      map.set('k', undefined);
      let result: string | undefined = map.get('k', 'default');
      expect(result).assertEqual('default');
    });

  });
}
