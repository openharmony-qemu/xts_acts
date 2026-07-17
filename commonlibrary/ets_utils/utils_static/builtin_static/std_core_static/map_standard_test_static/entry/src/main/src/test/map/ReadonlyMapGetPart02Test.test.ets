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

interface Payload { id: int; name: string; }
interface Data { code: int; msg: string; }
interface Coord { x: int; y: int; }

export default function readonlyMapGetPart02TestTest(): void {
  describe('ReadonlyMapGetPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_0100
     * @tc.name readonlyMapGetPart02Test001
     * @tc.desc Verify get 1 key typeof string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string> = new Map<string, string>([['alpha', 'beta']]);
      let result: string | undefined = map.get('alpha');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_0200
     * @tc.name readonlyMapGetPart02Test002
     * @tc.desc Verify get 1 key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string> = new Map<string, string>([['alpha', 'beta']]);
      let result: string | undefined = map.get('gamma');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_0300
     * @tc.name readonlyMapGetPart02Test003
     * @tc.desc Verify key=long.MAX get V V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, int> = new Map<long, int>([[9223372036854775807, 42]]);
      let result: int | undefined = map.get(9223372036854775807);
      expect(result!).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_0400
     * @tc.name readonlyMapGetPart02Test004
     * @tc.desc Verify key=long.MAX get typeof int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, int> = new Map<long, int>([[9223372036854775807, 99]]);
      let result: int | undefined = map.get(9223372036854775807);
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_0500
     * @tc.name readonlyMapGetPart02Test005
     * @tc.desc Verify key=long.MIN get V V=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[(-9223372036854775807 - 1), 'min_long_val']]);
      let result: string | undefined = map.get((-9223372036854775807 - 1));
      expect(result!).assertEqual('min_long_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_0600
     * @tc.name readonlyMapGetPart02Test006
     * @tc.desc Verify key=NaN get V V=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, number> = new Map<number, number>([[Number.NaN, 3.14]]);
      let result: number | undefined = map.get(Number.NaN);
      expect(result!).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_0700
     * @tc.name readonlyMapGetPart02Test007
     * @tc.desc Verify key=Infinity get V V=boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, boolean> = new Map<number, boolean>([[Number.POSITIVE_INFINITY, true]]);
      let result: boolean | undefined = map.get(Number.POSITIVE_INFINITY);
      expect(result!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_0800
     * @tc.name readonlyMapGetPart02Test008
     * @tc.desc Verify key=Infinity get typeof boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, boolean> = new Map<number, boolean>([[Number.POSITIVE_INFINITY, false]]);
      let result: boolean | undefined = map.get(Number.POSITIVE_INFINITY);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_0900
     * @tc.name readonlyMapGetPart02Test009
     * @tc.desc Verify key=-Infinity get V V=long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, long> = new Map<number, long>([[Number.NEGATIVE_INFINITY, Int.toLong(100)]]);
      let result: long | undefined = map.get(Number.NEGATIVE_INFINITY);
      expect(result!).assertEqual(Int.toLong(100));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_1000
     * @tc.name readonlyMapGetPart02Test010
     * @tc.desc Verify key=-Infinity get typeof long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, long> = new Map<number, long>([[Number.NEGATIVE_INFINITY, Int.toLong(200)]]);
      let result: long | undefined = map.get(Number.NEGATIVE_INFINITY);
      expect(typeof result).assertEqual('long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_1100
     * @tc.name readonlyMapGetPart02Test011
     * @tc.desc Verify key=XSS get V V=Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(1700000000000);
      const map: ReadonlyMap<string, Date> = new Map<string, Date>([['<script>alert(1)</script>', d]]);
      let result: Date | undefined = map.get('<script>alert(1)</script>');
      expect(result!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_1200
     * @tc.name readonlyMapGetPart02Test012
     * @tc.desc Verify key=XSS get typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(1700000000000);
      const map: ReadonlyMap<string, Date> = new Map<string, Date>([['<script>alert(1)</script>', d]]);
      let result: Date | undefined = map.get('<script>alert(1)</script>');
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_1300
     * @tc.name readonlyMapGetPart02Test013
     * @tc.desc Verify key=long 0n get V V=double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, double> = new Map<long, double>([[Int.toLong(0), 2.718281828]]);
      let result: double | undefined = map.get(Int.toLong(0));
      expect(result!).assertEqual(2.718281828);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_1400
     * @tc.name readonlyMapGetPart02Test014
     * @tc.desc Verify V=number get typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['k', 2.5]]);
      let result: number | undefined = map.get('k');
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_1500
     * @tc.name readonlyMapGetPart02Test015
     * @tc.desc Verify V=byte get typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, byte> = new Map<string, byte>([['k', 64 as byte]]);
      let result: byte | undefined = map.get('k');
      expect(typeof result).assertEqual('byte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_1600
     * @tc.name readonlyMapGetPart02Test016
     * @tc.desc Verify V=short get typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, short> = new Map<string, short>([['k', 500 as short]]);
      let result: short | undefined = map.get('k');
      expect(typeof result).assertEqual('short');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_1700
     * @tc.name readonlyMapGetPart02Test017
     * @tc.desc Verify V=float get typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, float> = new Map<string, float>([['k', 1.5 as float]]);
      let result: float | undefined = map.get('k');
      expect(typeof result).assertEqual('float');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_1800
     * @tc.name readonlyMapGetPart02Test018
     * @tc.desc Verify V=char get typeof string char string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, char> = new Map<string, char>([['k', c'A']]);
      let result: char | undefined = map.get('k');
      expect(typeof result).assertEqual('char');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_1900
     * @tc.name readonlyMapGetPart02Test019
     * @tc.desc Verify V=bigint get typeof bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, bigint> = new Map<string, bigint>([['k', 12345n]]);
      let result: bigint | undefined = map.get('k');
      expect(typeof result).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_2000
     * @tc.name readonlyMapGetPart02Test020
     * @tc.desc Verify V=string get set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string> = new Map<string, string>([['k1', 'exact_value']]);
      let result: string | undefined = map.get('k1');
      expect(result!).assertEqual('exact_value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_2100
     * @tc.name readonlyMapGetPart02Test021
     * @tc.desc Verify V=int get set int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['k_int', 2147483647]]);
      let result: int | undefined = map.get('k_int');
      expect(result!).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_2200
     * @tc.name readonlyMapGetPart02Test022
     * @tc.desc Verify V=number get set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['k_num', 1.6180339887]]);
      let result: number | undefined = map.get('k_num');
      expect(result!).assertEqual(1.6180339887);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_2300
     * @tc.name readonlyMapGetPart02Test023
     * @tc.desc Verify V=boolean true get true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, boolean> = new Map<string, boolean>([['k_true', true]]);
      let result: boolean | undefined = map.get('k_true');
      expect(result!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_2400
     * @tc.name readonlyMapGetPart02Test024
     * @tc.desc Verify V=boolean false get false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, boolean> = new Map<string, boolean>([['k_false', false]]);
      let result: boolean | undefined = map.get('k_false');
      expect(result!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_2500
     * @tc.name readonlyMapGetPart02Test025
     * @tc.desc Verify V=long get set bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, long> = new Map<string, long>([['k_long', 9223372036854775807]]);
      let result: long | undefined = map.get('k_long');
      expect(result!).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_2600
     * @tc.name readonlyMapGetPart02Test026
     * @tc.desc Verify V=double get set double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, double> = new Map<string, double>([['k_dbl', 2.2250738585072014e-308]]);
      let result: double | undefined = map.get('k_dbl');
      expect(result!).assertEqual(2.2250738585072014e-308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_2700
     * @tc.name readonlyMapGetPart02Test027
     * @tc.desc Verify V=byte get set byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, byte> = new Map<string, byte>([['k_byte', 127 as byte]]);
      let result: byte | undefined = map.get('k_byte');
      expect(result!).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_2800
     * @tc.name readonlyMapGetPart02Test028
     * @tc.desc Verify V=Date get set Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(1714521600000);
      const map: ReadonlyMap<string, Date> = new Map<string, Date>([['k_date', d]]);
      let result: Date | undefined = map.get('k_date');
      expect(result!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_2900
     * @tc.name readonlyMapGetPart02Test029
     * @tc.desc Verify V=RegExp get set RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('^test', 'i');
      const map: ReadonlyMap<string, RegExp> = new Map<string, RegExp>([['k_re', re]]);
      let result: RegExp | undefined = map.get('k_re');
      expect(result!).assertEqual(re);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_3000
     * @tc.name readonlyMapGetPart02Test030
     * @tc.desc Verify V=Error get set Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('ref_err');
      const map: ReadonlyMap<string, Error> = new Map<string, Error>([['k_err', err]]);
      let result: Error | undefined = map.get('k_err');
      expect(result!).assertEqual(err);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_3100
     * @tc.name readonlyMapGetPart02Test031
     * @tc.desc Verify V=object interface get set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Data = { code: 200, msg: 'ok' } as Data;
      const map: ReadonlyMap<string, Data> = new Map<string, Data>([['k_obj', obj]]);
      let result: Data | undefined = map.get('k_obj');
      expect(result!).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_3200
     * @tc.name readonlyMapGetPart02Test032
     * @tc.desc Verify V=Array<int> get set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [5, 10, 15];
      const map: ReadonlyMap<string, Array<int>> = new Map<string, Array<int>>([['k_arr', arr]]);
      let result: Array<int> | undefined = map.get('k_arr');
      expect(result!).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_3300
     * @tc.name readonlyMapGetPart02Test033
     * @tc.desc Verify V=Map<string,int> get set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Map<string, int> = new Map<string, int>();
      inner.set('inner_key', 42);
      const map: ReadonlyMap<string, Map<string, int>> = new Map<string, Map<string, int>>([['k_map', inner]]);
      const result: Map<string, int> | undefined = map.get('k_map');
      expect(result!).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_3400
     * @tc.name readonlyMapGetPart02Test034
     * @tc.desc Verify V=Set<int> get set Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(3);
      s.add(7);
      const map: ReadonlyMap<string, Set<int>> = new Map<string, Set<int>>([['k_set', s]]);
      let result: Set<int> | undefined = map.get('k_set');
      expect(result!).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_3500
     * @tc.name readonlyMapGetPart02Test035
     * @tc.desc Verify key get typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let result: int | undefined = map.get('missing_key');
      expect(typeof result).assertEqual('undefined');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_3600
     * @tc.name readonlyMapGetPart02Test036
     * @tc.desc Verify Map get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string> = new Map<string, string>();
      let result: string | undefined = map.get('anything');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_3700
     * @tc.name readonlyMapGetPart02Test037
     * @tc.desc Verify Date key Date key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1700000000000);
      let d2: Date = new Date(1700000000000);
      const map: ReadonlyMap<Date, string> = new Map<Date, string>([[d1, 'value_for_d1']]);
      let result: string | undefined = map.get(d2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_3800
     * @tc.name readonlyMapGetPart02Test038
     * @tc.desc Verify RegExp key pattern RegExp key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('abc', 'g');
      let r2: RegExp = new RegExp('abc', 'g');
      const map: ReadonlyMap<RegExp, string> = new Map<RegExp, string>([[r1, 'value_for_r1']]);
      let result: string | undefined = map.get(r2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_3900
     * @tc.name readonlyMapGetPart02Test039
     * @tc.desc Verify object key object key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Coord = { x: 10, y: 20 } as Coord;
      let obj2: Coord = { x: 10, y: 20 } as Coord;
      const map: ReadonlyMap<Coord, string> = new Map<Coord, string>([[obj1, 'point_a']]);
      let result: string | undefined = map.get(obj2);
      expect(result).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_4000
     * @tc.name readonlyMapGetPart02Test040
     * @tc.desc Verify get key Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 1], ['y', 2], ['z', 3]]);
      let sizeBefore: int = map.size;
      let r: int | undefined = map.get('x');
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_4100
     * @tc.name readonlyMapGetPart02Test041
     * @tc.desc Verify get key Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 10], ['b', 20]]);
      let sizeBefore: int = map.size;
      let r: int | undefined = map.get('ghost');
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_4200
     * @tc.name readonlyMapGetPart02Test042
     * @tc.desc Verify get key key has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string> = new Map<string, string>([['persist', 'value']]);
      const result: string | undefined = map.get('persist');
      expect(result).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_4300
     * @tc.name readonlyMapGetPart02Test043
     * @tc.desc Verify get key has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['real', 1]]);
      let r: int | undefined = map.get('fake');
      expect(map.has('fake')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_4400
     * @tc.name readonlyMapGetPart02Test044
     * @tc.desc Verify set get == r2!
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['stable', 777]]);
      let r1: int | undefined = map.get('stable');
      expect(map.has('stable')).assertTrue();
      expect(r1!).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_4500
     * @tc.name readonlyMapGetPart02Test045
     * @tc.desc Verify get entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['untouched', 555], ['target', 111]]);
      let r: int | undefined = map.get('target');
      let other: int | undefined = map.get('untouched');
      expect(other!).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_4600
     * @tc.name readonlyMapGetPart02Test046
     * @tc.desc Verify get key entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['keep', 888]]);
      let r: int | undefined = map.get('absent');
      let kept: int | undefined = map.get('keep');
      expect(kept!).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_4700
     * @tc.name readonlyMapGetPart02Test047
     * @tc.desc Verify set get K=string V=string == 'new'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string> = new Map<string, string>([['overwrite', 'old'], ['overwrite', 'new']]);
      let result: string | undefined = map.get('overwrite');
      expect(result!).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_4800
     * @tc.name readonlyMapGetPart02Test048
     * @tc.desc Verify get key long.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, int> = new Map<long, int>([[9223372036854775807, 1]]);
      let result: int | undefined = map.get(9223372036854775807);
      expect(result!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_4900
     * @tc.name readonlyMapGetPart02Test049
     * @tc.desc Verify Map<string, string> get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string> = new Map<string, string>([['s1', 'hello_world']]);
      let result: string | undefined = map.get('s1');
      expect(result!).assertEqual('hello_world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_5000
     * @tc.name readonlyMapGetPart02Test050
     * @tc.desc Verify Map<string, number> get number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['n1', 0.707106781]]);
      let result: number | undefined = map.get('n1');
      expect(result!).assertEqual(0.707106781);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_5100
     * @tc.name readonlyMapGetPart02Test051
     * @tc.desc Verify Map<string, boolean> get boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, boolean> = new Map<string, boolean>([['b1', false]]);
      let result: boolean | undefined = map.get('b1');
      expect(result!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_5200
     * @tc.name readonlyMapGetPart02Test052
     * @tc.desc Verify Map<string, long> get long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, bigint> = new Map<string, bigint>([['l1', -9223372036854775808n]]);
      let result: bigint | undefined = map.get('l1');
      expect(result!).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_5300
     * @tc.name readonlyMapGetPart02Test053
     * @tc.desc Verify Map<string, double> get double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, double> = new Map<string, double>([['d1', 1.7976931348623157e+308]]);
      let result: double | undefined = map.get('d1');
      expect(result!).assertEqual(1.7976931348623157e+308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_5400
     * @tc.name readonlyMapGetPart02Test054
     * @tc.desc Verify Map<string, byte> get byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, byte> = new Map<string, byte>([['by1', -128 as byte]]);
      let result: byte | undefined = map.get('by1');
      expect(result!).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_5500
     * @tc.name readonlyMapGetPart02Test055
     * @tc.desc Verify Map<string, short> get short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, short> = new Map<string, short>([['sh1', -32768 as short]]);
      let result: short | undefined = map.get('sh1');
      expect(result!).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_5600
     * @tc.name readonlyMapGetPart02Test056
     * @tc.desc Verify Map<string, float> get float undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, float> = new Map<string, float>([['f1', 0.125 as float]]);
      let result: float | undefined = map.get('f1');
      expect(map.has('f1')).assertTrue();
      expect(result!).assertEqual(0.125 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_5700
     * @tc.name readonlyMapGetPart02Test057
     * @tc.desc Verify Map<string, char> get char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, char> = new Map<string, char>([['c1', c'Z']]);
      let result: char | undefined = map.get('c1');
      expect(result!).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_5800
     * @tc.name readonlyMapGetPart02Test058
     * @tc.desc Verify Map<string, bigint> get bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, bigint> = new Map<string, bigint>([['bg1', 999999999999n]]);
      let result: bigint | undefined = map.get('bg1');
      expect(result!).assertEqual(999999999999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART02_TEST_5900
     * @tc.name readonlyMapGetPart02Test059
     * @tc.desc Verify Map<string, Array<int>> get Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 3, 5, 7];
      const map: ReadonlyMap<string, Array<int>> = new Map<string, Array<int>>([['arr1', arr]]);
      let result: Array<int> | undefined = map.get('arr1');
      expect(result!).assertEqual(arr);
    });

  });
}
